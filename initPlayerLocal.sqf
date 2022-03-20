//Configura HC
if (!hasInterface && !isDedicated) exitWith {
	missionNamespace setVariable ["SMQTV_hcPresente", clientOwner, true];
	remoteExec ["SMQTV_fnc_transfereGrupos", 2];
	systemChat "HC conectado";
};

//Carrega constantes locais
private _const = execVM "constantes\jogador.sqf"; waitUntil {scriptDone _const};

params ["_player", "_didJIP"];
waitUntil { !isNull _player && { !isNull findDisplay 46 } };

["Preload"] call BIS_fnc_arsenal;

//Inicializa configurações persistentes
execVM "configJogador\configs\actMenuConfig.sqf";                   //Configurações do Menu de Ações
execVM "recursos\gui\changelog\changelog.sqf";						//Inicia arquivos de changelog
execVM "recursos\killstreaks\configKillstreaks.sqf";				//Inicia killstreaks
execVM "recursos\caixaRearm\configHUD.sqf";							//HUD de remuniciamento de jogadores
execVM "recursos\igui\hudRadio\configHUD.sqf";  					//HUD de rádio de comunicação
execVM "recursos\igui\hudGranada\configHUD.sqf";                    //HUD de troca de granadas
execVM "recursos\ajudaFerido\solicitaCura\configHUD.sqf";			//HUD de solicitação de cura
_player execVM "configJogador\configs\gerenciadorDeGrupos.sqf";		//Inicia Gerenciador de Grupos
_player execVM "recursos\db\dbConfigJogador.sqf";					//Configuração para bando de dados da missão
_player execVM "configJogador\configs\rating.sqf";					//Configuração para garantir que bots aliados não o ataque
_player execVM "configJogador\configs\limpaAcoes.sqf";				//Configuração para cadáver do jogador
_player execVM "recursos\loadoutPersistente\configLoadout.sqf";		//Inicia persistência de loadout após ressurgimento
_player execVM "recursos\performance\itensNoChao.sqf";				//Restrições para itens colocados no chão
_player execVM "recursos\restricoes\restringeArmasEstaticas.sqf";	//Restrições para armas estáticas
_player execVM "recursos\gui\insignia\configInsignia.sqf";			//Configura sistema de Insígnias
_player execVM "recursos\earplugs\configEarplugs.sqf";				//Inicia Earplugs
_player execVM "recursos\igui\barraAviso\configHUD.sqf";    		//HUD barra de avisos
_player execVM "recursos\igui\indicadores\configHUD.sqf";   		//HUD de proximidade de médicos
_player execVM "recursos\igui\placar\configPlacar.sqf";				//HUD de pontuação (Mortes, Kills, Killstreak)
_player execVM "recursos\igui\hudPiloto\configHUD.sqf";     		//HUD de pilotos de transporte
_player execVM "recursos\igui\hudCursor\configHUD.sqf";     		//HUD de cursor do jogador
_player execVM "recursos\igui\hudRecarrega\configHUD.sqf";          //HUD de recarregamento
_player execVM "recursos\igui\hudCura\configHUD.sqf";               //HUD de cura
_player execVM "recursos\igui\hudReparo\configHUD.sqf";				//HUD de reparo de veículo
_player execVM "recursos\killstreaks\configHUD.sqf";				//HUD de dica de utilização do Menu de Suporte (Ctrl + F)
_player execVM "recursos\score\configScore.sqf";                    //Configurações de Score
_player execVM "recursos\efeitos\efeitoProjetilSniper.sqf";			//Configura efeito de projétil para Atiradores de Elite
_player execVM "recursos\trataDano\config.sqf";						//Trata danos recebidos pelo jogador (dispara avisos e punições de fogo amigo, huds de ajuda médica e etc)
_player call SMQTV_fnc_dicaMenu;									//Dica de utilização do Menu do Jogador
call SMQTV_fnc_ind3DInf;											//HUD de amigos no ambiente 3D
call SMQTV_fnc_ind2DInf;											//HUD de amigos no mapa

//Executa configurações cíclicas
_player call SMQTV_fnc_configMenuDoJogador;							//Inicia Menu do Jogador
_player call SMQTV_fnc_configSolicitaCura;							//Configura solicitação de cura
_player call SMQTV_fnc_configZeus;									//Inicia disponibilidade para o Zeus
_player call SMQTV_fnc_configRespawnPos;							//Configura posição de respawn
_player call SMQTV_fnc_configArrasta;								//Inicia opção de arrastar amigos incapacitados
_player call SMQTV_fnc_configRearmaSoldado;							//Configura remuniciamento em campo
call SMQTV_fnc_desabilitaComunicacao;								//Desabilita mensagens de rádio automáticas

//Abre tela de Boas-Vindas
createDialog "BoasVindas";