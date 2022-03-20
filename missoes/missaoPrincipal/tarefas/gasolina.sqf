params["_centro", "_tarefaPaiID"];

_bombasGasolina = _centro nearObjects ["Land_fs_feed_F", areaTamanho select 0];

if (_bombasGasolina isEqualTo []) exitWith {};

_tarefaID = "missaoGasolina_" + str incrementoMP;
["criaTarefa", [_tarefaID, _tarefaPaiID], "descricaoGasolina", "tipoGasolina"] spawn SMQTV_fnc_trataTarefas;

waitUntil {
	sleep 5;
	{alive _x} count _bombasGasolina isEqualTo 0
};

["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;