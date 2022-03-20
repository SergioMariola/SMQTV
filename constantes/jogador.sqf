COR_AMARELO			= [0.85,0.85,0,1] call BIS_fnc_colorRGBtoHTML;
COR_VERMELHO		= [1,0,0,1] call BIS_fnc_colorRGBtoHTML;
COR_AZUL			= [0.301961,0.301961,1,1] call BIS_fnc_colorRGBtoHTML;
COR_VERDE			= [0.2,0.8,0.2,1] call BIS_fnc_colorRGBtoHTML;
COR_KHAKI			= [0.5,0.6,0.4,1] call BIS_fnc_colorRGBAtoHTML;
COR_CORAL			= [0.901961,0.541177,0,1] call BIS_fnc_colorRGBAtoHTML;
LISTA_PILOTOS		= ["B_Fighter_Pilot_F", "B_Helipilot_F"];
SMQTV_sons			= [
	//0 ---Selecionar destino
	[
		"BIS_WL_Destination_EAST",
		"BIS_WL_Destination_WEST",
		"BIS_WL_Dropzone_EAST",
		"BIS_WL_Dropzone_WEST"
	],
	//1 ---Destino selecionado
	[
		"BIS_WL_Fast_travel_WEST",
		"BIS_WL_Fast_travel_EAST"
	],
	//2 ---Ação cancelada
	[
		"BIS_WL_Canceled_WEST",
		"BIS_WL_Canceled_EAST"
	],
	//3 ---Flyby de jatos
	[
		"BattlefieldJet1_3D",
		"BattlefieldJet2_3D",
		"BattlefieldJet3_3D"
	],
	//4 ---Chamar médico
	[
		"medic_heavy",
		"medic_scout",
		"medic_medic",
		"medic_soldier",
		"medic_sniper"
	],
	//5 ---Ping médico
	[
		"RscDisplayCurator_ping01",
		"RscDisplayCurator_ping02",
		"RscDisplayCurator_ping03",
		"RscDisplayCurator_ping04",
		"RscDisplayCurator_ping05",
		"RscDisplayCurator_ping06",
		"RscDisplayCurator_ping07"
	]
];
SMQTV_radio	= [
	//0 ---Solicita TacStrike
	[
		"mp_groundsupport_70_tacticalstrikeinbound_BHQ_0",
		"mp_groundsupport_70_tacticalstrikeinbound_IHQ_0",
		"mp_groundsupport_70_tacticalstrikeinbound_BHQ_1",
		"mp_groundsupport_70_tacticalstrikeinbound_IHQ_1",
		"mp_groundsupport_70_tacticalstrikeinbound_BHQ_2",
		"mp_groundsupport_70_tacticalstrikeinbound_IHQ_2",
		"mp_groundsupport_70_tacticalstrikeinbound_BHQ_3",
		"mp_groundsupport_70_tacticalstrikeinbound_IHQ_3",
		"mp_groundsupport_70_tacticalstrikeinbound_BHQ_4",
		"mp_groundsupport_70_tacticalstrikeinbound_IHQ_4"
	],
	//1 ---Solicita artilharia
	[
		"mp_groundsupport_45_artillery_BHQ_0",
		"mp_groundsupport_45_artillery_IHQ_0",
		"mp_groundsupport_45_artillery_BHQ_1",
		"mp_groundsupport_45_artillery_IHQ_1",
		"mp_groundsupport_45_artillery_BHQ_2",
		"mp_groundsupport_45_artillery_IHQ_2"
	],
	//2 ---Solicita CAS
	[
		"mp_groundsupport_50_cas_BHQ_0",
		"mp_groundsupport_50_cas_IHQ_0",
		"mp_groundsupport_50_cas_BHQ_1",
		"mp_groundsupport_50_cas_IHQ_1",
		"mp_groundsupport_50_cas_BHQ_2",
		"mp_groundsupport_50_cas_IHQ_2"
	],
	//3 ---Requisita transporte
	[
		"mp_groundsupport_01_transportrequested_BHQ_0",
		"mp_groundsupport_01_transportrequested_IHQ_0",
		"mp_groundsupport_01_transportrequested_BHQ_1",
		"mp_groundsupport_01_transportrequested_IHQ_1",
		"mp_groundsupport_01_transportrequested_BHQ_2",
		"mp_groundsupport_01_transportrequested_IHQ_2"
	],
	//4 ---Veículo destruído
	[
		"mp_groundsupport_10_vehicleterminated_BHQ_0",
		"mp_groundsupport_10_vehicleterminated_OHQ_0",
		"mp_groundsupport_10_vehicleterminated_IHQ_0",
		"mp_groundsupport_10_vehicleterminated_BHQ_1",
		"mp_groundsupport_10_vehicleterminated_OHQ_1",
		"mp_groundsupport_10_vehicleterminated_IHQ_1",
		"mp_groundsupport_10_vehicleterminated_BHQ_2",
		"mp_groundsupport_10_vehicleterminated_OHQ_2",
		"mp_groundsupport_10_vehicleterminated_IHQ_2"
	],
	//5 ---Todos a bordo
	[
		"mp_groundsupport_10_boardingended_BHQ_0",
		"mp_groundsupport_10_boardingended_BHQ_1",
		"mp_groundsupport_10_boardingended_BHQ_2",
		"mp_groundsupport_10_boardingended_IHQ_0",
		"mp_groundsupport_10_boardingended_IHQ_1",
		"mp_groundsupport_10_boardingended_IHQ_2"
	]
];

//Ícones 2D/3D
SMQTV_maxDist3D		= profilenamespace getvariable ["SMQTV_maxDist3D", 300];
SMQTV_nomeTam3D		= profilenamespace getvariable ["SMQTV_nomeTam3D", 0.03];
SMQTV_ind3D			= profilenamespace getvariable ["SMQTV_ind3D", -1];
SMQTV_ind3DSair		= profilenamespace getvariable ["SMQTV_ind3DSair", false];
SMQTV_corGrupo  	= getArray (configfile >> "CfgInGameUI" >> "SideColors" >> "colorFriendly");
SMQTV_corGrupo set [3, 0.8];
SMQTV_corTime   	= [profilenamespace getvariable ['Map_BLUFOR_R', 0], profilenamespace getvariable ['Map_BLUFOR_G', 1], profilenamespace getvariable ['Map_BLUFOR_B', 1], profilenamespace getvariable ['Map_BLUFOR_A', 0.8]];

//Dano
SMQTV_trataDano		= 0;