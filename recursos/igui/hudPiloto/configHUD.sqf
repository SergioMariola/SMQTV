if (typeOf _this isNotEqualTo 'B_Helipilot_F') exitWith {};

_this addEventHandler ["Killed", { 'SMQTV_hudPiloto' cutFadeOut -1 }];
_this addEventHandler ["Respawn", { 'SMQTV_hudPiloto' cutRsc ['HUDPiloto', 'PLAIN', -1, false] }];

['SMQTV_hudPiloto'] call BIS_fnc_rscLayer;
'SMQTV_hudPiloto' cutRsc ['HUDPiloto', 'PLAIN', -1, false];