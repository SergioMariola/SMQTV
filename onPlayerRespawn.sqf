params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

waitUntil { !isNull _newUnit && { !isNull findDisplay 46 } };

_newUnit call SMQTV_fnc_configMenuDoJogador;	//Inicia Menu do Jogador
_newUnit call SMQTV_fnc_configSolicitaCura;		//Configura solicitação de cura
_newUnit call SMQTV_fnc_configZeus;				//Inicia disponibilidade para o Zeus
_newUnit call SMQTV_fnc_configRespawnPos;		//Configura posição de respawn
_newUnit call SMQTV_fnc_configArrasta;			//Inicia opção de arrastar amigos incapacitados
_newUnit call SMQTV_fnc_configRearmaSoldado;	//Configura remuniciamento em campo
call SMQTV_fnc_desabilitaComunicacao;			//Desabilita mensagens de rádio automáticas
call SMQTV_fnc_limpaTela;						//Limpa a tela de mensagens cutText e hints