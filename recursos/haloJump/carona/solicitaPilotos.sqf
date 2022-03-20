params ["_control"];
private _display = ctrlParent _control;
private _pilotos = [
	uiNamespace getVariable ["SMQTV_caronaPilotoA", objNull],
	uiNamespace getVariable ["SMQTV_caronaPilotoB", objNull]
];
private _index = _pilotos findIf {isNull _x};

if (_index > -1) exitWith {["naoImportante", "Um ou mais pilotos não estão mais disponíveis", 0.5] call SMQTV_fnc_cutText};

{ [name player] remoteExec ["SMQTV_fnc_solicitaPilotoAviso", crew (vehicle _x)] } forEach _pilotos;
["Mensagem enviada aos pilotos"] spawn SMQTV_fnc_barraAviso;

_display closeDisplay 2;