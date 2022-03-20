systemChat ([name _this, " solicitou ajuda com ferimento"] joinString "");

private _sair = localNamespace getVariable ["SMQTV_curaSolicitada", false];
if _sair exitWith {};

localNamespace setVariable ["SMQTV_curaSolicitada", true];
uiNamespace setVariable ["SMQTV_curaSolicitante", _this];

playSound [selectRandom (SMQTV_sons select 5), true];
"SMQTV_hudSolicitaCura" cutRsc ["Rsc_SMQTV_solicitaCura", "PLAIN", -1, false];