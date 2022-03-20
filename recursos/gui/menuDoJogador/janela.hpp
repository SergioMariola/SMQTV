/* #Zetily
$[
	1.063,
	["SMQTV_menuJogador",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"SMQTV_fundo",[0,"#(argb,8,8,3)color(0,0,0,0.8)",[0.2625,0.12,0.475,0.88],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"SMQTV_titulo",[0,"Menu do jogador",[0.2625,0,0.475,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"SMQTV_fechar",[0,"Fechar",[0.6,0.94,0.1,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"SMQTV_nome",[0,"",[0.3,0.16,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"SMQTV_papel",[0,"",[0.3,0.2,0.4,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"SMQTV_visibilidade",[0,"Visibilidade",[0.3,0.44,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Controla distÃ¢ncias de visÃ£o do jogador (terreno, objetos e sombras)","-1"],[]],
	[1602,"SMQTV_fadiga",[0,"Sistema de fadiga",[0.3,0.52,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Controla se o jogador terÃ¡ limites de peso ou corrida e se isso afetarÃ¡ sua mira","-1"],[]],
	[1603,"SMQTV_stats",[0,"Minhas estatisticas",[0.3,0.6,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Visualizador de estatisticas do jogador neste servidor","-1"],[]],
	[1604,"SMQTV_lista",[0,"Lista de jogadores",[0.3,0.68,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Painel que lista todos os jogadores online no momento e possibilita algumas interacoes","-1"],[]],
	[1605,"SMQTV_recursos",[0,"Recursos do jogador",[0.3,0.76,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Lista de todos os recursos disponÃ­veis ao jogador neste servidor","-1"],[]],
	[1606,"SMQTV_changelog",[0,"Atualizacoes do servidor",[0.3,0.84,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Historico de todas as atualizacoes feitas no servidor","-1"],[]],
	[1607,"SMQTV_voteRestart",[0,"Reiniciar missao",[0.3,0.92,0.1,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Votar para reiniciar a missao","-1"],[]],
	[1100,"SMQTV_resetTexto",[0,"Reiniciar missao",[0.3,0.92,0.1,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1608,"SMQTV_3d",[0,"Icones indicadores de amigos",[0.3,0.36,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Controla aparencia, distancia e comportamento de icones para identificar amigos","-1"],[]],
	[1609,"SMQTV_insignia",[0,"Insignias",[0.3,0.28,0.4,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Escolhe insignia visivel (em alguns uniformes) no ombro esquerdo do jogador","-1"],[]],
	[1201,"Insignia",[0,"#(argb,8,8,3)color(1,1,1,1)",[0.6875,0.06,0.0375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class MenuJogador
{
	idd = 9999;
	onLoad = "SMQTV_menuJog = true; _this call SMQTV_fnc_guiMenuDoJogador; call SMQTV_fnc_aplicaDesfoque";
	onUnLoad = "SMQTV_menuJog = false; [] spawn SMQTV_fnc_cancelaDesfoque";

	class Controls
	{
		//--- Janela

		class Fundo: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			x = 0.2625;
			y = 0.12;
			w = 0.475;
			h = 0.88;
		};
		class Titulo: RscText
		{
			idc = -1;
			text = "Menu do jogador";
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			moving = 1;
			SizeEx = 0.07;
			x = 0.2625;
			y = 0;
			w = 0.475;
			h = 0.12;
		};
		class InsigniaLabel: RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.6875;
			y = 0.06;
			w = 0.0375;
			h = 0.04;
			tooltip = "Insígnia do jogador (ombro esquerdo)";
		};
		class Sair: RscButton
		{
			idc = 2;
			text = "Sair";
			colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
			x = 0.6;
			y = 0.94;
			w = 0.1;
			h = 0.04;
		};

		//--- Controles

		class Nome: RscText
		{
			idc = 1001;
			style = ST_CENTER;
			shadow = 2;
			x = 0.3;
			y = 0.16;
			w = 0.4;
			h = 0.04;
		};
		class Papel: RscText
		{
			idc = 1002;
			style = ST_CENTER;
			colorText[] = {0.5,0.5,0.5,1};
			shadow = 2;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.04;
		};
		class BotaoPadrao: RscButton
		{
			idc = 999;
			style = ST_CENTER;
			colorBackground[] = GUI_BCG_COLOR;
			offsetPressedX = "pixelW";
			offsetPressedY = "pixelH";
			x = 0.3;
			w = 0.4;
			h = 0.06;
		};
		class Insignia: BotaoPadrao
		{
			idc = -1;
			text = "Insígnias";
			x = 0.3;
			y = 0.28;
			w = 0.4;
			h = 0.06;
			tooltip = "Escolhe insignia visível no ombro esquerdo de alguns uniformes";
			onButtonClick = " createDialog 'Insignia' ";
		};
		class Botao3D: BotaoPadrao
		{
			idc = -1;
			text = "Ícones indicadores de amigos";
			y = 0.36;
			tooltip = "Controla aparência, distância e comportamento de ícones para identificar amigos";
			onButtonClick = " createDialog 'ind3D' ";
		};
		class Visibilidade: BotaoPadrao
		{
			idc = -1;
			text = "Visibilidade e sons";
			y = 0.44;
			tooltip = "Controles de performance (sons, terreno, objetos e sombras)";
			onButtonClick = " createDialog 'visibilidade' ";
		};
		class Fadiga: BotaoPadrao
		{
			idc = -1;
			text = "Sistema de fadiga";
			y = 0.52;
			tooltip = "Controla se o jogador terá limites de peso ou corrida e se isso afetará sua mira";
			onButtonClick = " createDialog 'fadiga' ";
		};
		class Stats: BotaoPadrao
		{
			idc = -1;
			text = "Minhas estatísticas";
			y = 0.6;
			tooltip = "Visualizador de estatísticas do jogador neste servidor";
			onButtonClick = " createDialog 'estatisticas' ";
		};
		class Lista: BotaoPadrao
		{
			idc = -1;
			text = "Lista de jogadores";
			y = 0.68;
			tooltip = "Painel que lista todos os jogadores online no momento e possibilita algumas interações";
			onButtonClick = " createDialog 'jogadoresOnline' ";
		};
		class Recursos: BotaoPadrao
		{
			idc = -1;
			text = "Recursos do jogador";
			y = 0.76;
			tooltip = "Lista de todos os recursos disponí­veis ao jogador neste servidor";
			onButtonClick = " createDialog 'recursos' ";
		};
		class Changelog: BotaoPadrao
		{
			idc = -1;
			text = "Atualizações do servidor";
			y = 0.84;
			tooltip = "Histórico de todas as atualizações feitas no servidor";
			onButtonClick = " createDialog 'changelog' ";
		};
		class VoteRestartTexto: RscStructuredText
		{
			idc = -1;
			text = "Reiniciar<br/>missão";
			class Attributes
			{
				font = "RobotoCondensed";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "center";
				shadow = 1;
				size = 0.7;
			};
			x = 0.3;
			y = 0.92;
			w = 0.1;
			h = 0.06;
		};
		class VoteRestart: RscButton
		{
			idc = -1;
			text = "";
			colorBackground[] = {0,0,0,0.1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {1,1,1,0.1};
			colorFocused[] = {0,0,0,0};
			x = 0.3;
			y = 0.92;
			w = 0.1;
			h = 0.06;
			tooltip = "Votar para reiniciar a missão";
			onButtonClick = " serverCommand '#vote restart' ";
		};
	};
};