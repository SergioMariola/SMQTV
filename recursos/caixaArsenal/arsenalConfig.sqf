_this enableRopeAttach false;
_this lockInventory true;

private _acao = _this addAction [
	"Arsenal Virtual",
	{call SMQTV_fnc_arsenal},
	nil,
	1.5,
	true,
	true,
	"",
	"",
	10
];

_this setUserActionText [_acao , "Arsenal Virtual", "<img size='2.5' image='\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa'/>"];

if (!isServer) exitWith {};

_this allowDamage false;
_this enableSimulationGlobal false;