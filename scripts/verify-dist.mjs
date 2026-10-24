import assert from 'node:assert/strict';
import { createHash } from 'node:crypto';
import { readFile, readdir } from 'node:fs/promises';
import { Script } from 'node:vm';

const manifest = JSON.parse(await readFile('dist/Roadmanify/manifest.json', 'utf8'));
const code = await readFile('dist/Roadmanify/index.js', 'utf8');
assert.equal(manifest.name, 'Roadmanify');
assert.equal(manifest.main, 'index.js');
assert.equal(manifest.hash, createHash('sha256').update(code).digest('hex'));
assert.ok(code.length > 0);
new Script(code); // Published bundles must be evaluable scripts, not ESM imports.
const files = await readdir('dist');
assert.deepEqual(files.sort(), ['.nojekyll', '404.html', 'LICENSE', 'Roadmanify', 'index.html'].sort(), 'Publish only Roadmanify, not the other archived plugins');
assert.match(await readFile('dist/index.html', 'utf8'), /Roadmanify\//);
console.log('Verified plugin manifest, bundle syntax, SHA-256 and website contents.');

// Smoke-test the actual IIFE export against the Vendetta API shape.
const { runInNewContext } = await import('node:vm');
const storage = {};
const sent = [];
const previews = [];
let command;
let beforeSend;
let unpatched = 0;
const messages = {
  sendMessage: (...args) => sent.push(args),
  sendBotMessage: (...args) => previews.push(args),
  receiveMessage() {},
};
const vendetta = {
  plugin: { storage },
  storage: { useProxy() {} },
  metro: {
    common: { React: {}, ReactNative: {} },
    findByProps: (...props) => props.includes('sendMessage') || props.includes('sendBotMessage') ? messages : {},
    findByStoreName: () => ({ getChannelId: () => 'test-channel' }),
  },
  commands: { registerCommand: (value) => { command = value; return () => { unpatched++; }; } },
  patcher: { before: (_method, _object, callback) => { beforeSend = callback; return () => { unpatched++; }; } },
};
const plugin = runInNewContext(code, { vendetta, console, setTimeout, alert: (msg) => { throw new Error(msg); } }).default;
assert.equal(typeof plugin.settings, 'function');
plugin.onLoad();
assert.equal(command.name, 'roadmanify');
// Set stable probabilities via the command's public settings source.
storage.settings.roadmanifier = { words: 1, accent: 0, sentences: { openers: 0, closers: 0 }, spaces: { tags: 0, fillers: 0, actions: 0 } };
// Reloading settings normally happens via the settings UI. Use an always-replaced word
// to check the default instance without exposing internals in the production bundle.
const args = ['test-channel', { content: 'scared' }];
beforeSend(args);
assert.ok(args[1].content.includes('shook'));
const commandOutput = ['test-channel', { content: 'scared', _command_output: true }];
beforeSend(commandOutput);
assert.equal(commandOutput[1].content, 'scared');
storage.settings.convert_messages = false;
const disabled = ['test-channel', { content: 'scared' }];
beforeSend(disabled);
assert.equal(disabled[1].content, 'scared');
beforeSend(['test-channel', undefined]); // attachment-only/missing content safety
command.execute([{ name: 'input', value: 'scared' }, { name: 'send', value: false }]);
assert.equal(previews.length, 1);
assert.equal(sent.length, 0);
assert.equal(previews[0][0], 'test-channel');
assert.ok(previews[0][1].includes('shook'));
command.execute([{ name: 'input', value: 'scared' }, { name: 'send', value: true }]);
assert.equal(sent.length, 1);
assert.equal(sent[0][1]._command_output, true);
for (let i = 0; i < 30; i++) command.execute([{ name: 'input', value: 'scared' }, { name: 'send', value: false }]);
assert.equal(storage.stats.history.length, 25);
plugin.onUnload();
plugin.onUnload();
assert.equal(unpatched, 2);
console.log('Verified bundled plugin load, message filter, private preview, send, bounded history and unload.');
