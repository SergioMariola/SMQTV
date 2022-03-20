if (typeOf _this in LISTA_PILOTOS) exitWith { ["importante", "Pilotos não podem utilizar o HALO Jump", 0.5] call SMQTV_fnc_cutText };

//Verifica se há pilotos de helicóptero
_temPiloto = allPlayers findIf { typeOf _x == "B_Helipilot_F" };
if (_temPiloto > -1) exitWith {createDialog "carona"};

_altMin = 200;
_texto = "";
SMQTV_haloPos = [];

//Verifica se tem mapa
if !("ItemMap" in (assignedItems _this)) exitWith {
	_texto = "Você não tem um mapa equipado<br/>É necessário um mapa para usar este recurso";
	["importante", _texto] call SMQTV_fnc_cutText;
	SMQTV_haloPos = nil;
};

//Abre mapa e aguarda ação
openMap true;
playSound [selectRandom (SMQTV_sons select 0), true];
_texto = "Clique na posição onde deseja saltar ou feche o mapa para abortar o salto";
["naoImportante", _texto, 3] call SMQTV_fnc_cutText;
SMQTV_mapClick = false;
_this onMapSingleClick
{
	onMapSingleClick "";
	SMQTV_haloPos = _pos;
	SMQTV_mapClick = true;
};

waitUntil { SMQTV_mapClick || {!visiblemap} };

//Caso o jogador desista do salto e feche o mapa
if !(SMQTV_mapClick) exitWith {
	SMQTV_haloPos = nil;
	playSound [selectRandom (SMQTV_sons select 2), true];
	["naoImportante", "Salto cancelado", 0.5] call SMQTV_fnc_cutText;
};

//Registra salto no DB
[_this, "HALO"] remoteExecCall ["SMQTV_fnc_dbAddAtributo", 2];

//Inicia salto
["naoImportante", "Destino selecionado<br/>Iniciando salto...", 0.2] call SMQTV_fnc_cutText;
playSound [selectRandom (SMQTV_sons select 1), true];
sleep 2;

//Inicia transição câmera
_saltoPos = SMQTV_haloPos vectorAdd [0, 0, 1500];
_saltoPos spawn SMQTV_fnc_haloJumpCam;
_this setPos _saltoPos;

//Dispara mensagens
_texto = format ["O paraquedas abre automaticamente aos %1m de altitude", _altMin];
["naoImportante", _texto] call SMQTV_fnc_cutText;
_texto = format ["== %1 está utilizando o HALO Jump ==", name _this];
_texto remoteExec ["systemChat"];

openMap false;

//Recolhe informações do jogador
_equipamento = getUnitLoadout _this;
removeBackpack _this;
waitUntil { backpack _this isEqualTo "" };
_this addBackpack "B_Parachute";

waitUntil {
	backpack _this isEqualTo "" || {((getPosATL _this) # 2) <= _altMin || {!alive _this}}
};

if (!alive _this) exitWith {SMQTV_haloPos = nil};
if (backpack _this isNotEqualTo "") then {
	_this action ["OpenParachute", _this];
};

waitUntil { isTouchingGround _this ||  {!alive _this} };

if (!alive _this) exitWith {SMQTV_haloPos = nil};

//Finaliza salto
_nvg = currentVisionMode _this;
_this setUnitLoadout _equipamento;
if (_nvg > 0) then {_this action ["nvGoggles", _this]};
SMQTV_haloPos = nil;