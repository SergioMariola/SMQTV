private _display = uiNamespace getVariable ["SMQTV_placarDisplay", displayNull];
if (isNull _display) exitWith {};

private _ctrlScore = _display displayCtrl 3101;
private _ctrlKS = _display displayCtrl 3102;

sleep 0.2;

_ctrlScore ctrlSetText (["Eliminações: ", (getPlayerScores player) select 0] joinString "");
_ctrlKS ctrlSetText (["Killstreak: ", _this] joinString "");

if (_this in [10, 20, 30]) then {
	_ctrlKS ctrlSetTextColor [1, 1, 0, 1];
	[_display, _ctrlKS] spawn SMQTV_fnc_recompensaVFX;
} else {
	_ctrlKS ctrlSetTextColor [1, 1, 1, 1];
};