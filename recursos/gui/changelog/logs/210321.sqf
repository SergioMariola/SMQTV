private _log = ["21/03/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>OVERHAUL</t>: Overhaul COMPLETO de toda missão Invade and Annex do antigo servidor 'AlmeidaBR'. Código completamente reescrito do zero, enxuto, livre de erros de script e totalmente em PT-BR;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;