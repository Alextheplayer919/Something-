import { copyFile, writeFile } from 'node:fs/promises';

const repository = process.env.GITHUB_REPOSITORY || 'Alextheplayer919/Something-';
const [owner, repo] = repository.split('/');
const origin = `https://${owner.toLowerCase()}.github.io`;
const basePath = repo.toLowerCase() === `${owner.toLowerCase()}.github.io` ? '/' : `/${repo}/`;
const url = `${origin}${basePath}Roadmanify/`;
const escape = (s) => s.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;').replaceAll('"', '&quot;');

await writeFile('dist/.nojekyll', '');
await copyFile('LICENSE', 'dist/LICENSE');
await writeFile('dist/index.html', `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Roadmanify — Discord plugin</title><style>
body{font:18px/1.6 system-ui,sans-serif;max-width:760px;margin:10vh auto;padding:24px;background:#13151b;color:#e7e9ef}h1{font-size:3rem;line-height:1.1}a{color:#acbaff}code,input{font-family:monospace}input{box-sizing:border-box;width:100%;padding:14px;background:#222735;color:inherit;border:1px solid #68728b;border-radius:8px;font-size:15px}button{margin:12px 0;padding:12px 20px;background:#b7c4ff;color:#13151b;border:0;border-radius:8px;font:inherit;cursor:pointer}small{color:#b7bdcc}
</style></head><body><small>VENDETTA-COMPATIBLE PLUGIN · NO APK</small><h1>Roadmanify, bruv.</h1>
<p>Turn your messages into playful London-inspired slang, or use <code>/roadmanify</code> on demand.</p>
<h2>Import this plugin link</h2><label for="url">Plugin folder URL</label><input id="url" readonly value="${escape(url)}" onclick="this.select()">
<button id="copy" type="button">Copy plugin link</button><p id="status" role="status" aria-live="polite"></p>
<ol><li>Open your Vendetta-compatible Discord client's settings.</li><li>Go to <strong>Plugins</strong>, tap <strong>+</strong> / <strong>Install</strong>, then paste the folder URL above.</li><li>Enable Roadmanify and adjust its settings. Try <code>/roadmanify input:hello friend send:false</code> for a private preview.</li></ol>
<p>Requires a client that supports Vendetta plugins. Stock Discord, desktop Vencord and BetterDiscord cannot import this format.</p>
<p>Automatic conversion and sending command output are enabled by default. Disable conversion for command-only use. Recent command inputs are stored locally (up to 25).</p>
<p><a href="${escape(basePath)}Roadmanify/manifest.json">Plugin manifest</a> · <a href="https://github.com/${escape(repository)}">Source &amp; setup help</a></p>
<script>document.getElementById('copy').onclick=async()=>{const input=document.getElementById('url');try{await navigator.clipboard.writeText(input.value);document.getElementById('status').textContent='Copied — paste it into your plugin installer.'}catch{input.select();document.getElementById('status').textContent='Select and copy the URL manually.'}};</script></body></html>\n`);
await writeFile('dist/404.html', `<!doctype html><html lang="en"><meta charset="utf-8"><title>Plugin import help</title><h1>Looking for Roadmanify?</h1><p>Paste <code>${escape(url)}</code> into your Vendetta-compatible plugin installer, not your browser.</p><a href="${escape(basePath)}">Installation help</a></html>\n`);
console.log(`Plugin import URL (after deployment): ${url}`);
