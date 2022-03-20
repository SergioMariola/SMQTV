_this addEventHandler ["Killed", {
	params ["_unit"];
	_unit call SMQTV_fnc_reiniciaKillstreaks;
}];

["SMQTV_ctrlF"] call BIS_fnc_rscLayer;