private _log = ["04/12/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>REPARO DE VEÍCULOS</t>: Agora a área de reparo é somente um helipad iluminado onde o jogador adentra e tem disponível uma ação no Menu de Ações;
	<br/>
	- <t color='%2'>MUNIÇÃO FLARE</t>: Munições flare agora iluminam o terreno à sua volta;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;