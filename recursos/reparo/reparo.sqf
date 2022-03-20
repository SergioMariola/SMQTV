params ["_caller"];

if (_caller isNotEqualTo player) exitWith {
	[] spawn SMQTV_fnc_reparoDrone;
};

call SMQTV_fnc_habilitaComunicacao;
private _veiculo = objectParent player;

if (isNull _veiculo) exitWith {
	["naoImportante", "Você precisa estar no assento de motorista/piloto de um veículo para usar este recurso"] call SMQTV_fnc_cutText;
};

if (driver _veiculo isNotEqualTo player) exitWith {
	["naoImportante", "Você precisa ser motorista/piloto do veículo para usar este recurso"] call SMQTV_fnc_cutText;
};

private _gas = fuel _veiculo;
private _dano = damage _veiculo;
private _danos = getAllHitPointsDamage _veiculo;
private _temDanos = if ((_danos # 2) findIf {_x > 0} >= 0) then {true} else {false};
private _danificados = [];
if (_temDanos) then {
	{
		if (_x > 0) then {
			_danificados pushBack (_danos # 0) # _forEachIndex;
		};
	} forEach (_danos select 2);
};

//--- Inicialização jogador

inGameUISetEventHandler ["Action", "true"];
private _ehTeclado = findDisplay 46 displayAddEventHandler ["keyDown", {true}];

//--- Inicialização veículo

if (isEngineOn _veiculo) then {_veiculo engineOn false};
private _helipad = nearestObject [_veiculo, "Land_HelipadCivil_F"];
private _helipadPos = getPosATL _helipad;
_veiculo setDir getDir _helipad;
_veiculo setPosATL [_helipadPos # 0, _helipadPos # 1, (_helipadPos # 2) + 0.2];

//--- Reparo

sleep 1;
_veiculo vehicleChat "Iniciando reparo...";
sleep 3;

if (_dano == 0 && !_temDanos) then {
	_veiculo vehicleChat "Veículo não necessita reparo";
} else {
	if (_dano > 0) then {
		_veiculo vehicleChat "Iniciando reparo estrutural...";
		sleep 3;
		while {damage _veiculo > 0} do {
			_veiculo setDamage (_dano - 0.01);
			_dano = damage _veiculo;
			_veiculo vehicleChat format ["Dano estrutural: %1%2", round (_dano * 100), "%"];
			sleep 0.5;
		};
	};
	if (_temDanos) then {
		_veiculo vehicleChat format ["Iniciando reparo de %1 pecas...", count _danificados];
		sleep 3;
		{
			_veiculo setHitPointDamage [_x, 0];
			_veiculo vehicleChat format ["Dano na peça %1: Consertado", _forEachIndex + 1];
			sleep 0.5;
		} forEach _danificados;
	};

	_veiculo vehicleChat "Reparo completo";
};

//--- Munição

_veiculo vehicleChat "Iniciando remuniciamento...";
sleep 3;

[_veiculo] remoteExec ["SMQTV_fnc_reparoMunicao", (crew _veiculo) select {alive _x}];

private _flareMag = _veiculo magazinesTurret [-1];
if !(_flareMag isEqualTo []) then {
	_veiculo vehicleChat "Recarregando flares...";
	sleep 1;
	_veiculo removeMagazinesTurret [_flareMag # 0, [-1]];
	_veiculo addMagazineTurret [_flareMag # 0, [-1]];
	_veiculo vehicleChat "Flares recarregados";
};

if (count (getPylonMagazines _veiculo) > 0) then {
	private _cont = 0;
	private _pylons = getPylonMagazines _veiculo;
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veiculo >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{
		_veiculo removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
		_veiculo vehicleChat format ["Removendo arma #%1...", _cont + 1];
		_cont = _cont + 1;
		sleep 1;
	} forEach getPylonMagazines _veiculo;
	_cont = 0;
	{
		[_veiculo, [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]] remoteExec ["setPylonLoadout", 0, _veiculo];
		_veiculo vehicleChat format ["Adicionando arma #%1...", _cont + 1];
		_cont = _cont + 1;
		sleep 1;
	} forEach _pylons;
} else {
	_veiculo setVehicleAmmoDef 1;
};

sleep 1;
_veiculo vehicleChat "Munição recarregada";
sleep 1;

//--- Combustível

_veiculo vehicleChat "Iniciando reabastecimento...";
sleep 3;

if (_gas >= 0.95) then {
	_veiculo vehicleChat "Veículo não necessita reabastecimento";
} else {
	while {fuel _veiculo < 0.95} do {
		_veiculo setFuel (_gas + 0.01);
		_gas = fuel _veiculo;
		_veiculo vehicleChat format ["Combustível: %1%2", round (_gas * 100), "%"];
		sleep 0.5;
	};

	_veiculo setFuel 1;
	_veiculo vehicleChat "Combustível completo";
};

//--- Finalização

sleep 1;

inGameUISetEventHandler ["Action", ""];
findDisplay 46 displayRemoveEventHandler ["keyDown", _ehTeclado];
_veiculo vehicleChat "Veículo disponível para uso";
call SMQTV_fnc_desabilitaComunicacao;
["Veículo disponível para uso", nil, 3] spawn SMQTV_fnc_barraAviso;