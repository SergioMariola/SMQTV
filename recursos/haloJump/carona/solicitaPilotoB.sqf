params ["_control"];
private _display = ctrlParent _control;
private _piloto = uiNamespace getVariable ["SMQTV_caronaPilotoB", objNull];

if (isNull _piloto) exitWith {
	_display closeDisplay 2;
	["naoImportante", "Este piloto não está mais disponível", 0.5] call SMQTV_fnc_cutText;
};

[player] remoteExec ["SMQTV_fnc_solicitaPilotoAviso", crew (vehicle _piloto)];
private _texto = ["Mensagem enviada ao piloto ", name _piloto] joinString "";
[_texto] spawn SMQTV_fnc_barraAviso;

_display closeDisplay 2;