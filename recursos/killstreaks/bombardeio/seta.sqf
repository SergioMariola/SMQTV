params ["_alvo", "_alvoPos", "_tipo", "_target"];

private _classe		= if (_tipo isEqualTo "CAS") then {"VR_3DSelector_01_default_F"} else {"VR_3DSelector_01_incomplete_F"};
private _altTerreno	= (AGLToASL _alvoPos) # 2;
private _posX		= [];
private _altura		= if (!isNull _target) then {_target call BIS_fnc_objectHeight} else {5};
private _seta		= createSimpleObject [_classe, (if (!isNull _target) then {getPosASLVisual _alvo} else {_alvoPos}), true];
private _posSeta	= if (!isNull _target) then {getPosASLVisual _alvo} else {_alvoPos};
private _escala		= 0;

waitUntil { !isNull _seta };

while { !isNull _alvo } do {

	_escala = 5;
	_seta setPosASL [_posSeta # 0, _posSeta # 1, _altTerreno + _altura + 10];
	_seta setObjectScale _escala;

	while {getObjectScale _seta >= 1} do {

		_escala = _escala - 0.1;
		_posX = getPosASL _seta;
		_seta setPosASL [_posX # 0, _posX # 1, (_posX # 2) - 0.5];
		_seta setObjectScale _escala;
		sleep 0.05;

	};	
};

deleteVehicle _seta;