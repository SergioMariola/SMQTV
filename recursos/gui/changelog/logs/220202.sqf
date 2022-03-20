private _log = ["02/02/2022",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>KILLSTREAKS</t>: Restruturamento de grande parte dos scripts de killstreak. Contando agora com janela para escolher suporte, melhor uso do Menu de Suporte, sistema de cooldown e off-load de processamento no computador do jogador;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;