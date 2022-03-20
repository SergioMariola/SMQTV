params ["_centro", "_tarefaPaiID"];

//Escolhe referência para o marcador
_casa = [_centro, areaTamanho select 0] call SMQTV_fnc_escolheCasa;
if (_casa isEqualTo []) exitWith {};

_casaPos = getPos _casa;
_marcador = createMarkerLocal ["marcadorMaleta", _casaPos];
_marcador setMarkerTypeLocal "Empty";
_marcador setMarkerShapeLocal "ELLIPSE";
_marcador setMarkerSizeLocal [200, 200];

//Escolhe casa da maleta
_casa = [_casaPos, 200] call SMQTV_fnc_escolheCasa;
if (_casa isEqualTo []) exitWith {deleteMarkerLocal _marcador};

_marcador setMarkerColor "ColorYellow";

//Cria maleta
_posicoesCasa = _casa buildingPos -1;
_posicaoCasa = selectRandom _posicoesCasa;
_maletaSelecionada = selectRandom MALETAS_TIPOS;
_maleta = createVehicle [_maletaSelecionada, _posicaoCasa, [], 0, "CAN_COLLIDE"];
waitUntil { !isNull _maleta };
_casa allowDamage false;
_maleta allowDamage false;
_maleta setVectorUp [0,0,1];
_maleta setDir ((_maleta getDir _casa) - 180);
{_x addCuratorEditableObjects [[_maleta], false]} forEach allCurators;
["estatico", _maleta, _marcador] spawn SMQTV_fnc_monitoraMarcador;

[
	_maleta,
	[
		"Recuperar maleta",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];

			_target setDamage 1;
			deleteVehicle _target;
			remoteExec ["", "maletaLock"];
			_caller switchAction "putdown";
		},
		nil,
		1.5,
		true,
		true,
		"",
		"true",
		2
	]
] remoteExec ["addAction", 0, _maleta];
[_maleta, true] remoteExec ["lockInventory", 0, "maletaLock"];

inimigosAO pushBack _maleta;

//Monitora maleta e cria adversidades enquanto esta não for adquirida
_monitora = [_maleta, _centro, _marcador] spawn SMQTV_fnc_monitoraMaleta;

//Configura tarefa
_tarefaID = "missaoMaleta_" + str incrementoMP;
_imgMaleta = getText (configfile >> "CfgVehicles" >> _maletaSelecionada >> "editorPreview");
_imgTenda = getText (configfile >> "CfgVehicles" >> "Land_MedicalTent_01_NATO_generic_open_F" >> "editorPreview");
_desc = format ["Uma maleta de inteligência inimiga se encontra em uma das casas próximas a área de missão. Imagens de satélite nos possibilitaram filtrar uma área mais precisa para sua localização (área em amarelo).<br/>Precisamos que esta maleta seja assegurada custe o que custar!<br/><br/>Nossos contatos afirmam que o item em questão se parece com o da imagem abaixo:<br/><br/><img image='%1' width='367' height='256'/><br/><br/>IMPORTANTE!<br/>É possível aumentar a precisão da área de busca recuperando informações de computadores que ficam em tendas como a da figura abaixo:<br/><br/><img image='%2' width='367' height='256'/>", _imgMaleta, _imgTenda];
["criaTarefa", [_tarefaID, _tarefaPaiID], [_desc, "Maleta de inteligência", ""], "tipoMaleta"] spawn SMQTV_fnc_trataTarefas;

[_maleta, _centro, _marcador, _tarefaID] spawn SMQTV_fnc_configModificaArea;

//Aguarda a resolução da tarefa ou o cancelamento da Missão Principal
waitUntil {
	sleep 5;
	!alive _maleta
};

//Finaliza adversidades
terminate _monitora;

//Exclui as tarefas opcionais
_opcionais = _tarefaID call BIS_fnc_taskChildren;
_completo = false;
if (_opcionais isNotEqualTo []) then {
	{
		[_x, true, true] call BIS_fnc_deleteTask;
	} forEach _opcionais;
};

//Finaliza
["alteraEstadoTarefa", _tarefaID, "SUCCEEDED"] spawn SMQTV_fnc_trataTarefas;