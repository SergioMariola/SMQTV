addMissionEventHandler ["PlayerConnected",
{
	params ["", "_uid", "_name", "", "_owner"];
	[_uid, _name, _owner] call SMQTV_fnc_dbCheckJogador;
}];

addMissionEventHandler ["PlayerDisconnected",
{
	params ["", "_uid"];
	[_uid] call SMQTV_fnc_dbAtualizaLogin;
}];

//Inicia DB
call SMQTV_fnc_dbCheckInicializacao;