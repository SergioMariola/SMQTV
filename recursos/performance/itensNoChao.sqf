_this addEventHandler ["Put", {
	params ["_unit", "_container", "_item"];

	if (typeOf _container == "GroundWeaponHolder") then
	{
		_container spawn {sleep 30; deleteVehicle _this;};
		private _texto = "Você está colocando itens no chão<br/>O item será apagado em 30s se não for pego novamente";
		["naoImportante", _texto] call SMQTV_fnc_cutText;
	};
}];