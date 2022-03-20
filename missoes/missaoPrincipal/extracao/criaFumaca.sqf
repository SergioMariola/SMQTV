_grupo = createGroup [sideLogic, true];
_modulo = _grupo createUnit [
    "ModuleSmoke_F",
    _this,
    [],
    0,
    "CAN_COLLIDE"
];
_modulo setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
_modulo setVariable ["type", "SmokeShellGreen"];
_modulo setVariable ["repeat", 1];

[_modulo, _grupo]