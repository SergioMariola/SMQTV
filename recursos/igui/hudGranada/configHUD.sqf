["SMQTV_hudGranada"] call BIS_fnc_rscLayer;

addUserActionEventHandler ["cycleThrownItems", "Deactivate", {
    private _granada = (currentThrowable player) select 0;
    private _nome = getText (configfile >> "CfgMagazines" >> _granada >> "displayName");
    uiNamespace setVariable ["SMQTV_granada", _nome];
    "SMQTV_hudGranada" cutRsc ["HUDGranada", "PLAIN", -1, false];
}];