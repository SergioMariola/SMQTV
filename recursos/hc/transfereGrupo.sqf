_hc = missionNamespace getVariable ["SMQTV_hcPresente", -1];
if (_hc isEqualTo -1) exitWith {};
sleep (random 10);

_this setGroupOwner _hc;