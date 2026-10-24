export function isUri(value) {
	if (!value) return false;
	return /^[a-z][a-z0-9+.-]*:\/\/\S+$/i.test(value) || /^www\.\S+\.\S+$/i.test(value);
}
export function isAt(value) {
	return value.charAt(0) === "@";
}
// <@123>, <#123>, <:emoji:123>, <a:emoji:123>, :emoji: and `code`
export function isDiscordToken(value) {
	return (
		(value.startsWith("<") && value.endsWith(">")) ||
		/^:[\w]+:$/.test(value) ||
		value.includes("`")
	);
}
export function clamp01(n) {
	n = Number(n);
	if (Number.isNaN(n)) return 0;
	return Math.min(1, Math.max(0, n));
}
// keeps the casing shape of `original` (ALL CAPS / Capitalised / lower)
export function matchCase(original, replacement) {
	if (/^I(?:$|['’\s])/.test(original)) return replacement; // "I" / "I'm" are always capital, so don't carry that over
	if (original.length > 1 && original === original.toUpperCase() && original !== original.toLowerCase()) return replacement.toUpperCase();
	if (original[0] !== original[0].toLowerCase()) return replacement[0].toUpperCase() + replacement.slice(1);
	return replacement;
}

// Segment protected Discord/Markdown syntax before *any* phrase or word rule.
// Links are kept whole, including their labels and targets. Unclosed code is kept too.
export function splitProtected(text) {
	const pattern = /```[\s\S]*?(?:```|$)|`[^`\n]*(?:`|$)|!?\[[^\]\n]*\]\((?:[^()\s]|\([^()]*\))*\)|<[^>\n]+>|(?:[a-z][a-z0-9+.-]*:\/\/|www\.)[^\s<>`]+|@[\p{L}\p{N}_.]+|:[\w]+:/giu;
	const parts = [];
	let cursor = 0;
	for (const match of text.matchAll(pattern)) {
		if (match.index > cursor) parts.push({ text: text.slice(cursor, match.index), protected: false });
		parts.push({ text: match[0], protected: true });
		cursor = match.index + match[0].length;
	}
	if (cursor < text.length) parts.push({ text: text.slice(cursor), protected: false });
	return parts;
}
