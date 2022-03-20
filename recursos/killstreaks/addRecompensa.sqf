_commID = 0;
_sair = false;

switch (_this) do { 
	case 10 : {
		_commID = [player, "CAS", nil, nil, ""] call BIS_fnc_addCommMenuItem;
		[["Recursos", "CAS"],nil,nil,nil,nil,true,true] call BIS_fnc_advHint;
	};
	case 20 : {
		_commID = [player, "MK41", nil, nil, ""] call BIS_fnc_addCommMenuItem;
		[["Recursos", "MK41"],nil,nil,nil,nil,true,true] call BIS_fnc_advHint;
	};
	case 30 : {
		_commID = [player, "mandaChuva", nil, nil, ""] call BIS_fnc_addCommMenuItem;
		[["Recursos", "mandaChuva"],nil,nil,nil,nil,true,true] call BIS_fnc_advHint;
	};
	default {_sair = true}; 
};
if _sair exitWith {};

SMQTV_commsMenuItems pushBack _commID;
"SMQTV_ctrlF" cutRsc ["Rsc_SMQTV_CtrlF", "PLAIN", -1, false];