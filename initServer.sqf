private _const = execVM "constantes\servidor.sqf"; waitUntil {scriptDone _const};
private _db	= execVM "recursos\db\dbConfigServer.sqf"; waitUntil {scriptDone _db};

//Configura ambiente
execVM "configServidor\clima.sqf";									//Configura clima da partida
execVM "configServidor\configuraBase.sqf";							//Configura a base de jogadores
execVM "configServidor\dataInicial.sqf";							//Configura data inicial para a partida
execVM "configServidor\diplomacia.sqf";								//Configura diplomacia entre facções
execVM "configServidor\gerenciadorDeGrupos.sqf";					//Inicia gerenciador de grupos BIS
execVM "configServidor\limpaLixo.sqf";								//Configura limpeza de itens e corpos de jogadores no chão
execVM "configServidor\popup.sqf";									//Inicia pop-up de logo do servidor
execVM "recursos\saltoDeVeiculo\configCooldown.sqf";				//Configura tempo de cooldown para Salto de Veículo

//Configura HC
execVM "recursos\hc\configHC.sqf";

//Inicializa Missão Principal
private _handleMP = [] spawn SMQTV_fnc_missaoPrincipal;

//Inicializa performance
[] spawn SMQTV_fnc_gerenciaMortos;

//Monitora veículos para RTB automático
[] spawn SMQTV_fnc_veiculosRTB;