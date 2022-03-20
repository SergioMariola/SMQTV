params ["_terminal", "_marcadorMissaoArea"];

_jogador	= objNull;
_jogadores	= [];

while {alive _terminal} do {
	_jogadores = playableUnits inAreaArray _marcadorMissaoArea;
	if (_jogadores isNotEqualTo []) then {
		_jogador = selectRandom _jogadores;
		_vezes = selectRandom [1,2,3];
		for "_i" from 1 to _vezes do {
			[_jogador] spawn SMQTV_fnc_airstrikeArtilharia;
			sleep 7;
		};
	};
	sleep 1000;
};