_this addEventHandler ['Killed', {
	'SMQTV_score' cutFadeOut -1;
	uiNamespace setVariable ["SMQTV_placarDisplay", nil];
}];

_this addEventHandler ["Respawn", {
	'SMQTV_score' cutRsc ['Placar', 'PLAIN', -1, false];
}];

['SMQTV_score'] call BIS_fnc_rscLayer;
'SMQTV_score' cutRsc ['Placar', 'PLAIN', -1, false];