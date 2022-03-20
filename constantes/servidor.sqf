//Constantes clima
SMQTV_tempoDia = 5;
SMQTV_tempoNoite = 90;

//Variaveis da Missão Principal
inimigosAO			= [];
inimigosAA			= [];
civisAO				= [];
civis_mortos		= 0;
colateral			= false;
tarefasAO			= [];
areaTamanho			= [700, 700];
incrementoMP		= 0;

//--- Lista de classes de civis
LISTA_CIVIS = [];
private _configs = "
private _config = [_x, true] call BIS_fnc_returnParents;
(configName _x) find 'C_Man' > -1 && (configName _x) find 'Presence' == -1 && 'Civilian' in _config && 'CAManBase' in _config
" configClasses (configFile >> "CfgVehicles");
{
	LISTA_CIVIS pushBack (configName _x);
} forEach _configs;

//--- Lista de veículos civis
LISTA_VEICULOS_CIVIS = [];
_configs = "getText (_x >> 'faction') == 'CIV_F' && getText (_x >> 'editorSubcategory') == 'EdSubcat_Cars'" configClasses (configfile >> "CfgVehicles");
{
	LISTA_VEICULOS_CIVIS pushBack getText (_x >> "_generalMacro");
} forEach _configs;

//--- Tipo de jatos inimigos
SMQTV_jatosInimigos = [
	"O_Plane_CAS_02_dynamicLoadout_F",
	"O_Plane_Fighter_02_F",
	"O_Plane_Fighter_02_Stealth_F",
	"I_Plane_Fighter_03_dynamicLoadout_F",
	"I_Plane_Fighter_04_F"
];

//--- Lista de classes que usam metralhadoras automáticas
SMQTV_autoRiflemen = [
	"O_Soldier_AR_F",
	"O_soldierU_AR_F",
	"O_T_Soldier_AR_F",
	"O_G_Soldier_AR_F",
	"O_R_Soldier_AR_F",
	"O_HeavyGunner_F",
	"O_Urban_HeavyGunner_F",
	"I_Soldier_AR_F",
	"I_E_Soldier_AR_F"
];

//--- Tipos de reforços possíveis
REFORCO_TIPOS = [
	["Indep", "IND_F", "Infantry", "I_InfTeam_Light"],
	["East", "OPF_R_F", "SpecOps", "O_R_InfTeam"],
	["Indep", "IND_F", "Infantry", "HAF_InfSquad"],
	["Indep", "IND_C_F", "Infantry", "ParaShockTeam"],
	["Indep", "IND_L_F", "Infantry", "I_L_LooterGang"],
	["Indep", "IND_E_F", "Infantry", "I_E_InfSquad"]
];

//--- Objetos das tarefas
MALETAS_TIPOS = [
	"Land_PortableCabinet_01_4drawers_sand_F",
	"Land_PortableCabinet_01_bookcase_olive_F",
	"Land_PortableCabinet_01_medical_F",
	"Land_Suitcase_F",
	"Land_BatteryPack_01_open_black_F",
	"Land_MultiScreenComputer_01_closed_olive_F",
	"Land_MultiScreenComputer_01_sand_F",
	"Land_PlasticCase_01_small_black_CBRN_F",
	"Land_SatellitePhone_F"
];

TORRES_TIPOS = [
	"Land_TTowerBig_1_F",
	"Land_TTowerBig_2_F"
];

MINAS_TIPOS = [
	"APERSBoundingMine",
	"APERSMine"
];

IGREJAS_TIPOS = [
	"Land_Chapel_V1_F",
	"Land_Chapel_V2_F",
	"Land_Chapel_Small_V1_F",
	"Land_Chapel_Small_V2_F"
];

EXPLOSIVOS_TIPOS = [
	"SatchelCharge_F",
	"DemoCharge_F",
	"IEDUrbanBig_F",
	"IEDLandBig_F",
	"IEDUrbanSmall_F",
	"IEDLandSmall_F"
];

TORRESAGUA_TIPOS = [
	"Land_SM_01_reservoirTower_F",
	"Land_ReservoirTank_V1_F",
	"Land_ReservoirTank_Airport_F",
	"Land_ReservoirTank_Rust_F",
	"Land_ReservoirTower_F",
	"Land_ReservoirTank_01_military_F",
	"Land_WaterTower_02_F",
	"Land_WaterTower_01_F"
];

HANGARES_TIPOS = [
	"Land_Airport_01_hangar_F",
	"Land_Hangar_F"
];

DRONES_TIPOS = [
	"I_UAV_02_dynamicLoadout_F",
	"O_UAV_02_dynamicLoadout_F",
	"O_T_UAV_04_CAS_F"
];

ARAME_FARPADO =
[
	[
		["Land_Razorwire_F",[-12.8057,-2.51904,-2.38419e-006],60.0001,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[7.53076,-11.2441,-2.38419e-006],150,1,0,[0,-0],"","",true,false], 
		["Land_Razorwire_F",[-4.53662,-12.9727,-2.38419e-006],210,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[14.9229,-2.58643,-2.38419e-006],120,1,0,[0,-0],"","",true,false], 
		["Land_Razorwire_F",[4.53662,14.873,-2.38419e-006],30.0001,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[-7.53076,13.1445,-2.38419e-006],330,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[13.1943,7.48096,-2.38419e-006],60.0001,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[-14.9229,4.48682,-2.38419e-006],300,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[-15.2544,-5.23584,0],71.6588,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[6.1167,-15.6055,0],338.585,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[-16.1587,6.99854,0],113.447,1,0,[0,-0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[16.2832,6.87793,0],247.54,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[-7.19824,-16.4312,0],23.2476,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[-6.9502,16.6792,0],158.064,1,0,[0,-0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[17.0366,-6.89648,0],292.666,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_English_F",[7.17285,17.1167,0],203.25,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[-12.6484,-13.8032,-2.38419e-006],225,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[-15.2705,12.7754,-2.38419e-006],315,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[12.8252,15.2207,-2.38419e-006],45.0001,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[15.2705,-12.876,-2.38419e-006],135,1,0,[0,-0],"","",true,false], 
		["Land_Razorwire_F",[-1.729,20.0176,-2.38419e-006],0,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[-20.0674,-1.77881,-2.38419e-006],270,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[20.0684,1.67969,-2.38419e-006],90.0001,1,0,[0,-0],"","",true,false], 
		["Land_Razorwire_F",[1.729,-20.1172,-2.38419e-006],180,1,0,[0,0],"","",true,false]
	],
	[
		["Land_Mil_WiredFence_F",[-8.13281,-3.49268,-9.53674e-006],68.0452,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[6.23096,-6.81396,-9.53674e-006],318.727,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[-1.04541,9.4458,-9.53674e-006],177.488,1,0,[0,-0],"","",true,false], 
		["Land_Mil_WiredFenceD_F",[9.36865,4.88672,-9.53674e-006],254.793,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[-9.82178,4.72852,-9.53674e-006],115.725,1,0,[0,-0],"","",true,false], 
		["Land_Sign_MinesDanger_Greek_F",[-10.4829,-3.729,0],71.6167,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFenceD_F",[-3.46045,-10.5361,-9.53674e-006],20.1214,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesDanger_English_F",[13.4531,5.81445,0],251.972,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_Greek_F",[5.94434,14.0225,0],203.673,1,0,[0,0],"","",true,false], 
		["Land_Sign_MinesTall_Greek_F",[-5.56494,-14.4731,0],21.0337,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[11.4238,-10.6885,-9.53674e-006],315,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[-11.21,-11.3267,-9.53674e-006],45,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[0.00390625,15.9526,-9.53674e-006],180,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[16.0024,-0.0537109,-9.53674e-006],270,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[-16.0022,-0.0458984,-9.53674e-006],90,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[-0.00390625,-16.0522,-9.53674e-006],0,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[11.4263,11.2979,-9.53674e-006],225,1,0,[0,0],"","",true,false], 
		["Land_Mil_WiredFence_F",[-11.2007,11.9478,-9.53674e-006],135,1,0,[0,-0],"","",true,false]
	]
];

MALETA_TENDA =
[
	[
		['Land_MedicalTent_01_NATO_generic_open_F',[-1.65149,-1.36475,0],0,1,0,[],'','',true,false], 
		['Land_PCSet_Intel_02_F',[1.44702,-1.0271,0.828819],88.3653,1,0,[],'','',true,false], 
		['Land_Computer_01_black_F',[1.35327,-1.48657,0.828752],91.0912,1,0,[],'','',true,false], 
		['OfficeTable_01_new_F',[1.35254,-1.14331,6.67572e-006],88.794,1,0,[],'','',true,false], 
		['O_HMG_01_high_F',[-1.55261,2.75293,0.00171137],359.989,1,0,[],'','',true,false], 
		['O_HMG_01_high_F',[-1.73792,-4.70386,0.00171137],180.82,1,0,[],'','',true,false]
	]
];