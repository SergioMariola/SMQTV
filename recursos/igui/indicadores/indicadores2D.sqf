addMissionEventHandler ["Map", {

    findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {
        params ["_control"];

        playableUnits apply {
            if (effectiveCommander vehicle _x isNotEqualTo _x) then {continue};
            _vivo       = (lifeState _x) isNotEqualTo "INCAPACITATED";
            _veiculo    = objectParent _x;
            _nome       = if (isNull _veiculo) then {name _x} else {
                _crew = (side player) countSide (crew _veiculo);
                if (_crew > 1) then {
                    [name _x, " (", getText (configfile >> "CfgVehicles" >> typeOf _veiculo >> "displayName"), ") +", _crew - 1] joinString ""
                } else {
                    [name _x, " (", getText (configfile >> "CfgVehicles" >> typeOf _veiculo >> "displayName"), ")"] joinString ""
                };
            };
            _iconeTipo  = getText (configfile >> "CfgVehicles" >> typeOf _x >> "icon");
            _textura    = if (_vivo) then {
                if (isNull _veiculo) then {getText (configfile >> "CfgVehicleIcons" >> _iconeTipo)} else {getText (configfile >> "CfgVehicles" >> typeOf _veiculo >> "icon")}
            } else {"\A3\Ui_f\data\IGUI\Cfg\Revive\overlayIcons\u100_ca.paa"};
            _cor        = if (_vivo) then {
                if ((group _x) isEqualTo (group player)) then {SMQTV_corGrupo} else {SMQTV_corTime}
            } else {[1,0,0,0.8]};

            _control drawIcon [
                _textura,
                _cor,
                getPosWorldVisual _x,
                20,
                20,
                getDirVisual _x,
                if (_vivo) then {_nome} else {[_nome, " (Incapacitado)"] joinString ""},
                2,
                0.06
            ];
        };
    }];

    removeMissionEventHandler [_thisEvent, _thisEventHandler];
}];