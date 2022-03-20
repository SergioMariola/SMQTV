params ["_trigger"];
private _id = -1;
private _uav = getConnectedUAV player;

if (_uav isNotEqualTo objNull && {_uav inArea _trigger}) exitWith {
	{
		_id = _x addAction [
			format ["<t color='%1'>Reparo / Reabastecimento / Munição</t>", COR_AMARELO],
			{
				params ["_target", "_caller", "_actionId", "_arguments"];
				[_caller] spawn SMQTV_fnc_reparo;
			}
		];
	} forEach crew _uav;
	localNamespace setVariable ["SMQTV_idReparo", _id];
};

_id = player addAction [
	format ["<t color='%1'>Reparo / Reabastecimento / Munição</t>", COR_AMARELO],
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_caller] spawn SMQTV_fnc_reparo;
	}
];
localNamespace setVariable ["SMQTV_idReparo", _id];