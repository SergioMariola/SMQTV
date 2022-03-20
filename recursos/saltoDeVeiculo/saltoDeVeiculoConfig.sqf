if (isServer) exitWith {};
if (!hasInterface && !isDedicated) exitWith {};

params ["_helipad", "_tipo"];

private _pos = getPosATL _helipad;
private _dir = getDir _helipad;
private _veiculo = _tipo createVehicleLocal _pos;
waitUntil { !isNull _veiculo };
_veiculo setDir _dir;

//Ação
[
	_veiculo,
	"Salto de Veículo",
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	"((vehicle _this) != _this) && ((driver (vehicle _this)) == _this)",
	"true",
	{},
	{},
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target] spawn SMQTV_fnc_saltoDeVeiculo;
	},
	{
		["naoImportante", "Ação cancelada", 0.5] call SMQTV_fnc_cutText;
	},
	[],
	0.5,
	1.5,
	false
] call BIS_fnc_holdActionAdd;

//Legenda 3D
addMissionEventHandler ["Draw3D", {
	private _veiculo = _thisArgs select 0;
	private _posVeiculo = getPosASL _veiculo;
	private _eyePos = eyePos player;
	if ( _posVeiculo distance _eyePos > 150 ) exitWith {};
	private _parent = objectParent player;
	if ( [_veiculo, "VIEW", _parent] checkVisibility [_eyePos, _posVeiculo] < 0.1 ) exitWith {};
	drawIcon3D [
		"",
		[1,1,1,1],
		ASLToAGL _posVeiculo,
		0,
		0,
		0,
		"Salto de veículo",
		2
	];
}, [_veiculo]];

//Configura luzes
_veiculo execVM "recursos\luzes\blackfish.sqf";

//Abre escotilha
_veiculo animateDoor ["Door_1_source", 1, false];
waitUntil { _veiculo doorPhase "Door_1_source" == 1 };

//Configurações de vulnerabilidade 
_veiculo allowDamage false;
_veiculo enableSimulation false;

//Tranca veículo
_veiculo lockDriver true;
{
	_veiculo lockTurret [_x,true];
} forEach allTurrets [_veiculo, true];
_veiculo lock true;