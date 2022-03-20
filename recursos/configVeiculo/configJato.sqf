//Configura aeronave para aceitar somente pilotos de jato nos assento de piloto
_this addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];

	if (typeOf _unit != "B_Fighter_Pilot_F") then
	{
		moveOut _unit;
		private _texto = "Somente pilotos de combate podem utilizar este assento";
		["importante", _texto, 0.5] remoteExecCall ["SMQTV_fnc_cutText", _unit];
	};
}];