if ((typeOf _this) isNotEqualTo "B_soldier_M_F") exitWith {};

_this addEventHandler ["Fired", {
	params ["", "_weapon", "", "", "", "", "_projectile"];
	_cat = getText (configfile >> "CfgVehicles" >> (["Weapon_", _weapon] joinString "") >> "editorSubcategory");
	if (_cat isNotEqualTo "EdSubcat_SniperRifles") exitWith {};
	_efeito = objNull;
	_noite = ((getPosATL player) getEnvSoundController "night") > 0.7;
	if !_noite then {
		_efeito = "#particlesource" createVehicleLocal (_projectile modelToWorld [0,0,0]);
		_efeito setParticleClass "StarterPistolCloud2";
		_efeito attachTo [_projectile, [0,0,0]];
	} else {
		_efeito = "#lightpoint" createVehicleLocal (_projectile modelToWorld [0,0,0]);
		_efeito attachTo [_projectile, [0,0,0]];
		_efeito setLightColor [1,1,1];
		_efeito setLightIntensity 3000;
		_efeito setLightUseFlare true;
		_efeito setLightFlareSize 0.5;
		_efeito setLightFlareMaxDistance 10000;
	};
	[_projectile, _efeito] spawn {
		params ["_projectile", "_efeito"];
		waitUntil {sleep 0.1; !alive _projectile};
		detach _efeito;
		deleteVehicle _efeito;
	};
}];