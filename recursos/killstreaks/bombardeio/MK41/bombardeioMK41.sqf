params ["_caller", "_pos", "_target", "_is3D", "_id"];
_target = cursorObject;

//Trata erros

private _emUso = missionNamespace getVariable ["SMQTV_mk41EmUso", false];
if (_emUso) exitWith {
	_texto = "Este recurso está sendo utilizado por outro jogador<br/><t size='1.3'>Tente novamente em alguns instantes</t>";
	["importante", _texto] call SMQTV_fnc_cutText;
};

if (_pos isEqualTo [] && {isNull _target}) exitWith {
    ["naoImportante", "Não é uma posição válida<br/><t size='1.3'>(É necessário ser solo ou objeto)</t>", 0.4] call SMQTV_fnc_cutText;
};

if !_is3D exitWith {
    ["naoImportante", "Bombardeio CAS não pode ser usado via mapa", 0.4] call SMQTV_fnc_cutText;
};

if (!isNull _target && {(side _target) isEqualTo (side _caller)}) exitWith {
    ["naoImportante", "Bombardeio CAS não pode ser usado diretamente em jogadores do mesmo time", 0.4] call SMQTV_fnc_cutText;
};

if (!isNull _target && {((getPosATL _target) select 2) > 2}) exitWith {
    ["naoImportante", "O alvo precisa estar em solo", 0.4] call SMQTV_fnc_cutText;
};

//Inicia bombardeio
private _params = _this;
if (_pos isEqualTo []) then {_params set [1, getPosATL _target]};
_params remoteExec ["SMQTV_fnc_iniciaMK41", 2];

//Remove suporte para o jogador
[_caller, _id] call SMQTV_fnc_removeCommMenuItem;