addMissionEventHandler ["PlayerDisconnected",
{
	params ["", "", "", "", "_owner", ""];
	_hc = missionNamespace getVariable ["SMQTV_hcPresente", -1];
	if (_hc > -1) then {
		if (_hc isEqualTo _owner) then {
			missionNamespace setVariable ["SMQTV_hcPresente", nil, true];
		};
	};
}];