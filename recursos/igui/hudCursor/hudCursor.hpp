/* #Kideka
$[
	1.063,
	["nomeHUD",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Texto",[1,"",["0.507734 * safezoneW + safezoneX","0.522008 * safezoneH + safezoneY","0.143086 * safezoneW","0.0220076 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class HUDCursor
{
	idd = 3600;
	fadein = IGUI_TEMPO_MOSTRA;
	fadeout = IGUI_TEMPO_FECHA;
	duration = 1e+011;
	onLoad = " _this call SMQTV_fnc_hudCursorOn ";

	class Controls
	{
		class Texto: RscText
		{
			idc = 1000;
			x = 0.534805 * safezoneW + safezoneX;
			y = 0.488996 * safezoneH + safezoneY;
			w = 0.143086 * safezoneW;
			h = 0.0220076 * safezoneH;
			colorText[] = GUI_BCG_COLOR;
			shadow = 2;
			font = "RobotoCondensedBold";
		};
	};
};