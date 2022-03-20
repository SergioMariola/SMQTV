//Reinicia variável de killstreaks
SMQTV_killstreaks = 0;

//Sai do script caso não haja suporte disponível para o jogador
_commsMenu = missionNamespace getVariable ["BIS_fnc_addCommMenuItem_menu", []];
if (count _commsMenu < 2) exitWith {};

//Remove itens do Menu de Suporte
{[_this, _x] call BIS_fnc_removeCommMenuItem} forEach SMQTV_commsMenuItems;
SMQTV_commsMenuItems resize 0;

//Apaga HUD de dica de utilização de suporte
"SMQTV_ctrlF" cutFadeOut -1;