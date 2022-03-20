SMQTV_killstreaks		= 0;
SMQTV_commsMenuItems	= [];

waitUntil { !isNull (findDisplay 46) };

findDisplay 46 displayAddEventHandler ["KeyDown", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
	
	if (_ctrl && { _key isEqualTo 0x21 }) then {
		_commsMenu = missionNamespace getVariable ["BIS_fnc_addCommMenuItem_menu", []];
		if (count _commsMenu < 2) exitWith {true};
		showCommandingMenu "#User:BIS_fnc_addCommMenuItem_menu";
		true
	};
}];