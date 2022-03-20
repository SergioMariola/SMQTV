params ["_displayOrControl", ["_config", configNull]];

_caixa = localNamespace getVariable ["SMQTV_caixaRearm", objNull];
_texto = _displayOrControl displayCtrl 1100;
_barra = _displayOrControl displayCtrl 1000;
_dist = false;
_morto = false;

//Inicia progresso
_handle = [_barra, _caixa] spawn {
	
	params ["_barra", "_caixa"];
	_i = 0;

	while {_i < 1} do {
		_barra progressSetPosition _i;
		_i = _i + 0.002;
		sleep 0.01;
	};

	_barra progressSetPosition 1;
};

_alturaBarra = (ctrlPosition _barra) select 3;
_barra ctrlSetPositionH (_alturaBarra / 3);
_barra ctrlSetPositionY (0.951 * safezoneH + safezoneY);
_texto ctrlSetPositionY (0.925 * safezoneH + safezoneY);

_barra ctrlCommit 0.5;
_texto ctrlCommit 0.5;

waitUntil {
	sleep 0.1;
	_dist = (player distance _caixa) > 6;
	_morto = !alive player || lifeState player isEqualTo "INCAPACITATED";
	(progressPosition _barra) isEqualTo 1 || _morto || _dist
};

if (_morto || _dist) exitWith {
	terminate _handle;
	"SMQTV_caixaRearm" cutFadeOut -1;
	localNamespace setVariable ["SMQTV_caixaRearm", nil];
	localNamespace setVariable ["SMQTV_caixaRearmOn", nil];
	["naoImportante", "Rearmamento cancelado", 0.4] call SMQTV_fnc_cutText;
};

localNamespace setVariable ["SMQTV_caixaRearm", nil];
localNamespace setVariable ["SMQTV_caixaRearmOn", nil];
"SMQTV_caixaRearm" cutFadeOut -1;

_var = ["SMQTV_loadout", "_", typeOf player] joinString "";
_equip = profileNamespace getVariable [_var, []];
_vis = currentVisionMode player;
player setUnitLoadout [_equip, true];
if (_vis > 0) then { player action ["nvGoggles", nil] };
["Suprimentos recarregados", nil, 2] spawn SMQTV_fnc_barraAviso;