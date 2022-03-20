private _db = profileNamespace getVariable ['SMQTV_db', []];

if (_db isEqualTo []) then {
	call SMQTV_fnc_dbInicia;
} else {
	call SMQTV_fnc_dbRecomp;
};