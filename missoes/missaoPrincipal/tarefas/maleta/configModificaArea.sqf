params ["_maleta", "_centro", "_marcador", "_tarefaPaiID"];

_pos		= [];
_posAnt		= [0,0,0];
_objetos	= [];
_grupo		= grpNull;
_soldado	= objNull;
_tela		= objNull;
_mesa 		= objNull;
_index		= 0;
_tarefaID	= "";
_desc		= "";

for "_i" from 0 to 2 do {

	//Define posição do acampamento
	_pos = [_centro, 0, areaTamanho select 0, 5, 0, 0.2] call BIS_fnc_findSafePos;
	if (_pos isEqualTypeArray [0,0,0]) then { continue };
	if (_pos distance _posAnt <= 20) then { continue };
	_posAnt = _pos;

	//Cria acampamento
	_objetos = [_pos, MALETA_TENDA, true] call SMQTV_fnc_compoeObjetos;

	{
		if (_x isKindOf 'Land') then {
			_x addEventHandler ["GetOut", {
				params ["_vehicle", "_role", "_unit", "_turret"];
				_vehicle removeAllEventHandlers 'Reloaded';
				_vehicle removeEventHandler ["GetOut", _thisEventHandler];
			}];
			_x addEventHandler ["Reloaded", {
				params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
				_unit addMagazineGlobal (_newMagazine select 0);
			}];
			_grupo = createGroup [east, true];
			_soldado = _grupo createUnit ['O_G_Soldier_F', _pos, [], 0, 'CAN_COLLIDE'];
			_soldado moveInGunner _x;
			_soldado setVariable ["SMQTV_vetorInimigo", "inimigosAO"];
			[_grupo] spawn SMQTV_fnc_configuraInimigo;
			inimigosAO pushBack _soldado;
		};
		if (_x isKindOf 'Items_base_F') then {_x enableSimulationGlobal false};
		_x allowDamage false;
		inimigosAO pushBack _x;
	} forEach _objetos;

	allCurators apply { _x addCuratorEditableObjects [_objetos, true] };

	//Configura tarefa
	_tarefaID = [_tarefaPaiID, "_Opcional_", _i] joinString "";
	_desc = "Recupere informações no computador do acampamento avançado inimigo para adquirir maior precisão sobre a localização da Maleta de Inteligência inimiga.";
	_pos set [2, 0];
	[true, [_tarefaID, _tarefaPaiID], [_desc, "Informações (Opcional)", ""], _pos, "CREATED", -1, false, "download"] call BIS_fnc_taskCreate;

	//Configura computador
	_index = _objetos findIf { (typeOf _x) isEqualTo 'Land_PCSet_Intel_02_F' };
	if (_index < 0) exitWith {};

	_tela = _objetos select _index;
	[
		_tela,
		[
			'Acessar informações',
			{
				params ["_target", "_caller", "_actionId", "_arguments"];

				_this remoteExec ["SMQTV_fnc_modificaArea", 2];
				_caller switchAction "putdown";
			},
			[_maleta, _marcador, _tarefaID],
			1.5,
			true,
			true,
			"",
			"true",
			3
		]
	] remoteExec ["addAction", 0, _tela];

	_index = _objetos findIf { (typeOf _x) isEqualTo 'OfficeTable_01_new_F' };
	if (_index < 0) exitWith {};
	_mesa = _objetos select _index;
	[_mesa, true] remoteExec ["lockInventory", 0, _mesa];
};