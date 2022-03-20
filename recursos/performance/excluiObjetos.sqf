params ["_objetos"];
_objetosFinal = flatten _objetos;
_delay = param [1, 0];

sleep _delay;

{
	switch (typeName _x) do
	{
		case "STRING":
		{
			deleteMarker _x;
		};

		case "OBJECT":
		{
			//Verifica se veículo possui jogador como passageiro
			if (crew _x findIf {isPlayer _x} > -1) then {
				["naoImportante","Este veículo será excluído assim que estiver sem tripulação e/ou passageiros"] remoteExecCall ["SMQTV_fnc_cutText", crew _x];
				_x spawn {
					while {true} do {
						sleep 5;
						if ({_x in crew _this} count playableUnits == 0) exitWith {deleteVehicle _this};
					};
				};
			} else {
				//Verifica se objeto é passageiro ou cargo de um veículo
				_veiculo = objectParent _x;
				if (isNull _veiculo) then {
					deleteVehicle _x;
				} else {
					_veiculo deleteVehicleCrew _x;
				};
			};
		};
	};
	sleep 0.2;
} forEach _objetosFinal;
_objetos resize 0;