//HC
if (!hasInterface && !isDedicated) exitWith {};

private _lightpoint = "#lightpoint" createVehicleLocal (_this modelToWorld [0,0,3]);
_lightpoint setLightAmbient [1, 1, 0.3];
_lightpoint setLightIntensity 5000;