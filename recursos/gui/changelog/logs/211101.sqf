private _log = ["01/11/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Bombardeio inimigo periódico até que a Torre de Rádio seja destruída;
	<br/>
	- <t color='%2'>IGUI</t>: Sistema de barra de notificações inspirado em Battlefield 2042;
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>MISSÃO PRINCIPAL</t>: Para manter uma batalha ativa, reforços agora não são mais de acordo com a quantidade de jogadores;
	<br/>
	- <t color='%2'>SALTO DE VEÍCULO</t>: Adicionada câmera de transição no momento do embarque;
	<br/>
	- <t color='%2'>HALO JUMP</t>: Óculos de visão noturna/calor corretamente aplicado após jogador tocar o chão, caso este estiver usando um no momento do pouso;
	<br/>
	- <t color='%2'>ABAFADOR DE SOM</t>: O abafador não responde mais ao comando ALT + TAB, fazendo com que o recurso se mantenha coerente caso o jogador queira minimizar o jogo;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	Não houveram
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;