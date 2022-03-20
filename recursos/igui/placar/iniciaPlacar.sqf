params ["_displayOrControl", ["_config", configNull]];

uiNamespace setVariable ["SMQTV_placarDisplay", _displayOrControl];
private _ctrlKills = _displayOrControl displayCtrl 3101;
private _ctrlKS = _displayOrControl displayCtrl 3102;
private _ctrlKsVFX = _displayOrControl displayCtrl 3202;
private _ctrlMortes = _displayOrControl displayCtrl 3103;
private _ctrlKillsTxt = ctrlText _ctrlKills;
private _ctrlKSTxt = ctrlText _ctrlKS;

_ctrlKsVFX ctrlSetFade 1;
_ctrlKsVFX ctrlCommit 0;

_ctrlMortes ctrlSetText ([ctrlText _ctrlMortes, getPlayerScores player # 4] joinString "");
_ctrlKills ctrlSetText ([_ctrlKillsTxt, getPlayerScores player # 0] joinString "");
_ctrlKS ctrlSetText ([_ctrlKSTxt, 0] joinString "");