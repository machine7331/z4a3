/*
	A3MSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
A3MSBanditSkins = ["O_Soldier_F",
"O_Soldier_AR_F",
"O_medic_F",
"O_engineer_F",
"O_soldier_exp_F",
"O_Soldier_GL_F",
"O_soldier_M_F",
"O_officer_F",
"O_Soldier_F",
"O_Soldier_LAT_F",
"O_Soldier_lite_F",
"O_Soldier_SL_F",
"O_Soldier_TL_F",
"O_soldier_UAV_F",
"O_Pilot_F"];

////////////////////////
// Array of AI Skills
A3MSSkills1 = [
["aimingAccuracy",0.60],
["aimingShake",0.60],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

A3MSSkills2 = [
["aimingAccuracy",0.15],
["aimingShake",0.20],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

A3MSSkills3 = [
["aimingAccuracy",0.60],
["aimingShake",0.60],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
A3MSWeps1 = [
"Weapon_LMG_Zafir_F","Weapon_arifle_Mk20_plain_F","Weapon_SMG_02_F","Weapon_arifle_Mk20C_plain_F",
"Weapon_arifle_Mk20_GL_plain_F","Weapon_SMG_01_F","Weapon_hgun_PDW2000_F","Weapon_hgun_Rook40_F","Weapon_arifle_Mk20_GL_plain_F"
];

A3MSWeps2 = [
"Weapon_srifle_GM6_F","Weapon_arifle_MXM_F","Weapon_srifle_DMR_01_F","Weapon_arifle_MX_SW_F","Weapon_LMG_Mk200_F",
"Weapon_srifle_EBR_F","Weapon_srifle_LRR_camo_F","Weapon_arifle_Katiba_C_F","Weapon_hgun_Pistol_heavy_02_F","Weapon_launch_RPG32_F"
];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
A3MSGear0 = [
["FirstAidKit"]
];

A3MSGear1 = [
["FirstAidKit"]
];

A3MSGear2 = [
["FirstAidKit"]
];

A3MSGear3 = [
["FirstAidKit"]
];

A3MSGear4 = [
["FirstAidKit"]
];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
A3MSPacklist = [
"B_FieldPack_cbr","B_FieldPack_oucamo","B_AssaultPack_blk","B_Carryall_mcamo","B_Kitbag_rgr"
];