/* #Dabada
$[
	1.063,
	["Placar",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Mortes",[1,"Mortes",["0.863516 * safezoneW + safezoneX","0.951 * safezoneH + safezoneY","0.131484 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Eliminacoes",[1,"Eliminacoes",["0.863516 * safezoneW + safezoneX","0.918 * safezoneH + safezoneY","0.131484 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"Killstreak",[1,"Killstreak",["0.863516 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.131484 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Placar
{
	idd = 3100;
	fadein = IGUI_TEMPO_MOSTRA;
	fadeout = IGUI_TEMPO_FECHA;
	duration = 1e+011;
	onLoad = "_this call SMQTV_fnc_iniciaPlacar";

	class Controls
	{
		class Molde: RscText
		{
			idc = -1;
			style = ST_RIGHT;
			font = "PuristaSemibold";
			shadow = 2;
		}
		class Elimnacoes: Molde
		{
			idc = 3101;
			text = "Eliminações: ";
			x = 0.890586 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.104414 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class FaixaEliminacoes: Elimnacoes
		{
			idc = 3104;
			style = ST_PICTURE;
			text = "recursos\igui\imagens\faixa.paa";
			x = 0.875117 * safezoneW + safezoneX;
			w = 0.131484 * safezoneW;
		};

		class Killstreak: Molde
		{
			idc = 3102;
			text = "Killstreak: ";
			x = 0.890586 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.104414 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class KillstreakVFX: Killstreak
		{
			idc = 3202;
			text = "+ Recompensa";
			colorText[] = {1, 1, 0, 1};
		};

		class FaixaKillstreak: Killstreak
		{
			idc = 3105;
			style = ST_PICTURE;
			text = "recursos\igui\imagens\faixa.paa";
			x = 0.875117 * safezoneW + safezoneX;
			w = 0.131484 * safezoneW;
		};

		class Mortes: Molde
		{
			idc = 3103;
			text = "Mortes: ";
			x = 0.890586 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.104414 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class FaixaMortes: Mortes
		{
			idc = 3106;
			style = ST_PICTURE;
			text = "recursos\igui\imagens\faixa.paa";
			x = 0.875117 * safezoneW + safezoneX;
			w = 0.131484 * safezoneW;
		};
	};
};