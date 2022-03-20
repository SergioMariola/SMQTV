scriptName "limpaLixo";

//Some com corpo do jogador que se desconecta
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	_unit spawn {
		sleep 5;
		_this setPosATL (getMarkerPos ["cemiterio", true]);
	};
	false;
}];

//Rotina de limpeza de itens no chão
while {sleep 3600; true} do
{
	{
		deleteVehicle _x;
		sleep 0.1;
	} forEach (allMissionObjects "weaponholder");
};