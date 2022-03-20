//HC
if (!hasInterface && !isDedicated) exitWith {};

_jato = _this;
_efeitoObj = "#particlesource" createVehicleLocal (_jato modelToWorld [0,0,0]);
_efeitoObj setParticleClass "MissileDARSmoke";
_efeitoObj attachTo [_jato, [0,-2,0]];

waitUntil {sleep 30; !alive _jato};

detach _efeitoObj;
deleteVehicle _efeitoObj;