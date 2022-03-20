params ["_blackfish"];

private _veiculo = vehicle player;
private _cargo = _blackfish canVehicleCargo _veiculo;
private _texto = "";

//Verifica se veículo cabe na aeronave
if !(_cargo # 1) exitWith {
	["Veículo não cabe na aeronave", nil, 3] spawn SMQTV_fnc_barraAviso;
};

//Verifica se jogador possui mapa
if !("ItemMap" in (assignedItems player)) exitWith {
	_texto = "Você não tem um mapa equipado<br/>É necessário um mapa para usar este recurso";
	["importante", _texto, player] call SMQTV_fnc_cutText;
};

//Verificar cooldown
call SMQTV_fnc_checkCooldown;
waitUntil { !isNil "SMQTV_cooldownSDV" };

if (SMQTV_cooldownSDV > 0) exitWith
{
	_texto = ["Em cooldown. Disponível em ", SMQTV_cooldownSDV, "s..."] joinString "";
	[_texto, nil, 4] spawn SMQTV_fnc_barraAviso;
	SMQTV_cooldownSDV = nil;
};

saltoPos				= [];
saltoRealizado			= false;
private _transporte		= objNull;
private _grupo			= grpNull;

//Abre mapa e aguarda ação
openMap true;
playSound [selectRandom (SMQTV_sons select 0), true];
_texto = "Aponte e clique no mapa onde deseja saltar ou feche o mapa para abortar o salto";
["naoImportante", _texto, 3] call SMQTV_fnc_cutText;

SMQTV_mapClick = false;
player onMapSingleClick
{
	onMapSingleClick "";
	saltoPos = _pos;
	SMQTV_mapClick = true;
};

waitUntil {SMQTV_mapClick or !(visiblemap)};

//Caso o jogador desista do salto e feche o mapa
if !(SMQTV_mapClick) exitWith
{
	onMapSingleClick "";
	saltoPos = nil;
	SMQTV_cooldownSDV = nil;
	playSound [selectRandom (SMQTV_sons select 2), true];
	["naoImportante", "Salto cancelado", 0.5] call SMQTV_fnc_cutText;
};

//Inicia cooldown
remoteExec ["SMQTV_fnc_iniciaCooldown", 2];
SMQTV_cooldownSDV = nil;

//Registra no DB
[player, "SALTO_VEICULO"] remoteExecCall ["SMQTV_fnc_dbAddAtributo", 2];

//Desabilita saltar manualmente
inGameUISetEventHandler ["Action", "
	if (_this select 3 != 'User') then {
		['naoImportante', 'Não é possível usar esta ação durante o transporte', 0.5] call SMQTV_fnc_cutText;
		true
	};
"];

//Previne problemas com Action Menu
private _eventHandler = player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	inGameUISetEventHandler ["Action", ""];
	_unit removeEventHandler ["Killed", _thisEventHandler];
}];

//Inicia transporte
["naoImportante", "Destino selecionado<br/>Iniciando salto...", 0.2] call SMQTV_fnc_cutText;
playSound [selectRandom (SMQTV_sons select 1), true];
sleep 2;
{player switchCamera "EXTERNAL"} remoteExec ["call", crew _veiculo];
openMap false;

//Cria veículo de transporte
_transporte = createVehicle ["B_T_VTOL_01_vehicle_F", getMarkerPos "inicioSaltoVeiculo", [], 0, "CAN_COLLIDE"];
waitUntil { !isNull _transporte };
private _dir = (getPosASL _transporte) getDir saltoPos;
_transporte setDir _dir;
_grupo = createVehicleCrew _transporte;
{ _x setCaptive true; } forEach (units _grupo);
[zeus, [[_transporte], true]] remoteExec ["addCuratorEditableObjects", 2];

{
	[_x, false, 60] call BIS_fnc_VREffectKilled;
} forEach ([_transporte] + (units _grupo));
{
	_x disableAI "TARGET";
	_x disableAI "AUTOTARGET";
	_x disableAI "AUTOCOMBAT";
} forEach (crew _transporte);

//Transição de câmera
private _cam = _transporte spawn SMQTV_fnc_sdvCameraTrans;
_transporte remoteExec ["SMQTV_fnc_sdvCameraTrans", (crew _veiculo) - [player]];
_transporte spawn {
	sleep 6;
	_this animateDoor ["Door_1_source", 1, false];
	waitUntil { (_this doorPhase "Door_1_source") isEqualTo 1  };
	waitUntil { getVehicleCargo _this isNotEqualTo [] };
	sleep 5;
	_this animateDoor ["Door_1_source", 0, false];
};
waitUntil { scriptDone _cam };

//Carrega veículo do jogador no veículo de transporte
_transporte setVehicleCargo _veiculo;
player action ["engineOff", _veiculo];
_veiculo engineOn false;

//Waypoints
private _waypoint1 = _grupo addWaypoint [saltoPos, -1];
_waypoint1 setWaypointType "MOVE";
_waypoint1 setWaypointBehaviour "CARELESS";
_waypoint1 setWaypointForceBehaviour true;
_waypoint1 setWaypointTimeout [1, 1, 1];
_waypoint1 setWaypointStatements["true","(vehicle this) setVehicleCargo objNull; saltoRealizado = true;"];

private _waypointPos2 = _veiculo getPos [(_veiculo distance2D saltoPos) + 5000, _dir];
private _waypoint2 = _grupo addWaypoint [_waypointPos2, -1];
_waypoint2 setWaypointType "MOVE";
_waypoint2 setWaypointBehaviour "CARELESS";
_waypoint2 setWaypointForceBehaviour true;

//Dispara mensagens
_texto = "O salto é realizado automaticamente ao alcançar o ponto escolhido no mapa";
["naoImportante", _texto] call SMQTV_fnc_cutText;
_texto = format ["== %1 está utilizando o Salto de Veículo ==", name player];
 _texto remoteExec ["systemChat"];

//Aguarda salto
waitUntil {saltoRealizado};

//Depois do salto
saltoPos = nil;
inGameUISetEventHandler ["Action", ""];
player removeEventHandler ["Killed", _eventHandler];

if (saltoRealizado) then
{
	saltoRealizado = nil;
	sleep 30;
	{ deleteVehicle _x; } forEach ([_transporte] + (units _grupo));
};
saltoRealizado = nil;