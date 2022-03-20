params ["_target", "_caller", "_index", "_engineName", "_text"];

/* if isServer then {
    hintSilent parseText ( ["Target: ", typeOf _target,"<br/>Caller: ", name _caller,"<br/>Index: ", _index,"<br/>Engine name: ", _engineName,"<br/>Text: ", _text] joinString "" );
}; */

//HUD Cura
if (_engineName isEqualTo "HealSoldier" || {_engineName isEqualTo "HealSoldierSelf" || {_engineName isEqualTo "Heal"}}) exitWith {

    switch _engineName do {
        case "HealSoldier": {
            _caller remoteExecCall ["SMQTV_fnc_iniciaCura", _target];
        };
        case "HealSoldierSelf": {
            "SMQTV_heal" cutRsc ["Rsc_SMQTV_cura", "PLAIN", -1, false];
        };
        case "Heal": {
            "SMQTV_heal" cutRsc ["Rsc_SMQTV_cura", "PLAIN", -1, false];
        };
    };
    false
};

//Restrição para não-Operadores de VANT
if (_engineName in ["UAVTerminalOpen", "UAVTerminalMakeConnection"] && {typeOf _caller isNotEqualTo "B_soldier_UAV_F"}) exitWith {
    ["naoImportante", "Esta função só pode ser utilizada por<br/>Operadores de VANT", 0.5] call SMQTV_fnc_cutText;
    true
};

//HUD Recarrega
if (_engineName isEqualTo "LoadEmptyMagazine") exitWith {
    "SMQTV_hudRecarrega" cutRsc ["HUDRecarrega", "PLAIN", -1, false];
    false
};

//HUD Repara
if (_engineName isEqualTo "RepairVehicle") exitWith {
    _tripulacao = (crew _target) select {isPlayer _x};
    if (_tripulacao isNotEqualTo []) then {
        [_caller, _target] remoteExecCall ["SMQTV_fnc_iniciaReparo", _tripulacao];
    };
    false
};

//Manda Chuva
if (_caller getVariable ["SMQTV_mandaChuvaEmUso", false] && {_engineName isNotEqualTo "User"}) exitWith {
    ["naoImportante", "Não é possível usar esta ação", 0.5] call SMQTV_fnc_cutText;
	true
};