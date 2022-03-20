params ["_displayOrControl", ["_config", configNull]];

private _foto1 = getText (configfile >> "CfgVehicles" >> "B_Plane_CAS_01_dynamicLoadout_F" >> "picture");
private _foto2 = getText (configfile >> "CfgHints" >> "GroundSupport" >> "GS_TacticalStrikes" >> "image");

{
    _displayOrControl lbAdd _x;
    _displayOrControl lbSetPicture [_forEachIndex, _foto1];
    _displayOrControl lbSetPictureRight [_forEachIndex, _foto2];
    _displayOrControl lbSetData [_forEachIndex, _x];
} forEach ["Canhão 30mm", "Mísseis", "Mísseis e Canhão 30mm", "GBU-12"];  //A ordem desta lista rege a ordem de indexação das opções, portanto, o tipo de suporte