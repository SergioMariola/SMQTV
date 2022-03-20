params ["_displayOrControl", ["_config", configNull]];

private _dbInfo = [] spawn SMQTV_fnc_dbRequisitaJogador;
waitUntil { scriptDone _dbInfo };

private _nome			= _displayOrControl displayCtrl 1001;
private _papel			= _displayOrControl displayCtrl 1002;
private _mortes			= _displayOrControl displayCtrl 1011;
private _kills			= _displayOrControl displayCtrl 1012;
private _colateral		= _displayOrControl displayCtrl 1013;
private _halo			= _displayOrControl displayCtrl 1014;
private _saltoVeiculo	= _displayOrControl displayCtrl 1015;
private _gbu			= _displayOrControl displayCtrl 1016;
private _mk41			= _displayOrControl displayCtrl 1017;
private _mandaChuva		= _displayOrControl displayCtrl 1018;
private _textoFalso		= _displayOrControl displayCtrl 999;
private _valorFalso		= _displayOrControl displayCtrl 998;

_textoFalso ctrlShow false;
_valorFalso ctrlShow false;
_nome ctrlSetText (name player);
_papel ctrlSetText (roleDescription player);
_mortes ctrlSetText str (["&MORTES"] call SMQTV_fnc_dbAtributoJogador);
_kills ctrlSetText str (["&KILLS"] call SMQTV_fnc_dbAtributoJogador);
_colateral ctrlSetText str (["&COLATERAL"] call SMQTV_fnc_dbAtributoJogador);
_halo ctrlSetText str (["&HALO"] call SMQTV_fnc_dbAtributoJogador);
_saltoVeiculo ctrlSetText str (["&SALTO_VEICULO"] call SMQTV_fnc_dbAtributoJogador);
_gbu ctrlSetText str (["&GBU"] call SMQTV_fnc_dbAtributoJogador);
_mk41 ctrlSetText str (["&MK41"] call SMQTV_fnc_dbAtributoJogador);
_mandaChuva ctrlSetText str (["&MANDA_CHUVA"] call SMQTV_fnc_dbAtributoJogador);