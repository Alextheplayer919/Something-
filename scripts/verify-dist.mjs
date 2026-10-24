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
    common: { React: { createElement: (type, props, ...children) => ({ type, props: { ...props, children } }) } },
    findByProps: (...props) => props.includes('sendMessage') || props.includes('sendBotMessage') ? messages : Object.fromEntries(props.map((name) => [name, name])),
    findByStoreName: () => ({ getChannelId: () => 'test-channel' }),
  },
  commands: { registerCommand: (value) => { command = value; return () => { unpatched++; }; } },
  patcher: { before: (_method, _object, callback) => { beforeSend = callback; return () => { unpatched++; }; } },
};
const plugin = runInNewContext(code, { vendetta, console, setTimeout, alert: (msg) => { throw new Error(msg); } }).default;
assert.equal(typeof plugin.settings, 'function');
plugin.onLoad();
assert.equal(command.name, 'roadmanify');
assert.equal(storage.settings.allow_swearing, true);
// Render the actual bundled settings and exercise its switches, without RN.
const rows = [];
function visit(node) {
  if (!node || typeof node !== 'object') return;
  assert.ok(node.type !== 'Slider' && node.type !== 'TextInput');
  if (node.type === 'TableSwitchRow') rows.push(node.props);
  for (const child of (node.props?.children || []).flat(Infinity)) visit(child);
}
visit(plugin.settings());
assert.equal(rows.length, 3);
const swearingRow = rows.find((row) => row.label === 'Allow occasional added swearing');
assert.ok(swearingRow);
swearingRow.onValueChange(false);
assert.equal(storage.settings.allow_swearing, false);
const cleanMessage = ['test-channel', { content: 'I don’t care' }];
beforeSend(cleanMessage);
assert.doesNotMatch(cleanMessage[1].content, /fuck|shit|piss|arsed/i);
swearingRow.onValueChange(true);
const rawMessage = ['test-channel', { content: 'I don’t care' }];
beforeSend(rawMessage);
assert.match(rawMessage[1].content, /shit/);
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
for (const [input, expected] of [
  ['I am hungry', "man's after a munch"],
  ['im thirsty', 'man needs a drink'],
  ['I need some sleep', 'man needs some kip'],
]) {
  const personal = ['test-channel', { content: input }];
  beforeSend(personal);
  // Automatic conversion was disabled above; re-enable it through the real UI.
  assert.equal(personal[1].content, input);
  rows.find((row) => row.label === 'Convert messages before sending').onValueChange(true);
  beforeSend(personal);
  assert.ok(personal[1].content.includes(expected), personal[1].content);
  rows.find((row) => row.label === 'Convert messages before sending').onValueChange(false);
}
command.execute([{ name: 'input', value: 'I feel tired' }, { name: 'send', value: false }]);
assert.ok(previews.at(-1)[1].includes("man's knackered"));

for (let i = 0; i < 30; i++) command.execute([{ name: 'input', value: 'scared' }, { name: 'send', value: false }]);
assert.equal(storage.stats.history.length, 25);
plugin.onUnload();
plugin.onUnload();
assert.equal(unpatched, 2);
console.log('Verified bundled plugin load, three-switch settings, live profanity toggle, message filter, private preview, send, bounded history and unload.');
