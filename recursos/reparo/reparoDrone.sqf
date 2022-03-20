call SMQTV_fnc_habilitaComunicacao;
private _veiculo = getConnectedUAV player;
private _callsign = [side player, "AirBase"];
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
_veiculo setDir getDir _helipad;
_veiculo setPosATL getPosATL _helipad;

//--- Reparo

sleep 1;
_callsign sideChat "Iniciando reparo...";
sleep 3;

if (_dano == 0 && !_temDanos) then {
	_callsign sideChat "Veículo não necessita reparo";
} else {
	if (_dano > 0) then {
		_callsign sideChat "Iniciando reparo estrutural...";
		sleep 3;
		while {damage _veiculo > 0} do {
			_veiculo setDamage (_dano - 0.01);
			_dano = damage _veiculo;
			_callsign sideChat format ["Dano: %1%2", round (_dano * 100), "%"];
			sleep 0.5;
		};	
	};
	if (_temDanos) then {
		_callsign sideChat "Iniciando reparo de peças...";
		sleep 3;
		{
			_veiculo setHitPointDamage [_x, 0];
			_callsign sideChat format ["Dano na peça %1: Consertado", _forEachIndex + 1];
			sleep 0.5;
		} forEach _danificados;
	};

	_callsign sideChat "Reparo completo";
};

//--- Combustível

_callsign sideChat "Iniciando reabastecimento...";
sleep 3;

if (_gas >= 0.95) then {
	_callsign sideChat "Veículo não necessita reabastecimento";
} else {
	while {fuel _veiculo < 0.95} do {
		_veiculo setFuel (_gas + 0.01);
		_gas = fuel _veiculo;
		_callsign sideChat format ["Combustível: %1%2", round (_gas * 100), "%"];
		sleep 0.5;
	};

	_callsign sideChat "Combustível completo";
};

//--- Munição
private _cont = 0;

_callsign sideChat "Iniciando remuniciamento...";
sleep 3;

private _flareMag = _veiculo magazinesTurret [-1];
if !(_flareMag isEqualTo []) then {
	_veiculo removeMagazinesTurret [_flareMag # 0, [-1]];
	_veiculo addMagazineTurret [_flareMag # 0, [-1]];
};

if (count (getPylonMagazines _veiculo) > 0) then {
	private _pylons = getPylonMagazines _veiculo;
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veiculo >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{
		_veiculo removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
		_callsign sideChat format ["Removendo arma #%1", _cont + 1];
		_cont = _cont + 1;
		sleep 1;
	} forEach getPylonMagazines _veiculo;
	_cont = 0;
	{
		[_veiculo, [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]] remoteExec ["setPylonLoadout", 0, _veiculo];
		_callsign sideChat format ["Adicionando arma #%1", _cont + 1];
		_cont = _cont + 1;
		sleep 1;
	} forEach _pylons;
} else {
	_veiculo setVehicleAmmoDef 1;
};

sleep 1;

_callsign sideChat "Munição recarregada";

//--- Finalização

sleep 1;

inGameUISetEventHandler ["Action", ""];
findDisplay 46 displayRemoveEventHandler ["keyDown", _ehTeclado];
_callsign sideChat "Veículo disponível para uso";
call SMQTV_fnc_desabilitaComunicacao;
["importante", "Veículo disponível para uso", 0.5] call SMQTV_fnc_cutText;