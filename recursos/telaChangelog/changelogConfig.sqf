if (!hasInterface && !isDedicated) exitWith {};

private _acao = _this addAction [
	"Atualizações do servidor",
	{createDialog 'changelog'},
	nil,
	1.5,
	true,
	true,
	"",
	"",
	4
];

_this setUserActionText [_acao , "Atualizações do servidor", "<img size='4.5' image='\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa'/>"];

if (!isServer) exitWith {};

_this allowDamage false;
_this enableSimulationGlobal false;