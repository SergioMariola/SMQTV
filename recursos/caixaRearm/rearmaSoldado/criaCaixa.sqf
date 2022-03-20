_caixa = createVehicle ["Land_Ammobox_rounds_F", _this, [], -1, "CAN_COLLIDE"];
waitUntil { !isNull _caixa };

_caixa remoteExec ["SMQTV_fnc_rearmaCaixaConfigs", 0, _caixa];

_caixa spawn {
	sleep 300;
	deleteVehicle _this;
};