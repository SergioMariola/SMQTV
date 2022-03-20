private _log = ["29/10/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Inimigos agora também surgem dentro de casas da AO;
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Inimigos não mais ficam sem munição com o decorrer da partida;
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Adicionada mensagem para deixar a AO quando a missão estiver completa;
	<br/>
	- <t color='%2'>SALTO DE PARAQUEDAS</t>: Para fins de compliance com o jogo base, este salto não pode mais ser executado pelo piloto da aeronave;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;