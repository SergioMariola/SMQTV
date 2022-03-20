/* #Jinepu
$[
	1.063,
	["reloadHUD",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Texto",[1,"",["0.345313 * safezoneW + safezoneX","0.203 * safezoneH + safezoneY","0.309375 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Texto",[1,"Recarregando",["0.426523 * safezoneW + safezoneX","0.181 * safezoneH + safezoneY","0.143086 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Rearma
{
	idd = 3700;
	fadein = 0.1;
	fadeout = 0.1;
	duration = 1e+011;
	onLoad = "_this spawn SMQTV_fnc_rearma";

	class Controls
	{
		class Barra: RscProgress
		{
			idc = 1000;
			type = 8;
			style = ST_HORIZONTAL;
			colorFrame[] = {1,1,1,0.3};
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			shadow = 2;
		};
		class Texto: RscText
		{
			idc = 1100;
			style = 2;
			text = "Recarregando...";
			x = 0.345313 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			shadow = 2;
		};
	};
};