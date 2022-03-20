params ["_control", "_checked"];

private _display = ctrlParent _control;
private _distSlider = _display displayCtrl 1900;
private _nomeSlider = _display displayCtrl 1901;

switch (_checked) do { 
	case 0 : {
		removeMissionEventHandler ["Draw3D", SMQTV_ind3D];
		profileNamespace setVariable ["SMQTV_ind3D", -1];
		profileNamespace setVariable ["SMQTV_ind3DSair", true];
		SMQTV_ind3D = -1;
		SMQTV_ind3DSair = true;
		_distSlider ctrlEnable false;
		_nomeSlider ctrlEnable false;
	}; 
	case 1 : {
		SMQTV_ind3DSair = false;
		SMQTV_ind3D = call SMQTV_fnc_ind3DInf;
		profileNamespace setVariable ["SMQTV_ind3D", SMQTV_ind3D];
		profileNamespace setVariable ["SMQTV_ind3DSair", false];
		_distSlider ctrlEnable true;
		_nomeSlider ctrlEnable true;
	}; 
	default {}; 
};