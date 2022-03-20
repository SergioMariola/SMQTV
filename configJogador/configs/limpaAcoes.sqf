_this addEventHandler ["Killed", {
	params ["_unit"];
	removeAllActions _unit;
}];