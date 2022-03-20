waitUntil { !isNull (findDisplay 46) };

SMQTV_menuJog = false;

findDisplay 46 displayAddEventHandler ["KeyDown", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
	if (_key isEqualTo 199 && {!SMQTV_menuJog}) then {
	  createDialog "MenuJogador";
	  true
	};
}];

localNamespace setVariable ["SMQTV_teclaAbrir", true];