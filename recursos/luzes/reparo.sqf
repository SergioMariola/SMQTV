//HC
if (!hasInterface && !isDedicated) exitWith {};

private _lightpoint = "#lightpoint" createVehicleLocal (_this modelToWorld [0,0,0.5]);
_lightpoint setLightAmbient [0, 0.7, 0];
_lightpoint setLightIntensity 2000;
_lightpoint setLightAttenuation [0, 0, 50, 0];