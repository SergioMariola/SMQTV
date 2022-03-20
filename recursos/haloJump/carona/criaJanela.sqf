params ["_displayOrControl", ["_config", configNull]];
(_displayOrControl displayCtrl 123) ctrlShow false; //Apaga botão falso

private _pilotos = allPlayers select {typeOf _x isEqualTo "B_Helipilot_F"};
if (_pilotos isEqualTo []) exitWith {
	_displayOrControl closeDisplay 2;
	["naoImportante", "Não há pilotos de transporte na partida", 0.5] call SMQTV_fnc_cutText;
};

private _fotoPiloto1	= _displayOrControl displayCtrl 1201;
private _fotoPiloto2	= _displayOrControl displayCtrl 1202;
private _botaoPiloto1	= _displayOrControl displayCtrl 1700;
private _botaoPiloto2	= _displayOrControl displayCtrl 1701;
private _botaoPilotos	= _displayOrControl displayCtrl 1702;
private _nomePiloto1	= _displayOrControl displayCtrl 1002;
private _nomePiloto2	= _displayOrControl displayCtrl 1003;
private _piloto1		= objNull;
private _piloto2		= objNull;
private _sair			= false;

while {!isNull _displayOrControl} do {

	_pilotos = allPlayers select {typeOf _x isEqualTo "B_Helipilot_F"};
	if (_pilotos isEqualTo []) exitWith {_sair = true};
	_pilotos = _pilotos apply { [name _x, _x] };
	_pilotos sort true;
	_piloto1 = _pilotos select 0 select 1;
	_fotoPiloto1 ctrlSetText (getText (configfile >> "CfgVehicles" >> "B_Helipilot_F" >> "editorPreview"));
	_nomePiloto1 ctrlSetText ([(_pilotos select 0 select 0), " (", if (_piloto1 inArea "baseArea") then {"na base"} else {"a " + str round (player distance (_pilotos select 0 select 1)) + "m"}, ")"] joinString "");
	_botaoPilotos ctrlEnable false;
	if (count _pilotos > 1) then {
		uiNamespace setVariable ["SMQTV_caronaPilotoA", (_pilotos select 0 select 1)];
		uiNamespace setVariable ["SMQTV_caronaPilotoB", (_pilotos select 1 select 1)];
		_botaoPilotos ctrlEnable true;
		_botaoPiloto2 ctrlEnable true;
		_fotoPiloto2 ctrlSetText (getText (configfile >> "CfgVehicles" >> "B_Helipilot_F" >> "editorPreview"));
		_nomePiloto2 ctrlEnable true;
		_piloto2 = _pilotos select 1 select 1;
		_nomePiloto2 ctrlSetText ([(_pilotos select 1 select 0), " (", if (_piloto2 inArea "baseArea") then {"na base"} else {"a " + str round (player distance _piloto2) + "m"}, ")"] joinString "");
	} else {
		uiNamespace setVariable ["SMQTV_caronaPilotoA", (_pilotos select 0 select 1)];
		_botaoPilotos ctrlEnable false;
		_botaoPiloto2 ctrlEnable false;
		_fotoPiloto2 ctrlSetText (getText (configfile >> "CfgTaskTypes" >> "X" >> "icon"));
		_nomePiloto2 ctrlEnable false;
		_nomePiloto2 ctrlSetText "Não há outro piloto";
	};
	sleep 1;
};

if (_sair) exitWith {
	_displayOrControl closeDisplay 2;
	["naoImportante", "Não há mais pilotos de transporte na partida<br/>HALO Jump liberado", 0.5] call SMQTV_fnc_cutText;
};