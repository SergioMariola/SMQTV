private _efeito = uiNamespace getVariable ["SMQTV_efeitoBlur", -1];
if (_efeito isEqualTo -1) exitWith {};

_efeito ppEffectAdjust [0];
_efeito ppEffectCommit 0.1;
waitUntil {ppEffectCommitted _efeito};
_efeito ppEffectEnable false;
ppEffectDestroy _efeito;

uiNamespace setVariable ["SMQTV_efeitoBlur", nil];