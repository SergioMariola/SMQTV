if (typeOf _this isNotEqualTo "B_Soldier_F") exitWith {};

private _acao = _this addAction [
	"Fornecer munição",
	{_this spawn SMQTV_fnc_rearmaSoldado},
	nil,
	1.5,
	false,
	true,
	"",
	"!(localNamespace getVariable ['SMQTV_rearmCaixaNoChao', false]) && {isNull (objectParent _originalTarget)}"
];

_this setUserActionText [
	_acao,
	"Fornecer munição",
	"<img size='1.8' shadow='2' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa'/>"
];