params ["_veiculo", "_pos", "_dir"];

if (_veiculo isKindOf "Helicopter") then {
	//Desabilita a função de co-piloto
	_veiculo enableCopilot false;

	//Configura Salto PQD
	_acao = _veiculo addAction [
		"Salto de paraquedas",
		{
			params ["", "_caller"];
			_caller spawn SMQTV_fnc_saltoPQD;
		},
		nil,
		1.5,
		false,
		true,
		"",
		"_this in (crew _target) && {_this isNotEqualTo (driver _target)}",
		-1
	];
	_veiculo setUserActionText [
		_acao ,
		"Salto de paraquedas",
		"<img size='2' image='\A3\ui_f\data\map\vehicleicons\iconParachute_ca.paa'/>"
	];
};

//Configura estacionamento do veículo
private _acao = _veiculo addAction [
	"Estacionar veículo",
	{
		params ["_target", "", "", "_arguments"];
		_arguments params ["_pos", "_dir"];
		[_target, _pos, _dir] spawn SMQTV_fnc_estacionaVeiculo;
	},
	[_pos, _dir],
	1.5,
	false,
	true,
	"",
	"_target inArea 'baseArea' && {(crew _target) select {isPlayer _x} isEqualTo []}",
	10
];

_veiculo setUserActionText [
	_acao,
	"Estacionar veículo",
	"<img size='2' image='\A3\Ui_f\data\GUI\Cfg\KeyframeAnimation\IconCurve_CA.paa'/>"
];