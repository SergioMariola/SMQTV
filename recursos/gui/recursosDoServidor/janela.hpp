/* #Vakuni
$[
	1.063,
	["recursos",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1800,"SMQTV_fundo",[0,"",[5.68107e-008,0.12,1,0.88],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"SMQTV_titulo",[0,"Recursos do jogador",[0,0,1,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"SMQTV_texto",[0,"",[0.275,0.18,0.7,0.76],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"SMQTV_tempo",[0,"Tempo",[0.0625,0.56,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"SMQTV_menuDoJogador",[0,"Menu do jogador",[0.0625,0.26,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"SMQTV_haloJump",[0,"HALO Jump",[0.0625,0.32,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"SMQTV_respawnVeiculos",[0,"Veiculos",[0.0625,0.5,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1604,"SMQTV_arsenal",[0,"Arsenal",[0.0625,0.2,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1605,"SMQTV_saltoVeiculo",[0,"Salto de Veiculo",[0.0625,0.38,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1606,"SMQTV_pqd",[0,"Salto PQD",[0.0625,0.44,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1607,"SMQTV_gbu",[0,"GBU-12",[0.1,0.68,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1608,"SMQTV_killstreaks",[0,"Killstreaks",[0.0625,0.62,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1609,"SMQTV_mk14",[0,"Mk-41 VLS",[0.1,0.74,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1610,"SMQTV_mandaChuva",[0,"Manda Chuva",[0.1,0.8,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"",[0,">>",[0.0625,0.68,0.025,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"",[0,">>",[0.0625,0.74,0.025,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"",[0,">>",[0.0625,0.8,0.025,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2,"Sair",[0,"Sair",[0.1,0.9,0.0775253,0.0416836],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class recursos
{
	idd = 9996;
	onLoad = "_this call SMQTV_fnc_guiRecursosDoServidor";

	class Controls
	{

		//---Janela

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
			text = "Recursos do jogador";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			SizeEx = 0.1;
			moving = 1;
			x = 0;
			y = 0;
			w = 1;
			h = 0.12;
		};
		class Texto: RscStructuredText
		{
			idc = 1100;
			style = ST_MULTI;
			x = 0.275;
			y = 0.18;
			w = 0.7;
			h = 0.76;
		};
		class TextoFrame: RscFrame
		{
			idc = -1;
			style = ST_FRAME;
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
			x = 0.1;
			y = 0.9;
			w = 0.0775253;
			h = 0.0416836;
		};

		//---Controles padrão

		class BotaoPadrao: RscButton
		{
			idc = 111;
			borderSize = 0.002;
			colorBorder[] = GUI_BCG_COLOR;
			style = ST_CENTER;
			x = 0.0625;
			w = 0.15;
			h = 0.04;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
		};

		//---Controles

		class Tempo: BotaoPadrao
		{
			idc = -1;
			text = "Tempo";x = 0.0625;
			y = 0.56;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class MenuDoJogador: BotaoPadrao
		{
			idc = -1;
			text = "Menu do jogador";
			y = 0.26;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class HaloJump: BotaoPadrao
		{
			idc = -1;
			text = "HALO Jump";
			y = 0.32;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class RespawnVeiculos: BotaoPadrao
		{
			idc = -1;
			text = "Veículos";
			y = 0.5;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class Fones: BotaoPadrao
		{
			idc = -1;
			text = "Fones de ouvido";
			y = 0.2;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class SaltoVeiculo: BotaoPadrao
		{
			idc = -1;
			text = "Salto de Veículo";
			y = 0.38;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class PQD: BotaoPadrao
		{
			idc = -1;
			text = "Salto PQD";
			y = 0.44;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class Killstreaks: BotaoPadrao
		{
			idc = -1;
			text = "Killstreaks";
			y = 0.62;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class TAB1: RscText
		{
			idc = -1;
			text = "L";
			x = 0.0625;
			y = 0.68;
			w = 0.025;
			h = 0.04;
		};
		class TAB2: TAB1
		{
			idc = -1;
			y = 0.74;
		};
		class TAB3: TAB1
		{
			idc = -1;
			y = 0.8;
		};
		class GBU: BotaoPadrao
		{
			idc = -1;
			text = "GBU-12";
			style = ST_LEFT;
			x = 0.1;
			y = 0.68;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class MK41: BotaoPadrao
		{
			idc = -1;
			text = "Mk-41 VLS";
			style = ST_LEFT;
			x = 0.1;
			y = 0.74;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
		class MandaChuva: BotaoPadrao
		{
			idc = -1;
			text = "Manda Chuva";
			style = ST_LEFT;
			x = 0.1;
			y = 0.8;
			onButtonClick = "_this call SMQTV_fnc_ctrlRecursosBotao";
		};
	};
};