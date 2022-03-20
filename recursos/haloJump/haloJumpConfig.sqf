if (!hasInterface && !isDedicated) exitWith {};

localNamespace setVariable ["SMQTV_caronaAvisoCooldown", false];

private _acao = _this addAction [
	"HALO Jump",
	{
		params ["_target", "_caller"];
		_caller spawn SMQTV_fnc_haloJump;
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true",
	3
];

_this setUserActionText [_acao , "HALO Jump", "<img size='2' image='\A3\ui_f\data\map\vehicleicons\iconParachute_ca.paa'/>"];

if (!isServer) exitWith {};

_this allowDamage false;
_this enableSimulationGlobal false;