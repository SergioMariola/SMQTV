/* #Bygyja
$[
	1.063,
	["HUDMed",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1100,"Status",[1,"",["0.345313 * safezoneW + safezoneX","0.412 * safezoneH + safezoneY","0.309375 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class hudMed
{
    idd = 3400;
	fadein = IGUI_TEMPO_MOSTRA;
	fadeout = IGUI_TEMPO_FECHA;
	duration = 1e+011;
	onLoad = "_this spawn SMQTV_fnc_hudMed";

	class Controls
	{
		class Status: RscStructuredText
		{
			idc = 1000;
			style = ST_CENTER;
			size = GUI_TEXT_SIZE_LARGE;
			class Attributes
			{
				font = "RobotoCondensedBold";
				align = "center";
			};
			x = 0.345313 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.044 * safezoneH;
			shadow = 2;
		};
	};
};