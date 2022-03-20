params["_centro", "_tarefaPaiID"];
private ["_hangaresTemp"];

private _hangares = nearestObjects [_centro, HANGARES_TIPOS, areaTamanho select 0, true];

if (_hangares isEqualTo []) exitWith {};

private _hangar = selectRandom _hangares;
_hangar allowDamage false;
private _hangarPos = getPosATL _hangar;
private _hangarDir = getDir _hangar;
private _hangarPosicoes = _hangar buildingPos -1;

//Cria veículo
private _veiculo = createVehicle [selectRandom DRONES_TIPOS, [_hangarPos select 0, _hangarPos select 1, (_hangarPosicoes select 0) select 2], [], 0, "CAN_COLLIDE"];
_veiculo setDir _hangarDir + 180;

if (typeOf _veiculo in ["I_UAV_02_dynamicLoadout_F", "O_UAV_02_dynamicLoadout_F"]) then
{
	private _pylons = ["",""];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veiculo >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veiculo removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _veiculo;
	{ [_veiculo, [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]] remoteExec ["setPylonLoadout", 0, _veiculo] } forEach _pylons;
};
_veiculo setFuel 0;
_veiculo addEventHandler ["HandleDamage", {
	params ["_unit", "", "", "", "_projectile"];

	if !(_projectile isKindOf "PipeBombBase") then
	{
		damage _unit;
	};
}];

//Cria objetos em volta do veículo
private _objPos = getPosATL _veiculo getPos [2, _hangarDir + 90];
private _obj1 = "Land_HelicopterWheels_01_assembled_F" createVehicle _objPos;
_obj1 setPos [_objPos select 0, _objPos select 1, (_objPos select 2) + 0.5];

_objPos = getPosATL _veiculo getPos [8, _hangarDir];
private _obj2 = "B_Slingload_01_Fuel_F" createVehicle _objPos;
_obj2 setDir _hangarDir + 90;

_objPos = getPosATL _veiculo getPos [5, _hangarDir + 150];
private _obj3 = createVehicle ["Land_MobileLandingPlatform_01_F", _objPos, [], 0, "CAN_COLLIDE"];
_obj3 setDir _hangarDir + 45;

_objPos = getPosATL _veiculo getPos [3, _hangarDir + 240];
private _obj4 = createVehicle ["Land_EngineCrane_01_F", [_objPos select 0, _objPos select 1, (_objPos select 2) + 0.2], [], 0, "CAN_COLLIDE"];
_obj4 enableSimulationGlobal false;
_obj4 setDir _hangarDir - 110;

{ _x addCuratorEditableObjects [[_veiculo, _obj1, _obj2, _obj3, _obj4], false] } forEach allCurators;

{
	inimigosAO pushBack _x;
	sleep 0.1;
} forEach [_veiculo, _obj1, _obj2, _obj3, _obj4];

private _tarefaID = "missaoDrone_" + str incrementoMP;
["criaTarefa", [_tarefaID, _tarefaPaiID], "descricaoDrone", "tipoDrone"] spawn SMQTV_fnc_trataTarefas;

waitUntil {
	sleep 5;
	!alive _veiculo
};

//Finaliza
["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;