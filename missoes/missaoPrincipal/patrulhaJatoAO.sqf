params ["_centroAO"];

private _pilotoPresente	= -1;
private _jato		= objNull;
private _jatoGrupo	= grpNull;
private _pos		= [];
private _wp			= [];

sleep 10;

while {true} do
{
	_pilotoPresente = allPlayers findIf {typeOf _x == "B_Fighter_Pilot_F"};

	if (_pilotoPresente > -1) then {
		_pos = [nil,["ground"],{(_this distance (getMarkerPos "respawn_west")) > 3000}] call BIS_fnc_randomPos;
		_jato = createVehicle ["O_Plane_CAS_02_dynamicLoadout_F", _pos, [], 0, "FLY"];
		_jatoGrupo = createVehicleCrew _jato;
		zeus addCuratorEditableObjects [[_jato] + (units _jatoGrupo), true];

		{
			inimigosAO pushBack _x;
			_x setVariable ["SMQTV_vetorInimigo", "inimigosAO"];
		} forEach [_jato] + (units _jatoGrupo);

		_jato flyInHeight 400;
		_wp = _jatoGrupo addWaypoint [_centroAO, -1];
		_wp setWaypointType "MOVE";
		_jatoGrupo setCombatMode "RED";

		_jato addEventHandler ["Fired", {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
			_unit setAmmo [_weapon, 9999];
		}];

		[_jatoGrupo] spawn SMQTV_fnc_configuraInimigo;

		waitUntil {
			sleep 120;
			private _pilotos = {typeOf _x == "B_Fighter_Pilot_F"} count allPlayers;
			_jato flyInHeight 400;
			_wp setWaypointType "SAD";
			_pilotos < 1 || !alive _jato
		};

		if (alive _jato) then {
			_jato setDamage 1;
		};
	};
	sleep 900;
};