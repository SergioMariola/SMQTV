if (localNamespace getVariable ["SMQTV_caronaAvisoCooldown", false]) exitWith {};
params ["_solicitante"];

call SMQTV_fnc_habilitaComunicacao;
sleep 0.1;
_solicitante sideRadio (selectRandom (SMQTV_radio select 3));

private _texto = format ["%1 está requisitando carona na base", name _solicitante];
[_texto] spawn SMQTV_fnc_barraAviso;
[] spawn SMQTV_fnc_caronaAvisoCooldown;

sleep 5;

call SMQTV_fnc_desabilitaComunicacao;