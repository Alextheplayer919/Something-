import test from 'node:test';
import assert from 'node:assert/strict';
import Roadmanifier, { getRoadmanifier, reloadRoadmanifier } from '../plugins/Roadmanify/roadmanifier/index.js';
import { clamp01, matchCase } from '../plugins/Roadmanify/roadmanifier/utils.js';

const quiet = { words: 1, accent: 0, sentences: { openers: 0, closers: 0 }, spaces: { tags: 0, fillers: 0 } };
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
  const disabled = new Roadmanifier({ words: 0, accent: 0, sentences: { openers: 0, closers: 0 }, spaces: { tags: 0, fillers: 0 } });
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
  const loud = new Roadmanifier({ words: 1, accent: 1, sentences: { openers: 1, closers: 1 }, spaces: { tags: 1, fillers: 1 } });
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
test('internal engine probabilities still support deterministic testing', () => {
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

const swearPattern = /\b(?:fuck\w*|shit\w*|piss\w*|arsed)\b/gi;
const countSwears = (text) => [...text.matchAll(swearPattern)].length;

test('more conversational phrase coverage without grammar-damaging swaps', () => {
  const r = new Roadmanifier({ ...quiet, swearing: false });
  assert.equal(r.roadmanifySentence('I am hungry'), "man's after a munch");
  assert.equal(r.roadmanifySentence('I’m hungry'), "man's after a munch");
  assert.equal(r.roadmanifySentence('I am going home'), "man's heading yard");
  assert.equal(r.roadmanifySentence('To be honest that is unfair'), "Real talk that's peak");
  assert.equal(r.roadmanifySentence('come over'), 'pull up');
  assert.equal(r.roadmanifySentence('let me know'), 'give me a shout');
  assert.equal(r.roadmanifySentence('message me'), 'hit me up');
  assert.equal(r.roadmanifySentence('hard drive home page kiss flirt'), 'hard drive home page kiss flirt');
});

test('swearing is occasional, contextual, deterministic and can be disabled', () => {
  const raw = new Roadmanifier(quiet);
  const clean = new Roadmanifier({ ...quiet, swearing: false });
  let strong = 0;
  let mild = 0;
  for (let i = 0; i < 80; i++) {
    const input = `${'well '.repeat(i)}I do not care`;
    const output = raw.roadmanifySentence(input);
    assert.equal(output, raw.roadmanifySentence(input));
    if (countSwears(output)) strong++; else mild++;
    assert.equal(countSwears(clean.roadmanifySentence(input)), 0);
  }
  assert.ok(strong > 0, 'some eligible phrases should get stronger wording');
  assert.ok(mild > 0, 'not every eligible phrase should swear');
  for (const input of ['Hello friend', 'This food is really good', 'I am excited', 'Thank you', 'See you later']) {
    assert.equal(countSwears(raw.roadmanifySentence(input)), 0, input);
  }
});

test('added profanity is capped per message across protected spans', () => {
  const raw = new Roadmanifier(quiet);
  let hasSworn = false;
  for (let i = 0; i < 40; i++) {
    const input = `${'well '.repeat(i)}I do not care. <@123> For goodness sake. https://example.com What the hell. This is ridiculous.`;
    const output = raw.roadmanifySentence(input);
    const count = countSwears(output);
    assert.ok(count <= 1, output);
    if (count) hasSworn = true;
    assert.ok(output.includes('<@123>'));
    assert.ok(output.includes('https://example.com'));
  }
  assert.ok(hasSworn);
});

test('existing swears stay, without piling on more', () => {
  for (const swearing of [true, false]) {
    const raw = new Roadmanifier({ ...quiet, swearing });
    const output = raw.roadmanifySentence('shit, I do not care. For goodness sake. What the hell!');
    assert.ok(output.startsWith('shit,'));
    assert.equal(countSwears(output), 1);
  }
});

test('swearing phrases in protected syntax are never touched', () => {
  const raw = new Roadmanifier(quiet);
  for (const protectedText of ['`I do not care`', '```For goodness sake```', '[what the hell](https://example.com)', '/command I do not care']) {
    assert.equal(raw.roadmanifySentence(protectedText), protectedText);
  }
});

test('fixed preset ignores old sliders and honors the swearing switch immediately', () => {
  const legacy = {
    settings: {
      roadmanifier: { words: 0, accent: 0, sentences: { openers: 1, closers: 1 }, spaces: { tags: 1, fillers: 1, actions: 1 } },
      convert_messages: false,
      defaults: { send: false },
      allow_swearing: false,
    },
  };
  reloadRoadmanifier(legacy);
  const clean = getRoadmanifier();
  assert.ok(clean.roadmanifySentence('scared').includes('shook'));
  assert.equal(clean._spaces.tags, 0);
  assert.equal(clean._spaces.fillers, 0);
  assert.equal(clean._swearing, false);
  assert.equal(countSwears(clean.roadmanifySentence('I don’t care')), 0);
  legacy.settings.allow_swearing = true;
  reloadRoadmanifier(legacy);
  assert.equal(getRoadmanifier()._swearing, true);
  assert.ok(countSwears(getRoadmanifier().roadmanifySentence('I don’t care')) > 0);
  assert.equal(legacy.settings.convert_messages, false);
  assert.equal(legacy.settings.defaults.send, false);
});

test('default output contains no roleplay actions or mid-sentence padding', () => {
  const r = new Roadmanifier();
  const output = r.roadmanifySentence('walking walking walking walking walking walking walking walking walking walking');
  assert.doesNotMatch(output, /\*|adjusts|dap|pulls up/);
  const withoutEnds = new Roadmanifier({ sentences: { openers: 0, closers: 0 } });
  const input = 'a simple message with no dictionary words here';
  assert.equal(withoutEnds.roadmanifySentence(input).split(/\s+/).length, input.split(/\s+/).length);
});
