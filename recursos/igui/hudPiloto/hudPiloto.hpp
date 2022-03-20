/* #Tikico
$[
	1.063,
	["HUDPiloto",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Texto",[1,"blablablablablablablablablab",["0.302773 * safezoneW + safezoneX","0.016 * safezoneH + safezoneY","0.39832 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class HUDPiloto
{
	idd = 3500;
	fadein = IGUI_TEMPO_MOSTRA;
	fadeout = IGUI_TEMPO_FECHA;
	duration = 1e+011;
	onLoad = "_this spawn SMQTV_fnc_hudPiloto";

	class Controls
	{
		class Texto: RscStructuredText
		{
			idc = 1000;
			text = "";
			style = ST_CENTER;
			class Attributes
			{
				font = "RobotoCondensed";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "center";
				shadow = 2;
			};
			x = 0.302773 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.39832 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};