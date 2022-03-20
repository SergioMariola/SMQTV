private _log = ["15/05/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>RESPAWN MÓVEL</t>: Adicionado veículo (Prowler) que serve como ponto de respawn móvel acessível pelo Menu de Respawn;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Consertado problema onde jogadores ressurgiam sem as modificações feitas no Menu do Jogador;
	<br/>
	- <t color='%2'>REPARO DE VEÍCULOS</t>: Consertado problema nos pods de reparo (Processo de reparo não era iniciado);
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;