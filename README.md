# Roadmanify

A **Vendetta-format Discord client plugin**, extracted from the supplied `dumsane-roadmanify.zip`. Converts text into playful London-inspired slang, using an automatic message filter or the `/roadmanify` command. **This repository builds a plugin link, not an APK.**

## Plugin import link (available from the PR branch)

The compiled plugin is also published directly in this public repository, so installation does not depend on enabling Pages:

```text
https://raw.githubusercontent.com/Alextheplayer919/Something-/arena/3b59966b-something/published/Roadmanify/
```

Paste this folder URL into your Vendetta-compatible client's **Settings → Plugins → + / Install**. Keep the branch while using this URL. It tracks updates pushed to the current PR branch; deleting the branch will break future installs and updates from this URL.

The `published/Roadmanify/` directory intentionally tracks only the small compiled manifest and bundle, as an exception to keeping generated builds out of Git. After source or dependency changes, run `npm run export:raw` and commit both updated files. CI checks that these files match a fresh build via `npm run check:raw`.

### GitHub Pages alternative

After a successful GitHub Pages deployment:

```text
https://alextheplayer919.github.io/Something-/Roadmanify/
```

Paste the **whole folder URL**, including `Roadmanify/`, into your client's **Settings → Plugins → + / Install**. Do not import the ZIP, a GitHub source page, `manifest.json` or `index.js` separately.

Requires a client with **Vendetta-compatible plugin APIs and URL installation**. The source uses `@vendetta` APIs. Stock Discord, desktop Vencord and BetterDiscord do not accept this plugin format. Compatibility with a particular client/Discord version still needs testing on your device.

The website root (`https://alextheplayer919.github.io/Something-/`) provides installation help and a copy-link button. The plugin folder serves `manifest.json` and `index.js`; it does not need its own browser homepage.

> The Pages URL above is a deployment target, not a claim that it is already live. GitHub Pages was not enabled when this work was prepared. No remote deployment is performed just by editing these files.

## Enable publishing once

1. Put these changes on GitHub. The automatic production trigger is a push to **`main`**, not the archive's old `master` branch.
2. Open **Repository → Settings → Pages → Build and deployment → Source → GitHub Actions**.
3. Open **Actions → Build and publish Roadmanify link**. A push to `main` runs it automatically; **Run workflow** can publish a selected branch once the workflow is available on the default branch. If using a non-default branch, the `github-pages` environment must allow deployments from that branch.
4. Wait for both **build** and **deploy** to succeed. The deployment job's summary prints the import URL. Then paste that URL into your client.

The workflow uses `npm ci` with the committed lockfile, runs the tests, builds **only Roadmanify**, prepares the static site, verifies the manifest hash and smoke-tests the bundle. It deploys through the official GitHub Pages artifact actions. Pull requests are built/tested but **never deployed**. There is no APK or separate `gh-pages` source branch.

If you see a 404: check Pages is enabled, the deployment finished, and the URL's repository name and `Roadmanify` capitalization are exact. If manifest/bundle URLs work but installation fails, check your client's Vendetta compatibility and logs. A custom Pages domain requires adjusting the URL generator in `scripts/prepare-site.mjs`.

## Use it

- `/roadmanify input:hello friend send:false` — show a private/local preview.
- `/roadmanify input:hello friend send:true` — send the transformed text to the current channel.
- **Convert message before sending** enables/disables automatic conversion; it is **on by default**, as in the supplied plugin.
- **Send command output by default** controls the command's default; initially **on**. Use `send:false` or disable this setting if you only want previews.
- **Allow occasional added swearing** is **on by default**. Frustrated/exasperated phrases can occasionally use stronger language (for example, “I don’t care” → “man don't give a shit”). Switch it off for clean replacements; this does not censor profanity you typed yourself.
- **No sliders or numeric fields.** A fixed, tuned preset handles slang and accent with occasional openers/closers. No random mid-sentence padding or roleplay actions.
- Added swearing is limited to **one stronger phrase per message**, only on eligible phrases—not neutral greetings or compliments. Existing profanity in ordinary text suppresses further added swearing.
- Existing installs keep their automatic-conversion and send-default switches. Old slider values are ignored so they cannot silently disable the new preset.

Core replacements (the preset may add occasional accent changes or an opener/closer):

| Input | Possible output |
| --- | --- |
| `scared` | `shook` |
| `muscular` | `hench` |
| `annoying` | `jarring` |
| `out of money` | `skint` |
| `I am hungry` / `im hungry` | `man's after a munch` |
| `I am really hungry` | `man's proper hungry` |
| `I’m a bit hungry` | `man's a bit peckish` |
| `I am thirsty` | `man needs a drink` |
| `I feel tired` | `man's knackered` |
| `I need some sleep` | `man needs some kip` |
| `come over` | `pull up` |
| `let me know` | `give me a shout` |
| `I understand` | `say less` |
| `hang out with friends` | `roll with fam` |

Personal-state rules cover hunger, thirst, sleep, tiredness, mood, stress, illness and temperature. They match `I am`, `I'm`, `I’m`, casual `im`, and `I feel` / `I'm feeling`. They keep the speaker as the subject: “man's” is self-reference here, not a remark about someone else. Mild/intense qualifiers get separate wording, negatives stay negative, and statements about other people do not acquire a first-person subject. These are authored phrase rules, not general language understanding.

Choices are deterministic for the same input and settings, so repeating a message does not reroll swearing. Stronger wording is authored for a small set of phrases; it is not an AI judgement about context. This is a playful text filter, not a context-aware translator or a complete representation of a real dialect. See [slang notes and research](docs/slang-research.md).

## Preservation and privacy

URLs, Discord mentions/custom emoji, inline/fenced code and Markdown links are protected before replacements. Slash-command messages beginning with `/` are left alone. Phrase output is not transformed a second time. Plain text outside those protected regions can still change, so preview important messages first.

Roadmanify's text conversion runs locally and does not call an external translation service. The last **25 command inputs and timestamps** are retained in the plugin's local storage, as in the supplied archive. Local previews are not sent as your chat message; `send:true` and automatic conversion use the client's normal message-sending path.

Client modifications may violate Discord's terms. Review code before installing and use at your own discretion.

## Local development

Use Node.js **22+**:

```sh
npm ci
npm test
npm run build
npm run site
npm run verify
```

The installable files are `dist/Roadmanify/{manifest.json,index.js}`. The SHA-256 in the manifest is computed from the compiled bundle. `dist/` and `node_modules/` are ignored; GitHub Actions publishes the built output.

`npm run verify` checks site contents, manifest/hash, bundle syntax and plugin lifecycle against mocked Vendetta APIs, including the three-switch settings screen, live swearing toggle, private preview, outgoing messages, filter bypass, bounded history and unload. It is **not** an on-device compatibility test.

### Archive contents

The original ZIP is retained, and all its source files were extracted into this repository. The archive also includes unrelated plugins (including token/evaluation utilities). Those files are preserved for completeness, **not endorsed or deployed**. The default build and deployment include Roadmanify only. `npm run build:all` is an opt-in development command for the archived collection; that collection is not part of the tested deployment.

The extracted Unlicense and author credits are retained. Build dependencies were updated, a lockfile added, and the old type package's vulnerable Moment dependency overridden with a patched version.
