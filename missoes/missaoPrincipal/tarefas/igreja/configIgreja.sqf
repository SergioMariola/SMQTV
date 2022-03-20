params["_centro", "_tarefaPaiID"];

//Verifica igrejas na área
_igrejas = nearestObjects [_centro, IGREJAS_TIPOS, areaTamanho select 0, true];

if (_igrejas isEqualTo []) exitWith {};

//Configura explosivo
_igreja = selectRandom _igrejas;
_igreja allowDamage false;
_igrejaPosicoes = _igreja buildingPos -1;
_igrejaPosicao = selectRandom _igrejaPosicoes;
_grejaPosicao = AGLToASL _igrejaPosicao;
_explosivo = createVehicle [(selectRandom EXPLOSIVOS_TIPOS), _igrejaPosicao, [], 0, "CAN_COLLIDE"];
waitUntil { !isNull _explosivo };
_begPos = _explosivo modelToWorldWorld [0,0,0];
_endPos = _explosivo modelToWorldWorld [0,0,-10];
_surf = lineIntersectsSurfaces [_begPos, _endPos, _explosivo];
_igrejaPosicao = _surf select 0 select 0;
_explosivo setPosASL _igrejaPosicao;
{_x addCuratorEditableObjects [[_explosivo], false]} forEach allCurators;
_explosivo allowDamage false;
inimigosAO pushBack _explosivo;
SMQTV_defusado = false;

[
	_explosivo,
	"Desarmar explosivo",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"_target distance _this < 3",
	"true",
	{},
	{
		params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
		if (_progress == 5) then
		{
			if !("ToolKit" in (items _caller)) then
			{
				private _texto = "Você não possui um ToolKit para desarmar este explosivo<br/>Esta operação pode não sair como esperado";
				["naoImportante", _texto] call SMQTV_fnc_cutText;
			};
		};
	},
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _igreja = _a0;
		private _explosivo = _a1;

		if ("ToolKit" in (items _caller)) exitWith {
			_this remoteExec ["SMQTV_fnc_defusaIgreja", 0, _target];
		};

		if (random 1 > 0.2) then
		{
			private _explosivo = createMine [typeOf _target, position _target, [], 0];
			_explosivo setDamage 1;
			deleteVehicle _target;
			_igreja setDamage 1;
		} else {
			_this remoteExec ["SMQTV_fnc_defusaIgreja", 0, _target];
		};
	},
	{
		["naoImportante", "Ação cancelada", 0.4] call SMQTV_fnc_cutText;
	},
	[_igreja, _explosivo],
	20,
	1.5
] remoteExecCall ["BIS_fnc_holdActionAdd", 0, _explosivo];

private _tarefaID = "missaoIgreja_" + str incrementoMP;
["criaTarefa", [_tarefaID, _tarefaPaiID], "descricaoIgreja", "tipoIgreja"] spawn SMQTV_fnc_trataTarefas;

waitUntil {
	sleep 5;
	!alive _explosivo || SMQTV_defusado
};

if !SMQTV_defusado exitWith {
	["alteraEstadoTarefa", _tarefaID, "FAILED"] spawn SMQTV_fnc_trataTarefas;
	SMQTV_defusado = nil;
};

["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;
SMQTV_defusado = nil;