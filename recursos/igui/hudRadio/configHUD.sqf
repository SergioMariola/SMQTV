["SMQTV_hudRadio"] call BIS_fnc_rscLayer;

addUserActionEventHandler ["pushToTalk", "Activate", {
	if (currentChannel isNotEqualTo 5) then {
		playSound ["radioIn", true];
		"SMQTV_hudRadio" cutRsc ["RadioHUD", "PLAIN", -1, false];
	};
}];

addUserActionEventHandler ["pushToTalk", "Deactivate", {
	"SMQTV_hudRadio" cutFadeOut -1;
	if (currentChannel isNotEqualTo 5) then {playSound ["radioOut", true];};
}];