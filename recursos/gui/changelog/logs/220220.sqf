private _log = ["20/02/2022",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>PRESENÇA CIVIL</t>: Adicionado trânsito simples de veículos IDAP pela AO;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>FOGO AMIGO</t>: Além da punição com raio de Zeus, jogador que cometer 3 teamkills agora também tem suas recompensas removidas e contador de killstreak reiniciado;
	<br/>
	- <t color='%2'>DANO COLATERAL</t>: Adicionada punição (Raio de Zeus) ao jogador que cometer 3 homicídios de civis. Além do raio, jogador terá suas recompensas removidas e contador de killstreak reiniciado;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Removida condição de falha da Missão Principal por quantidade de assassinatos de civis;
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;