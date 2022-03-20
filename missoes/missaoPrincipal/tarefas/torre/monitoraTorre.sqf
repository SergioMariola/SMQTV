params ["_centro", "_objeto"];
private _jogadores = [];
private _jogadoresSort = [];
private _jogador = objNull;

while {alive _objeto} do {

	_jogadores = playableUnits inAreaArray [_centro, 700, 700];
	_jogadoresSort = [];

	if (_jogadores isNotEqualTo []) then {

		{_jogadoresSort pushBack [_x, _x distance2D _centro]} forEach _jogadores;
		_jogadoresSort sort false;
		_jogador = _jogadoresSort select 0 select 0;
		_jogador spawn SMQTV_fnc_airstrikeGBU;
		_jogadores = playableUnits inAreaArray [getPosATL _jogador, 100, 100];
		["Jato inimigo a caminho da sua posição. Proteja-se!", "vermelho", 7] remoteExec ["SMQTV_fnc_barraAviso", _jogadores];
	};
	sleep 900;
};