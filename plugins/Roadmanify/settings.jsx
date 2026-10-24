import { React, ReactNative } from "@vendetta/metro/common";
import { storage } from "@vendetta/plugin";
import { useProxy } from "@vendetta/storage";
import { clamp01 } from "./roadmanifier/utils.js";
import { reloadRoadmanifier } from "./roadmanifier/index.js";
import {
	ScrollView,
	Stack,
	TableRowGroup,
	TableSwitchRow,
	TextInput,
} from "../../common/ui/TableComponents.js";
import { findByProps } from "@vendetta/metro";

const { View, Text } = ReactNative;
const { Slider } = findByProps("Slider") || {};
const { Card } = findByProps("Card") || {};

const updateStorage = (path, finalVal) => {
	const keys = path.split(".");
	let current = storage;
	for (let i = 0; i < keys.length - 1; i++) {
		current = current[keys[i]];
	}
	current[keys[keys.length - 1]] = finalVal;

	if (path.startsWith("settings.roadmanifier"))
		setTimeout(() => reloadRoadmanifier(storage), 0);
};

const SettingCardSlider = ({ label, path, max = 1 }) => {
	const keys = path.split(".");
	let initialVal = storage;
	for (const key of keys) initialVal = initialVal[key];

	const [localText, setLocalText] = React.useState(String(initialVal));

	const handleTextChange = (text) => {
		setLocalText(text);
		if (text === "" || text.endsWith(".")) return;
		const parsed = Number(text);
		if (!Number.isNaN(parsed)) {
			updateStorage(path, clamp01(parsed));
		}
	};

	const handleSliderChange = (val) => {
		const rounded = parseFloat(val.toFixed(3));
		setLocalText(String(rounded));
		updateStorage(path, rounded);
	};

	const content = (
		<View style={{ padding: 0, gap: 12 }}>
			<View
				style={{
					flexDirection: "row",
					justifyContent: "space-between",
					alignItems: "center",
				}}
			>
				<Text
					variant="heading-md/semibold"
					style={{ color: "#dbdee1", flexShrink: 1 }}
				>
					{label}
				</Text>
				<View style={{ width: 80 }}>
					<TextInput
						placeholder="0.0"
						value={localText}
						onChangeText={handleTextChange}
						keyboardType="numeric"
						size="sm"
					/>
				</View>
			</View>
			{Slider && (
				<Slider
					value={parseFloat(localText) || 0}
					minimumValue={0}
					maximumValue={max}
					step={0.005}
					onValueChange={handleSliderChange}
				/>
			)}
		</View>
	);

	if (Card) {
		return <Card>{content}</Card>;
	}

	return (
		<View
			style={{
				backgroundColor: "#2b2d31",
				borderRadius: 16,
				overflow: "hidden",
			}}
		>
			{content}
		</View>
	);
};

export default function Settings() {
	useProxy(storage);

	return (
		<ScrollView style={{ flex: 1 }} contentContainerStyle={{ padding: 12 }}>
			<Stack spacing={12}>
				<TableRowGroup title="Slang & accent">
					<Stack spacing={8}>
						<SettingCardSlider label="Slang swaps (bruv, peng, dench)" path="settings.roadmanifier.words" />
						<SettingCardSlider label="Accent (dis, dat, gonna, -in')" path="settings.roadmanifier.accent" />
					</Stack>
				</TableRowGroup>
				<TableRowGroup title="Start & end of messages">
					<Stack spacing={8}>
						<SettingCardSlider label="Openers (wagwan, oi)" path="settings.roadmanifier.sentences.openers" />
						<SettingCardSlider label="Closers (innit, fam)" path="settings.roadmanifier.sentences.closers" />
					</Stack>
				</TableRowGroup>
				<TableRowGroup title="Mid-sentence extras">
					<Stack spacing={8}>
						<SettingCardSlider label="Tags (bruv, blud, fam)" path="settings.roadmanifier.spaces.tags" />
						<SettingCardSlider label="Fillers (you get me)" path="settings.roadmanifier.spaces.fillers" />
						<SettingCardSlider label="Actions *dap*" path="settings.roadmanifier.spaces.actions" />
					</Stack>
				</TableRowGroup>
				<TableRowGroup title="Other">
					<TableSwitchRow
						label="Send command output by default"
						value={storage.settings.defaults.send}
						onValueChange={(v) => updateStorage("settings.defaults.send", v)}
					/>
					<TableSwitchRow
						label="Convert message before sending"
						value={storage.settings.convert_messages}
						onValueChange={(v) => {
							updateStorage("settings.convert_messages", v);
						}}
					/>
				</TableRowGroup>
			</Stack>
		</ScrollView>
	);
}
