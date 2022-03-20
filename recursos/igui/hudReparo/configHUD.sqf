["SMQTV_reparo"] call BIS_fnc_rscLayer;

_this addEventHandler ["Killed", {
    localNamespace setVariable ["SMQTV_reparoOn", nil];
    uiNamespace setVariable ["SMQTV_mecanico", nil];
    "SMQTV_reparo" cutFadeOut -1;
}];