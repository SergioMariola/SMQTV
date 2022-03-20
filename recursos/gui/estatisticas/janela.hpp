/* #Larepy
$[
	1.063,
	["SMQTV_stats",[[0,0,1,1],0.025,0.04,"GUI_GRID"],1,0,0],
	[1200,"SMQTV_fundo",[0,"#(argb,8,8,3)color(0,0,0,0.8)",[0.2625,0.28,0.475,0.72],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"SMQTV_titulo",[0,"Minhas estatisticas",[0.2625,0.16,0.475,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"SMQTV_fechar",[0,"Fechar",[0.45,0.94,0.1,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"SMQTV_nome",[0,"",[0.3,0.32,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"SMQTV_papel",[0,"",[0.3,0.36,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"SMQTV_mortesTexto",[0,"Minhas mortes:",[0.3,0.44,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de mortes sofridas","-1"],[]],
	[1004,"SMQTV_killsTexto",[0,"Minhas eliminacoes:",[0.3,0.5,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de inimigos eliminados","-1"],[]],
	[1005,"SMQTV_colateralTexto",[0,"Danos colaterais:",[0.3,0.56,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de civis que matou","-1"],[]],
	[1006,"SMQTV_haloTexto",[0,"HALO Jump:",[0.3,0.62,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de vezes que usou o HALO Jump","-1"],[]],
	[1007,"SMQTV_saltoVeiculoTexto",[0,"Salto de Veiculo:",[0.3,0.68,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de vezes que usou o Salto de Veiculo","-1"],[]],
	[1008,"SMQTV_asGBUTexto",[0,"Air-strikes GBU-12:",[0.3,0.74,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de vezes que usou Air-strikes de GBU-12","-1"],[]],
	[1009,"SMQTV_asMK41Texto",[0,"Air-strikes Mk-41:",[0.3,0.8,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de vezes que usou Air-strikes de Mk-41","-1"],[]],
	[1010,"SMQTV_mandaChuvaTexto",[0,"Air-strikes Manda-Chuva:",[0.3,0.86,0.3,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Quantidade de vezes que usou Air-strikes do Manda-Chuva","-1"],[]],
	[1011,"SMQTV_mortes",[0,"",[0.65,0.44,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1012,"SMQTV_kills",[0,"",[0.65,0.5,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1013,"SMQTV_colateral",[0,"",[0.65,0.56,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1014,"SMQTV_halo",[0,"",[0.65,0.62,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1015,"SMQTV_saltoVeiculo",[0,"",[0.65,0.68,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1016,"SMQTV_asGBU",[0,"",[0.65,0.74,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1017,"SMQTV_asMK41",[0,"",[0.65,0.8,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1018,"SMQTV_mandaChuva",[0,"",[0.65,0.86,0.05,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class estatisticas
{
	idd = 9992;
	onLoad = "_this spawn SMQTV_fnc_guiEstatisticas";

	class Controls
	{

		//--- Janela

		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.2625;
			y = 0.28;
			w = 0.475;
			h = 0.72;
		};
		class Titulo: RscText
		{
			idc = -1;
			text = "Minhas estatísticas";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			SizeEx = 0.07;
			moving = 1;
			x = 0.2625;
			y = 0.16;
			w = 0.475;
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
		
		class Nome: RscText
		{
			idc = 1001;
			style = ST_CENTER;
			x = 0.3;
			y = 0.32;
			w = 0.4;
			h = 0.04;
		};
		class Papel: RscText
		{
			idc = 1002;
			style = ST_CENTER;
			colorText[] = {0.85,0.85,0,1};
			shadow = 2;
			x = 0.3;
			y = 0.36;
			w = 0.4;
			h = 0.04;
		};
		class TextoPadrao: RscText
		{
			idc = 999;
			x = 0.3;
			w = 0.3;
			h = 0.04;
		};
		class MortesTexto: TextoPadrao
		{
			idc = 1003;
			text = "Minhas mortes:";
			y = 0.44;
			tooltip = "Quantidade de mortes sofridas";
		};
		class KillsTexto: TextoPadrao
		{
			idc = 1004;
			text = "Minhas eliminações:";
			y = 0.5;
			tooltip = "Quantidade de inimigos eliminados";
		};
		class ColateralTexto: TextoPadrao
		{
			idc = 1005;
			text = "Danos colaterais:";
			y = 0.56;
			tooltip = "Quantidade de civis que matou";
		};
		class HaloTexto: TextoPadrao
		{
			idc = 1006;
			text = "HALO Jump:";
			y = 0.62;
			tooltip = "Quantidade de vezes que usou o HALO Jump";
		};
		class SaltoVeiculoTexto: TextoPadrao
		{
			idc = 1007;
			text = "Salto de Veiculo:";
			y = 0.68;
			tooltip = "Quantidade de vezes que usou o Salto de Veiculo";
		};
		class GBUTexto: TextoPadrao
		{
			idc = 1008;
			text = "Air-strikes GBU-12:";
			y = 0.74;
			tooltip = "Quantidade de vezes que usou Air-strikes de GBU-12";
		};
		class MK41Texto: TextoPadrao
		{
			idc = 1009;
			text = "Air-strikes Mk-41:";
			y = 0.8;
			tooltip = "Quantidade de vezes que usou Air-strikes de Mk-41";
		};
		class MandaChuvaTexto: TextoPadrao
		{
			idc = 1010;
			text = "Air-strikes Manda-Chuva:";
			y = 0.86;
			tooltip = "Quantidade de vezes que usou Air-strikes do Manda-Chuva";
		};
		class ValorPadrao: RscText
		{
			idc = 998;
			style = ST_RIGHT;
			x = 0.65;
			w = 0.05;
			h = 0.04;
		};
		class Mortes: ValorPadrao
		{
			idc = 1011;
			style = ST_RIGHT;
			y = 0.44;
		};
		class Kills: ValorPadrao
		{
			idc = 1012;
			y = 0.5;
		};
		class Colateral: ValorPadrao
		{
			idc = 1013;
			y = 0.56;
		};
		class Halo: ValorPadrao
		{
			idc = 1014;
			y = 0.62;
		};
		class SaltoVeiculo: ValorPadrao
		{
			idc = 1015;
			y = 0.68;
		};
		class GBU: ValorPadrao
		{
			idc = 1016;
			y = 0.74;
		};
		class MK41: ValorPadrao
		{
			idc = 1017;
			y = 0.8;
		};
		class MandaChuva: ValorPadrao
		{
			idc = 1018;
			y = 0.86;
		};
	};
};