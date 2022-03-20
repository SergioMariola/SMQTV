params ["_grupo"];

//Marca para exclusão do vetor
_veiculo = objNull;
{
	_x setVariable ["SMQTV_vetorInimigo", "civisAO"];
	_veiculo = assignedVehicle _x;
	if (!isNull _veiculo) then {
		_veiculo setVariable ["SMQTV_vetorInimigo", "civisAO"];
	};
	sleep 0.5;
} forEach (units _grupo);

//Zeus
{
	_x addCuratorEditableObjects [units _grupo, false];
} forEach allCurators;

//Transfere para HC
_grupo spawn SMQTV_fnc_transfereGrupo;