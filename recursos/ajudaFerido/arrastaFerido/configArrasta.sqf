private _acao = _this addAction [
	"Arrastar ferido",
	"_this spawn SMQTV_fnc_arrasta",
	nil,
	1.5,
	false,
	true,
	"",
	"
	private _cur = cursorTarget;
	lifeState _cur isEqualTo 'INCAPACITATED' && {_this distance _cur <= 2}
	",
	-1
];

_this setUserActionText [
	_acao,
	"Arrastar ferido",
	"<img size='2.5' image='\A3\Ui_f\data\IGUI\Cfg\Actions\take_ca.paa'/>"
];