//Indicadores de soldados comuns
if (SMQTV_ind3DSair) exitWith {};

SMQTV_ind3D = addMissionEventHandler ["Draw3D", {

	(playableUnits - [player]) apply {

		_dist 		= player distance _x;
		if (_dist > SMQTV_maxDist3D || {_dist > viewDistance}) then {continue};
		if (effectiveCommander vehicle _x isNotEqualTo _x) then {continue};
		_veicP		= objectParent player;
		_veicX		= objectParent _x;
		_pos 		= _x modelToWorldVisual (_x selectionPosition "pelvis");
		_vis 		= [_veicP, "VIEW", _veicX] checkVisibility [eyePos player, AGLToASL _pos];
		_alpha 		= if (_vis > 0) then {0.7} else {0.2};
		_iconeTam	= 1 - (_dist / SMQTV_maxDist3D);
		_ls 		= lifeState _x;
		_vivo		= _ls isNotEqualTo "INCAPACITATED";
		_borda		= if (!_vivo) then {true} else {false};
		_iconeTipo	= getText (configfile >> "CfgVehicles" >> typeOf _x >> "icon");
		_textura 	= if (_vivo) then {getText (configfile >> "CfgVehicleIcons" >> _iconeTipo)} else {"\A3\Ui_f\data\IGUI\Cfg\Revive\overlayIcons\u100_ca.paa"};
		_cor 		= [
			if (_vivo) then {
				if (group _x isEqualTo group player) then {[0,1,0,_alpha]} else {[0,0.3,0.6,_alpha]};
			} else {
				[1,0,0,_alpha];
			},
			[1,1,1,_alpha]
		];
		_nome		= if (isNull _veicX) then {
			_ferimentos = getAllHitPointsDamage _x select 2;
			_ferimentos deleteAt ((count _ferimentos) - 1);
			_ferido = _ferimentos findIf {_x > 0.25};
			switch (true) do {
				case (!_vivo) :				{ [name _x, " [Incapacitado]"] joinString "" };
				case (_ferido > -1) :	{ [name _x, " [Ferido]"] joinString "" };
				default {name _x};
			};
		} else {
			_crew = (side player) countSide (crew _veicX);
			if (_crew > 1) then {[name _x, " +", _crew - 1] joinString ""} else {name _x};
		};

		drawIcon3D [
			_textura,
			_cor,
			_pos,
			_iconeTam,
			_iconeTam,
			0,
			_nome,
			2,
			SMQTV_nomeTam3D,
			"RobotoCondensed",
			"center",
			_borda
		];
	};
}];

SMQTV_ind3D