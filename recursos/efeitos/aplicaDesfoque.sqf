_efeito = ppEffectCreate ["DynamicBlur", 401];
if (_efeito isEqualTo -1) exitWith {};
_efeito ppEffectEnable true;
_efeito ppEffectAdjust [2];
_efeito ppEffectCommit 0.2;

uiNamespace setVariable ["SMQTV_efeitoBlur", _efeito];