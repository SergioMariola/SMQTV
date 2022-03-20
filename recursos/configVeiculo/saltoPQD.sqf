_altMinSalto	= 200;
_altMinAbre		= 100;
_altitude		= (getPosATL _this) select 2;
_texto			= "";

//Impede salto
if (_altitude < _altMinSalto) exitWith {
	_texto = format ["A aeronave precisa estar a pelo menos %1m de altitude para o salto ser possível", _altMinSalto];
	["importante", _texto, 0.5] call SMQTV_fnc_cutText;
};

//Inicia salto
moveOut _this;

//Dispara mensagens
_texto = format ["O paraquedas abre automaticamente aos %1m de altitude", _altMinAbre];
["importante", _texto, 0.5] call SMQTV_fnc_cutText;

//Configura e monitora queda
_equipamento = getUnitLoadout _this;
removeBackpack _this;
sleep 0.5;
_this addBackpack "B_Parachute";

waitUntil {
	_altitude = ((getPosATL _this) select 2) <= _altMinAbre;
	_altitude || {!alive _this}
};

if (!alive _this) exitWith {};
_this action ["OpenParachute", _this];

waitUntil { isTouchingGround _this || !alive _this };

if (!alive _this) exitWith {};

//Finaliza salto
_nvg = currentVisionMode _this;
_this setUnitLoadout _equipamento;
if (_nvg > 0) then {_this action ["nvGoggles", _this]};