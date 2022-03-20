["SMQTV_heal"] call BIS_fnc_rscLayer;

_this addEventHandler ["Killed", {
    localNamespace setVariable ["SMQTV_curaOn", nil];
    uiNamespace setVariable ["SMQTV_healer", nil];
    "SMQTV_heal" cutFadeOut -1;
}];