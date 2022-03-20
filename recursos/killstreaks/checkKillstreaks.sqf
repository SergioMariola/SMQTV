SMQTV_killstreaks = SMQTV_killstreaks + 1;
private _ks = SMQTV_killstreaks;
_ks spawn SMQTV_fnc_atualizaPlacar;

if ((typeOf player) in LISTA_PILOTOS) exitWith {};

_ks spawn SMQTV_fnc_addRecompensa;