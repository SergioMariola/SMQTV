private _pos = missionNamespace getVariable ["SMQTV_respawnPos", []];
if (_pos isEqualTo []) exitWith { missionNamespace setVariable ["SMQTV_respawnPos", [getDir _this, getPosATL _this]] };
if (!isNull (objectParent _this)) exitWith {};
_this setDir (_pos # 0);
_this setPosATL (_pos # 1);