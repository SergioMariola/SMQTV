params ["_maleta", "_centro", "_marcador"];
_pos		= [];
_heliComp	= [];
_crew		= [];
_grupo		= grpNull;
_heli		= objNull;
_wp			= [];

while {alive _maleta} do {

	_jogadores = playableUnits inAreaArray _marcador;

	if (_jogadores isNotEqualTo []) then {

		//Escolhe posição
		_pos = _centro getPos [2000, random 359];
		while {_pos distance (getMarkerPos "respawn_west") <= 1000} do {
			_pos = _centro getPos [2000, random 359];
		};

		//Cria veículo
		_heliComp = [_pos, _pos getDir _centro, "O_Heli_Attack_02_dynamicLoadout_F", civilian] call BIS_fnc_spawnVehicle;
		_heli = _heliComp select 0;
		_crew = _heliComp select 1;
		_grupo = _heliComp select 2;

		//Coloca veículo no ar
		_pos = AGLToASL _pos;
		_heli setPosASL [_pos # 0, _pos # 1, (_pos # 2) + 70];

		//Configura comportamento
		_wp = _grupo addWaypoint [_centro, 0];
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointType "LOITER";
		_wp setWaypointLoiterRadius 300;
		_wp setWaypointLoiterAltitude 100;
		[_grupo] spawn SMQTV_fnc_configuraInimigo;

		{ inimigosAO pushBack _x } forEach _crew + [_heli];

		waitUntil {
			sleep 30;
			!alive driver _heli || !alive _heli
		};
	};

	sleep 1800;
};