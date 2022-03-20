private _sair = localNamespace getVariable ["SMQTV_curaOn", false];
if _sair exitWith {};
uiNamespace setVariable ["SMQTV_healer", _this];
"SMQTV_heal" cutRsc ["Rsc_SMQTV_cura", "PLAIN", -1, false];