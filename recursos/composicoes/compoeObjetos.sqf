params ["_centro", "_lista"];
private _z = param [2, false];

private _composicao = selectRandom _lista;
private _objetos = [_centro, random 359, _composicao] call BIS_fnc_objectsMapper;

private ["_pos", "_normal"];

_objetos apply {
	_pos = getPosATL _x;
	_x setPosATL [_pos # 0, _pos # 1, (_pos # 2) + 10];
	_normal = surfaceNormal _pos;
	_x setVectorUp _normal;
	_x setPosATL [_pos # 0, _pos # 1, if _z then {_pos # 2} else {0}];
};

_objetos