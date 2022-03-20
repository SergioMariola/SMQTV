params ["_target", "_caller", "_actionId", "_arguments"];
_jogador = cursorTarget;

//Remove ação de arrastar
player removeAction _actionId;

//Inicia arraste
player playMove "AcinPknlMstpSrasWrflDnon";

sleep 1;

if (!alive player) exitWith {};
if ((lifeState player) isEqualTo "INCAPACITATED") exitWith {player call SMQTV_fnc_configArrasta};

_jogador attachTo [player, [0,1.3,0], "footstepr"];

_id = player addAction [
	"Soltar ferido",
	{
		params ["", "", "_actionId", "_jogador"];
		detach _jogador;
		player removeAction _actionId;
		player playMove "AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon";
	},
	_jogador
];

waitUntil {
	(lifeState player) isEqualTo "INCAPACITATED" || {!alive player || {!(_id in (actionIDs player))}}
};

//Remove ação de arrastar
if ((lifeState player) isEqualTo "INCAPACITATED" || {!alive player}) then {detach _jogador};
_temID = _id in (actionIDs player);
if _temID then {player removeAction _id};

if (!alive player) exitWith {};

//Devolve ação de arrastar
player call SMQTV_fnc_configArrasta;