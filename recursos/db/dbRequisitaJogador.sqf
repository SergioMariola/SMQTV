private _requisitor = param [0, player];
private _jogador = param [1, objNull];
SMQTV_playerClass = nil;

[_requisitor, _jogador] remoteExecCall ["SMQTV_fnc_dbEnviaJogador", 2];
waitUntil { !isNil "SMQTV_playerClass" };