["SMQTV_barraAviso"] call BIS_fnc_rscLayer;

_this addEventHandler ['Killed', {
	'SMQTV_barraAviso' cutFadeOut 2;
}];