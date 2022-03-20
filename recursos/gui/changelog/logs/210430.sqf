private _log = ["30/04/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>BANCO DE DADOS</t>: Implementada solução para garantir a persistência entre sessões de alguns dados de jogadores, como UID, nome, quantidade de eliminações, utilização de recursos e etc;
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