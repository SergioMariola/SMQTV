//Ícones 3D na caixa
_id = addMissionEventHandler ["Draw3D", {

	_caixa = _thisArgs select 0;
	if (isNull _caixa) exitWith {};
	if (player distance _caixa > 100) exitWith {};
	_pos = getPosATLVisual _caixa;
	_pos set [2, (_pos select 2) + 0.5];

	drawIcon3D [
		"\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa",
		[1,1,1,1],
		_pos,
		0.7,
		0.7,
		0,
		["Caixa de munição (", ceil (player distance _caixa), "m)"] joinString "",
		2,
		0.03,
		"RobotoCondensed",
		"center",
		true
	];

},[_this]];

//Configura ação da caixa
_acao = _this addAction [
	"Arsenal limitado (Uso único)",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		//Verifica já utilizado
		_sair = _target getVariable ["SMQTV_caixaUtilizada", false];
		if _sair exitWith {
			["naoImportante", "Você já abriu esta caixa<br/><t size='1.3'>Este recurso é de utlização única</t>", 0.7] call SMQTV_fnc_cutText;
		};

		//Configura arsenal
		_target setVariable ["SMQTV_caixaUtilizada", true];

		//Remove ícone 3D
		removeMissionEventHandler ["Draw3D", _arguments];

		_id = [missionNamespace, "arsenalOpened", {
			params ["_display"];
			_botaoLoad = _display displayCtrl 44147; //Botão "LOAD"
			_botaoLoad ctrlEnable false;
		}] call BIS_fnc_addScriptedEventHandler;

		//Abre arsenal limitado
		[] spawn BIS_fnc_arsenal;

		//Mensagem e remove desativação de botão do Arsenal
		["naoImportante", "Este Arsenal é limitado ao seu equipamento atual"] call SMQTV_fnc_cutText;
		_id spawn {
			sleep 5;
			[missionNamespace, "arsenalOpened", _this] call BIS_fnc_removeScriptedEventHandler;
		};
	},
	_id,
	1.5,
	true,
	true,
	"",
	"isNull (objectParent _this)",
	6
];

_this setUserActionText [
	_acao,
	"Arsenal limitado (Uso único)",
	"<img size='1.8' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa'/><br/>Arsenal limitado (Uso único)"
];

//Som
_this say3D ["Beep_Target", 200];

_caixaUtilizada = false;
waitUntil {
	sleep 5;
	_caixaUtilizada = _this getVariable ["SMQTV_caixaUtilizada", false];
	isNull _this || {_caixaUtilizada}
};

if _caixaUtilizada exitWith {};

//Remove ícone 3D
removeMissionEventHandler ["Draw3D", _id];