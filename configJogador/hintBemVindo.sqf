_fnc_descPapel = {
	private _prefixo = "<t underline='1'>Sua&#160;função</t> é ";
	private _texto = "";
	switch (_this) do {
		case "Rifleman"							: { _texto = "ser botas no chão. Seu time precisa de você para garantir fogo contra o inimigo.<br/>Você pode criar <t font='RobotoCondensedBold'>caixas de munição</t> no campo de batalha para seu time se remuniciar." };
		case "Grenadier"						: { _texto = "ser botas no chão. Seu time precisa de você para garantir fogo contra o inimigo." };
		case "Autorifleman"						: { _texto = "garantir fogo rápido e em quantidade para possivelmente dizimar e suprimir o inimigo." };
		case "Heavy Gunner"						: { _texto = "<t font='RobotoCondensedBold'>chover chumbo</t> no inimigo. Suas armas são perigosas e automáticas, porém pesadas.<br/>Não esqueça de apoiá-las com o bipé sempre que possível e efetue rajadas pequenas e controladas." };
		case "Marksman"							: { _texto = "possivelmente ser um fantasma. Ajude seu time eliminando inimigos à médias e grandes distâncias.<br/>Atenção aos seus arredores, pois seu equipamento não te ajuda muito em curtas distâncias." };
		case "Engineer"							: { _texto = "ser uma oficina móvel. Você possui a habilidade valiosa de consertar veículos e desarmar explosivos.<br/>Mantenha-se vivo e longe de perigos desnecessários." };
		case "Missile Specialist (AT)"			: { _texto = "prover fogo efetivo contra veículos blindados pesados inimigos.<br/>Você é um recurso importante para seu time, não se arrisque desnecessariamente." };
		case "Combat Life Saver"				: { _texto = "primariamente ajudar seus amigos de time provendo cura para ferimentos no campo de batalha." };
		case "UAV Operator"						: { _texto = "prover inteligência e fogo, ambos vindos do céu.<br/>Com os drones aéreos, mantenha seu time atualizado da movimentação inimiga e reserve sua escaça munição para ameaças blindadas e/ou iminentes." };
		case "Helicopter Pilot"					: { _texto = "transportar seu time DE e PARA pontos no mapa em helicópteros.<br/><br/>Você não possui acesso ao Arsenal Virtual ou às caixas de remuniciamento, então limite-se à função de transportar seus amigos." };
		case "Fighter Pilot"					: { _texto = "ser a maior ameaça para o time inimigo.<br/>Sua ferramenta (o jato de combate) é o recurso mais valioso num time organizado. Mantenha sempre contato com seus amigos no solo e organize ataques precisos e fulminantes.<br/><br/>Você não possui acesso ao Arsenal Virtual ou às caixas de remuniciamento, então limite-se à sua aeronave." };
		default { _texto = "| Esta classe ainda não recebeu uma definição |" };
	};
	private _textoF = [
		_prefixo,
		_texto,
		if ((typeOf player) in LISTA_PILOTOS) then {""} else {"<br/><br/>Este servidor <t underline='1'>não&#160;limita</t> o equipamento das classes de combate em solo, então é de bom senso que você tente se limitar à seu papel para que todos tenham um jogo dinâmico."}] joinString "";
	_textoF
};

_role = roleDescription _this;
_classname = getText (configfile >> "CfgVehicles" >> typeOf _this >> "displayName");
_texto = _classname call _fnc_descPapel;
if (_role isEqualTo "") then {_role = _classname};

hintSilent parseText ([
			"<br/>",
			"<t shadow='2'>",
			"<t size='1.5' color='#ffff00'>" + _role + "</t>",
			"<br/><br/>",
			_texto,
			"<br/><br/>",
			"Acesse mais controles no painel ""<t color='#e67300'>Menu do jogador</t>"", no menu de ações, ou pela tecla de atalho <t color='#e67300'>HOME</t>.",
			"</t>"
] joinString "");

sleep 15;

if (!alive _this) exitWith {};

hintSilent parseText ([
			"<br/>",
			"<t shadow='2'>",
			"<t size='1.5' color='#ffff00'>" + _role + "</t>",
			"<br/><br/>",
			_texto,
			"<br/><br/>",
			"Acesse mais controles no painel ""<t color='#e67300'>Menu do jogador</t>"", no menu de ações, ou pela tecla de atalho <t color='#e67300'>HOME</t>.",
			"</t>"
] joinString "");