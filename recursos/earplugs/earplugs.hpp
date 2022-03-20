/* #Segeja
$[
	1.063,
	["Earplugs",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1100,"Status",[1,"",["0.863516 * safezoneW + safezoneX","0.841 * safezoneH + safezoneY","0.131484 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"Barra",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.863516 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.131484 * safezoneW","0.0055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"Texto",[1,"",["0.913015 * safezoneW + safezoneX","0.8146 * safezoneH + safezoneY","0.0348047 * safezoneW","0.011 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Earplugs
{
    idd = 3200;
	fadein = IGUI_TEMPO_MOSTRA;
	fadeout = IGUI_TEMPO_FECHA;
	duration = 1e+011;
	onLoad = "_this call SMQTV_fnc_iniciaEarplugs";
	onUnLoad = "uiNamespace setVariable ['SMQTV_earplugs', nil]";

	class Controls
	{
		class Texto: RscText
		{
			idc = 1003;
			text = "Volume";
			sizeEx = GUI_TEXT_SIZE_SMALL;
			style = 2;
			x = 0.913015 * safezoneW + safezoneX;
			y = 0.8146 * safezoneH + safezoneY;
			w = 0.0348047 * safezoneW;
			h = 0.011 * safezoneH;
			shadow = 2;
		};
		class Barra: RscProgress
		{
			idc = 1200;
			type = 8;
			style = ST_HORIZONTAL;
			colorFrame[] = {0,0,0,0.3};
			x = 0.863516 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.131484 * safezoneW;
			h = 0.0055 * safezoneH;
			shadow = 2;
		};
		class Status: RscStructuredText
		{
			idc = 1000;
			text = "";
			x = 0.863516 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.131484 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaSemibold";
				align = "right";
			};
			shadow = 2;
		};
	};
};