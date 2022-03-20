params ["_displayOrControl", ["_config", configNull]];

_pos = ctrlPosition _displayOrControl;
_pos set [2, 0.1125];
_displayOrControl ctrlSetPosition _pos;
_displayOrControl ctrlCommit 0.5;