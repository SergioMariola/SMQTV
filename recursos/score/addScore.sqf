private _index = _this addEventHandler ["HandleScore", {
	params ["_unit", "_object", "_score"];

	//Killstreaks
	if (_score isEqualTo 1) exitWith {
		[_unit, "KILLS"] call SMQTV_fnc_dbAddAtributo;
		remoteExecCall ["SMQTV_fnc_checkKillstreaks", _unit];
		
	};

	//Dano colateral
	if (faction _object in ["CIV_F", "CIV_IDAP_F"] && {_object isKindOf "Man"}) exitWith {
		[_unit, "COLATERAL"] call SMQTV_fnc_dbAddAtributo;
		[_unit] remoteExecCall ["SMQTV_fnc_danoColateral"];
	};
}];

_this setVariable ["SMQTV_scoreEH", _index];