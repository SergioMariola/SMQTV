/* #Kovifa
$[
	1.063,
	["boasVindas",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"SMQTV_header",[0,"SÃ³ Morre Quem TÃ¡ Vivo",[1.66893e-006,-2.98023e-008,1,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"SMQTV_textoPrincipal",[0,"",[0.0125021,0.12,0.975,0.44],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"SMQTV_textoListBox",[0,"",[0.0499992,0.66,0.25,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"",[0,"",[0.0499992,0.7,0.25,0.28],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"SMQTV_imagem",[0,"#(argb,8,8,3)color(1,1,1,1)",[0.412501,0.66,0.512501,0.32],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"SMQTV_fundo",[0,"",[0,0.12,1,0.9],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"SMQTV_recursos",[0,"Recursos",[0.05,0.54,0.15,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Recursos do jogador","-1"],[]],
	[1601,"SMQTV_atualizacoes",[0,"Atualizacoes",[0.25,0.54,0.15,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Changelog de desenvolvimento","-1"],[]],
	[1602,"SMQTV_fechar",[0,"Fechar",[0.775,0.54,0.15,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class BoasVindas
{
	idd = 9998;
	onLoad = "_this spawn SMQTV_fnc_guiBoasVindas; call SMQTV_fnc_aplicaDesfoque";
	onUnload = "execVM 'recursos\gui\boasVindas\data.sqf'; player execVM 'configJogador\hintBemVindo.sqf'; execVM 'recursos\gui\boasVindas\uiScale.sqf'; [] spawn SMQTV_fnc_cancelaDesfoque";

	class Controls
	{
		class Titulo: RscText
		{
			idc = -1;
			text = "Só Morre Quem Tá Vivo";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			SizeEx = 0.1;
			x = 1.66893e-006;
			y = -2.98023e-008;
			w = 1;
			h = 0.12;
		};
		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0;
			y = 0.12;
			w = 1;
			h = 0.9;
		};
		class Lista: RscListbox
		{
			idc = 1500;
			style = LB_TEXTURES;
			x = 0.0499992;
			y = 0.7;
			w = 0.25;
			h = 0.28;
		};
		class Logo: RscPicture
		{
			idc = -1;
			text = "logo.paa";
			x = 0.412501;
			y = 0.66;
			w = 0.512501;
			h = 0.32;
		};
		class TextoPrincipal: RscStructuredText
		{
			idc = 1100;
			style = ST_MULTI;
			x = 0.0125021;
			y = 0.12;
			w = 0.975;
			h = 0.44;
		};
		class TituloListBox: RscText
		{
			idc = 1001;
			text = "Jogadores online";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			shadow = 2;
			x = 0.0499992;
			y = 0.66;
			w = 0.25;
			h = 0.04;
		};
		class BotaoPadrao: RscButton
		{
			idc = 123;
			colorBackground[] = GUI_BCG_COLOR;
			style = ST_CENTER;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
			w = 0.15;
			h = 0.06;
		};
		class Recursos: BotaoPadrao
		{
			idc = 1600;
			text = "Recursos";
			x = 0.05;
			y = 0.54;
			onButtonClick = " createDialog 'recursos' ";
			tooltip = "Recursos do jogador";
		};
		class Atualizacoes: BotaoPadrao
		{
			idc = 1601;
			text = "Atualizações";
			x = 0.25;
			y = 0.54;
			onButtonClick = " createDialog 'changelog' ";
			tooltip = "Atualizações de desenvolvimento da missão";
		};
		class Sair: BotaoPadrao
		{
			idc = 2;
			text = "Sair";
			x = 0.775;
			y = 0.54;
			tooltip = "Fechar esta janela";
		};
	};
};