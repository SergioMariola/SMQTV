/* #Cyfoja
$[
	1.063,
	["changelog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1800,"SMQTV_fundo",[0,"",[0,0.12,1,0.88],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"SMQTV_titulo",[0,"Atualizacoes (Changelog)",[0,0,1,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"SMQTV_lista",[0,"",[0.0375,0.18,0.1875,0.66],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"SMQTV_texto",[0,"",[0.275,0.18,0.7,0.76],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2,"Sair",[0,"Sair",[0.0875,0.9,0.0875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class changelog
{
	idd = 9997;
	onLoad = "_this call SMQTV_fnc_guiChangelog";

	class Controls
	{
		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0;
			y = 0.12;
			w = 1;
			h = 0.88;
		};
		class Titulo: RscText
		{
			idc = -1;
			text = "Atualizações (Changelog)";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			SizeEx = 0.1;
			moving = 1;
			x = 0;
			y = 0;
			w = 1;
			h = 0.12;
		};
		class Lista: RscListbox
		{
			idc = 1500;
			x = 0.0375;
			y = 0.18;
			w = 0.1875;
			h = 0.66;
			onLBSelChanged = "_this call SMQTV_fnc_ctrlChangelog";
		};
		class Texto: RscStructuredText
		{
			idc = 1100;
			x = 0.275;
			y = 0.18;
			w = 0.7;
			h = 0.76;
		};
		class Sair: RscButton
		{
			idc = 2;
			text = "Sair";
			colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
			x = 0.0875;
			y = 0.9;
			w = 0.0875;
			h = 0.04;
		};
	};
};