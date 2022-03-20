/* #Cizaga
$[
	1.063,
	["HUD_Heal",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"Progresso",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.438125 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.12375 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Seta",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.484531 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.0309375 * safezoneW","0.088 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Texto",[1,"",["0.438125 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.12375 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Rsc_SMQTV_cura
{
    idd = 4100;
    fadeIn = 0.2;
    fadeOut = 0.2;
    duration = 30;
    onLoad = "_this spawn SMQTV_fnc_hudCura";

    class Controls
    {
        class Progresso: RscProgress
        {
            idc = 1200;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorFrame[] = {0,0,0,0.3};
        };
        class Seta: RscPictureKeepAspect
        {
            idc = 1201;
            text = "recursos\igui\hudCura\seta.paa";
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.088 * safezoneH;
        };
        class Texto: RscText
        {
            idc = 1000;
            text = "";
            style = ST_CENTER;
            shadow = 2;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};