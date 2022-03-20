SMQTV_earplugs		= false;
SMQTV_earplugsTecla	= 0x0F;			//Tecla TAB
SMQTV_volumeSom		= soundVolume;
SMQTV_volumeMusica	= musicVolume;

_this addEventHandler ["Killed", { "SMQTV_earplugs" cutFadeOut -1 }];
_this addEventHandler ["Respawn", { "SMQTV_earplugs" cutRsc ["Earplugs", "PLAIN", -1, false] }];

(findDisplay 46) displayAddEventHandler["KeyDown", {
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];

	if (_key isEqualTo SMQTV_earplugsTecla && {!_alt}) then {
		[] spawn SMQTV_fnc_atualizaEarplugs;
		true
	};
}];

["SMQTV_earplugs"] call BIS_fnc_rscLayer;
"SMQTV_earplugs" cutRsc ["Earplugs", "PLAIN", -1, false];