/* #Puwinu
$[
	1.063,
	["SMQTV_ind3D",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"SMQTV_fundo",[0,"#(argb,8,8,3)color(0,0,0,0.8)",[0.25,0.2,0.4875,0.48],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"SMQTV_titulo",[0,"Indicadores de amigos",[0.25,0.08,0.4875,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"SMQTV_maxDistTxt",[0,"Distancia maxima (Icones 3D)",[0.35,0.24,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Distancia maxima dos icones indicadores de amigos","-1"],[]],
	[1900,"SMQTV_distMaxSlider",[0,"",[0.35,0.28,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"SMQTV_maxDistValor",[0,"",[0.35,0.32,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"SMQTV_tamNomeTxt",[0,"Tamanho dos nomes",[0.35,0.38,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Tamanho dos nomes abaixo dos icones","-1"],[]],
	[1901,"SMQTV_tamNomeSlider",[0,"",[0.35,0.42,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"SMQTV_tamNomeValor",[0,"",[0.35,0.46,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"SMQTV_fechar",[0,"Fechar",[0.4375,0.62,0.125,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2800,"SMQTV_checkbox",[0,"",[0.35,0.52,0.025,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1005,"SMQTV_checkboxTxt",[0,"Mostrar icones",[0.375,0.52,0.2875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class ind3D
{
	idd = 9990;
	onLoad = "_this call SMQTV_fnc_guiInd3D; [] spawn SMQTV_fnc_cancelaDesfoque";
	onUnload = "call SMQTV_fnc_aplicaDesfoque";

	class Controls
	{

		//---Janela

		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.25;
			y = 0.2;
			w = 0.4875;
			h = 0.48;
		};
		class Titulo: RscText
		{
			idc = -1;
			text = "Indicadores de amigos";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			SizeEx = 0.07;
			moving = 1;
			x = 0.25;
			y = 0.08;
			w = 0.4875;
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
			y = 0.62;
			w = 0.125;
			h = 0.04;
		};

		//--- Controles

		class MaxDistTxt: RscText
		{
			idc = -1;
			text = "Distância máxima (Ícones 3D)";
			style = ST_CENTER;
			x = 0.35;
			y = 0.24;
			w = 0.3;
			h = 0.04;
			tooltip = "Distância máxima dos ícones indicadores de amigos";
		};
		class DistMaxSlider: RscSlider
		{
			idc = 1900;
			type = CT_XSLIDER;
			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
			x = 0.35;
			y = 0.28;
			w = 0.3;
			h = 0.04;
			onSliderPosChanged = "_this call SMQTV_fnc_ctrlInd3DMaxDist";
		};
		class MaxDistValor: RscText
		{
			idc = 1002;
			style = ST_CENTER;
			x = 0.35;
			y = 0.32;
			w = 0.3;
			h = 0.04;
		};
		class TamNomeTxt: RscText
		{
			idc = -1;
			text = "Tamanho dos nomes";
			style = ST_CENTER;
			x = 0.35;
			y = 0.38;
			w = 0.3;
			h = 0.04;
			tooltip = "Tamanho dos nomes abaixo dos ícones 3D";
		};
		class TamNomeSlider: RscSlider
		{
			idc = 1901;
			type = CT_XSLIDER;
			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
			x = 0.35;
			y = 0.42;
			w = 0.3;
			h = 0.04;
			onSliderPosChanged = "_this call SMQTV_fnc_ctrlInd3DNomeTam";
		};
		class TamNomeValor: RscText
		{
			idc = 1004;
			style = ST_CENTER;
			x = 0.35;
			y = 0.46;
			w = 0.3;
			h = 0.04;
		};
		class Checkbox: RscCheckbox
		{
			idc = 2800;
			x = 0.35;
			y = 0.52;
			w = 0.025;
			h = 0.04;
			onCheckedChanged = "_this call SMQTV_fnc_ctrlInd3DMostra";
		};
		class CheckboxTxt: RscText
		{
			idc = -1;
			text = "Mostrar ícones";
			x = 0.375;
			y = 0.52;
			w = 0.2875;
			h = 0.04;
		};
	};
};