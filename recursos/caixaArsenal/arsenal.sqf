if (typeOf player in LISTA_PILOTOS) exitWith {
	["naoImportante", "Pilotos não são autorizados a acessar o Arsenal Virtual"] call SMQTV_fnc_cutText;
};

["Open", true] spawn BIS_fnc_arsenal;