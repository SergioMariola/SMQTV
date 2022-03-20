/* #Nypeso
$[
	1.063,
	["Insignia",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Titulo",[0,"Insignia",[0.35,0.28,0.275,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"Fundo",[0,"#(argb,8,8,3)color(0,0,0,0.2)",[0.35,0.34,0.275,0.44],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"Lista",[0,"",[0.375,0.4,0.2375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Texto",[0,"Escolha abaixo",[0.375,0.36,0.2375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Foto",[0,"",[0.4125,0.48,0.15,0.16],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"Aplicar",[0,"Aplicar",[0.425,0.66,0.125,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"Sair",[0,"Sair",[0.45,0.72,0.075,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Insignia
{
	idd = 9989;
	onLoad = "_this call SMQTV_fnc_guiInsignia";
	onUnload = "_this call SMQTV_fnc_guiInsigniaSair; call SMQTV_fnc_aplicaDesfoque";

	class Controls
	{
		class Titulo: RscText
		{
			idc = -1;
			text = "Insígnias";
			style = 2;
			moving = 1;
			colorBackground[] = GUI_BCG_COLOR;
			x = 0.35;
			y = 0.28;
			w = 0.275;
			h = 0.06;
		};
		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.35;
			y = 0.34;
			w = 0.275;
			h = 0.44;
		};
		class Lista: RscCombo
		{
			idc = 2100;
			x = 0.375;
			y = 0.4;
			w = 0.2375;
			h = 0.04;
			onLBSelChanged = "_this call SMQTV_fnc_ctrlInsigniaSel";
		};
		class Texto: RscText
		{
			idc = 1001;
			text = "Escolha abaixo";
			style = 2;
			x = 0.375;
			y = 0.36;
			w = 0.2375;
			h = 0.04;
		};
		class Foto: RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.4125;
			y = 0.48;
			w = 0.15;
			h = 0.16;
		};
		class Aplicar: RscButton
		{
			idc = 1600;
			text = "Aplicar";
			x = 0.425;
			y = 0.66;
			w = 0.125;
			h = 0.04;
			style = 80 + 2;
			colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
			onButtonClick = "_this call SMQTV_fnc_ctrlInsigniaAplica";
		};
		class Sair: RscButton
		{
			idc = 1;
			text = "Sair";
			x = 0.45;
			y = 0.72;
			w = 0.075;
			h = 0.04;
			style = 80 + 2;
			colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
		};
	};
};

		