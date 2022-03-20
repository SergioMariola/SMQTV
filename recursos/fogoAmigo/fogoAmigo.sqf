params ["_unit", "_atirador"];

//Sai se for suicídio
if (local _atirador) exitWith {};

//Inicia Fogo Amigo
[_unit, _atirador] remoteExecCall ["SMQTV_fnc_fogoAmigoAviso", -2];
_unit remoteExecCall ["SMQTV_fnc_fogoAmigoPunicaoCheck", _atirador];