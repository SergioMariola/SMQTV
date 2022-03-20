private _culpado = localNamespace getVariable ["SMQTV_culpadoFogoAmigo", 0];
if (_culpado < 2) exitWith {
	localNamespace setVariable ["SMQTV_culpadoFogoAmigo", _culpado + 1];
	_texto = ["Fogo amigo: Você incapacitou ", name _this, "<br/><t size='1.3'>Você será punido após 3 incidências</t>"] joinString "";
	["naoImportante", _texto] call SMQTV_fnc_cutText;
};

localNamespace setVariable ["SMQTV_culpadoFogoAmigo", 0];
player remoteExec ["SMQTV_fnc_fogoAmigoPunicao", 2];
player call SMQTV_fnc_reiniciaKillstreaks;
0 spawn SMQTV_fnc_atualizaPlacar;

systemChat "ATENÇÃO: Você incapacitou muitos amigos.";
systemChat "Suas recompensas foram removidas e você será punido!";