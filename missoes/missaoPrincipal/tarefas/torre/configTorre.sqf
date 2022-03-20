params["_centro", "_tarefaPaiID"];

_mina			= objNull;
_torre			= objNull;
_posicaoTorre	= [];
_elementos		= [];

//Cria torre
_torresDoLocal = nearestObjects [_centro, TORRES_TIPOS, areaTamanho select 0, true];
if (count _torresDoLocal > 0) then
{
	_torre = selectRandom _torresDoLocal;
	_posicaoTorre = getPosASL _torre;
} else {
	_posicaoTorre = [_centro, 0, areaTamanho select 0, 20, 0, 0.4, 0] call BIS_fnc_findSafePos;
	_torre = (selectRandom TORRES_TIPOS) createVehicle _posicaoTorre;
};
_torre setVectorUp [0, 0, 1];
_elementos pushBack _torre;
_torre addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile"];

	if !(_projectile isKindOf "PipeBombBase") then
	{
		damage _unit;
	};
}];
_torre addEventHandler ["Killed", {
	params ["_unit"];

	//Cria efeito de fogo
	_unit spawn SMQTV_fnc_efeitoFogo;

	//Tremor
	_jogadores = playableUnits select { isTouchingGround _x && {_x distance2D _unit <= 1400} };
	if (_jogadores isEqualTo []) exitWith {};
	_unit remoteExec ["SMQTV_fnc_terremoto", _jogadores];
}];

//Cria campo minado em volta da torre
for "_x" from 0 to 14 do
{
	_mina = createMine [(selectRandom MINAS_TIPOS), getPosATL _torre, [], 20];
	waitUntil { !isNull _mina };
	_elementos pushBack _mina;
	sleep 0.1;
};

//Cria obstruções em volta da torre
_arame = [_posicaoTorre, ARAME_FARPADO] call SMQTV_fnc_compoeObjetos;
_arame apply {_elementos pushBack _x};

{
	zeus addCuratorEditableObjects [[_x], false];
	inimigosAO pushBack _x;
} forEach _elementos;
_elementos = nil;

//Inicia airstrikes
_monitora = [_centro, _torre] spawn SMQTV_fnc_monitoraTorre;

//Inicia tarefa
_tarefaID = "missaoTorre_" + str incrementoMP;
_imgCaminho = getText (configfile >> "CfgVehicles" >> typeOf _torre >> "editorPreview");
_desc = format ["Nosso QG nos informa sobre a presença de uma torre de transmissão de rádio na área de operações. O inimigo estaria usando o equipamento para transmitir coordenadas para seu time de bombardeio aéreo.<br/>Localize e destrua esta torre para se livrar de possíveis chuvas de explosivos.<br/><br/>A torre foi avistada em um de nossos vôos de reconhecimento e podemos afirmar que o modelo é idêntico ao da imagem abaixo:<br/><br/><img image='%1' width='367' height='256'/>", _imgCaminho];
["criaTarefa", [_tarefaID, _tarefaPaiID], [_desc, "Torre de rádio", ""], "tipoTorre"] spawn SMQTV_fnc_trataTarefas;

//Aguarda destruição da torre
waitUntil {
	sleep 5;
	!alive _torre
};

//Finaliza airstrikes
terminate _monitora;

//Finaliza
["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;