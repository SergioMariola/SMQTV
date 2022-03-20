params ["_displayOrControl", ["_config", configNull]];

private _listaTitulo	= _displayOrControl displayCtrl 1001;
private _lista			= _displayOrControl displayCtrl 1500;
private _jogadorNome	= _displayOrControl displayCtrl 1002;
private _botaoKick		= _displayOrControl displayCtrl 1600;
private _botaoLoadout	= _displayOrControl displayCtrl 1602;
private _botaoFalso		= _displayOrControl displayCtrl 123;

_botaoFalso ctrlShow false;
_botaoKick ctrlShow false;
_botaoLoadout ctrlShow false;
{
	_lista lbAdd (name _x);
	_lista lbSetData [_forEachIndex, getPlayerUID _x];
} forEach allPlayers;

lbSort _lista;

_listaTitulo ctrlSetText ("Jogadores (" + str (lbSize _lista) + ")");