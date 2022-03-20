params ["_control"];

private _display	= ctrlParent _control;
private _telaTexto	= _display displayCtrl 1100;
private _texto		= "";

switch (ctrlText _control) do { 

	case "Tempo" : {

		_texto = format ["
		<t size='1.3'>Neste servidor o tempo percorre diferente do tempo real</t>
		<br/><br/>
		À fim de manter o jogador à luz do dia na maior parte da partida e ao mesmo tempo fazê-lo passar pela noite sem quebrar a imersão, durante o dia o tempo percorre à <t shadow='2' color='%1'>5x</t> do tempo real. Já a noite percorre à <t shadow='2' color='%1'>90x</t> do tempo real.
		", COR_VERMELHO];
	};
	case "Menu do jogador" : {

		_texto = format ["
		<t size='1.3'>Menu do Jogador</t>
		<br/><br/>
		O jogador pode acessar o <t shadow='2' color='%1'>Menu do Jogador</t> a qualquer momento.
		<br/>
		Para acessar basta rolar o Action Menu e selecionar a opção 'Menu do jogador' enquanto estiver à pé.
		<br/><br/>
		Itens do menu:
		<br/><br/>
		<t shadow='2' color='%1'>Habilitar Stamina</t>: Habilitar/desabilitar o sistema de fadiga do jogador.
		<br/>
		<t shadow='2' color='%1'>Grama</t>: Escolher entre as três opções de densidade de grama. Não é possível remover a grama totalmente.
		<br/>
		<t shadow='2' color='%1'>Distância de visão</t>: Aumente ou diminua seu campo de visão.
		", COR_VERMELHO];
	};
	case "HALO Jump" : {

		_texto = format ["
		<t size='1.3'>HALO Jump</t>
		<br/><br/>
		O <t shadow='2' color='%1'>HALO Jump</t> é um recurso de viagem instantânea onde o jogador salta de paraquedas num ponto escolhido no mapa.
		<br/><br/>
		Para utilizar o recurso aproxime-se do monitor presente ao lado do Arsenal, na base. Um ícone de mapa irá aparecer na tela. Segure <t shadow='2' color='%1'>barra de espaço</t> para acessar.
		<br/><br/>
		<t shadow='2' color='%1'>IMPORTANTE</t>: Este recurso é bloqueado quando há um ou mais jogadores no papel de piloto de helicóptero presente.
		", COR_VERMELHO];
	};
	case "Veículos" : {

		_texto = format ["
		<t size='1.3'>Veículos</t>
		<br/><br/>
		Todos os veículos da base possuem um sistema de respawn ao serem destruídos ou desertados pelo mapa.
		<br/><br/>
		Tempo de respawn ao ser <t shadow='2' color='%1'>destruído</t>: 3 minutos;
		<br/>
		Tempo de respawn ao ser <t shadow='2' color='%1'>desertado</t>: 3 minutos;
		<br/>
		Distância de todos os jogadores para ser <t shadow='2' color='%1'>considerado desertado</t>: 400 metros;
		<br/><br/>
		Veículos podem ser reabastecidos e remuniciados na marca <t shadow='2' color='%1'>Manutenção de veículos</t>, na base.
		<br/><br/>
		Ao final de uma missão, todas as unidades inimigas são deletadas, porém veículos inimigos tripulados por jogadores continuarão existindo até que não haja mais jogadores dentro deste.
		", COR_VERMELHO];
	};
	case "Fones de ouvido" : {

		_texto = format ["
		<t size='1.3'>Fones de ouvido</t>
		<br/><br/>
		Neste servidor é possível o personagem usar <t shadow='2' color='%1'>fones de ouvido</t> a fim de diminuir o som do ambiente à sua volta.
		<br/><br/>
		Pressione a tecla <t size='1.2' shadow='2' color='%1'>TAB</t> para habilitar/desabilitar os fones de ouvido.
		", COR_VERMELHO];
	};
	case "Salto de Veículo" : {

		_texto = format ["
		<t size='1.3'>Salto de veículo</t>
		<br/><br/>
		O <t shadow='2' color='%1'>Salto de Veículo</t> é um recurso de viagem automática onde um ou mais jogadores dentro de um veículo terrestre é/são transportado(s) por um V-44X Blackfish e salta(m) de paraquedas num ponto escolhido no mapa.
		<br/><br/>
		Para utilizar o recurso aproxime-se do V-44X Blackfish presente atrás dos blindados, na base. Um ícone de carregamento de carga irá aparecer na tela. Segure <t shadow='2' color='%1'>barra de espaço</t> para acessar.
		<br/><br/>
		<t shadow='2' color='%1'>IMPORTANTE</t>: Este recurso possui um tempo de cooldown de 1 minuto após o uso.
		", COR_VERMELHO];
	};
	case "Salto PQD" : {

		_texto = format ["
		<t size='1.3'>Salto PQD</t>
		<br/><br/>
		O <t shadow='2' color='%1'>Salto PQD</t> é um recurso para saltar de paraquedas de dentro de veículos aéreos.
		<br/>
		Para acessar basta rolar o Action Menu e selecionar a opção 'Salto de paraquedas' enquanto estiver embarcado em um helicóptero ou avião.
		<br/><br/>
		Há um limite mínimo onde o jogador não é permitido saltar se a aeronave estiver abaixo de <t shadow='2' color='%1'>200 metros</t> do solo.
		<br/>
		Ao saltar o jogador pode abrir o paraquedas a qualquer momento usando o Action Menu. Se não o fizer, ao atingir a altitude de <t shadow='2' color='%1'>100 metros</t> do solo o paraquedas abre automaticamente.
		", COR_VERMELHO];
	};
	case "Killstreaks" : {

		_texto = format ["
		<t size='1.3'>Killstreaks</t>
		<br/><br/>
		Sistema de recompensa por eliminações de inimigos.
		<br/><br/>
		Jogadores que não são pilotos (transporte ou ataque) são elegíveis de serem recompensados com vantagens temporárias ou de uso único.
		<br/><br/>
		Recompensas:
		<br/><br/>
		- <t shadow='2' color='%1'>Bombardeio GBU-12</t>: Eliminar <t shadow='2' color='%1'>10</t> inimigos sem morrer.
		<br/>
		- <t shadow='2' color='%1'>Bombardeio Mk-41 VLS</t>: Eliminar <t shadow='2' color='%1'>20</t> inimigos sem morrer.
		<br/>
		- <t shadow='2' color='%1'>Manda Chuva</t>: Eliminar <t shadow='2' color='%1'>30</t> inimigos sem morrer.
		<br/><br/>
		IMPORTANTE! Ao morrer, o jogador perde as recompensas que conquistou. Lembre-se de usá-las em tempo hábil.
		", COR_VERMELHO];
	};
	case "GBU-12" : {

		_texto = format ["
		<t size='1.3'>Bombardeio com GBU-12</t>
		<br/><br/>
		O bombardeio com <t shadow='2' color='%1'>GBU-12</t> faz parte do sistema de recompensa por eliminações de inimigos.
		<br/><br/>
		Ao alcançar <t shadow='2' color='%1'>10</t> eliminações sem ter morrido no processo, o jogador ganha acesso, através do Menu de Comunicação (teclas de atalho <t shadow='2' color='%1'>0-8</t>), ao Bombardeio GBU-12.
		<br/><br/>
		O jogador deverá apontar para um objeto ou um ponto no solo, acessar o Menu de Comunicações e selecionar a opção. Jogadores próximos da área de impacto serão informados do perigo com alertas sonoros e em texto.
		", COR_VERMELHO];
	};
	case "Mk-41 VLS" : {

		_texto = format ["
		<t size='1.3'>Bombardeio com míssil Mk-41 VLS</t>
		<br/><br/>
		O bombardeio com míssil cruzeiro <t shadow='2' color='%1'>Mk-41 VLS</t> faz parte do sistema de recompensa por eliminações de inimigos.
		<br/><br/>
		Ao alcançar <t shadow='2' color='%1'>20</t> eliminações sem ter morrido no processo, o jogador ganha acesso, através do Menu de Comunicação (teclas de atalho <t shadow='2' color='%1'>0-8</t>), ao Bombardeio Mk-41.
		<br/><br/>
		O jogador deverá apontar para um objeto ou um ponto no solo, acessar o Menu de Comunicações e selecionar a opção. Jogadores próximos da área de impacto serão informados do perigo com alertas sonoros e em texto.
		", COR_VERMELHO];
	};
	case "Manda Chuva" : {
	
		_texto = format ["
		<t size='1.3'>Manda Chuva</t>
		<br/><br/>
		O <t shadow='2' color='%1'>Manda Chuva</t> faz parte do sistema de recompensa por eliminações de inimigos.
		<br/><br/>
		Ao alcançar <t shadow='2' color='%1'>30</t> eliminações sem ter morrido no processo, o jogador ganha acesso, através do Menu de Comunicação (teclas de atalho <t shadow='2' color='%1'>0-8</t>), ao Manda Chuva.
		<br/>
		O jogador será colocado no controle de um artilheiro em um <t shadow='2' color='%1'>V-44X Blackfish</t> que ronda uma área selecionada pelo próprio jogador.
		<br/><br/>
		O recurso chega ao fim de 2 (duas) maneiras:
		<br/><br/>
		- Ao final de 3 minutos, automaticamente, o controle do artilheiro é removido do jogador e este volta a controlar seu personagem original;
		<br/>
		- Durante a utilização do recurso, escolhendo a ação <t shadow='2' color='%1'>Sair do Manda Chuva</t>, pelo Menu de Ações.
		", COR_VERMELHO];
	};
	
	default { _texto = "<t size='1.4'>A descrição deste recurso ainda não foi documentada</t>"; }; 
};

_telaTexto ctrlSetStructuredText (parseText _texto);