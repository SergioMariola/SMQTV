private _log = ["29/06/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>FOGO AMIGO</t>: Sistema de alertas de fogo amigo e suicídio;
	<br/>
	- <t color='%2'>POP-UP</t>: Pop-up para os jogadores com logotipo do servidor de tempos em tempos;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>HALO JUMP</t>: Imagem do monitor de HALO Jump alterada por uma mais leve;
	<br/>
	- <t color='%2'>MENU DO JOGADOR</t>: Ao entrar no Menu do Jogador, era possível habilitar a Stamina acidentalmente pressionando a barra de espaço. Isso não acontece mais;
	<br/>
	- <t color='%2'>KILLSTREAKS</t>: Bombardeio GBU-12 as vezes não era completado pois a bomba não tocava o chão. Código foi completamente recriado, assegurando o splash da bomba;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;