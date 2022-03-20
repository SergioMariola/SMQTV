private _log = ["29/05/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>VANTs</t>: Adicionados VANTs à disposição da equipe de jogadores;
	<br/>
	- <t color='%2'>VANTs</t>: Adicionados pontos de respawn para Operador de VANT;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>REPARO DE VEÍCULOS</t>: Os PODs de reparo de veículos agora funcionam também com VANTs;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;