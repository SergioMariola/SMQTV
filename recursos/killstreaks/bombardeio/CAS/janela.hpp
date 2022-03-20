/* #Metudi
$[
	1.063,
	["GUI_Bombardeio",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Titulo",[0,"Escolha o tipo",[0,0.18,1,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"Lista",[0,"",[-2.04891e-008,0.24,1,0.3],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2600,"OK",[0,"OK",[0.7625,0.54,0.2375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2700,"Cancela",[0,"Cancela",[0,0.54,0.2375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class SMQTV_GUI_BombardeioCAS
{
    idd = 9988;
	onLoad = "call SMQTV_fnc_aplicaDesfoque";
    onUnload = "uiNamespace setVariable ['SMQTV_bombardeioParams', nil]; [] spawn SMQTV_fnc_cancelaDesfoque";

    class Controls
    {
        class Titulo: RscText
        {
            idc = 1000;
            text = "Escolha o tipo de suporte";
            style = ST_CENTER;
            colorBackground[] = GUI_BCG_COLOR;
            x = 0;
            y = 0.18;
            w = 1;
            h = 0.06;
        };
        class Lista: RscListbox
        {
            idc = 1500;
            rowHeight = 0.07;
            colorBackground[] = {0,0,0,0.8};
            x = 0;
            y = 0.24;
            w = 1;
            h = 0.3;
            onLoad = "_this execVM 'recursos\killstreaks\bombardeio\CAS\ctrlLista.sqf'";
        };
        class BotaoOK: RscButton
        {
            text = "OK";
            style = ST_RIGHT;
            font = "PuristaLight";
            colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
            x = 0.7625;
            y = 0.54;
            w = 0.2375;
            h = 0.04;
            onButtonClick = "_this execVM 'recursos\killstreaks\bombardeio\CAS\ctrlOK.sqf'";
        };
        class BotaoCancela: RscButton
        {
            idc = 2;
            text = "Cancela";
            style = ST_LEFT;
            font = "PuristaLight";
            colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
            x = 0;
            y = 0.54;
            w = 0.2375;
            h = 0.04;
        };
    };
};