params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

waitUntil { visibleMap };
private _texto = "Escolha no menu abaixo a posição que deseja ressurgir";
["importante", _texto, 5] call SMQTV_fnc_cutText;