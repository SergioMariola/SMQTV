private _log = ["15/07/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>PERFORMANCE</t>: Adicionada rotina para monitorar grandes variáveis e aliviar recursos da memória RAM (exclui elementos nulos de uma matriz);
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>KILLSTREAKS</t>: Em bombardeios executados pelas recompensas recebidas uma seta animada (além dos já existentes texto e sirene de alerta) indicará para todos os jogadores onde será o impacto da bomba;
	<br/>
	- <t color='%2'>PERFORMANCE</t>: Inimigos que eram mortos estavam sendo deletados somente após o final da Missão Principal, e não pela rotina mais curta coletora de lixo. Isso foi consertado;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;