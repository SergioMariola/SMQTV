private _log = ["12/02/2022",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>FOGO AMIGO</t>: Adicionada punição (Raio de Zeus) para jogador que cometer 3 teamkills (ao receber punição, contador de teamkills do jogador é zerada e jogador tem mais 3 chances);
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;