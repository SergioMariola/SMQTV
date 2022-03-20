/* #Buguha
$[
	1.063,
	["carona",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"Titulo",[0,"Deseja pedir carona?",[0,0.2,1,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"Fundo",[0,"#(argb,8,8,3)color(0,0,0,0.9)",[0,0.26,1,0.52],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Texto",[0,"Este recurso so esta disponivel enquanto nao ha pilotos de transporte na partida. Deseja pedir carona?",[0.0625,0.32,0.875,0.08],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"fotoPiloto1",[0,"#(argb,8,8,3)color(0,0,0,0.9)",[0.0875,0.42,0.15,0.18],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1202,"fotoPiloto2",[0,"#(argb,8,8,3)color(0,0,0,0.9)",[0.7625,0.42,0.15,0.18],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1700,"botaoPiloto1",[0,"Chamar Fulano",[0.0875,0.68,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1701,"botaoPiloto2",[0,"Chamar Beltrano",[0.7625,0.68,0.15,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"nomePiloto1",[0,"",[0.025,0.62,0.2875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"nomePiloto2",[0,"",[0.6875,0.62,0.2875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1702,"botaoPilotos",[0,"Chamar Ambos",[0.4125,0.6,0.175,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"Sair",[0,"Sair",[0.4625,0.68,0.0875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class carona
{
	idd = 9995;
	onLoad = " _this spawn SMQTV_fnc_guiSolicitaPilotos; call SMQTV_fnc_aplicaDesfoque ";
	onUnLoad = " uiNamespace setVariable ['SMQTV_caronaPilotoA', nil]; uiNamespace setVariable ['SMQTV_caronaPilotoB', nil]; [] spawn SMQTV_fnc_cancelaDesfoque ";

	class Controls
	{
		class BotaoPadrao: RscButton
		{
			idc = 123;
			colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
		};

		class Titulo: RscText
		{
			idc = -1;
			text = "Deseja pedir carona?";
			style = 2;
			colorBackground[] = GUI_BCG_COLOR;
			moving = 1;
			x = 0;
			y = 0.2;
			w = 1;
			h = 0.06;
		};
		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0;
			y = 0.26;
			w = 1;
			h = 0.52;
		};
		class Texto: RscText
		{
			idc = -1;
			text = "Este recurso só está disponível enquanto nao há pilotos de transporte na partida. Deseja pedir carona?";
			style = 2;
			x = 0.0625;
			y = 0.32;
			w = 0.875;
			h = 0.08;
		};
		class FotoPiloto1: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.0875;
			y = 0.42;
			w = 0.15;
			h = 0.18;
		};
		class FotoPiloto2: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.7625;
			y = 0.42;
			w = 0.15;
			h = 0.18;
		};
		class BotaoPiloto1: BotaoPadrao
		{
			idc = 1700;
			text = "Solicitar";
			onButtonClick = " _this call SMQTV_fnc_solicitaPilotoA ";
			x = 0.0875;
			y = 0.68;
			w = 0.15;
			h = 0.04;
		};
		class BotaoPiloto2: BotaoPadrao
		{
			idc = 1701;
			text = "Solicitar";
			onButtonClick = " _this call SMQTV_fnc_solicitaPilotoB ";
			x = 0.7625;
			y = 0.68;
			w = 0.15;
			h = 0.04;
		};
		class NomePiloto1: RscText
		{
			idc = 1002;
			style = 2;
			x = 0.025;
			y = 0.62;
			w = 0.2875;
			h = 0.04;
		};
		class NomePiloto2: RscText
		{
			idc = 1003;
			style = 2;
			x = 0.6875;
			y = 0.62;
			w = 0.2875;
			h = 0.04;
		};
		class BotaoPilotos: BotaoPadrao
		{
			idc = 1702;
			text = "Solicitar Ambos";
			onButtonClick = " _this call SMQTV_fnc_solicitaPilotos ";
			x = 0.4125;
			y = 0.6;
			w = 0.175;
			h = 0.06;
		};
		class Sair: BotaoPadrao
		{
			idc = 2;
			text = "Sair";
			x = 0.4625;
			y = 0.68;
			w = 0.0875;
			h = 0.04;
		};
	};
};