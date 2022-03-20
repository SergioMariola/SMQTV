params ["_centro"];

_grupo	= grpNull;
_civil	= objNull;
_pos	= [];
_area	= 700;
_vivos	= 0;

//Primeira leva de civis
for "_i" from 0 to 19 do {
	_pos = [_centro, 0, _area, 5] call BIS_fnc_findSafePos;
	_grupo = createGroup [civilian, true];
	civisAO pushBack (_grupo createUnit [selectRandom LISTA_CIVIS, _pos, [], 0, "NONE"]);
	[_grupo] spawn SMQTV_fnc_configuraCivil;
	[_grupo, _centro, _area] spawn SMQTV_fnc_patrulha;
	sleep 0.5;
};

//Gera trânsito de veículos IDAP pela AO
[_thisScript, _centro] spawn {
	scriptName "TransitoCivil";

	params ["_scriptPai", "_centro"];

	_estradas = _centro nearRoads 1500;
	if (_estradas isEqualTo []) exitWith {};

	_configs	= "getText (_x >> 'faction') isEqualTo 'CIV_IDAP_F' && getText (_x >> 'editorSubcategory') isEqualTo 'EdSubcat_Cars'" configClasses (configfile >> "CfgVehicles");
	_carros		= _configs apply {configName _x};
	_emOrdem	= [];
	_pos		= [];
	_grupo		= grpNull;
	_estrada	= objNull;
	_carro		= objNull;
	_unidade	= objNull;

	while {sleep 30; !scriptDone _scriptPai} do {

		//Acha posição
		_estradas = _centro nearRoads 1500;
		_estradas = _estradas apply {[_x distance _centro, _x]};
		_estrada = (selectRandom _estradas) select 1;
		while {_estrada distance _centro <= 700} do {
			_estrada = (selectRandom _estradas) select 1;
			sleep 1;
		};

		//Cria grupo
		_grupo = createGroup [civilian, true];
		_carro = (selectRandom _carros) createVehicle (position _estrada);
		_unidade = _grupo createUnit [selectRandom LISTA_CIVIS, _carro, [], 0, "NONE"];
		civisAO pushBack _unidade;
		civisAO pushBack _carro;

		sleep 0.5;

		//Configura grupo
		[_unidade] joinSilent _grupo;
		_unidade assignAsDriver _carro;
		_unidade moveInDriver _carro;
		_unidade disableAI "AUTOCOMBAT";
		_grupo allowFleeing 0;
		_grupo setBehaviourStrong "CARELESS";
		[_grupo] spawn SMQTV_fnc_configuraCivil;

		sleep 0.5;

		//Orienta veículo
		_dir = _carro getDir _centro;
		_carro setDir _dir;

		sleep 0.5;

		//Cria waypoints
		_wp1 = _grupo addWaypoint [_centro, 0];
		_wp1 setWaypointType "MOVE";
		_pos = _carro getPos [2500, _dir];
		_wp2 = _grupo addWaypoint [_pos, 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointStatements [
			"true",
			"
				_carro = objectParent this;
				{_x setDamage [1, false]} forEach [this, _carro];
			"
		];

		_tempo = time + 1200;
		waitUntil {
			sleep 30;
			!alive _unidade || {!alive _carro || {scriptDone _scriptPai || {time > _tempo}}}
		};

		{_x setDamage [1, false]} forEach [_unidade, _carro];
		if (scriptDone _scriptPai) exitWith {};
	};
};

//Monitora qtd de civis vivos e despacha novos caso número estiver baixo
while {sleep 120; true} do {
	_vivos = [civisAO] call SMQTV_fnc_contaVivos;
	if (_vivos <= 10) then {
		for "_i" from 0 to 4 do {
			_pos = [_centro, 0, _area, 5] call BIS_fnc_findSafePos;
			_grupo = createGroup [civilian, true];
			civisAO pushBack (_grupo createUnit [selectRandom LISTA_CIVIS, _pos, [], 0, "NONE"]);
			[_grupo] spawn SMQTV_fnc_configuraCivil;
			[_grupo, _centro, _area] spawn SMQTV_fnc_patrulha;
			sleep 0.5;
		};
	};
};