params ["_displayOrControl", ["_config", configNull]];

_texto = _displayOrControl displayCtrl 1000;
_canal = [];

switch (currentChannel) do { 
	case 0 : { _canal = ["-= Canal global =-", [1,1,1,1]] };
	case 1 : { _canal = ["-= Canal de lado =-", [0.501961,0.831373,1,1]] };
	case 2 : { _canal = ["-= Canal de comando =-", [1,1,0.6,1]] };
	case 3 : { _canal = ["-= Canal de grupo =-", [0.709,0.972,0.384,0.8]] };
	case 4 : { _canal = ["-= Canal de veículo =-", [1,1,0,1]] };
	default { _canal = ["< Canal personalizado >", [1,0,1,1]] };
};

_texto ctrlSetTextColor  (_canal select 1);
_texto ctrlSetText (_canal select 0);