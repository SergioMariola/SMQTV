private _log = ["04/05/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>MANDA CHUVA</t>: Adicionado sistema de recompensa que dá ao jogador acesso ao Manda Chuva caso este elimine 20 inimigos sem morrer (pilotos não recebem esta recompensa);
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