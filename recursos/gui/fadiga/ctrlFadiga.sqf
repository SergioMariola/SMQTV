params ["_control", "_checked"];

if (_checked == 1) then {
	player enableStamina true;
	profileNamespace setVariable ["SMQTV_stamina", true];
	["naoImportante", "Fadiga habilitada", 0.3] spawn SMQTV_fnc_cutText;
} else {
	player enableStamina false;
	profileNamespace setVariable ["SMQTV_stamina", false];
	["naoImportante", "Fadiga desabilitada", 0.3] spawn SMQTV_fnc_cutText;
};