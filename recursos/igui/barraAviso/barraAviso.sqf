private _texto = param [0, "Texto padrão"];
private _corBG = param [1, "azul"];
private _tempo = param [2, 5];
private _rgb = [];

switch (_corBG) do {
	case "azul": { uiNamespace setVariable ["SMQTV_barraCor", [0.3,0.3,1,1]] };
	case "verde": { uiNamespace setVariable ["SMQTV_barraCor", [0.1,0.9,0.1,1]] };
	case "vermelho": { uiNamespace setVariable ["SMQTV_barraCor", [1,0.3,0.3,1]] };
	default {};
};
uiNamespace setVariable ["SMQTV_barraTexto", _texto];
uiNamespace setVariable ["SMQTV_barraTempo", _tempo];

"SMQTV_barraAviso" cutRsc ["BarraAviso", "PLAIN", -1, true];