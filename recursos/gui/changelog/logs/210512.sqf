private _log = ["12/05/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Adicionada condição de falha ao serem eliminados mais de 10 civis na Área de Operações;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Configurações do jogador não estavam sendo persistentes depois do respawn. Agora são;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;