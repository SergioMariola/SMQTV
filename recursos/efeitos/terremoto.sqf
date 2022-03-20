//HC
if (!hasInterface && !isDedicated) exitWith {};

_pwr = 0;
_dur = 0;
_pos = getPosATL _this;
_fonteSom = "Land_HelipadEmpty_F" createVehicleLocal _pos;
waitUntil { !isNull _fonteSom };
_dist = player distance _fonteSom;

_fonteSom say3D ["Earthquake_01", 700, 1, true];
switch true do { 
	case (_dist <= 100) : {
		_pwr = 5;
		_dur = 14;
	};
	case (_dist > 100 && _dist <=200) : {
		_pwr = 3;
		_dur = 12;
	};
	case (_dist > 200 && _dist <=400) : {
		_pwr = 2;
		_dur = 10;
	};
	case (_dist > 400 && _dist <=700) : {
		_pwr = 1;
		_dur = 8;
	};
	default {
		_pwr = 0.5;
		_dur = 6;
	};
};

sleep 1;

addCamShake [_pwr, _dur, 50];
playSound ["combat_deafness", true];
_hndl = ppEffectCreate ["DynamicBlur", 401];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [_pwr];
_hndl ppEffectCommit 1;
waitUntil { ppEffectCommitted _hndl };
_hndl ppEffectAdjust [0];
_hndl ppEffectCommit 7;
waitUntil { ppEffectCommitted _hndl };
_hndl ppEffectEnable false;
ppEffectDestroy _hndl;

sleep 10;

deleteVehicle _fonteSom;