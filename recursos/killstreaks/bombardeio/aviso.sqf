if (isDedicated) exitWith {}; //Servidor
if (!hasInterface && !isDedicated) exitWith {}; //HC

params ["_alvo", "_alvoPos", "_caller", "_pos", "_target", "_tipo"];
_alerta		= "";
_radio		= "";
_distancia	= 0;
_delay		= 0;

switch _tipo do
{
	case "CAS":
	{
		_alerta		= "alarmeCAS";
		_radio		= selectRandom (SMQTV_radio select 2);
		_distancia	= 200;
		_delay		= 3;
	};

	case "MK41":
	{
		_alerta		= "alarmeMK41";
		_radio		= selectRandom (SMQTV_radio select 0);
		_distancia	= 400;
		_delay		= 1.5;
	};

	default {};
};

call SMQTV_fnc_habilitaComunicacao;
sleep 0.1;

player sideRadio _radio;
if (!local _caller && {player distance _alvo <= _distancia}) then
{
	private _texto = format ["%1 requisitou um bombardeio próximo à você. Afaste-se da sirene e se proteja!", name _caller];
	[_texto, "vermelho", 10] spawn SMQTV_fnc_barraAviso;
};

[_alvo, _alvoPos, _tipo, _target] spawn SMQTV_fnc_bombardeioSeta;

while {!isNull _alvo} do {
	_alvo say3D [_alerta, 700, 1, true];
	sleep _delay;
};
call SMQTV_fnc_desabilitaComunicacao;