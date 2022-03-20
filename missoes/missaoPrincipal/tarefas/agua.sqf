params["_centro", "_tarefaPaiID"];

_torres = nearestObjects [_centro, TORRESAGUA_TIPOS, areaTamanho select 0, true];
if (_torres isEqualTo []) exitWith {};

_tarefaID = "missaoAgua_" + str incrementoMP;
["criaTarefa", [_tarefaID, _tarefaPaiID], "descricaoAgua", "tipoAgua"] spawn SMQTV_fnc_trataTarefas;

waitUntil {
	sleep 5;
	{alive _x} count _torres == 0
};

["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;