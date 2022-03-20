params ["_veiculo"];

_veiculo addEventHandler ["Fuel", {
	params ["_vehicle", "_hasFuel"];

	if ((crew _vehicle) findIf {isPlayer _x} < 0) then
	{
		_vehicle setFuel 1;
	};
}];