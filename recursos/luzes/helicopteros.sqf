//HC
if (!hasInterface && !isDedicated) exitWith {};

private _lightpoint = "#lightpoint" createVehicleLocal (_this modelToWorld [0,0,0]);
_lightpoint setLightAmbient [1, 1, 1];
_lightpoint setLightIntensity 1500;