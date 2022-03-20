params ["_jogador"];
private _texto = "";

if (local _jogador) then {
	_culpado = localNamespace getVariable ["SMQTV_culpadoDanoColateral", 0];
	_culpado = _culpado + 1;
	localNamespace setVariable ["SMQTV_culpadoDanoColateral", _culpado];
	call SMQTV_fnc_vrFadeIn;

	if (_culpado > 2) then {
		localNamespace setVariable ["SMQTV_culpadoDanoColateral", nil];
		_jogador remoteExec ["SMQTV_fnc_danoColateralPunicao", 2];
		_jogador call SMQTV_fnc_reiniciaKillstreaks;
		0 spawn SMQTV_fnc_atualizaPlacar;
		systemChat "ATENÇÃO: Você matou muitos civis.";
		systemChat "Suas recompensas foram removidas e você será punido!";
	} else {
		systemChat "Você matou um civil";
		["naoImportante", "Você matou um civil<br/><t size='1.3'>Você será punido após 3 incidências</t>", 0.8] call SMQTV_fnc_cutText;
	};
} else {
	playSound "FD_Course_Active_F";
	_texto = format ["Dano colateral: %1 matou um civil", name _jogador];
	systemChat _texto;
	_texto = format ["%1 matou um civil", name _jogador];
	["naoImportante", _texto, 0.8] call SMQTV_fnc_cutText;
};