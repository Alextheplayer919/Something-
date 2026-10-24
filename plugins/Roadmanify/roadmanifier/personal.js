// First-person phrases only: never turn someone else's state into the speaker's.
// All groups are noncapturing because the phrase engine uses the match offset.
const SELF = String.raw`(?:i(?:[ \t]+am|['’]?m)(?:[ \t]+feeling)?|i[ \t]+feel)`;
const SPACE = String.raw`[ \t]+`;
const STRONG = String.raw`(?:really|very|so|extremely|proper|bare)`;
const MILD = String.raw`(?:a[ \t]+bit|a[ \t]+little|kind[ \t]+of|kinda|slightly)`;
const phrase = (body) => new RegExp(String.raw`\b${body}\b`, "gi");

// [state, ordinary, stronger, milder, optional stronger profanity]
const STATES = [
	[String.raw`hungry(?![ \t]+for\b)`, "man's after a munch", "man's proper hungry", "man's a bit peckish"],
	["starving", "man's starving", "man's absolutely starving", "man's a bit hungry"],
	[String.raw`thirsty(?![ \t]+for\b)`, "man needs a drink", "man's proper thirsty", "man's a bit thirsty"],
	["sleepy", "man needs some kip", "man's proper sleepy", "man's a bit sleepy"],
	["tired|exhausted", "man's knackered", "man's proper knackered", "man's a bit tired"],
	["angry|annoyed|frustrated", "man's vexed", "man's bare vexed", "man's a bit vexed", "man's fucking vexed"],
	["happy", "man's buzzing", "man's proper buzzing", "man's a little happy"],
	["excited|hyped", "man's gassed", "man's proper gassed", "man's a bit gassed"],
	["sad|down", "man's feeling low", "man's proper down", "man's a bit down"],
	["lonely", "man's feeling lonely", "man's proper lonely", "man's a bit lonely"],
	["stressed", "man's stressing", "man's proper stressing", "man's a bit stressed"],
	["worried|anxious|nervous", "man's on edge", "man's proper on edge", "man's a bit on edge"],
	["scared|frightened", "man's shook", "man's proper shook", "man's a bit shook"],
	["bored", "man's bored", "man's bored stiff", "man's a bit bored"],
	[String.raw`ill|sick(?![ \t]+of\b)|unwell`, "man's feeling rough", "man's proper rough", "man's a bit under the weather"],
	["cold", "man's feeling the cold", "man's freezing", "man's a bit chilly"],
	["hot", "man's feeling the heat", "man's roasting", "man's a bit warm"],
	["confused", "man's baffled", "man's proper baffled", "man's a bit baffled"],
	["embarrassed", "man's feeling awkward", "man's proper embarrassed", "man's a bit embarrassed"],
	["disappointed", "man's gutted", "man's proper gutted", "man's a bit disappointed"],
];

export const PERSONAL_PHRASES = [
	// More specific qualifiers must win before the ordinary state rule.
	...STATES.flatMap(([state, ordinary, strong, mild, swear]) => [
		[phrase(`${SELF}${SPACE}${STRONG}${SPACE}(?:${state})`), [strong], ...(swear ? [[swear]] : [])],
		[phrase(`${SELF}${SPACE}${MILD}${SPACE}(?:${state})`), [mild]],
		[phrase(`${SELF}${SPACE}(?:${state})`), [ordinary]],
	]),
	[phrase(String.raw`i${SPACE}need${SPACE}(?:some${SPACE})?(?:food|something${SPACE}to${SPACE}eat)`), ["man needs a munch"]],
	[phrase(String.raw`i${SPACE}need${SPACE}(?:some${SPACE})?sleep`), ["man needs some kip"]],
	[phrase(String.raw`i${SPACE}need${SPACE}(?:a${SPACE}drink|some${SPACE}water)`), ["man needs a drink"]],
	[phrase(String.raw`i${SPACE}need${SPACE}(?:a${SPACE}break|to${SPACE}relax)`), ["man needs to cotch for a bit"]],
	[phrase(String.raw`i${SPACE}want${SPACE}(?:some${SPACE})?food`), ["man wants a munch"]],
	[phrase(String.raw`i${SPACE}want${SPACE}to${SPACE}eat`), ["man wants to grab a munch"]],
	[phrase(String.raw`i${SPACE}want${SPACE}to${SPACE}sleep`), ["man wants to get some kip"]],
	// Negative prefixes stay negative; don't use the positive state idioms here.
	[phrase(`${SELF}${SPACE}not`), ["man's not"]],
	[phrase(String.raw`i${SPACE}(?:don['’]?t|do${SPACE}not)${SPACE}feel`), ["man don't feel"]],
];
