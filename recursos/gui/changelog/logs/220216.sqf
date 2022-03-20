private _log = ["16/02/2022",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>REMUNICIAMENTO EM CAMPO</t>: Fuzileiros comuns (Fuzileiro) agora podem criar caixas de Arsenal limitado em qualquer posição do mapa. A caixa de munição fica no chão por 5min e o recurso pode ser utilizado pelo jogador novamente em 10min;
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