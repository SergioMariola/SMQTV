private _acao = _this addAction [
	"Solicitar cura",
	{
		params ["", "_caller"];
		_jogadores = playableUnits inAreaArray [getPosATL _caller, 100, 100, 0, false, 100];
		_jogadores = _jogadores - [_caller];
		if (_jogadores isEqualTo []) exitWith {
			["naoImportante", "Não há jogadores próximos (100m) a você", 0.4] call SMQTV_fnc_cutText;
		};
		_caller remoteExecCall ["SMQTV_fnc_solicitaCura", _jogadores];
		playSound [selectRandom (SMQTV_sons select 5), true];
		["naoImportante", "Ajuda solicitada", 0.4] call SMQTV_fnc_cutText;
	},
	nil,
	1.5,
	true,
	true,
	"",
	"((getAllHitPointsDamage _originalTarget select 2) findIf {_x > 0.25} > -1) && { !('FirstAidKit' in (items _originalTarget)) }",
	-1
];

_this setUserActionText [
	_acao,
	"Solicitar cura",
	"<img size='2.5' image='\A3\ui_f\data\igui\cfg\cursors\unitBleeding_ca.paa'/>"
];