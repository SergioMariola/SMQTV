private _log = ["01/07/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>NO-FLY ZONE</t>: Adicionada Zona de restrição de vôo na área que cobre o spawn de infantaria BLUFOR;
	<br/>
	- <t color='%2'>RESTRIÇÕES DE DRONES</t>: Proibição de montagem de drones armados ou não. Armas estáticas não-autônomas continuam sendo liberadas;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Completa restruturação do Menu do Jogador, com um painel principal e sub-paineis para melhor organização, performance e compreensão. Também foram adicionados alguns controles que estavam pendente desde a criação deste recurso (controladores independentes de distância de visão de terreno, objetos e sombras por exemplo);
	<br/>
	- <t color='%2'>FOGO AMIGO</t>: Pequena melhoria na detecção de fogo amigo e suicídio;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;