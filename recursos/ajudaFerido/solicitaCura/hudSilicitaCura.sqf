params ["_displayOrControl", ["_config", configNull]];

_seta = _displayOrControl displayCtrl 1200;
_texto = _displayOrControl displayCtrl 1100;
_cruz = _displayOrControl displayCtrl 1202;
_solicitante = uiNamespace getVariable ["SMQTV_curaSolicitante", objNull];

_txt = ["<t color='", COR_AZUL, "'>", name _solicitante, "</t> está próximo a você e solicita auxílio com ferimento"] joinString "";
_texto ctrlSetStructuredText parseText _txt;

_cruzPosY = (ctrlPosition _cruz) select 1;
_cruz ctrlSetPositionY (_cruzPosY - 0.15);
_cruz ctrlCommit 1.2;
_cruz ctrlSetFade 1;
_cruz ctrlCommit 1;

_id = addMissionEventHandler ["Draw3D", {
	_thisArgs params ["_solicitante", "_seta"];
	_seta ctrlSetAngle [player getRelDir _solicitante, 0.5, 0.5];
}, [_solicitante, _seta]];

_limite = time + 10;
waitUntil {
	sleep 0.2;
	time > _limite || {lifeState player isEqualTo "INCAPACITATED" || {!alive player}}
};

removeMissionEventHandler ["Draw3D", _id];

localNamespace setVariable ["SMQTV_curaSolicitada", nil];
uiNamespace setVariable ["SMQTV_curaSolicitante", nil];

"SMQTV_hudSolicitaCura" cutFadeOut -1;