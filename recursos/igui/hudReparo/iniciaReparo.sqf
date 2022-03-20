private _sair = localNamespace getVariable ["SMQTV_reparoOn", false];
if _sair exitWith {};
uiNamespace setVariable ["SMQTV_mecanico", _this];
"SMQTV_reparo" cutRsc ["Rsc_SMQTV_reparo", "PLAIN", -1, false];