params ["_jogador", "_atirador"];

_texto = format ["Fogo amigo: %1 incapacitou %2", name _atirador, name _jogador];

if (local _atirador) then {
	call SMQTV_fnc_vrFadeIn;
} else {
	playSound "Alarm";
	["naoImportante", _texto] call SMQTV_fnc_cutText;
};

systemChat _texto;