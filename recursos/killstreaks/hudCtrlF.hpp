/* #Mejezy
$[
	1.063,
	["IGUI_CtrlF",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Dica",[1,"Ctrl + F",["0.00113278 * safezoneW + safezoneX","0.082 * safezoneH + safezoneY","0.0348047 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Rsc_SMQTV_CtrlF
{
	idd = 4300;
	fadeIn = 0;
	fadeOut = 0.2;
	duration = 1e+011;
	onLoad = "";

	class Controls {

		class Dica: RscText
		{
			idc = 1000;
			onLoad = "_this call SMQTV_fnc_hudCtrlF";
			text = "Ctrl + F";
			x = 0.00113278 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0;
			h = 0.022 * safezoneH;
		};
	};
};