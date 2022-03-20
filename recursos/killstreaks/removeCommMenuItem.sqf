params [
	["_caller", objNull, [objNull]],
	["_id", -1, [0]]
];

//Remove item do Menu de Suporte
[_caller, _id] call BIS_fnc_removeCommMenuItem;

//Apaga HUD de dica de utilização
private _commsMenu = missionNamespace getVariable ["BIS_fnc_addCommMenuItem_menu", []];
if (count _commsMenu < 2) then { "SMQTV_ctrlF" cutFadeOut -1 };

//Remove item da lista de contenção
private _index = SMQTV_commsMenuItems findIf { _x isEqualTo _id };
SMQTV_commsMenuItems deleteAt _index;