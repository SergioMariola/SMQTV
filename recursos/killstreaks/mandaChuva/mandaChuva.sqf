params ["_caller", "_pos", "_target", "_is3D", "_id"];
_texto = "";

//Verifica se um jogador não está usando o Manda Chuva
_emUso = missionNamespace getVariable ["SMQTV_mandaChuvaEmUso", false];
if (_emUso) exitWith {
	_texto = "Este recurso está sendo utilizado por outro jogador<br/><t size='1.3'>Tente novamente em alguns instantes</t>";
	["importante", _texto] call SMQTV_fnc_cutText;
};

//Verifica se tem mapa
if !("ItemMap" in (assignedItems _caller)) exitWith {
	_texto = "Você não tem um mapa equipado<br/>É necessário um mapa para usar este recurso";
	["importante", _texto] call SMQTV_fnc_cutText;
};

//Abre mapa
openMap true;
_texto = "Aponte e clique no mapa onde deseja empregar o Manda Chuva";
["naoImportante", _texto, 0.5] call SMQTV_fnc_cutText;

//Escolhe área
SMQTV_areaSelecionada = false;
SMQTV_mandaChuvaPos = [];

_caller onMapSingleClick
{
	onMapSingleClick "";
	SMQTV_mandaChuvaPos append _pos;
	SMQTV_areaSelecionada = true;
};

waitUntil { SMQTV_areaSelecionada || !(visibleMap) };

//Caso o jogador desista e feche o mapa
if !(SMQTV_areaSelecionada) exitWith
{
	["naoImportante", "Ação abortada", 0.5] call SMQTV_fnc_cutText;
	SMQTV_mandaChuvaPos = nil;
	SMQTV_areaSelecionada = nil;
};

//----------------Inicia recurso----------------//

//Certifica que somente este jogador usará o recurso no momento
missionNamespace setVariable ["SMQTV_mandaChuvaEmUso", true, true];

//Registra uso no DB
[_caller, "MANDA_CHUVA"] remoteExecCall ["SMQTV_fnc_dbAddAtributo", 2];

//Configura jogador
_caller setVariable ["SMQTV_mandaChuvaEmUso", true];
["naoImportante", "", 0.1] call SMQTV_fnc_cutText;

//Remove suporte para o jogador
[_caller, _id] call SMQTV_fnc_removeCommMenuItem;

//Cria, posiciona e direciona o veículo
_pos = [SMQTV_mandaChuvaPos, 1000, 1200, 0, 1] call BIS_fnc_findSafePos;
_veiculo = createVehicle ["B_T_VTOL_01_armed_F", _pos, [], 0, "FLY"];
waitUntil { !isNull _veiculo };
_dir = _pos getDir SMQTV_mandaChuvaPos;
_veiculo setDir (_dir + 90);
_veiculo setPos [_pos select 0, _pos select 1, 600];


//Configura veículo
_veiculo flyInHeight 600;
zeus addCuratorEditableObjects [[_veiculo],true];
clearItemCargoGlobal _veiculo;
clearWeaponCargoGlobal _veiculo;
clearBackpackCargoGlobal _veiculo;
clearMagazineCargoGlobal _veiculo;
[_veiculo, false] remoteExec ["enableCopilot"];

//Cria e configura tripulação para veículo
_grupo = createGroup [west, true];
_grupoGunner = createGroup [west, true];
_piloto = _grupo createUnit ["B_Pilot_F", _pos, [], 0, "NONE"];
_gunner = _grupoGunner createUnit ["B_Pilot_F", _pos, [], 0, "NONE"];

{
	_x allowDamage false;
} forEach ([_veiculo] + (units _grupo));
_piloto moveInDriver _veiculo;
_veiculo lockTurret [[0], true];
_veiculo lockTurret [[2], true];
_veiculo lockDriver true;
_gunner moveInTurret [_veiculo, [1]];
[_grupo, SMQTV_mandaChuvaPos, 1200] spawn SMQTV_fnc_loiter;

//Guarda configurações de vídeo do jogador
_viewDistance = viewDistance;
_objectViewDistance = getObjectViewDistance;

//Dispara mensagem
_nomeJogador = name _caller;
_texto = format ["== %1 está utilizando o Manda Chuva ==", _nomeJogador];
_texto remoteExec ["systemChat"];

//Dá ao jogador controle sob a artilharia do veículo via controle remoto
openMap false;
_caller remoteControl _gunner;
_gunner switchCamera "INTERNAL";
_turret = _veiculo unitTurret _gunner;
_veiculo lockCameraTo [SMQTV_mandaChuvaPos, _turret];
sleep 1;
_gunner switchCamera "GUNNER";
sleep 0.1;
_veiculo lockCameraTo [objNull, _turret];

//Aplica configurações de vídeo otimizadas para a tarefa
if (viewDistance < 3000) then
{
	setViewDistance 3000;
	setObjectViewDistance [3000, 100];
};

//Ação para o jogador
_gunner addAction [
	"Sair do Manda Chuva",
	{
		params ["_target", "", "_actionId"];
		missionNamespace setVariable ["SMQTV_mandaChuvaEmUso", false, true];
		_target removeAction _actionId;
	},
	nil,
	1.5,
	false
];

//Dispara mensagem sobre o tempo disponível do recurso
_tempo = time + 180;
["naoImportante", "Este recurso ficará off-line em 3 minutos", 0.5] call SMQTV_fnc_cutText;

waitUntil {
	sleep 1;
	!SMQTV_mandaChuvaEmUso || {lifeState _caller isEqualTo "INCAPACITATED" || {time > _tempo || {!alive _veiculo}}}
};

if SMQTV_mandaChuvaEmUso then {
	missionNamespace setVariable ["SMQTV_mandaChuvaEmUso", false, true];
};

[_caller, _gunner, _veiculo, _grupo, _viewDistance, _objectViewDistance, _nomeJogador] spawn SMQTV_fnc_mandaChuvaSair;