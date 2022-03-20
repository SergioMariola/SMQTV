private _acao = _this addAction [
	"Rearmar-se",
	{
		params ["_target"];

		if (!alive _target) exitWith { ["importante", "Esta caixa está danificada", 0.4] call SMQTV_fnc_cutText };
		_sair = localNamespace getVariable ["SMQTV_caixaRearmOn", false];
		if (_sair) exitWith { ["importante", "Você já está se remuniciando", 0.4] call SMQTV_fnc_cutText };

		localNamespace setVariable ["SMQTV_caixaRearmOn", true];
		localNamespace setVariable ["SMQTV_caixaRearm", _target];
		"SMQTV_caixaRearm" cutRsc ["Rearma", "PLAIN", -1, false];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true",
	6
];

_this setUserActionText [
	_acao ,
	"Rearmar-se",
	"<img size='2' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa'/>"
];

_this lockInventory true;