if (!hasInterface && !isDedicated) exitWith {};

private _acao = _this addAction [
	"Informações do servidor",
	{createDialog 'recursos'},
	nil,
	1.5,
	true,
	true,
	"",
	"",
	4
];

_this setUserActionText [_acao , "Informações do servidor", "<img size='4.5' image='\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_access_fm_CA.paa'/>"];

if (!isServer) exitWith {};

_this allowDamage false;
_this enableSimulationGlobal false;