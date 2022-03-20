params ["_displayOrControl", ["_config", configNull]];
SMQTV_cursorCtrl = _displayOrControl displayCtrl 1000;

private _index = addMissionEventHandler ["Draw3D", {
	_cur = cursorTarget;
	if (isPlayer _cur) then {
		SMQTV_cursorCtrl ctrlSetText ([name _cur, " [ ", roleDescription _cur, " ]"] joinString "");
	} else {
		SMQTV_cursorCtrl ctrlSetText "";
	};
}];

localNamespace setVariable ["SMQTV_hudCursorEH", _index];