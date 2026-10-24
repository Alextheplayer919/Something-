# Slang expansion notes

Research checked on 24 October 2026. Definitions were used as references; the replacement rules are handwritten, not copied word lists or externally fetched runtime data.

## Scope

This is an exaggerated, playful filter. Multicultural London English (MLE) is a real dialect used by people of varied backgrounds, not simply a collection of internet jokes. The BBC overview and discussion provide context for that distinction. [1](https://www.bbc.co.uk/programmes/articles/1H14PvBsbMGrwzRGTBDsbzP/17-multicultural-london-english-words-and-what-they-mean)

Not every included term is unique to London or to MLE. Broader British slang is deliberately mixed in; the code cannot reliably infer tone, grammar or a word's intended sense.

## References used

| Reference | How it informed this change |
| --- | --- |
| BBC Radio 4, *17 Multicultural London English words and what they mean* | `hench` for muscular/strong-looking; `safe` for good/agreement; `bare` for very/many. [1](https://www.bbc.co.uk/programmes/articles/1H14PvBsbMGrwzRGTBDsbzP/17-multicultural-london-english-words-and-what-they-mean) |
| The Guardian, *Wagwan? Why are more and more Britons speaking Multicultural London English?* | Confirms `shook` for scared, `hench` for muscular and `peng` for good. [2](https://www.theguardian.com/science/2022/jun/14/wagwan-why-are-more-and-more-britons-speaking-multicultural-london-english) |
| Highsnobiety, *A Completely Unserious Guide to British Street Slang* | `allow it` for stop/leave it; `skint` specifically for being short of money. [3](https://www.highsnobiety.com/p/british-street-slang-guide/) |
| London Webcam, *London Slang Words And Meanings* | `bait` is obvious/exposed, `buki` is strange/suspicious; broader British additions include `knackered`, `chuffed`, `gutted` and `grub`. [4](https://londonwebcam.co.uk/blog/london-slang-words-and-meanings/) |
| Gradding Homes, *Roadman Slang in UK* | `jarring` for annoying/irritating, rather than the archive's `bait`. [5](https://www.graddinghomes.com/blog/uk/roadman-slang) |
| Lellalee, *UK Teen Slang Words* | `leng` for attractive; corroborates `skint` and `allow it`. [6](https://lellalee.com/uk-teen-slang-words/) |
| British Slang Dictionary, *How Multicultural London English Is Reshaping British Slang* | `say less` for understanding/acknowledgement. [7](https://britishslangdictionary.net/how-multicultural-london-english-is-reshaping-british-slang/) |

## Changes

- Added adjective coverage: muscular → hench; scared/frightened/terrified → shook; suspicious → buki; irritating → jarring; irritated → vexed; delicious/tasty → peng; impressive → dench.
- Added everyday vocabulary: cash, pounds, belongings, food, meal, song(s), party, tired/exhausted, pleased and disappointed. Some are general British or youth slang, not exclusively MLE.
- Added contextual phrases, including understanding → say less; no problem → safe/say less; don't worry → no stress; let it go → allow it; out of money → skint; talking nonsense → chatting breeze; very attractive → leng/peng; my neighbourhood → the ends.
- Kept `skint` behind an explicit money phrase. The ambiguous word `broke` is **not** globally replaced, so “the build broke” does not become “the build skint”.
- Corrected annoying → jarring; retained obvious → bait. Removed paranoid → par and goodbye → ahlie because they are not reliable equivalents.
- Removed automatic girl/woman → ting substitutions and the plural `mandem` option for singular `friend`.
- Fixed overlapping “hang out with” / “hang out” rules. Phrases now use a single replacement pass; their results do not cascade into word rules.
- Fixed capture-group offsets and support for curly apostrophes in common contractions.
- Added protected spans for code, URLs, Markdown links, mentions and emoji before any transformation.

## Limitations

Some inherited substitutions remain broad: `mad`, `fine` and `area` can have meanings or grammatical forms that a dictionary swap cannot distinguish. Review the preview rather than relying on this filter for exact meaning. Probabilities and deterministic choices create variation, not linguistic accuracy.

No network research is performed when the plugin runs. The unit tests pin important meanings, phrase behavior, casing, zero-probability behavior and protected syntax; the compiled-bundle smoke test checks the plugin API lifecycle separately.

## Simplified/raw-slang update

The settings now have only three switches: automatic conversion, command send default, and occasional added swearing (enabled initially). Numeric controls have been removed. Old numeric settings are ignored on reload, without changing the existing send/conversion preferences.

More hand-authored phrases cover “I don't know”, hunger, “come over”, “let me know”, “message me”, “to be honest”, “going home” and “that's unfair”. These are stylistic choices, not claims of exclusive London usage. Removed the ambiguous global `hard`, `home`, `kiss` and `flirt` swaps, which could damage phrases like “hard drive” or “home page”.

Stronger alternatives are limited to exasperated phrases (such as “for goodness sake”, “I don't care”, “stop messing around”, “really annoyed”). Each eligible phrase has a 40% deterministic chance while the message's one-phrase budget remains. The budget is shared across protected spans; existing profanity in unprotected text prevents more being added. There are no profane random closers, added slurs or threats. This is literal phrase matching, not semantic understanding: previews are still recommended, particularly with sarcasm, quotations or sensitive contexts.

The toggle only prevents **new** swearing; input profanity is not censored. Roleplay actions were removed entirely, mid-sentence insertions are disabled in the user preset, and opener/closer frequency has been reduced. Regression tests cover both swearing states, the per-message cap, neutral text, protected syntax, deterministic output and migration from old settings.
