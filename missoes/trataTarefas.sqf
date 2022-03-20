params ["_modo"];

switch (_modo) do
{
	case "criaTarefa":
	{
		_tarefaID		= param [1];
		_descricao		= param [2];
		_tipo			= param [3];
		_notificacao	= param [4, false, [true]];
		_local			= param [5, objNull, [objNull, [0,0,0]]];

		[
			true,
			_tarefaID,
			_descricao,
			_local,
			"AUTOASSIGNED",
			-1,
			_notificacao,
			_tipo
		] call BIS_fnc_taskCreate;
	};

	case "alteraDescricaoTarefa":
	{
		_tarefaID			= param [1];
		_tarefaDescricao	= param [2];

		_descricao = _tarefaID call BIS_fnc_taskDescription;
		[_tarefaID, [_tarefaDescricao, _descricao select 1, _descricao select 2]] call BIS_fnc_taskSetDescription;
	};

	case "alteraEstadoTarefa":
	{
		_tarefaID		= param [1];
		_tarefaEstado	= param [2];

		[_tarefaID, _tarefaEstado] call BIS_fnc_taskSetState;
	};

	case "excluiTarefa":
	{
		_tarefaID	= param [1];

		[_tarefaID, true, true] call BIS_fnc_deleteTask;
	};
};