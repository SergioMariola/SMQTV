sleep 2;

if ((lifeState _this) isEqualTo "INCAPACITATED" || !alive _this) exitWith {};

_this remoteExec ["SMQTV_fnc_efeitoPunicao"];

sleep 10;

_grupo = createGroup sideLogic;
_modulo = _grupo createUnit [
    "ModuleLightning_F",
    getPosATL _this,
    [],
    0,
    "CAN_COLLIDE"
];
_modulo setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
_modulo attachTo [_this];

sleep 5;

detach _modulo;
deleteVehicle _modulo;
deleteGroup _grupo;