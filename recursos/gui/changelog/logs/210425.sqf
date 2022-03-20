private _log = ["25/04/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Adicionados civis à Missão Principal;
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Adicionados controles para aumentar/diminuir o balanço da arma;
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Adicionados controles para habilitar/desabilitar o crosshair;
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Adicionados controles para habilitar/desabilitar o chat;
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Adicionados controles para habilitar/desabilitar a Barra de Grupo (Squad Bar), visível para líderes de grupo;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MANUSEIO DE ARMAS</t>: O balanço de arma foi alterado para 20%3 por padrão, podendo ser alterado via 'Menu do Jogador';
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI,
	"%"
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;