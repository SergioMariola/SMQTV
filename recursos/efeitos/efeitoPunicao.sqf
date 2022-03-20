_jogador	= _this;
_hndl		= 0;

//Efeito de cor
if (local _jogador) then {	
	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	_hndl ppEffectAdjust [
		1,
		1,
		0,
		[0, 0, 0, 0.7],
		[0, 0, 0, 1],
		[0.299, 0.587, 0.114, 0],
		[-1, -1, 0, 0, 0, 0, 0]
	];
	_hndl ppEffectCommit 8;
};

//Efeito de poeira
_efeito = "#particlesource" createVehicleLocal (getPosATL _jogador);
_efeito setParticleClass "MineCircleDust";
_efeito attachTo [_jogador, [0,0,-3]];

sleep 2;

if (local _jogador) then {
	["importante", "Zeus:<br/>Suas ações serão punidas!", 0.7] call SMQTV_fnc_cutText;
};

sleep 8;

//Finaliza
detach _efeito;
deleteVehicle _efeito;
if (local _jogador) then {ppEffectDestroy _hndl};