private _log = ["13/02/2022",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>SOLICITAÇÃO DE CURA</t>: Jogadores que estiverem feridos e não possuírem recursos para se curar poderão solicitar, via Menu de Ações, a ajuda de outros jogadores que estejam próximos;
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