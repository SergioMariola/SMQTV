//--- Distância de visão
private _acao = _this addAction [
	"Menu do jogador",
	" createDialog 'menuJogador' ",
	nil,
	1.5,
	false
];

_this setUserActionText [_acao , "Menu do jogador", "<img size='2.5' image='\A3\modules_f\data\portraitModule_ca.paa'/>"];

//--- Stamina
private _stamina = profileNamespace getVariable ["SMQTV_stamina", false];
_this enableStamina _stamina;

//--- Balanço de arma
private _wSway = profileNamespace getVariable ["SMQTV_wSway", 0.2];
_this setCustomAimCoef _wSway;

//--- Ambiente
private _vidaAnimal = profileNamespace getVariable ["SMQTV_vidaAnimal", true];
private _somAmb = profileNamespace getVariable ["SMQTV_somAmb", true];
private _ambVol = profileNamespace getVariable ["SMQTV_ambVol", 1];
enableEnvironment [_vidaAnimal, _somAmb];
0 fadeEnvironment _ambVol;

//--- Terreno
private _grid = profileNamespace getVariable ["SMQTV_terrainGrid", 25];
private _vd = profileNamespace getVariable ["SMQTV_viewDistance", 1600];
private _ovd = profileNamespace getVariable ["SMQTV_objViewDistance", 1600];
private _sombra = profileNamespace getVariable ["SMQTV_sombra", 100];
setTerrainGrid _grid;
setViewDistance _vd;
setObjectViewDistance [_ovd, _sombra];

if (localNamespace getVariable ["SMQTV_teclaAbrir", false]) exitWith {};
execVM "recursos\gui\menuDoJogador\teclaAbrir.sqf";