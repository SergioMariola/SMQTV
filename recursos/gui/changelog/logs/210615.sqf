private _log = ["15/06/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>REFORÇOS</t>: Os reforços inimigos agora são influenciados pela quantidade de jogadores no servidor (mais jogadores, mais reforços e vice-versa);
	<br/>
	- <t color='%2'>RELAÇÕES DE TIMES</t>: Unidades AAF inimigas não devem mais aparecer no mapa dos jogadores;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;