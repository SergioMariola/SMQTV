_grupo = createGroup [sideLogic, true];

//Cria fogo
_moduloFogo = _grupo createUnit ["ModuleEffectsFire_F", getPosATL _this, [], 0, "CAN_COLLIDE"];
_moduloFogo setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
_moduloFogo setVariable ["particlelifetime", 5];
_moduloFogo setVariable ["particlesize", 2];

//Cria fumaça
_moduloFumaca = _grupo createUnit ["ModuleEffectsSmoke_F", getPosATL _this, [], 0, "CAN_COLLIDE"];
_moduloFumaca setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
_moduloFumaca setVariable ["particledensity", 20];

sleep 2;

_emitterFogo	= (_moduloFogo getVariable ["effectemitter", objNull]) select 0;
_luzFogo		= (_moduloFogo getVariable ["effectlight", objNull]) select 0;
_emitterFumaca	= (_moduloFumaca getVariable "effectemitter") select 0;

waitUntil {sleep 30; isNull _this};

{
	deleteVehicle _x;
	sleep 0.1;
} forEach [_emitterFogo, _luzFogo, _moduloFogo, _emitterFumaca, _moduloFumaca];

deleteGroup _grupo;