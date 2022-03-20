params ["_displayOrControl", ["_config", configNull]];

if !(player inArea "baseArea") exitWith {
	["Você precisa estar na base para alterar sua insígnia", "vermelho"] spawn SMQTV_fnc_barraAviso;
	_displayOrControl closeDisplay 2;
};

player allowDamage false;

private _lista = _displayOrControl displayCtrl 2100;
private _array = [];
private _index = 0;
private _classes = "true" configClasses (missionConfigFile >> "CfgUnitInsignia");
private _insignias = [];
{
	_insignias pushBack [configName _x, getText (_x >> "texture")];		/* ["Brasil", "caminho\imagem.paa"] */

} forEach _classes;

//Preenche lista com insígnias personalizadas
_lista lbAdd "||--== Este Servidor ==--||";
_array pushBack "||--== Este Servidor ==--||";

{
	_index = _lista lbAdd (_x select 0);
	_lista lbSetData [_index, _x select 0];
	_lista lbSetPicture [_index, _x select 1];
	_array pushBack (_x select 0);
} forEach _insignias;

_lista lbAdd "||--== BIS ==--||";
_array pushBack "||--== BIS ==--||";

//Preenche lista com insígnias vanilla
_classes = "true" configClasses (configFile >> "CfgUnitInsignia");
_insignias = [];
{
	_insignias pushBack [configName _x, getText (_x >> "texture")];		/* ["Brasil", "caminho\imagem.paa"] */

} forEach _classes;
{
	_index = lbSize _lista;
	_lista lbAdd (_x select 0);
	_lista lbSetData [_index, _x select 0];
	_lista lbSetPicture [_index, _x select 1];
	_array pushBack (_x select 0);
} forEach _insignias;

private _insignia = profileNamespace getVariable ["SMQTV_insignia", "Brasil"];
_lista lbSetCurSel ( _array findIf { _x isEqualTo _insignia } );

//Sai se jogador estiver num veículo
private _veiculo = objectParent player;
if (!isNull _veiculo) exitWith {};

//Desfoque
[] spawn SMQTV_fnc_cancelaDesfoque;

//Cria câmera
private _camera = "camera" camCreate getPosATL player;
_camera cameraEffect ["internal", "back"];
_camera camPrepareTarget player;
_camera camCommitPrepared 0;
_camera camPrepareRelPos [-1,1,1.6];
_camera camCommitPrepared 0;


uiNamespace setVariable ["SMQTV_insigniaCam", _camera];