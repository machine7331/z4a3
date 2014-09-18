this mission system has been renmaed to A3MS for the purpose of using in Arma 3 and creating a mission system on the Takistan (on Arma 3) )map.

Need to make sure all units, weapons, gear, item, vehicles are using classnames for ArmA 3.

to install, open your server_functions.sqf and put this line at the top:
		[]spawn { call compile preprocessFileLineNumbers "\z\addons\	arma 3 server path  \A3MS\A3MSInit.sqf";};