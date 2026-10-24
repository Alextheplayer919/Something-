import assert from 'node:assert/strict';
import { createHash } from 'node:crypto';
import { mkdir, readFile, writeFile } from 'node:fs/promises';

// Keep just the two small installable files in Git for a Pages-independent URL.
const manifest = await readFile('dist/Roadmanify/manifest.json');
const bundle = await readFile('dist/Roadmanify/index.js');
const metadata = JSON.parse(manifest.toString());
assert.equal(metadata.name, 'Roadmanify');
assert.equal(metadata.main, 'index.js');
assert.equal(metadata.hash, createHash('sha256').update(bundle).digest('hex'));
const files = [['manifest.json', manifest], ['index.js', bundle]];
if (process.argv.includes('--check')) {
  for (const [name, bytes] of files) {
    assert.deepEqual(await readFile(`published/Roadmanify/${name}`), bytes,
      `Stale raw distribution: run npm run export:raw and commit published/Roadmanify/${name}`);
  }
  console.log('Checked-in raw plugin matches the current build.');
} else {
  await mkdir('published/Roadmanify', { recursive: true });
  for (const [name, bytes] of files) await writeFile(`published/Roadmanify/${name}`, bytes);
  console.log('Exported Roadmanify manifest and bundle for raw URL installation.');
}
