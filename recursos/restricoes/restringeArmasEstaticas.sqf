_this addEventHandler ["WeaponAssembled", {
	params ["_unit", "_staticWeapon"];

	if (unitIsUAV _staticWeapon) then {
		["importante", "É proibido montar equipamentos autônomos neste servidor", 0.4] call SMQTV_fnc_cutText;
		deleteVehicle _staticWeapon;
	};
}];