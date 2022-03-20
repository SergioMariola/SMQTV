_this addEventHandler ["Hit", {
	params ["_jog", "_source", "", "_instigator"];

	//Variáveis
	_ls = lifeState _jog;
	_incap = _jog getVariable ["SMQTV_incap", false];

	//Incapacitação
	if (_ls isEqualTo "INCAPACITATED" && {!_incap}) exitWith {
		//Flag incapacitado
		_jog setVariable ["SMQTV_incap", true];
		//Mostra HUD de médicos próximos
		"SMQTV_hudMed" cutRsc ["hudMed", "PLAIN", -1, false];
		//Cria gatilho para saída do estado de incapacitado
		_gat = createTrigger ["EmptyDetector", _jog, false];
		_gat setTriggerStatements [
			"lifeState player isNotEqualTo 'INCAPACITATED'",
			"deleteVehicle thisTrigger;
			player setVariable ['SMQTV_incap', nil];
			'SMQTV_hudMed' cutFadeOut -1;",
			""
		];
		//Fogo amigo
		if (isPlayer _instigator) exitWith {[_jog, _instigator] call SMQTV_fnc_fogoAmigo};
		if (isPlayer _source) exitWith {[_jog, _source] call SMQTV_fnc_fogoAmigo};
		//Mensagem de incapacitação
		[_jog, "incap"] remoteExec ['SMQTV_fnc_msgIncap', -2];
	};

	//Morte
	if (_ls isEqualTo "DEAD-RESPAWN") exitWith {
		[_jog, "morto"] remoteExec ['SMQTV_fnc_msgIncap', -2];
	};
}];