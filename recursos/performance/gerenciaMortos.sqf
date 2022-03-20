_tempo			= 0;
_vetorNome		= "";
_respawn		= [];
_lista			= [];
_veiculo		= objNull;
_objeto			= objNull;

while {sleep 5; true} do {

	_lista = allDead;

	//Tenta novamente se não houver mortos
	if (_lista isEqualTo []) then {continue};

	//Percorre lista
	{
		//Ignora quando for Respawn Móvel
		if (_x getVariable ["SMQTV_respawnMovelFlag", false]) then {continue};

		//Verifica tempo
		_tempo = _x getVariable ["SMQTV_excluiTempo", 0];
		if (_tempo >= 15) then {

			//Exclui do vetor inimigo
			_vetorNome = _x getVariable ["SMQTV_vetorInimigo", ""];
			if (_vetorNome isNotEqualTo "") then {
				_objeto = _x;
				_vetor = missionNamespace getVariable _vetorNome;
				_vetor deleteAt (_vetor findIf {_x isEqualTo _objeto});
			};

			//Exclui objeto
			_respawn = _x getVariable ["SMQTV_respawnFlag", []];
			_veiculo = objectParent _x;
			if (!isNull _veiculo) then {_veiculo deleteVehicleCrew _x} else {deleteVehicle _x};

			//Respawn
			if (_respawn isNotEqualTo []) then {_respawn spawn SMQTV_fnc_respawnVeiculo};
		} else {

			//Incrementa tempo
			_tempo = _tempo + 1;
			_x setVariable ["SMQTV_excluiTempo", _tempo];
		};


		sleep 0.5;
	} forEach _lista;
};