private _log = ["28/11/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>INCAPACITAÇÃO</t>: Adicionados chamados de socorro para alertar os jogadores sobre feridos em seus arredores;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MANDA-CHUVA</t>: Recurso agora só pode ser usado se nenhum outro jogador estiver usando no momento;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;