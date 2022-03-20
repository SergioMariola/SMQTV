params ["_displayOrControl", ["_config", configNull]];

_prog       = _displayOrControl displayCtrl 1200;
_icone      = _displayOrControl displayCtrl 1201;
_txt        = _displayOrControl displayCtrl 1000;
_var        = uiNamespace getVariable ["SMQTV_mecanico", objNull];
_mecanico   = _var select 0;
_veiculo    = _var select 1;
_damage     = getAllHitPointsDamage _veiculo select 2;
_soma = 0;
{
	_soma = _soma + _x;
} forEach _damage;
_media = _soma / (count _damage);

//Flag
localNamespace setVariable ["SMQTV_reparoOn", true];

//Informa sobre healer
_texto = [name _mecanico, " está reparando seu veículo..."] joinString "";
["naoImportante", _texto, 0.5] call SMQTV_fnc_cutText;

//Inicia controles
_prog progressSetPosition _media;
_txt ctrlSetText (["Dano atual: ", 100 * _media toFixed 1, "%"] joinString "");

//Anima seta
[_displayOrControl, _icone] spawn {
    params ["_displayOrControl", "_icone"];
    _pos = (ctrlPosition _icone) select 1;

    while { !isNull _displayOrControl && {localNamespace getVariable ["SMQTV_reparoOn", false]} } do {
        _icone ctrlSetPositionY _pos;
        _icone ctrlSetFade 0;
        _icone ctrlCommit 0;
        _icone ctrlSetPositionY (_pos - 0.05);
        _icone ctrlCommit 0.7;
        _icone ctrlSetFade 1;
        _icone ctrlCommit 0.7;
        sleep 0.8;
    };
    _icone ctrlSetPositionY _pos;
    _icone ctrlSetFade 0;
    _icone ctrlCommit 0;
};

sleep 1.5;

//Aguarda processo de cura ou afastamento do mecânico
_sair = false;
_anim = animationState _mecanico;
waitUntil { animationState _mecanico isNotEqualTo _anim || {_veiculo distance _mecanico > 10}};
if (_veiculo distance _mecanico > 10) then {_sair = true};

if _sair exitWith {
    _anim remoteExecCall ["SMQTV_fnc_cancelaReparo", _mecanico];
    uiNamespace setVariable ["SMQTV_mecanico", nil];
    localNamespace setVariable ["SMQTV_reparoOn", false];
    "SMQTV_reparo" cutFadeOut -1;
    _texto = (["Seu veículo se afastou de ", name _mecanico, "<br/><t size='1.3'>O reparo foi cancelado</t>"] joinString "");
    ["importante", _texto, 0.5] call SMQTV_fnc_cutText;
};

_mediaFinal = 0;
waitUntil {
    _damage     = getAllHitPointsDamage _veiculo select 2;
    _soma = 0;
    {
        _soma = _soma + _x;
    } forEach _damage;
    _mediaFinal = _soma / (count _damage);
    _mediaFinal < _media
};

//Anima barra de progresso

for "_i" from _media to _mediaFinal step -0.001 do {
    _prog progressSetPosition _i;
    _txt ctrlSetText (["Dano final: ", 100 * _i toFixed 1, "%"] joinString "");
    sleep 0.01;
};
_prog progressSetPosition _mediaFinal;
_txt ctrlSetText (["Dano final: ", 100 * _mediaFinal toFixed 0, "%"] joinString "");

//Finaliza
localNamespace setVariable ["SMQTV_reparoOn", false];
uiNamespace setVariable ["SMQTV_mecanico", nil];
sleep 2;
"SMQTV_reparo" cutFadeOut -1;