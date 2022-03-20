private _jogador = uiNamespace getVariable ["SMQTV_temp", objNull];

if (typeOf player in LISTA_PILOTOS) exitWith {["naoImportante", "Pilotos não podem copiar equipamento", 0.7] call SMQTV_fnc_cutText};
if !(player inArea "baseArea") exitWith {["naoImportante", "Não é possível copiar equipamento fora da base", 0.7] call SMQTV_fnc_cutText};
if (isNull _jogador) exitWith {
	uiNamespace setVariable ["SMQTV_temp", nil];
	["naoImportante", "Jogador não está mais na partida", 0.7] call SMQTV_fnc_cutText;
};

private _equipamento = getUnitLoadout [_jogador, true];
player setUnitLoadout _equipamento;
uiNamespace setVariable ["SMQTV_temp", nil];
["naoImportante", "Equipamento copiado", 0.4] call SMQTV_fnc_cutText;