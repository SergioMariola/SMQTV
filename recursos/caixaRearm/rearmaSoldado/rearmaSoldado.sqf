params ["_target", "_caller", "_actionId", "_arguments"];

//Animação
_caller playActionNow "PutDown";
sleep 0.5;

//Cria caixa
_relPos = _caller selectionPosition ["leftforearm", "Memory"];
_relPos = _relPos vectorAdd [0,1.5,0];
_pos = _caller modelToWorld _relPos;
_pos remoteExec ["SMQTV_fnc_rearmaCriaCaixa", 2];

//Restringe criação de novas caixas por um tempo
localNamespace setVariable ["SMQTV_rearmCaixaNoChao", true];
[] spawn {
	sleep 600;
	localNamespace setVariable ["SMQTV_rearmCaixaNoChao", nil];
};
["naoImportante", "Caixa de munição criada<br/><t size='1.3'>Aguarde 10 minutos para poder criar novamente</t>"] call SMQTV_fnc_cutText;