private _i = 0;
localNamespace setVariable ["SMQTV_caronaAvisoCooldown", true];

while {_i <= 10} do {
	_i = _i + 1;
	sleep 1;
};

localNamespace setVariable ["SMQTV_caronaAvisoCooldown", false];