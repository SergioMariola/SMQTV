private _log = ["13/07/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>PERFORMANCE</t>: Missão foi completamente remodelada para se alinhar com o padrão de qualidade da Biblioteca de Funções do Arma 3. Todos os scripts agora são compilados e se alocam em memória RAM assim que o jogador entra no servidor, não precisando mais serem compilados toda vez que forem executados;
	<br/>
	- <t color='%2'>OFF-LOAD</t>: Alguns scripts pesados (criação de veículos, rotinas de geolocalização e etc) que antes rodavam inteiramente na máquina do jogador, agora são executados no servidor, potencialmente resultando num gameplay mais leve. Isso assegura também a total execução dos scripts que forem iniciados (jogadores frequentemente disparam um script e morrem/saem do servidor, acarretando na perda de referência do código e gerando logs de erros no servidor);
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;