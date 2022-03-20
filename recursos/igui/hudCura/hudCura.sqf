params ["_displayOrControl", ["_config", configNull]];

_prog = _displayOrControl displayCtrl 1200;
_seta = _displayOrControl displayCtrl 1201;
_txt = _displayOrControl displayCtrl 1000;
_healer = uiNamespace getVariable ["SMQTV_healer", objNull];
_damage = if (player getHitPointDamage "hitlegs" >= 0.5) then {0.2} else {0.5};

//Flag
localNamespace setVariable ["SMQTV_curaOn", true];

//Informa sobre healer
if (!isNull _healer) then {
    _eMedico = if (_healer getUnitTrait "medic") then {"é"} else {"não é"};
    _texto = [name _healer, " está te curando...<br/><t size='1.3'>Ele ", _eMedico, " médico</t>"] joinString "";
    ["naoImportante", _texto, 0.5] call SMQTV_fnc_cutText;
};

//Inicia controles
_prog progressSetPosition _damage;
_txt ctrlSetText (["Saúde atual: ", 100 * _damage, "%"] joinString "");

//Anima seta
[_displayOrControl, _seta] spawn {
    params ["_displayOrControl", "_seta"];
    _pos = (ctrlPosition _seta) select 1;

    while { !isNull _displayOrControl && {localNamespace getVariable ["SMQTV_curaOn", false]} } do {
        _seta ctrlSetPositionY _pos;
        _seta ctrlSetFade 0;
        _seta ctrlCommit 0;
        _seta ctrlSetPositionY (_pos - 0.05);
        _seta ctrlCommit 0.7;
        _seta ctrlSetFade 1;
        _seta ctrlCommit 0.7;
        sleep 0.8;
    };
    _seta ctrlSetPositionY _pos;
    _seta ctrlSetFade 0;
    _seta ctrlCommit 0;
};

sleep 1.5;

//Aguarda processo de cura ou afastamento do machucado
_sair = false;
if (isNull _healer) then {
    _anim = animationState player;
    waitUntil { animationState player isNotEqualTo _anim };
} else {
    _anim = animationState _healer;
    waitUntil { animationState _healer isNotEqualTo _anim || {player distance _healer > 3}};
    if (player distance _healer > 3) then {_sair = true};
};

if _sair exitWith {
    player remoteExecCall ["SMQTV_fnc_cancelaCura", _healer];
    uiNamespace setVariable ["SMQTV_healer", nil];
    localNamespace setVariable ["SMQTV_curaOn", false];
    "SMQTV_heal" cutFadeOut -1;
    _texto = (["Você se afastou de ", name _healer, "<br/><t size='1.3'>A cura foi cancelada</t>"] joinString "");
    ["importante", _texto, 0.5] call SMQTV_fnc_cutText;
};

//Anima barra de progresso
_eMedico = false;
if (isNull _healer) then {
    _eMedico = player getUnitTrait "medic";
} else {
    _eMedico = _healer getUnitTrait "medic";
};

_damageFinal = if _eMedico then {1} else {0.8};

for "_i" from _damage to _damageFinal step 0.01 do {
    _prog progressSetPosition _i;
    _txt ctrlSetText (["Saúde final: ", 100 * _i, "%"] joinString "");
    sleep 0.001;
};
_prog progressSetPosition _damageFinal;
_txt ctrlSetText (["Saúde final: ", 100 * _damageFinal, "%"] joinString "");

//Finaliza
localNamespace setVariable ["SMQTV_curaOn", false];
uiNamespace setVariable ["SMQTV_healer", nil];
sleep 2;
"SMQTV_heal" cutFadeOut -1;