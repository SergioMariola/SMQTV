private _log = ["22/02/2022",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>Efeito de projétil</t>: Atiradores de Elite que usarem rifles de precisão contarão com um rastro de fumaça para observar a tragetória de seus disparos;
	<br/>
	- <t color='%2'>EFEITOS</t>: Adicionados diversos efeitos visuais para destruição de veículos inimigos, realização de objetivos, punições de jogadores, entre outros;
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