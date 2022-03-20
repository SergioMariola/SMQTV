/* #Tyhaty
$[
	1.063,
	["IGUI_feridoSeta",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"Seta",[0,"#(argb,8,8,3)color(1,1,1,1)",[0.475,0.88,0.075,0.08],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"Texto",[0,"",[0,1,1,0.08],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Rsc_SMQTV_solicitaCura
{
    idd = 4400;
    fadeIn = 0.1;
    fadeOut = 0.2;
    duration = 30;
    onLoad = "_this spawn SMQTV_fnc_hudSolicitaCura";

    class Controls
    {
        class Seta: RscPicture
        {
            idc = 1200;
            text = "recursos\ajudaFerido\solicitaCura\seta.paa";
            x = 0.45;
            y = 0.84;
            w = 0.125;
            h = 0.16;
        };
        class Cruz: RscPicture
        {
            idc = 1201;
            text = "\A3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa";
            colorText[] = {0.8,0,0,1};
            shadow = 2;
            x = 0.475;
            y = 0.88;
            w = 0.075;
            h = 0.08;
        };
        class CruzAux: RscPicture
        {
            idc = 1202;
            text = "\A3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa";
            colorText[] = {0.8,0,0,1};
            shadow = 2;
            x = 0.475;
            y = 0.88;
            w = 0.075;
            h = 0.08;
        };
        class Texto: RscStructuredText
        {
            idc = 1100;
            x = 0;
            y = 1;
            w = 1;
            h = 0.08;
            size = GUI_TEXT_SIZE_LARGE;
            class Attributes
            {
                font = "PuristaSemibold";
                align = "center";
                shadow = 2;
            };
        };
    };
};