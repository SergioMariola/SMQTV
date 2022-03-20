private _log = ["02/05/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>HALO JUMP</t>: Adicionada função para pedir carona aos pilotos de helicóptero caso haja um ou mais no servidor;
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: A quantidade de inimigos na Missão Principal foi diminuída e o tempo entre reforços foi aumentado;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;