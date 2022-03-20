params ["_displayOrControl", ["_config", configNull]];

_ctrlTxt	= _displayOrControl displayCtrl 1000;
_meds		= [];
_cor		= [];
_txt		= "";
_dist		= 0;

while {!isNull _displayOrControl} do {
	
	_meds = (playableUnits - [player]) select { player distance _x <= SMQTV_maxDist3D && {_x getUnitTrait "medic" && {(lifeState _x) isNotEqualTo "INCAPACITATED"}} };
	if (_meds isEqualTo []) then {
		_txt = ["Não há médico(s) num raio de ", SMQTV_maxDist3D, "m"] joinString "";
	} else {
		{
			_meds set [_forEachIndex, [round (player distance _x), _x]];
		} forEach _meds;
		_meds sort true;
		_dist = (_meds select 0) select 0;
		switch (true) do {
			case (_dist <= 50) : {_cor = COR_VERDE};
			case (_dist > 50 && _dist <= 150) : {_cor = COR_AZUL};
			default {_cor = COR_VERMELHO};
		};
		_txt = ["Médico mais próximo: ", name ((_meds select 0) select 1), " (<t color='", _cor,"'>", _dist, "m</t>)"] joinString "";
	};
	_ctrlTxt ctrlSetStructuredText parseText _txt;
	sleep 0.1;
};