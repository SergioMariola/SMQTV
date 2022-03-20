private _log = ["25/11/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>MAPA</t>: Adicionados nomes aos ícones de jogadores no mapa (com indicadores de veículo utilizado e incapacitação);
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