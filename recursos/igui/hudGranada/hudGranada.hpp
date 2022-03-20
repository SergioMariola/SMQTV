/* #Pylixo
$[
	1.063,
	["Granada_Popup",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Texto",[1,"",["0.345313 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.309375 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class HUDGranada
{
    idd = 4000;
    fadeIn = 0.3;
    fadeOut = 0.3;
    duration = 0.6;
    onLoad = "_this call SMQTV_fnc_hudGranada";

    class Controls
    {
        class Texto: RscText
        {
            idc = 1000;
            style = 2;
            shadow = 2;
            x = 0.345313 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};