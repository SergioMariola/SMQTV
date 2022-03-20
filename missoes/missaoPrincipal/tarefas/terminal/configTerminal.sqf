params["_centro", "_marcadorMissaoArea", "_tarefaPaiID"];

_posicaoTurret	= [];
_turret			= objNull;
_soldado		= objNull;
_relDir			= 0;
_dir			= random 360;
_elementos		= [];

//Cria terminal
_posicaoRadio = [_centro, 0.1, (areaTamanho select 0) - 100, 10, 0, 0.15] call BIS_fnc_findSafePos;
_terminal = "Land_DataTerminal_01_F" createVehicle _posicaoRadio;
[_terminal, "red", "purple", "green"] call BIS_fnc_DataTerminalColor;
[_terminal, 3] call BIS_fnc_DataTerminalAnimate;
_terminal allowDamage false;
_terminal setDir _dir;
_terminal setPos _posicaoRadio;

//Cria tenda
_tenda = "CamoNet_BLUFOR_F" createVehicle _posicaoRadio;
_tenda enableSimulationGlobal false;
_tenda allowDamage false;
_tenda setDir _dir;
_tenda setPos _posicaoRadio;

//Zeus
{_x addCuratorEditableObjects [[_terminal, _tenda], false]} forEach allCurators;

_elementos pushBack _terminal;
_elementos pushBack _tenda;

//Cria grupo inimigo
_grupo = createGroup [east, true];

for "_i" from 1 to 3 step 1 do
{
	_posicaoTurret = [_posicaoRadio, 15, 65, 5, 0, 0.5] call BIS_fnc_findSafePos;
	_turret = "I_HMG_02_high_F" createVehicle _posicaoTurret;
	_relDir = _turret getRelDir (position _tenda);
	_turret setDir (_relDir - 180);
	_soldado = _grupo createUnit ["O_G_Soldier_F", _posicaoTurret, [], 0, "NONE"];
	_soldado assignAsGunner _turret;
	_soldado moveInGunner _turret;
	zeus addCuratorEditableObjects [[_turret, _soldado], false];
	_elementos pushBack _turret;
	_elementos pushBack _soldado;
	sleep 0.1;
};
[_grupo] spawn SMQTV_fnc_configuraInimigo;

//Configura terminal
[
	_terminal,
	"Desativar equipamento",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	"_target distance _this < 4",
	"true",
	{
		params ["_target"];

		[_target, 2] call BIS_fnc_DataTerminalAnimate;
	},
	{
		params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];

		if (_progress > 14) then
		{
			[_target, 1] call BIS_fnc_DataTerminalAnimate;
		};
	},
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		[_target, 0] call BIS_fnc_DataTerminalAnimate;
		_this remoteExec ["SMQTV_fnc_efeitoDestroiTerminal", 0, _target];
	},
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		[_target, 3] call BIS_fnc_DataTerminalAnimate;
		["naoImportante", "Progresso cancelado", 0.4] call SMQTV_fnc_cutText;
	},
	[],
	15,
	1.5
] remoteExec ["BIS_fnc_holdActionAdd", 0, _terminal];

{
	inimigosAO pushBack _x;
	sleep 0.1;
} forEach _elementos;
_elementos = nil;

//Monitora maleta e cria adversidades enquanto esta não for adquirida
_monitora = [_terminal, _marcadorMissaoArea] spawn SMQTV_fnc_monitoraTerminal;

//Cria tarefa
_tarefaID = "missaoTerminal_" + str incrementoMP;
_imgTerminal = getText (configfile >> "CfgVehicles" >> "Land_DataTerminal_01_F" >> "editorPreview");
_imgTenda = getText (configfile >> "CfgVehicles" >> "CamoNet_BLUFOR_F" >> "editorPreview");
_desc = format ["Há um equipamento de comunicação via satélite na área inimiga sendo usado para transmitir informações criptografadas ao seu HQ.<br/>É de alto interesse de nossas forças que este seja encontrado e desativado.<br/><br/>Acredita-se que o equipamento de última geração seja deste modelo:<br/><br/><img image='%1' width='367' height='256'/><br/><br/>O inimigo precisa utilizá-lo em campo aberto, então é provável que estejam usando algum tipo de camuflagem como a tenda da imagem abaixo: <br/><br/><img image='%2' width='367' height='256'/>", _imgTerminal, _imgTenda];
["criaTarefa", [_tarefaID, _tarefaPaiID], [_desc, "Terminal de comunicação", ""], "tipoTerminal"] spawn SMQTV_fnc_trataTarefas;

//Aguarda destruição do terminal
waitUntil {
	sleep 5;
	!alive _terminal
};

//Finaliza adversidades
terminate _monitora;

//Finaliza
["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;