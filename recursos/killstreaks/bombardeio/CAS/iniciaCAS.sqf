params ["_caller", "_pos", "_target", "_is3D", "_id", "_opcao", "_descricao"];

//Certifica que somente este jogador usará o recurso no momento
missionNamespace setVariable ["SMQTV_casEmUso", true, true];

_moduleGroup = createGroup [sideLogic, true];
_modulo = _moduleGroup createUnit ["ModuleCAS_F", _pos, [], 0, "CAN_COLLIDE"];
_modulo setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
_modulo setVariable ['vehicle', 'B_Plane_CAS_01_dynamicLoadout_F'];
_modulo setVariable ['type', _opcao];

//Cria alvo
_alvoPos    = if (_pos isEqualTo []) then {getPosATL _target} else {_pos};
_alvo       = createVehicle ["Land_HelipadEmpty_F", _alvoPos, [], 0, "CAN_COLLIDE"];
waitUntil { !isNull _alvo };

//Dispara mensagens
private _texto = format ["== %1 requisitou um bombardeio de %2 ==", name _caller, _descricao];
_texto remoteExecCall ["systemChat"];
[_alvo, _alvoPos, _caller, _pos, _target, "CAS"] remoteExec ["SMQTV_fnc_bombardeioAviso", 0];

//Configura gatilho de aviso
_jato = objNull;
waitUntil {
    _jato = _modulo getVariable ["plane", objNull];
    !isNull _jato
};

missionNamespace setVariable ["SMQTV_alvoHelipad", _alvo];

_jato addEventHandler ["Fired", {
    params ["_unit"];

    //Deleta helipad
    private _alvo = missionNamespace getVariable ["SMQTV_alvoHelipad", objNull];
    deleteVehicle _alvo;
    missionNamespace setVariable ["SMQTV_alvoHelipad", nil];
    //Libera o uso para outros jogadores
    [] spawn {
        sleep 15;
        missionNamespace setVariable ["SMQTV_casEmUso", false, true];
        "|| CAS liberado para uso ||" remoteExecCall ["systemChat"];
    };
    //Exclui EH
    _unit removeEventHandler ['Fired', _thisEventHandler];
}];

//Registra ação no BD
[_caller, "_descricao"] call SMQTV_fnc_dbAddAtributo;

waitUntil {
    sleep 5;
    isNull _jato
};

deleteVehicle _modulo;
deleteGroup _moduleGroup;