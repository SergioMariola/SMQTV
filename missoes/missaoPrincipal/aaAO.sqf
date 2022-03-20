params ["_centroAO"];

for [{_i=1},{_i<=3},{_i=_i+1}] do
{
	private _pos = [_centroAO, (areaTamanho select 0) * 3, (areaTamanho select 0) * 4, 10] call BIS_fnc_findSafePos;
	while {(_pos distance (getMarkerPos "respawn_west")) < 5000} do
	{
		_pos = [_centroAO, (areaTamanho select 0) * 3, (areaTamanho select 0) * 4, 10] call BIS_fnc_findSafePos;
	};

	[1, _pos, east, ["East", "OPF_F", "Mechanized", "OIA_MechInf_AA"], "aaArea"] spawn SMQTV_fnc_criaInimigos;
	sleep 1;
};