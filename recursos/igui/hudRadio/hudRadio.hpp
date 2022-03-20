/* #Qeguhu
$[
	1.063,
	["GUIRadio",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"Radio",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.132617 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.112148 * safezoneW","0.275 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Texto",[1,"",["0.132617 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.112148 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RadioHUD
{
	idd = 3800;
	fadein = 0.1;
	fadeout = 0.1;
	duration = 1e+011;
	onLoad = " _this call SMQTV_fnc_radio ";

	class Controls
	{
		class Radio: RscPictureKeepAspect
		{
			idc = 1200;
			text = "recursos\igui\hudRadio\radio.paa";
			x = 0.132617 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.275 * safezoneH;
		};
		class Texto: RscText
		{
			idc = 1000;
			style = ST_CENTER;
			x = 0.132617 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.022 * safezoneH;
			shadow = 2;
		};
	};
};