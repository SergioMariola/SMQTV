private _log = ["25/10/2021",
	format [
	"
	<t color='%1'>==ADIÇÕES==</t>
	<br/>
	Não houveram
	<br/><br/>
	<t color='%1'>==MODIFICAÇÕES==</t>
	<br/>
	- <t color='%2'>IGUI</t>: Adicionado HUD ao ser incapacitado, informando se há um médico por perto e sua distância;
	<br/>
	- <t color='%2'>IGUI</t>: Adicionado HUD para monitorar mortes, eliminações e killstreaks;
	<br/>
	- <t color='%2'>IGUI</t>: Adicionado HUD para monitorar status dos plugs de ouvido;
	<br/>
	- <t color='%2'>CAIXA DE REARMAMENTO</t>: Caixas de rearmamento agora ressurgem na base caso afundem no mar;
	<br/>
	- <t color='%2'>SALTO DE VEÍCULO</t>: Recurso sinalizado com texto 3D;
	<br/><br/>
	<t color='%1'>==REMOÇÕES==</t>
	<br/>
	- <t color='%2'>RESPAWN</t>: Removidas alguns pontos de ressurgimento no Menu de Ressurgimento, restando as opções 'Base' (que cria o jogador em sua posição original) e os pontos de ressurgimento móveis;
	",
	COR_AMARELO,
	COR_KHAKI
	]];

(localNamespace getVariable ["SMQTV_changelog", []]) pushBack _log;