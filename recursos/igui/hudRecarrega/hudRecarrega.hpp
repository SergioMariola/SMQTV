/* #Qemabo
$[
	1.063,
	["HUD_Recarrega",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"Progresso",[1,"Recarregando...",["0.00113308 * safezoneW + safezoneX","0.9774 * safezoneH + safezoneY","0.997734 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class HUDRecarrega
{
    idd = 3900;
    fadeIn = 0.1;
    fadeOut = 0.3;
    duration = 100;

    class Controls
    {
        class Progresso: RscProgress
        {
            idc = 1200;
            onLoad = "_this spawn SMQTV_fnc_hudRecarrega";
            colorFrame[] = {1,1,1,0};
            x = -0.0298056 * safezoneW + safezoneX;
            y = 0.984 * safezoneH + safezoneY;
            w = 1.06734 * safezoneW;
            h = 0.022 * safezoneH;
            texture = "";
        };
    };
};