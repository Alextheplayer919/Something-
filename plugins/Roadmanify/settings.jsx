import { React } from "@vendetta/metro/common";
import { storage } from "@vendetta/plugin";
import { useProxy } from "@vendetta/storage";
import { reloadRoadmanifier } from "./roadmanifier/index.js";
import { ScrollView, TableRowGroup, TableSwitchRow } from "../../common/ui/TableComponents.js";

export default function Settings() {
	useProxy(storage);

	return (
		<ScrollView style={{ flex: 1 }} contentContainerStyle={{ padding: 12 }}>
			<TableRowGroup title="Roadmanify">
				<TableSwitchRow
					label="Convert messages before sending"
					value={storage.settings.convert_messages}
					onValueChange={(value) => { storage.settings.convert_messages = value; }}
				/>
				<TableSwitchRow
					label="Send command output by default"
					value={storage.settings.defaults.send}
					onValueChange={(value) => { storage.settings.defaults.send = value; }}
				/>
				<TableSwitchRow
					label="Allow occasional added swearing"
					value={storage.settings.allow_swearing}
					onValueChange={(value) => {
						storage.settings.allow_swearing = value;
						reloadRoadmanifier(storage);
					}}
				/>
			</TableRowGroup>
		</ScrollView>
	);
}
