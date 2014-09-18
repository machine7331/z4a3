/*
	Usage: [_crate,"type"] execVM "dir\A3MSBox.sqf";
		_crate is the crate to fill
		"type" is the type of crate
		"type" can be weapons or medical
		Edited for Arma 3 by JediChris816
*/
_crate = _this select 0;
_type = _this select 1;

// Clear the current cargo
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// Define lists. Some lists are defined in A3MSWeaponCrateList.sqf in the ExtConfig.
_bpackList = ["B_FieldPack_cbr","B_FieldPack_oucamo","B_AssaultPack_blk","B_Carryall_mcamo","B_Kitbag_rgr"];
_gshellList = ["ATMine","chemlight_red","SatchelCharge_F"];
_medical = ["FirstAidKit"];
_money = ["ItemSilverBar","ItemSilverBar10oz","ItemGoldBar","ItemGoldBar10oz"];

//////////////////////////////////////////////////////////////////
// Medical Crates
if (_type == "medical") then {
	// load medical
	_scount = count _medical;
	for "_x" from 0 to 40 do {
		_sSelect = floor(random _sCount);
		_item = _medical select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
};

///////////////////////////////////////////////////////////////////
// Weapon Crates
if (_type == "weapons") then {
	// load grenades
	_scount = count _gshellList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = _gshellList select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
   
	// load packs
	_scount = count _bpackList;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _bpackList select _sSelect;
		_crate addBackpackCargoGlobal [_item,1];
	};
	 
	// load pistols
	_scount = count A3MSpistolList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = A3MSpistolList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	//load sniper
	_scount = count A3MSsniperList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = A3MSsniperList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	//load mg
	_scount = count A3MSmgList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = A3MSmgList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	//load primary
	_scount = count A3MSprimaryList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = A3MSprimaryList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};
};

///////////////////////////////////////////////////////////////////
// Epoch Supply Crates
if (_type == "supply") then {
	// load tools
	_scount = count A3MSConTools;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = A3MSConTools select _sSelect;
		_crate addWeaponCargoGlobal [_item, 1];
	};
	
	// load construction
	_scount = count A3MSConSupply;
	for "_x" from 0 to 30 do {
		_sSelect = floor(random _sCount);
		_item = A3MSConSupply select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};

///////////////////////////////////////////////////////////////////
// Epoch Money Crates
if (_type == "money") then {
	// load money
	_scount = count _money;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _money select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};