"SMQTV_hudCursor" cutFadeOut -1;
private _index = localNamespace getVariable ["SMQTV_hudCursorEH", -1];
removeMissionEventHandler ["Draw3D", _index];
SMQTV_cursorCtrl = nil;