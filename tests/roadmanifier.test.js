import test from 'node:test';
import assert from 'node:assert/strict';
import Roadmanifier, { getRoadmanifier, reloadRoadmanifier } from '../plugins/Roadmanify/roadmanifier/index.js';
import { clamp01, matchCase } from '../plugins/Roadmanify/roadmanifier/utils.js';

const quiet = { words: 1, accent: 0, sentences: { openers: 0, closers: 0 }, spaces: { tags: 0, fillers: 0, actions: 0 } };
const slang = new Roadmanifier(quiet);
const convert = (s) => slang.roadmanifySentence(s);

test('new researched vocabulary', () => {
  assert.match(convert('muscular scared irritating delicious cash tired disappointed food song party'), /^hench shook jarring peng (paper|ps) knackered gutted grub tune motive$/);
});
test('phrases are longest-first and not rewritten again', () => {
  assert.match(convert('hang out with friends'), /^roll with (mandem|fam)$/);
  assert.match(convert('no problem'), /^(safe|say less)$/);
  assert.equal(convert('I understand'), 'say less');
  assert.equal(convert('out of money'), 'skint');
  assert.equal(convert('talking nonsense'), 'chatting breeze');
});
test('capturing groups and curly apostrophes work', () => {
  assert.equal(convert('oh my god'), 'oh my days');
  assert.equal(convert('oh my gosh'), 'oh my days');
  assert.equal(convert('is that right'), 'innit');
  assert.equal(convert('isn’t it'), 'innit');
  assert.equal(convert('what’s up'), 'wagwan');
  assert.equal(convert('I’m excited'), "man's gassed");
});
test('corrected meanings and non-objectifying substitutions', () => {
  assert.equal(convert('annoying obvious paranoid girl woman'), 'jarring bait paranoid girl woman');
  assert.equal(convert('bye'), 'safe');
});
test('case, punctuation and whitespace survive', () => {
  assert.equal(convert('SCARED!  Muscular\nscared'), 'SHOOK!  Hench\nshook');
  assert.equal(convert('  scared\t\n'), '  shook\t\n');
  assert.equal(matchCase('I', 'man'), 'man');
});
test('zero probabilities disable everything exactly', () => {
  const disabled = new Roadmanifier({ words: 0, accent: 0, sentences: { openers: 0, closers: 0 }, spaces: { tags: 0, fillers: 0, actions: 0 } });
  const text = 'Hello friend, what is going on? I am thinking about a lot of things.';
  assert.equal(disabled.roadmanifySentence(text), text);
});
test('URLs, mentions, emoji, links and multi-word code are byte-for-byte preserved', () => {
  const protectedValues = [
    'https://example.com/hello?a=friend', 'www.example.com/hello',
    '<https://example.com/hello>', '<@123456789012345678>', '<@!123456789012345678>',
    '<@&123456789012345678>', '<#123456789012345678>', '<:hello:123456789012345678>',
    '<a:friend:123456789012345678>', '@everyone', '@here', '@friend', ':hello:',
    '`hello friend what is going on`', '```js\nhello friend\nwhat is going on\n```',
    '`hello friend', '```hello friend',
    '[hello friend](https://example.com/hello)', '![hello](https://example.com/a_(friend))',
  ];
  const loud = new Roadmanifier({ words: 1, accent: 1, sentences: { openers: 1, closers: 1 }, spaces: { tags: 1, fillers: 1, actions: 1 } });
  for (const value of protectedValues) {
    assert.equal(loud.roadmanifySentence(value), value, value);
    const input = `scared ${value} scared`;
    const output = loud.roadmanifySentence(input);
    assert.ok(output.includes(value), `${value}: ${output}`);
    assert.notEqual(output, input);
  }
});
test('slash commands and non-text messages remain unchanged', () => {
  for (const input of ['/roadmanify hello friend', ' /other hello', null, undefined, '', '  ', 123]) assert.equal(convert(input), input);
});
test('accent and sentence decorations are configurable', () => {
  const accent = new Roadmanifier({ ...quiet, words: 0, accent: 1 });
  assert.equal(accent.roadmanifySentence('this that the nothing walking'), "dis dat da nuttin walkin'");
  const loud = new Roadmanifier({ ...quiet, sentences: { openers: 1, closers: 1 } });
  assert.match(loud.roadmanifySentence('scared!'), /^.+, shook, .+!$/);
});
test('output is deterministic', () => {
  const r = new Roadmanifier();
  const input = 'Hello friends, I am excited to meet up in my neighbourhood.';
  assert.equal(r.roadmanifySentence(input), r.roadmanifySentence(input));
});
test('invalid probabilities are clamped and settings reload', () => {
  assert.equal(clamp01(-1), 0);
  assert.equal(clamp01(99), 1);
  assert.equal(clamp01('nope'), 0);
  reloadRoadmanifier({ settings: { roadmanifier: quiet } });
  assert.equal(getRoadmanifier().roadmanifySentence('scared'), 'shook');
});
