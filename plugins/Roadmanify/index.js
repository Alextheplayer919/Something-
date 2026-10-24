/** biome-ignore-all lint/complexity/useLiteralKeys: <ilik e it> */
import Settings from "./settings.jsx";
import { cmdDisplays } from "../../common/index.js";
import { findByProps } from "@vendetta/metro";
import { before } from "@vendetta/patcher";
import { sendTextMessage as sendText } from "../../common/index.js";
import { storage } from "@vendetta/plugin";
import { commands } from "@vendetta";
import { getRoadmanifier, reloadRoadmanifier } from "./roadmanifier/index.js";
import { makeDefaults } from "../../common/index.js";

const patches = [];

const DEFAULT_STORAGE = {
	stats: {
		global_counter: 0,
		history: [], // only remembers the last 25
	},
	settings: {
		allow_swearing: true,
		convert_messages: true,
		defaults: {
			send: true,
		},
	},
};

export default {
	settings: Settings,
	onUnload() {
		for (const unpatch of patches.splice(0)) unpatch();
	},
	onLoad() {
		makeDefaults(storage, DEFAULT_STORAGE);
		reloadRoadmanifier(storage);

		patches.push(
			commands.registerCommand(
				cmdDisplays({
					type: 1,
					applicationId: "-1",
					inputType: 1,
					name: `roadmanify`,
					description: "Roadmanify some text, bruv",
					options: [
						{
							type: 3,
							required: true,
							name: "input",
							description: "Text to be Roadmanified",
						},
						{
							type: 5,
							required: false,
							name: "send",
							description: `Whether to send the roadmanified text as an actual message in chat (default: ${storage["settings"]["defaults"]["send"]})`,
						},
					],
					execute: (rawArgs) => {
						try {
							const args = new Map(rawArgs.map((o) => [o.name, o]));
							const input = args.get("input")?.value;
							const output = getRoadmanifier().roadmanifySentence(input);
							const ephemeral = !(args.get("send")?.value ?? storage["settings"]["defaults"]["send"]);
							const history = storage["stats"]["history"];

							history.unshift({
								timestamp: Date.now(),
								input,
							});

							while (history.length > 25) history.pop();

							sendText("currentChannel", output, ephemeral);
						} catch (e) {
							console.error(e);
							console.log(e.stack);
							alert(`There was an error while running the command\n${e.stack}`);
						}
					},
				}),
			),
		);

		const Messages = findByProps("sendMessage", "receiveMessage");
		patches.push(
			before("sendMessage", Messages, (args) => {
				if (storage["settings"]["convert_messages"] && args[1] && !args[1]._command_output)
					args[1].content = getRoadmanifier().roadmanifySentence(args[1].content);
			}),
		);
	},
};
