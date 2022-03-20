/* #Kefogi
$[
	1.063,
	["SMQTV_visibilidade",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"SMQTV_fundo",[0,"#(argb,8,8,3)color(0,0,0,0.8)",[0.2,0.12,0.6,0.88],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"SMQTV_titulo",[0,"Visibilidade",[0.2,0,0.6,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"SMQTV_fechar",[0,"Fechar",[0.45,0.94,0.1,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"SMQTV_terrenoTexto",[0,"Terreno",[0.3,0.38,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Visibilidade do terreno Ã  sua volta","-1"],[]],
	[1900,"SMQTV_terrenoSlider",[0,"",[0.3,0.42,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"SMQTV_terrenoValor",[0,"",[0.3,0.46,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"SMQTV_objetosTexto",[0,"Objetos",[0.3,0.52,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Visibilidade de objetos Ã  sua volta (casas, Ã¡rvores, unidades, etc)","-1"],[]],
	[1901,"SMQTV_objetosSlider",[0,"",[0.3,0.56,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"SMQTV_objetosValor",[0,"",[0.3,0.6,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1005,"SMQTV_sombrasTexto",[0,"Sombras",[0.3,0.66,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Visibilidade de sombras","-1"],[]],
	[1902,"SMQTV_sombrasSlider",[0,"",[0.3,0.7,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1006,"SMQTV_sombrasValor",[0,"",[0.3,0.74,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1007,"SMQTV_gramaTexto",[0,"Grama",[0.3,0.8,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Visibilidade de grama","-1"],[]],
	[2100,"SMQTV_gramaCombo",[0,"",[0.3,0.84,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"SMQTV_envFrame",[0,"Ambiente",[0.225,0.16,0.55,0.18],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1801,"SMQTV_terrFrame",[0,"Terreno",[0.225,0.34,0.55,0.58],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2800,"SMQTV_vidaAnimalChk",[0,"",[0.3,0.2,0.025,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2801,"SMQTV_somAmbChk",[0,"",[0.55,0.2,0.025,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1008,"SMQTV_vidaAnimalTxt",[0,"Vida animal",[0.325,0.2,0.125,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Habilita/desabilita animais pelo mapa (lebres, cobras, abelhas, passaros e etc)","-1"],[]],
	[1009,"SMQTV_somAmbTxt",[0,"Som ambiente",[0.575,0.2,0.1375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Habilita/desabilita sons de ambiente (animais, vento, trovoes, chuva e etc)","-1"],[]],
	[1010,"SMQTV_somAmbVol",[0,"Volume (som ambiente)",[0.4,0.24,0.2125,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1903,"SMQTV_somAmbVolSlider",[0,"",[0.3,0.28,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class visibilidade
{
	idd = 9994;
	onLoad = "_this call SMQTV_fnc_guiVisibilidade; [] spawn SMQTV_fnc_cancelaDesfoque";
	onUnload = "call SMQTV_fnc_aplicaDesfoque";

	class Controls
	{
		
		//--- Janela

		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.2;
			y = 0.12;
			w = 0.6;
			h = 0.88;
		};
		class Titulo: RscText
		{
			idc = -1;
			text = "Visibilidade e sons";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			SizeEx = 0.1;
			moving = 1;
			x = 0.2;
			y = 0;
			w = 0.6;
			h = 0.12;
		};
		class Sair: RscButton
		{
			idc = 2;
            text = "Sair";
            colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
			x = 0.45;
			y = 0.94;
			w = 0.1;
			h = 0.04;
		};

		//--- Controles

		//Padrões

		class SliderPadrao: RscSlider
		{
			idc = 999;
			type = CT_XSLIDER;
			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
			x = 0.3;
			y = 0.42;
			w = 0.4;
			h = 0.04;
		};
		class CBPadrao: RscCheckbox
		{
			idc = 998;
			y = 0.2;
			w = 0.025;
			h = 0.04;
		};
		class TerrenoTextoPadrao: RscText
		{
			idc = 997;
			style = ST_CENTER;
			x = 0.3;
			w = 0.4;
			h = 0.04;
		};
		class TerrenoValorPadrao: RscText
		{
			idc = 996;
			style = ST_CENTER;
			colorText[] = {0.5,0.5,0.5,1};
			x = 0.3;
			w = 0.4;
			h = 0.04;
		};

		//Ambiente

		class EnvFrame: RscFrame
		{
			idc = -1;
			text = "Ambiente"; //--- ToDo: Localize;
			sizeEx = 0.03;
			x = 0.225;
			y = 0.16;
			w = 0.55;
			h = 0.18;
		};
		class VidaAnimalChk: CBPadrao
		{
			idc = 2800;
			x = 0.3;
			onCheckedChanged = "_this call SMQTV_fnc_ctrlVidaAnimal";
		};
		class SomAmbChk: CBPadrao
		{
			idc = 2801;
			x = 0.55;
			onCheckedChanged = "_this call SMQTV_fnc_ctrlSomAmb";
		};
		class VidaAnimalTxt: RscText
		{
			idc = -1;
			text = "Vida animal";
			x = 0.325;
			y = 0.2;
			w = 0.125;
			h = 0.04;
			tooltip = "Habilita/desabilita animais pelo mapa (lebres, cobras, abelhas, pássaros, peixes e etc)"; //--- ToDo: Localize;
		};
		class SomAmbTxt: RscText
		{
			idc = -1;
			text = "Som ambiente";
			x = 0.575;
			y = 0.2;
			w = 0.1375;
			h = 0.04;
			tooltip = "Habilita/desabilita sons de ambiente (animais, vento, trovões, chuva e etc)"; //--- ToDo: Localize;
		};
		class SomAmbVolTxt: RscText
		{
			idc = -1;
			text = "Volume (som ambiente)";
			x = 0.4;
			y = 0.24;
			w = 0.2125;
			h = 0.04;
		};
		class SomAmbVolSlider: SliderPadrao
		{
			idc = 1903;
			y = 0.28;
			onSliderPosChanged = "_this call SMQTV_fnc_ctrlAmbVol";
		};

		//Terreno

		class TerrenoFrame: RscFrame
		{
			idc = -1;
			text = "Terreno"; //--- ToDo: Localize;
			sizeEx = 0.03;
			x = 0.225;
			y = 0.34;
			w = 0.55;
			h = 0.58;
		};
		class TerrenoTexto: TerrenoTextoPadrao
		{
			idc = -1;
			text = "Terreno";
			y = 0.38;
			tooltip = "Visibilidade do terreno à sua volta";
		};
		class TerrenoSlider: SliderPadrao
		{
			idc = 1900;
			x = 0.3;
			y = 0.42;
			w = 0.4;
			h = 0.04;
			onSliderPosChanged = "_this call SMQTV_fnc_ctrlTerreno";
		};
		class TerrenoValor: TerrenoValorPadrao
		{
			idc = 1002;
			y = 0.46;
		};
		class ObjetosTexto: TerrenoTextoPadrao
		{
			idc = -1;
			text = "Objetos";
			y = 0.52;
			tooltip = "Visibilidade de objetos à sua volta (casas, árvores, unidades, etc)";
		};
		class ObjetosSlider: SliderPadrao
		{
			idc = 1901;
			y = 0.56;
			onSliderPosChanged = "_this call SMQTV_fnc_ctrlObjetos";
		};
		class ObjetosValor: TerrenoValorPadrao
		{
			idc = 1004;
			y = 0.6;
		};
		class SombrasTexto: TerrenoTextoPadrao
		{
			idc = -1;
			text = "Sombras";
			y = 0.66;
			tooltip = "Visibilidade de sombras";
		};
		class SombrasSlider: SliderPadrao
		{
			idc = 1902;
			y = 0.7;
			onSliderPosChanged = "_this call SMQTV_fnc_ctrlSombras";
		};
		class SombrasValor: TerrenoValorPadrao
		{
			idc = 1006;
			y = 0.74;
		};
		class GramaTexto: TerrenoTextoPadrao
		{
			idc = -1;
			text = "Grama";
			y = 0.8;
			tooltip = "Visibilidade de grama";
		};
		class GramaCombo: RscCombo
		{
			idc = 2100;
			x = 0.3;
			y = 0.84;
			w = 0.4;
			h = 0.04;
			onLBSelChanged = "_this call SMQTV_fnc_ctrlGrama";
		};
	};
};