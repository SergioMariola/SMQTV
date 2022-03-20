if !isServer exitWith {};
scriptName "passagemDeTempo";
_caixa = _this;
_posA = [];
_posB = [];

while {true} do
{
	sleep 1;

	//Desacelera tempo
	setTimeMultiplier SMQTV_tempoDia;
	//Flyby de jatos na base
	_posA = _caixa modelToWorld [2000, 30, 0];
	_posB = _caixa modelToWorld [-2000, 30, 0];
	[_posA, _posB, 100, "LIMITED", "B_Plane_Fighter_01_F"] call SMQTV_fnc_flyBy;
	_posA = _caixa modelToWorld [2000, -30, 0];
	_posB = _caixa modelToWorld [-2000, -30, 0];
	[_posA, _posB, 100, "LIMITED", "B_Plane_Fighter_01_F"] call SMQTV_fnc_flyBy;

	//Aguarda a noite
	waitUntil {sleep 30; date select 3 >= 20};

	//Acelera tempo
	setTimeMultiplier SMQTV_tempoNoite;
	//Flyby de jatos na base
	_posA = _caixa modelToWorld [2000, 30, 0];
	_posB = _caixa modelToWorld [-2000, 30, 0];
	[_posA, _posB, 100, "LIMITED", "B_Plane_Fighter_01_F"] call SMQTV_fnc_flyBy;
	_posA = _caixa modelToWorld [2000, -30, 0];
	_posB = _caixa modelToWorld [-2000, -30, 0];
	[_posA, _posB, 100, "LIMITED", "B_Plane_Fighter_01_F"] call SMQTV_fnc_flyBy;

	//Aguarda a manhã
	waitUntil {sleep 30; date select 3 >= 4};
};