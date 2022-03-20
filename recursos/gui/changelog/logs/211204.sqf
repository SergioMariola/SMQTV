private _log = ["04/12/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Adicionados controles de som ambiente;
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Adicionados controles de indicadores de amigos;
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Adicionada dica de uso do recurso (esta dica expira depois de algumas aparições);
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;