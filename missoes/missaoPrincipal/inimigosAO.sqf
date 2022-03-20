params ["_centro"];

//--- Infantaria
[3, _centro, east, ["Indep", "IND_E_F", "Infantry", "I_E_InfSquad"], "aoArea"] spawn SMQTV_fnc_criaInimigos;
sleep 1;
[3, _centro, east, ["Indep", "IND_C_F", "Infantry", "BanditCombatGroup"], "aoArea"] spawn SMQTV_fnc_criaInimigos;
sleep 1;
[2, _centro, east, ["Indep", "IND_F", "Infantry", "HAF_InfSquad_Weapons"], "aoArea"] spawn SMQTV_fnc_criaInimigos;
sleep 1;
[2, _centro, east, ["Indep", "IND_G_F", "Infantry", "I_G_InfTeam_Light"], "aoArea"] spawn SMQTV_fnc_criaInimigos;
sleep 1;
[2, _centro, east, ["Indep", "IND_G_F", "Infantry", "I_G_InfTeam_Light"], "aoArea"] spawn SMQTV_fnc_criaInimigos;
sleep 1;

//--- Infantaria motorizada
[1, _centro, east, ["Indep", "IND_F", "Mechanized", "HAF_MechInf_Support"], "aoArea"] spawn SMQTV_fnc_criaInimigos;
sleep 1;
[1, _centro, east, ["Indep", "IND_E_F", "Mechanized", "I_E_MechInfSquad"], "aoArea"] spawn SMQTV_fnc_criaInimigos;
sleep 1;
[1, _centro, east, ["Indep", "IND_F", "SpecOps", "HAF_AttackTeam_UGV"], "aoArea"] spawn SMQTV_fnc_criaInimigos;

//--- Inimigos dentro de casas
[nil, _centro, east, [], "aoCasas"] spawn SMQTV_fnc_criaInimigos;