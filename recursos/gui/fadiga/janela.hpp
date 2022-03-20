/* #Maguma
$[
	1.063,
	["SMQTV_fadiga",[[0,0,1,1],0.025,0.04,"GUI_GRID"],1,0,0],
	[1200,"SMQTV_fundo",[0,"#(argb,8,8,3)color(0,0,0,0.8)",[0.35,0.28,0.275,0.32],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"SMQTV_titulo",[0,"Fadiga",[0.35,0.16,0.275,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"SMQTV_fechar",[0,"Fechar",[0.4375,0.54,0.1,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"SMQTV_fadigaTexto",[0,"Habilitar fadiga",[0.375,0.32,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Fadiga impoe limites de peso e movimentacao ao jogador","-1"],[]],
	[2800,"SMQTV_fadigaCB",[0,"",[0.575,0.32,0.025,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"SMQTV_miraTexto",[0,"Balanco da mira",[0.4125,0.38,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"100% = padrao do Arma 3","-1"],[]],
	[1900,"SMQTV_miraSlider",[0,"",[0.375,0.42,0.225,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"SMQTV_miraValor",[0,"",[0.4125,0.46,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class fadiga
{
	idd = 9993;
	onLoad = "_this call SMQTV_fnc_guiFadiga";

	class Controls
	{

		//--- Janela

		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.35;
			y = 0.28;
			w = 0.275;
			h = 0.32;
		};
		class Titulo: RscText
		{
			idc = -1;
			text = "Fadiga";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			SizeEx = 0.05;
			moving = 1;
			x = 0.35;
			y = 0.16;
			w = 0.275;
			h = 0.12;
		};
		class Sair: RscButton
		{
			idc = 2;
			text = "Sair";
			colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
			x = 0.4375;
			y = 0.54;
			w = 0.1;
			h = 0.04;
		};

		//--- Controles

		class FadigaTexto: RscText
		{
			idc = -1;
			text = "Habilitar fadiga";
			x = 0.375;
			y = 0.32;
			w = 0.15;
			h = 0.04;
			tooltip = "Fadiga impõe limites de peso e movimentacao ao jogador";
		};
		class FadigaCB: RscCheckbox
		{
			idc = 2800;
			x = 0.575;
			y = 0.32;
			w = 0.025;
			h = 0.04;
			onCheckedChanged = "_this call SMQTV_fnc_ctrlFadiga";
		};
		class MiraTexto: RscText
		{
			idc = -1;
			text = "Balanco da mira";
			style = ST_CENTER;
			x = 0.4125;
			y = 0.38;
			w = 0.15;
			h = 0.04;
			tooltip = "100% = padrão do Arma 3";
		};
		class MiraSlider: RscSlider
		{
			idc = 1900;
			type = CT_XSLIDER;
			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
			x = 0.375;
			y = 0.42;
			w = 0.225;
			h = 0.04;
			onSliderPosChanged = "_this call SMQTV_fnc_ctrlMira";
		};
		class MiraValor: RscText
		{
			idc = 1003;
			style = ST_CENTER;
			colorText[] = {0.5,0.5,0.5,1};
			x = 0.4125;
			y = 0.46;
			w = 0.15;
			h = 0.04;
		};
	};
};