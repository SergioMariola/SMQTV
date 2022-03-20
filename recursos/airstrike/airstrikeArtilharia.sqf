/* 
Esta função aceita o(s) seguinte(s) argumentos:

    1) Objeto, posição ou grupo

        Obs: Caso este parâmetro não seja fornecido, a posição do cursor será utilizada

    2) Tipos de munição:

        "Foguete"   para Foguete 230mm
        "Howitzer"  para Howitzer 155mm
        "Morteiro"  para Morteiro 82mm

        Obs: Caso não seja fornecido um tipo de munição, o tipo "Morteiro" será utilizado
    
    Exemplos:

        execVM "estaFuncao.sqf";
        [] execVM "estaFuncao.sqf";
        [position _soldadoInimigo] execVM "estaFuncao.sqf";
        [nil, "Howitzer"] execVM "estaFuncao.sqf";
        [position _soldadoInimigo, "Foguete"] execVM "estaFuncao.sqf";
*/

if !canSuspend exitWith {
   ["Esta função precisa rodar em ambiente que possa ser suspenso (execVM ou spawn)", nil] call BIS_fnc_error;
};

params [
    ["_pos", [0,0,0], [objNull, [], grpNull]],
    ["_municao", "Morteiro", [""]]
];

_tipos = [
    ["Foguete", "ModuleOrdnanceRocket_F_Ammo"],
    ["Howitzer", "ModuleOrdnanceHowitzer_F_Ammo"],
    ["Morteiro", "ModuleOrdnanceMortar_F_Ammo"]
];

_index = _tipos findIf { _municao isEqualTo (_x select 0) };

_grupo = createGroup [sideLogic, true];
_modulo = _grupo createUnit [
    "ModuleOrdnance_F",
    _pos,
    [],
    100,
    "CAN_COLLIDE"
];
_modulo setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
_modulo setVariable ["type", (_tipos select _index) select 1];

sleep 10;

deleteVehicle _modulo;
deleteGroup _grupo;