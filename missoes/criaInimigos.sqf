params ["_qtd", "_centro", "_lado", "_grupoConfig", "_areaTipo"];

private _area		= 0;
private _faccao		= _grupoConfig param [0, "Indep"];
private _time		= _grupoConfig param [1, "IND_F"];
private _categoria	= _grupoConfig param [2, "Infantry"];
private _grupoTipo	= _grupoConfig param [3, "HAF_InfSquad_Weapons"];
private _pos		= [];
private _grupo		= grpNull;
private _veiculo	= objNull;
private _parentConfigs = [];

switch (_areaTipo) do
{
	case "aoArea":
	{
		_area = 700;
		for "_i" from 1 to _qtd step 1 do
		{
			_pos = [_centro, 0, _area, 10] call BIS_fnc_findSafePos;
			_grupo = [_pos, _lado, (configFile >> "CfgGroups" >> _faccao >> _time >> _categoria >> _grupoTipo)] call BIS_fnc_spawnGroup;
			_grupo setFormation "STAG COLUMN";
			_veiculo = vehicle ((units _grupo) select 0);
			_parentConfigs = [(configFile >> "CfgVehicles" >> typeOf _veiculo), true] call BIS_fnc_returnParents;
			
			if ("LandVehicle" in _parentConfigs) then {
				inimigosAO pushBack _veiculo;
			};

			{
				inimigosAO pushBack _x;
				_x setSkill ["courage", 1];
				_x setVariable ["SMQTV_vetorInimigo", "inimigosAO"];
				sleep 0.5;
			} forEach (units _grupo);

			[_grupo, _centro, _area] spawn SMQTV_fnc_patrulha;
			[_grupo] spawn SMQTV_fnc_configuraInimigo;
			sleep 0.1;
		};
	};

	case "aoCasas":
	{
		_area = 700;
		private _entidades = _centro nearObjects ["House", _area];
		if (_entidades isEqualTo []) exitWith {};
		private _casas = _entidades select { !((_x buildingPos -1) isEqualTo []) };
		private _casasQtd = count _casas;
		if (_casas isEqualTo [] || {_casasQtd < 3}) exitWith {};
		private _loop = 0;
		if (_casasQtd >= 3 && {_casasQtd <= 10}) then {_loop = 5};
		if (_casasQtd >= 11 && {_casasQtd <= 15}) then {_loop = 7};
		if (_casasQtd >= 16 && {_casasQtd <= 20}) then {_loop = 10};
		if (_casasQtd >= 21 && {_casasQtd <= 25}) then {_loop = 15};
		if (_casasQtd > 25) then {_loop = 17};
		_casas = _casas call BIS_fnc_arrayShuffle;
		_grupo = createGroup [_lado, true];
		waitUntil { !isNull _grupo }; 
		private _soldado = objNull;
		private _casa = objNull;
		private _casaPos = [];
		private _dir = 0;
		private _index = 0;

		for "_i" from 1 to _loop do {
			//Seleciona posição
			_casa = selectRandom _casas;
			_casaPos = _casa buildingPos -1;
			_pos = selectRandom _casaPos;

			//Cria soldado
			_soldado = _grupo createUnit [selectRandom SMQTV_autoRiflemen, _pos, [], 0, "CAN_COLLIDE"];
			waitUntil { !isNull _soldado };
			[_soldado] joinSilent _grupo;
			_soldado disableAI "PATH";
			_dir = _soldado getDir _casa;
			_soldado setDir (_dir - 180);
			_soldado addEventHandler ["Fired", {
				params ["_unit"];
				_unit enableAI "PATH";
				_unit removeEventHandler ["Fired", _thisEventHandler];
			}];
			inimigosAO pushBack _soldado;
			_soldado setVariable ["SMQTV_vetorInimigo", "inimigosAO"];
			[_grupo] spawn SMQTV_fnc_configuraInimigo;

			//Garante somente um soldado por casa
			_index = _casas findIf {_casa isEqualTo _x};
			if (_index > -1) then {
				_casas deleteAt _index;
			};
			sleep 0.1;
		};

	};

	case "aoReforco":
	{
		_area = 700;

		for "_x" from 1 to _qtd do
		{
			_pos = [_centro, _area + 200, _area + 500, 10] call BIS_fnc_findSafePos;
			_grupo = [_pos, _lado, (configFile >> "CfgGroups" >> _faccao >> _time >> _categoria >> _grupoTipo)] call BIS_fnc_spawnGroup;
			_grupo setFormation "STAG COLUMN";
			_veiculo = vehicle ((units _grupo) select 0);
			_parentConfigs = [(configFile >> "CfgVehicles" >> typeOf _veiculo), true] call BIS_fnc_returnParents;
			
			if ("LandVehicle" in _parentConfigs) then {
				inimigosAO pushBack _veiculo;
			};
			{
				inimigosAO pushBack _x;
				_x setSkill ["courage", 1];
				_x setVariable ["SMQTV_vetorInimigo", "inimigosAO"];
				sleep 0.5;
			} forEach (units _grupo);

			[_grupo, _centro, _area, "reforco"] spawn SMQTV_fnc_patrulha;
			[_grupo] spawn SMQTV_fnc_configuraInimigo;
			sleep 3;
		};
	};

	case "aaArea":
	{
		_area = 200;
		_pos = [_centro, 0, _area, 10] call BIS_fnc_findSafePos;
		_grupo = [_pos, _lado, (configFile >> "CfgGroups" >> _faccao >> _time >> _categoria >> _grupoTipo)] call BIS_fnc_spawnGroup;
		_grupo setFormation "STAG COLUMN";
		_veiculo = vehicle ((units _grupo) select 0);
		_parentConfigs = [(configFile >> "CfgVehicles" >> typeOf _veiculo), true] call BIS_fnc_returnParents;
		
		if ("LandVehicle" in _parentConfigs) then {
			inimigosAA pushBack _veiculo;
		};

		{
			inimigosAA pushBack _x;
			_x setSkill ["courage", 1];
			_x setVariable ["SMQTV_vetorInimigo", "inimigosAA"];
			sleep 0.5;
		} forEach (units _grupo);

		[_grupo, _centro, _area] spawn SMQTV_fnc_patrulha;
		[_grupo] spawn SMQTV_fnc_configuraInimigo;
		sleep 0.1;
	};


	default {};
};