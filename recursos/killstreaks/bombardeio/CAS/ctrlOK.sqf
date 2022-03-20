params ["_control"];

private _display = ctrlParent _control;
private _lista = _display displayCtrl 1500;
private _opcaoLista = lbCurSel _lista;

if (_opcaoLista < 0) exitWith {
    ["naoImportante", "Nenhuma opção selecionada", 0.4] call SMQTV_fnc_cutText;
	false
};

//Verifica disponibilidade do recurso
private _emUso = missionNamespace getVariable ["SMQTV_casEmUso", false];
if (_emUso) exitWith {
	_texto = "Este recurso está sendo utilizado por outro jogador<br/><t size='1.3'>Tente novamente em alguns instantes</t>";
	["importante", _texto] call SMQTV_fnc_cutText;
    closeDialog 1;
};

//Inicia bombardeio
private _descricao = _lista lbData _opcaoLista;
private _params = uiNamespace getVariable ["SMQTV_bombardeioParams", []];
_params pushBack _opcaoLista;
_params pushBack _descricao;
_params remoteExec ["SMQTV_fnc_iniciaCAS", 2];

//Remove suporte para o jogador
[_params select 0, _params select 4] call SMQTV_fnc_removeCommMenuItem;

//Fecha janela
closeDialog 1;