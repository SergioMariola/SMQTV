private _log = ["05/05/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>Bombardeio GBU-12</t>: Adicionada recompensa caso jogador elimine <t color='%2'>10</t> inimigos sem morrer;
	<br/>
	- <t color='%2'>Bombardeio Mk-41 VLS</t>: Adicionada recompensa caso jogador elimine <t color='%2'>20</t> inimigos sem morrer;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MANDA CHUVA</t>: Número de eliminações de inimigos requeridas aumentado para 30;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;