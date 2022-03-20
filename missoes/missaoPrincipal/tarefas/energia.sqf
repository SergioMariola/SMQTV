params["_centro", "_tarefaPaiID"];

_transformadores = [];
_objetos = nearestTerrainObjects [_centro, [], areaTamanho select 0];
_objetoPos = [];
_marcador = "";

{
	_objetoTexto = format ["%1", _x];
	if (_objetoTexto find "dp_transformer_f" > -1) then
	{
		_objetoPos = getPosASLW _x;
		_marcador = ["criarUnica", nil, nil, _objetoPos, "loc_PowerSolar"] call SMQTV_fnc_criaMarcador;
		["estatico", _x, _marcador] spawn SMQTV_fnc_monitoraMarcador;
		_transformadores pushBack _x;
	};
} forEach _objetos;

if (_transformadores isEqualTo []) exitWith {};

_tarefaID = "missaoEnergia_" + str incrementoMP;
["criaTarefa", [_tarefaID, _tarefaPaiID], "descricaoEnergia", "tipoEnergia"] spawn SMQTV_fnc_trataTarefas;

waitUntil {
	sleep 5;
	{alive _x} count _transformadores == 0
};

["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;