//Configura aeronave para aceitar somente pilotos de transporte nos assento de piloto
_this addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if ((typeOf _unit != "B_Helipilot_F") && (_role == "driver")) then
	{
		moveOut _unit;
		private _texto = "Somente pilotos de transporte podem utilizar este assento";
		["importante", _texto, 0.5] remoteExecCall ["SMQTV_fnc_cutText", _unit];
	};
}];

//Configura aeronave para aceitar somente que pilotos de transporte realizem troca de assento para o assento de piloto
_this addEventHandler ["SeatSwitched", {
	params ["_vehicle", "_unit1", "_unit2"];

	if ((typeOf _unit1 != "B_Helipilot_F") && ((assignedVehicleRole _unit1 select 0) == "Driver")) then
	{
		moveOut _unit1;
		private _texto = "Somente pilotos de transporte podem utilizar este assento";
		["importante", _texto, 0.5] remoteExecCall ["SMQTV_fnc_cutText", _unit1];
	};
}];

//Avisa sobre rompimento dos cabos de carga
_this addEventHandler ["RopeBreak", {
	params ["_object1", "_rope", "_object2"];

	["importante", "A carga foi solta"] remoteExecCall ["SMQTV_fnc_cutText", crew _object1];
}];