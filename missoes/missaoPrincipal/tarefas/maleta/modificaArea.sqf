params ["_target", "_caller", "_actionId", "_arguments"];
_arguments params ["_maleta", "_marcador", "_tarefaID"];

if (!alive _maleta) exitWith {
	["naoImportante", "As informações neste computador são obsoletas, a Maleta de Ingeligência já foi recuperada"] remoteExec ["SMQTV_fnc_cutText", _caller];
};
_acessado = _target getVariable ["SMQTV_pcAcessado", false];
if _acessado exitWith {
	["naoImportante", "As informações deste computador já foram adquiridas anteriormente"] remoteExec ["SMQTV_fnc_cutText", _caller];
};

_target setDamage 1;
_target setVariable ["SMQTV_pcAcessado", true];
[_tarefaID, "SUCCEEDED"] call BIS_fnc_taskSetState;

_tam = markerSize _marcador;
_tamFinal = (_tam select 0) / 2;
_marcador setMarkerSizeLocal [_tamFinal, _tamFinal];
if (_maleta inArea _marcador) exitWith {
	_marcador setMarkerSize [_tamFinal, _tamFinal];
	{ ["naoImportante", format ["O tamanho da área de busca pela <br/><t color='%1' >Maleta de Ingeligência</t> foi diminuída pela metade", COR_AMARELO]] call SMQTV_fnc_cutText } remoteExec ["call", _caller];
};

_pos = getMarkerPos _marcador;
_proxPos = [0,0,0];
_dist = random _tamFinal;

while {  _maleta distance _proxPos > _dist } do {
	_proxPos = _pos getPos [2, _pos getDir _maleta];
	_pos = _proxPos;
};

_marcador setMarkerPos _proxPos;

{ ["naoImportante", format ["O tamanho da área de busca pela <br/><t color='%1' >Maleta de Ingeligência</t> foi diminuída pela metade", COR_AMARELO]] call SMQTV_fnc_cutText } remoteExec ["call", _caller];