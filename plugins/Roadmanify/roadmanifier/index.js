/** biome-ignore-all lint/complexity/useLiteralKeys: ilike it*/
import Seed from "./seed.js";
import { clamp01, isAt, isDiscordToken, isUri, matchCase, splitProtected } from "./utils.js";

const DEFAULTS = {
	words: 1, // chance each slang swap applies
	accent: 0.5, // chance each accent rule applies (dis, dat, -in', gonna...)
	sentences: { openers: 0.25, closers: 0.35 }, // wagwan ... innit
	spaces: { tags: 0.04, fillers: 0.025, actions: 0.015 }, // mid-sentence additions
};

// Whole-phrase swaps, run before word swaps. [regex, [options]]
const PHRASES = [
	[/\bwhat(?:'|’)?s happening\b/gi, ["wagwan"]],
	[/\bwhat do you mean\b/gi, ["what you sayin'"]],
	[/\bare you serious\b/gi, ["are you for real"]],
	[/\bi (?:understand|get it)\b/gi, ["say less"]],
	[/\bno problem\b/gi, ["safe", "say less"]],
	[/\bdo not worry\b/gi, ["no stress"]],
	[/\bdon['’]?t worry\b/gi, ["no stress"]],
	[/\blet it go\b/gi, ["allow it"]],
	[/\bstop (?:doing that|talking nonsense)\b/gi, ["allow it"]],
	[/\b(?:talking|chatting) (?:rubbish|nonsense)\b/gi, ["chatting breeze"]],
	[/\b(?:tell|telling) lies\b/gi, ["chat breeze"]],
	[/\bout of money\b/gi, ["skint"]],
	[/\b(?:very|really) attractive\b/gi, ["leng", "peng"]],
	[/\bgood looking\b/gi, ["peng", "leng"]],
	[/\b(?:my|our) neighbourhood\b/gi, ["the ends"]],
	[/\b(?:my|our) neighborhood\b/gi, ["the ends"]],
	[/\bwhat['’]?s up\b/gi, ["wagwan"]],
	[/\bwhat['’]?s going on\b/gi, ["wagwan"]],
	[/\bhow are you\b/gi, ["you good", "you alright"]],
	[/\bi know\b/gi, ["dun know"]],
	[/\boh my (?:god|gosh)\b/gi, ["oh my days"]],
	[/\ba lot of\b/gi, ["bare"]],
	[/\blots of\b/gi, ["bare"]],
	[/\bi am\b/gi, ["man's"]],
	[/\bi['’]?m\b/gi, ["man's"]],
	[/\bisn['’]?t it\b/gi, ["innit"]],
	[/\bis(?:n'?t)? that right\b/gi, ["innit"]],
	[/\bgoing to\b/gi, ["gonna"]],
	[/\bwant to\b/gi, ["wanna"]],
	[/\bgot to\b/gi, ["gotta"]],
	[/\bleave it\b/gi, ["allow it"]],
	[/\bstop it\b/gi, ["allow it"]],
	[/\bcalm down\b/gi, ["calm yourself", "relax bruv"]],
	[/\byou know\b/gi, ["you get me", "ya get me"]],
	[/\bhang out with\b/gi, ["roll with"]],
	[/\bhang out\b/gi, ["link up", "cotch"]],
	[/\bmeet up\b/gi, ["link up"]],
	[/\bflirting with\b/gi, ["chirpsing"]],
	[/\bflirt with\b/gi, ["chirps"]],
	[/\bgood morning\b/gi, ["morning bruv"]],
	[/\bgood night\b/gi, ["night fam"]],
];

// Single word swaps. Key is lowercase. Value is a list, one is picked.
const WORDS = {
	muscular: ["hench"],
	scared: ["shook"],
	frightened: ["shook"],
	terrified: ["shook"],
	suspicious: ["buki"],
	irritating: ["jarring"],
	irritated: ["vexed"],
	delicious: ["peng"],
	tasty: ["peng"],
	impressive: ["dench"],
	belongings: ["tings"],
	cash: ["paper", "ps"],
	pounds: ["quid"],
	tired: ["knackered"],
	exhausted: ["knackered"],
	disappointed: ["gutted"],
	pleased: ["chuffed"],
	food: ["grub"],
	meal: ["munch"],
	song: ["tune"],
	songs: ["tunes"],
	party: ["motive"],

	hello: ["wagwan", "oi"],
	hi: ["wagwan", "oi"],
	hey: ["oi", "wagwan"],
	yo: ["wagwan"],
	friend: ["bruv", "fam"],
	friends: ["mandem", "fam"],
	mate: ["bruv", "fam"],
	buddy: ["bruv", "fam"],
	bro: ["bruv"],
	brother: ["bruv"],
	dude: ["bruv", "blud"],
	guys: ["mandem"],
	boys: ["mandem"],
	lads: ["mandem"],
	girls: ["gyaldem"],
	thing: ["ting"],
	things: ["tings"],
	very: ["bare"],
	really: ["bare", "proper"],
	extremely: ["bare"],
	many: ["bare"],
	good: ["dench", "nang", "safe"],
	great: ["dench", "nang"],
	awesome: ["dench", "nang"],
	cool: ["nang", "dench", "safe"],
	nice: ["safe", "dench"],
	ok: ["safe"],
	okay: ["safe"],
	alright: ["safe"],
	fine: ["safe"],
	thanks: ["safe", "appreciate it fam"],
	thx: ["safe"],
	bye: ["safe"],
	goodbye: ["safe"],
	attractive: ["peng", "leng"],
	beautiful: ["peng"],
	gorgeous: ["peng"],
	ugly: ["clapped"],
	weird: ["buki"],
	strange: ["buki"],
	funny: ["jokes"],
	hilarious: ["jokes"],
	excited: ["gassed"],
	hyped: ["gassed"],
	angry: ["vexed"],
	mad: ["vexed"],
	annoyed: ["vexed"],
	annoying: ["jarring"],
	obvious: ["bait"],
	difficult: ["long"],
	boring: ["long"],
	tiring: ["long"],
	hard: ["long"],
	unlucky: ["peak"],
	unfortunate: ["peak"],
	clothes: ["garms"],
	outfit: ["garms"],
	shoes: ["creps"],
	trainers: ["creps"],
	sneakers: ["creps"],
	car: ["whip"],
	home: ["ends"],
	neighbourhood: ["ends"],
	neighborhood: ["ends"],
	area: ["ends"],
	police: ["feds", "jakes"],
	cops: ["feds", "jakes"],
	money: ["bands", "paper"],
	idiot: ["wasteman"],
	loser: ["wasteman"],
	fool: ["wasteman"],
	enemies: ["pagans"],
	kids: ["yutes"],
	kid: ["yute"],
	child: ["yute"],
	children: ["yutes"],
	kiss: ["lips"],
	flirt: ["chirps"],
	yes: ["yeah", "yeah bruv"],
	yeah: ["yeah fam"],
	no: ["nah"],
	nope: ["nah"],
	omg: ["oh my days"],
	wow: ["oh my days"],
	i: ["man"],
	"i'd": ["man'd"],
	"i'll": ["man'll"],
	"i've": ["man've"],
};

// Accent swaps (th-stopping etc). Each is its own dice roll.
const THE_MAP = { the: "da", this: "dis", that: "dat", these: "dese", those: "dose", them: "dem", they: "dey", there: "dere", then: "den", their: "dere", with: "wid", think: "tink", thinking: "tinking", thanks: "tanks", thank: "tank", nothing: "nuttin", something: "summin", everything: "everyting", anything: "anyting", because: "cuz", what: "wot", about: "bout" };

const OPENERS = ["wagwan", "oi", "yo", "oi oi", "bruv", "listen", "safe"];
const CLOSERS = ["innit", "bruv", "fam", "you get me", "innit bruv", "on my life", "no cap", "still", "ting"];
const TAGS = ["bruv", "fam", "blud", "g", "my guy"];
const FILLERS = ["ya get me", "you get me", "like", "trust me", "bare times", "swear down"];
const ACTIONS = ["*adjusts creps*", "*pulls up*", "*dap*", "*checks the ends*", "*hops in the whip*", "*hits the corner shop*"];

export default class Roadmanifier {
	constructor({ words = DEFAULTS.words, accent = DEFAULTS.accent, sentences = DEFAULTS.sentences, spaces = DEFAULTS.spaces } = {}) {
		this._words = clamp01(words);
		this._accent = clamp01(accent);
		this._sentences = { openers: clamp01(sentences?.openers), closers: clamp01(sentences?.closers) };
		this._spaces = { tags: clamp01(spaces?.tags), fillers: clamp01(spaces?.fillers), actions: clamp01(spaces?.actions) };
	}

	pick(seed, arr) {
		return arr[Math.min(arr.length - 1, Math.floor(seed.random() * arr.length))];
	}

	// swap whole phrases ("what's up" -> "wagwan")
	roadmanifyPhrases(sentence, withWords = false) {
		// One pass: phrase output must not be fed back into later rules.
		const pattern = new RegExp(PHRASES.map(([regex]) => `(?:${regex.source})`).join("|"), "gi");
		let out = "";
		let cursor = 0;
		for (const match of sentence.matchAll(pattern)) {
			const gap = sentence.slice(cursor, match.index);
			out += withWords ? this.roadmanifyWords(gap) : gap;
			const [, options] = PHRASES.find(([regex]) => new RegExp(`^(?:${regex.source})$`, "i").test(match[0]));
			const seed = new Seed(`${match[0]}|${match.index}`);
			out += seed.random() < this._words
				? matchCase(match[0], this.pick(seed, options))
				: (withWords ? this.roadmanifyWords(match[0]) : match[0]);
			cursor = match.index + match[0].length;
		}
		const tail = sentence.slice(cursor);
		return out + (withWords ? this.roadmanifyWords(tail) : tail);
	}

	// slang swaps + accent, token by token (whitespace kept as-is)
	roadmanifyWords(sentence) {
		return sentence
			.split(/(\s+)/)
			.map((token, index) => {
				if (!token || /^\s+$/.test(token)) return token;
				if (isAt(token) || isUri(token) || isDiscordToken(token)) return token;
				const m = token.match(/^([^\p{L}]*)([\p{L}][\p{L}'’]*)([\s\S]*)$/u);
				if (!m) return token;
				const [, lead, core, trail] = m;
				const lower = core.toLowerCase().replace(/’/g, "'");
				const seed = new Seed(`${lower}|${index}|${sentence.length}`);

				// 1. slang swap
				const options = Object.hasOwn(WORDS, lower) ? WORDS[lower] : null;
				if (options && seed.random() < this._words) {
					return lead + matchCase(core, this.pick(seed, options)) + trail;
				}

				// 2. accent: th-stopping etc
				if (Object.hasOwn(THE_MAP, lower) && seed.random() < this._accent) {
					return lead + matchCase(core, THE_MAP[lower]) + trail;
				}

				// 3. -ing -> -in'  (not for 1-syllable words like "thing", "king")
				if (/^[\p{L}]{4,}ing$/u.test(core) && !Object.hasOwn(WORDS, lower) && seed.random() < this._accent) {
					return lead + core.slice(0, -1) + "'" + trail;
				}
				return token;
			})
			.join("");
	}

	// insert tags / fillers / actions after random words
	roadmanifySpaces(sentence) {
		const { tags, fillers, actions } = this._spaces;
		const tagT = tags;
		const fillerT = tagT + fillers;
		const actionT = fillerT + actions;
		const tokens = sentence.split(/(\s+)/);
		return tokens
			.map((token, index) => {
				if (!token || /^\s+$/.test(token)) return token;
				if (isAt(token) || isUri(token) || isDiscordToken(token)) return token;
				// only add after a word that ends cleanly (no trailing punctuation) so we don't break "word," etc.
				if (!/[\p{L}\p{N}]$/u.test(token)) return token;
				const seed = new Seed(`${token}|${index}|${sentence.length}`);
				const r = seed.random();
				if (r < tagT) return `${token} ${this.pick(seed, TAGS)}`;
				if (r < fillerT) return `${token} ${this.pick(seed, FILLERS)}`;
				if (r < actionT) return `${token} ${this.pick(seed, ACTIONS)}`;
				return token;
			})
			.join("");
	}

	// "wagwan, ..." at the start and "..., innit" at the end
	roadmanifyEnds(sentence) {
		const trimmed = sentence.trim();
		if (!trimmed || isDiscordToken(trimmed) || isUri(trimmed)) return sentence;
		const seed = new Seed(`${trimmed}|ends`);
		let out = sentence;
		if (seed.random() < this._sentences.openers && !/^(wagwan|oi|yo)\b/i.test(out.trim())) {
			const opener = this.pick(seed, OPENERS);
			const first = out.charAt(0);
			// don't lowercase the first letter if the next bit is an @mention, URL, ALL CAPS word etc.
			const firstWord = out.split(/\s+/)[0];
			if (first === first.toUpperCase() && first !== first.toLowerCase() && firstWord !== firstWord.toUpperCase()) {
				out = first.toLowerCase() + out.slice(1);
			}
			out = `${opener}, ${out}`;
		}
		if (seed.random() < this._sentences.closers) {
			const closer = this.pick(seed, CLOSERS);
			const m = out.match(/^([\s\S]*?)([.!?]*)(\s*)$/);
			const body = m[1];
			const punct = m[2];
			// don't tag onto code blocks / links / mentions at the very end
			const lastWord = body.split(/\s+/).pop();
			if (isUri(lastWord) || isDiscordToken(lastWord) || body.includes("```")) return out;
			out = `${body}, ${closer}${punct || ""}${m[3]}`;
		}
		return out;
	}

	roadmanifySentence(sentence) {
		if (typeof sentence !== "string" || !sentence.trim()) return sentence;
		// Never rewrite commands, even if automatic conversion is enabled.
		if (/^\s*\//.test(sentence)) return sentence;
		const parts = splitProtected(sentence);
		if (!parts.some(({ text, protected: keep }) => !keep && /[\p{L}]/u.test(text))) return sentence;
		const out = parts.map(({ text, protected: keep }) => keep ? text
			: this.roadmanifySpaces(this.roadmanifyPhrases(text, true))).join("");
		// Don't add decorations around code snippets or markdown links.
		return sentence.includes("`") || /\[[^\]]*\]\(/.test(sentence) ? out : this.roadmanifyEnds(out);
	}
}

const state = {
	roadmanifier: new Roadmanifier(),
};
export function getRoadmanifier() {
	return state.roadmanifier;
}
export function reloadRoadmanifier(storage) {
	const s = storage["settings"]["roadmanifier"];
	const getNum = (v) => (Number.isNaN(parseFloat(v)) ? 0 : parseFloat(v));
	state.roadmanifier = new Roadmanifier({
		words: getNum(s["words"]),
		accent: getNum(s["accent"]),
		sentences: {
			openers: getNum(s["sentences"]["openers"]),
			closers: getNum(s["sentences"]["closers"]),
		},
		spaces: {
			tags: getNum(s["spaces"]["tags"]),
			fillers: getNum(s["spaces"]["fillers"]),
			actions: getNum(s["spaces"]["actions"]),
		},
	});
}
