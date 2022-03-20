private _log = ["09/07/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>INDICADORES DE AMIGOS</t>: Criados indicadores de amigos mais compreensíveis (diferenciando classes e contendo nome do jogador);
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Adicionadas imagens contextuais para as tarefas. Foram feitas também leves alterações nas descrições de algumas tarefas;
	<br/>
	- <t color='%2'>FOGO AMIGO</t>: Pequena melhoria na detecção de fogo amigo;
	<br/>
	- <t color='%2'>PERFORMANCE</t>: Prováveis melhorias em performance ao conectar no servidor (itens agora são removidos da fila JIP quando objeto atrelado à eles não existem mais);
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;