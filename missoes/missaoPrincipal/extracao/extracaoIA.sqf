params ["_centro", "_marcadorMissaoArea"];

sleep 5;

_pilotos = allPlayers findIf {typeOf _x == "B_Helipilot_F"};
if ( _pilotos > -1 ) exitWith {};

_jogadoresAO = playableUnits inAreaArray _marcadorMissaoArea;
if ( count _jogadoresAO == 0 ) exitWith {};

//Posição de pouso
_n = 0;
_helipadPos = [_centro, _n, areaTamanho select 0, 20, 0, 0.3, 0] call BIS_fnc_findSafePos;
while {count _helipadPos == 3} do
{
	_n = _n + 100;
	_helipadPos = [_centro, 0, areaTamanho select 0 + _n, 20, 0, 0.3, 0] call BIS_fnc_findSafePos;
};

//Cria veículo, tripulação e etc
_helipad = "Land_HelipadEmpty_F" createVehicle _helipadPos;
_veiculos = [["B_Heli_Transport_03_F", "Door_rear_source"], ["B_T_VTOL_01_infantry_F", "Door_1_source"]];
_veiculoEscolha = "";
_rampaVeiculo = "";

if (playersNumber west <= 16) then
{
	_veiculoEscolha = _veiculos select 0 select 0;
	_rampaVeiculo = _veiculos select 0 select 1;
} else {
	_veiculoEscolha = _veiculos select 1 select 0;
	_rampaVeiculo = _veiculos select 1 select 1;
};

_veiculo = createVehicle [_veiculoEscolha, getMarkerPos "extracaoRTB", [], 0, "FLY"];
_grupo = createVehicleCrew _veiculo;

SMQTV_extracaoAI = [];
SMQTV_extracaoAI_falha = false;
SMQTV_extracaoAI pushBack _helipad;
SMQTV_extracaoAI pushBack _veiculo;
{
	_veiculo lockTurret [_x, true];
} forEach (allTurrets [_veiculo, false]);
_veiculo lockDriver true;

zeus addCuratorEditableObjects [[_veiculo, _helipad], true];

{
	SMQTV_extracaoAI pushBack _x;
	zeus addCuratorEditableObjects [[_x], true];
} forEach (units _grupo);

_eh = _veiculo addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	 _texto = "Use a ação 'Retornar à base' do menu de ações quando todos estiverem prontos";
	["importante", _texto] remoteExecCall ["SMQTV_fnc_cutText", _unit];
}];

{
	_x addEventHandler ["Killed", {
		if (SMQTV_extracaoAI_falha) exitWith {};
		SMQTV_extracaoAI_falha = true;
		[SMQTV_extracaoAI, 60] spawn SMQTV_fnc_excluiObjetos;
		["importante", "Atenção!<br/>Equipe de extração automática foi impedida de ajudar"] remoteExecCall ["SMQTV_fnc_cutText"];
	}];
} forEach [_veiculo, driver _veiculo];

//Dispara aviso
[_veiculoEscolha] remoteExecCall ["SMQTV_fnc_extracaoAviso", _jogadoresAO];

//addAction
_texto = "Retornar à base";
[_veiculo, [
	_texto,
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		_texto = format ["== %1 ordenou que o veículo de extração retorne à base ==", name _caller];
		_wp = group (driver _target) addWaypoint [getMarkerPos "extracaoRTB", -1];

		_target removeEventHandler ["GetIn", _arguments];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointForceBehaviour true;
		_wp setWaypointStatements ["true", "vehicle this land 'LAND'"];
		_wp setWaypointCompletionRadius 50;
		[_texto] remoteExec ["systemChat"];
		[_target, _actionId] remoteExec ["removeAction"];
		remoteExec ["SMQTV_fnc_extracaoRadio", crew _target];
	},
	_eh,
	1.5,
	false,
	true,
	"",
	"_this in crew _target"
]] remoteExec ["addAction", 0, _veiculo];

//Marcador
 _marcadorVeiculo = ["criarUnica", nil, nil, position _veiculo, "b_air"] call SMQTV_fnc_criaMarcador;
["seguir", _veiculo, _marcadorVeiculo] spawn SMQTV_fnc_monitoraMarcador;

//Waypoint
_wp = _grupo addWaypoint [_helipadPos, -1];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointForceBehaviour true;
_wp setWaypointStatements ["true", "vehicle this land 'GET IN'"];
_wp setWaypointCompletionRadius 300;

//Cria fumaça
_fumaca = _helipadPos call SMQTV_fnc_extracaoFumaca;

//Marcador de pouso
_marcadorPouso = createMarkerLocal ["marcaExtracao" + str incrementoMP, _helipadPos];
_marcadorPouso setMarkerTypeLocal "hd_pickup";
_marcadorPouso setMarkerColorLocal "colorIndependent";
_marcadorPouso setMarkerText "Ponto de extração!";
SMQTV_extracaoAI pushBack _marcadorPouso;

waitUntil {
	sleep 2;
	isTouchingGround _veiculo || {!alive _veiculo || {!alive (driver _veiculo)}}
};

//Exclui fumaça
deleteVehicle (_fumaca select 0);
deleteGroup (_fumaca select 1);

//Partida
if (alive _veiculo && alive (driver _veiculo)) then {
	_veiculo animateDoor [_rampaVeiculo, 1, false];
	_marcadorPouso setMarkerText format ["Ponto de extração! Chegou em: %1h%2m [expira em 15min]", systemTime select 3, systemTime select 4];
};

 _tempoLimite = diag_tickTime + 300;

waitUntil {
	sleep 2;
	diag_tickTime >= _tempoLimite || {!alive _veiculo || {!alive (driver _veiculo)}}
};

[SMQTV_extracaoAI] spawn SMQTV_fnc_excluiObjetos;