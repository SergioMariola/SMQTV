/* #Kisymy
$[
	1.063,
	["barraAviso",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Barra",[1,"",["0.00113278 * safezoneW + safezoneX","0.00500001 * safezoneH + safezoneY","0.997734 * safezoneW","0.077 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class BarraAviso
{
	idd = 3300;
	fadein = 1;
	fadeout = 0;
	duration = 15;
	onLoad = "_this spawn SMQTV_fnc_barraAvisoEfeito";

	class Controls
	{
		class Barra: RscText
		{
			idc = 1000;
			Text = "Teste";
			x = 0.00113278 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.997734 * safezoneW;
			h = 0.077 * safezoneH;
			SizeEx = GUI_TEXT_SIZE_LARGE * 1.5;
			style = ST_CENTER;
			font = "PuristaSemibold";
		};
	};
};