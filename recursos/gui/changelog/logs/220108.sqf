private _log = ["08/01/2022",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>HUD DE PILOTOS DE TRANSPORTE</t>: Pilotos de transporte agora possuem um texto na tela que os informa da quantidade de jogadores possivelmente esperando carona na base;
	<br/>
	- <t color='%2'>INSÍGNIAS</t>: Jogadores agora podem escolher uma insígnia específica, em seu ombro esquerdo, via 'Menu do Jogador';
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MENUS</t>: Os menus da missão foram configurados para terem a mesma cor e transparência (caso haja) de todos os menus do jogo;
	<br/>
	- <t color='%2'>PERFORMANCE</t>: Sistema novo e mais performático no tratamento de cadáveres e sucatas na missão;
	<br/>
	- <t color='%2'>HALO JUMP</t>: Tela de solicitação de carona totalmente reformulada. A tela agora responde em tempo real à presença e/ou ausência de pilotos de transporte;
	<br/>
	- <t color='%2'>EARPLUGS</t>: Melhorias na detecção e HUD dos abafadores de som;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;