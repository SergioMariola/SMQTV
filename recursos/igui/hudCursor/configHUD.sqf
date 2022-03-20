_this addEventHandler ["Killed", { call SMQTV_fnc_hudCursorOff }];
_this addEventHandler ["Respawn", {
    "SMQTV_hudCursor" cutRsc ["HUDCursor", "PLAIN", -1, false];
}];

["SMQTV_hudCursor"] call BIS_fnc_rscLayer;
"SMQTV_hudCursor" cutRsc ["HUDCursor", "PLAIN", -1, false];