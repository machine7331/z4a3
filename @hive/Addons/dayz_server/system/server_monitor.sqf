[]execVM "\z\addons\dayz_server\system\s_fps.sqf"; //server monitor FPS (writes each ~181s diag_fps+181s diag_fpsmin*)

dayz_versionNo = 		getText(configFile >> "CfgMods" >> "dayz" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "dayz" >> "hiveVersion");
_script = getText(missionConfigFile >> "onPauseScript");

if ((count playableUnits == 0) and !isDedicated) then {
	isSinglePlayer = true;
};

waitUntil{initialized}; //means all the functions are now defined

diag_log "HIVE: Starting";

//Set the Time
	//Send request
	_key = "CHILD:307:";
	_result = _key call server_hiveReadWrite;
	_outcome = _result select 0;
	if(_outcome == "PASS") then {
		_date = _result select 1;
		
		//date setup
		_year = _date select 0;
		_month = _date select 1;
		_day = _date select 2;
		_hour = _date select 3;
		_minute = _date select 4;
		
		//Force full moon nights
		_date = [2012,6,6,_hour,_minute];
		
		if(isDedicated) then {
			//["dayzSetDate",_date] call broadcastRpcCallAll;
			setDate _date;
			dayzSetDate = _date;
			publicVariable "dayzSetDate";
		};
		diag_log ("HIVE: Local Time set to " + str(_date));
	};

//	if (_script != "") then
//	{
//		diag_log "MISSION: File Updated";
//	} else {
//		diag_log "MISSION: File Needs Updating";
//	};

	//Stream in objects
	/* STREAM OBJECTS */
		//Send the key
		_key = format["CHILD:302:%1:",dayZ_instance];
		_result = _key call server_hiveReadWrite;

		diag_log "HIVE: Request sent";
		
		//Process result
		_status = _result select 0;
		
		_myArray = [];
		if (_status == "ObjectStreamStart") then {
			_val = _result select 1;
			//Stream Objects
			diag_log ("HIVE: Commence Object Streaming...");
			for "_i" from 1 to _val do {
				_result = _key call server_hiveReadWrite;

				_status = _result select 0;
				_myArray set [count _myArray,_result];
				//diag_log ("HIVE: Loop ");
			};
			//diag_log ("HIVE: Streamed " + str(_val) + " objects");
		};
	
		_countr = 0;		
		{
				
			//Parse Array
			_countr = _countr + 1;
		
			_idKey = 	_x select 1;
			_type =		_x select 2;
			_ownerID = 	_x select 3;
			_worldspace = _x select 4;
			_intentory=	_x select 5;
			_hitPoints=	_x select 6;
			_fuel =		_x select 7;
			_damage = 	_x select 8;

			_dir = 0;
			_pos = [0,0,0];
			_wsDone = false;			
			if (count _worldspace >= 2) then
			{
				_dir = _worldspace select 0;
				if (count (_worldspace select 1) == 3) then {
					_pos = _worldspace select 1;
					_wsDone = true;
				}
			};
			
			if (!_wsDone) then {
				if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
				_objectPos = [_worldspace select 1 select 0,_worldspace select 1 select 1,0];		
				_pos = [(_objectPos),0,15,1,0,2000,0,[],[_objectPos,[]]] call BIS_fnc_findSafePos;
				if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
				diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
			};
			
			if (_damage < 1) then {
				diag_log format["OBJ: %1 - %2", _idKey,_type];
				
				//Create it
				_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
				_object setVariable ["lastUpdate",time];
				_object setVariable ["ObjectID", _idKey, true];
				_object setVariable ["CharacterID", _ownerID, true];
				
				clearWeaponCargoGlobal  _object;
				clearMagazineCargoGlobal  _object;
				
				if (_object isKindOf "TentStorage") then {
					_pos set [2,0];
					_object setpos _pos;
					_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
				};
				if (_object isKindOf "garage_repart") then {
					_pos set [2,0];
					_object setpos _pos;
					_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
					_code = _fuel * 1000; //it is necessary cause we get only the converted fuel variable from the database, so we got to calculate back to code format
                    _object setVariable ["Code", _code,true];
				};
				_object setdir _dir;
				_object setDamage _damage;
				
				if (count _intentory > 0) then {
					//Add weapons
					_objWpnTypes = (_intentory select 0) select 0;
					_objWpnQty = (_intentory select 0) select 1;
					_countr = 0;					
					{
						if (_x == "Crossbow") then { _x = "Crossbow_DZ" }; // Convert Crossbow to Crossbow_DZ
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgWeapons" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes; 
					
					//Add Magazines
					_objWpnTypes = (_intentory select 1) select 0;
					_objWpnQty = (_intentory select 1) select 1;
					_countr = 0;
					{
						if (_x == "BoltSteel") then { _x = "WoodenArrow" }; // Convert BoltSteel to WoodenArrow
						_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgMagazines" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes;

					//Add Backpacks
					_objWpnTypes = (_intentory select 2) select 0;
					_objWpnQty = (_intentory select 2) select 1;
					_countr = 0;
					{
						_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgVehicles" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes;
					
					//Add Items
					_objWpnTypes = (_intentory select 3) select 0;
					_objWpnQty = (_intentory select 3) select 1;
					_countr = 0;
					{
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgWeapons" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addItemCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes;
				};	
				
				if (_object isKindOf "AllVehicles") then {
					{
						_selection = _x select 0;
						_dam = _x select 1;
						if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
						[_object,_selection,_dam] call object_setFixServer;
					} forEach _hitpoints;
					_object setvelocity [0,0,1];
					_object setFuel _fuel;
					_object call fnc_vehicleEventHandler;
					//Updated object position if moved
					if (!_wsDone) then {
						[_object, "position"] call server_updateObject;
					};
				};

				//Monitor the object
				//_object enableSimulation false;
				dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];
			};
		} forEach _myArray;
		
	// # END OF STREAMING #
	
	createCenter civilian;
	if (isDedicated) then {
		endLoadingScreen;
	};	
	
if (isDedicated) then {
	_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
};

call compile preprocessFileLineNumbers "\z\addons\invasion_server\A3MS\A3MSMSInit.sqf";		//A3MS initialize
allowConnection = true;
// [_guaranteedLoot, _randomizedLoot, _frequency, _variance, _spawnChance, _spawnMarker, _spawnRadius, _spawnFire, _fadeFire]
nul = [4, 4, (30 * 60), (5 * 60), 1.00, 'center', 5000, true, false] spawn server_spawnCrashSite;

