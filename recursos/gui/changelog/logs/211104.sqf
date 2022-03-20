private _log = ["01/11/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>LOADOUT</t>: Loadouts agora são persistentes entre sessões. Obs: Loadouts são salvos para cada classe que o jogador escolher e ficam localmente no computador (e perfil atual) do jogador;
	<br/>
	- <t color='%2'>CONFIGURAÇÕES VISUAIS</t>: Configurações visuais feitas no 'Menu do Jogador' agora são persistentes entre sessões. Obs: As configurações são salvas localmente no computador (e perfil atual) do jogador;
	<br/>
	- <t color='%2'>CONFIGURAÇÕES DE FADIGA</t>: Configurações de fadiga feitas no 'Menu do Jogador' agora são persistentes entre sessões. Obs: As configurações são salvas localmente no computador (e perfil atual) do jogador;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;