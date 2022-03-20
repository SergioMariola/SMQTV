params ["_displayOrControl", ["_config", configNull]];

private _barra = _displayOrControl displayCtrl 1000;
private _posY = (ctrlPosition _barra) select 1;

_barra ctrlSetPositionY _posY - 0.5;
_barra ctrlCommit 0;
waitUntil { ctrlCommitted _barra };

_barra ctrlSetBackgroundColor ( uiNamespace getVariable ["SMQTV_barraCor", [1,1,1,1]] );
_barra ctrlSetText ( uiNamespace getVariable ["SMQTV_barraTexto", ""] );

_barra ctrlSetPositionY _posY;
_barra ctrlCommit 0.5;
playSound ["Topic_Trigger", true];
waitUntil { ctrlCommitted _barra };

sleep ( uiNamespace getVariable ["SMQTV_barraTempo", 5] );

_barra ctrlSetPositionY _posY - 0.5;
_barra ctrlCommit 0.5;