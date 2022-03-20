["SMQTV_hudRecarrega"] call BIS_fnc_rscLayer;

addUserActionEventHandler ["reloadMagazine", "Activate", {
    "SMQTV_hudRecarrega" cutRsc ["HUDRecarrega", "PLAIN", -1, false];
}];