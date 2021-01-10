/* Envoie un groupe rejoindre son véhicule */


// On vérifie une variable globale pour éviter de déclencher le script plusieurs fois

if !(alerteGo) then {
	
	alerteGo = true;
	
	private _goGrp = {
		params [
			"_grp",
			"_veh",
			["_mrk", ""],
			["_typeWp", ""]
		];
		{_x enableAI "PATH"} forEach units _grp;
		_grp setBehaviour "CARELESS";
		_grp setCombatMode "BLUE";
		_grp setSpeedMode "FULL";
		_grp addVehicle _veh;
		units _grp ordergetin true;

		if !(_mrk=="") then {
			while {vehicle leader _grp == leader _grp} do {sleep 0.5};
			_wp = (_grp) addWaypoint [getMarkerPos _mrk, 0];
			_wp setWaypointType _typeWp;
		};

		_grp setBehaviour "SAFE";
		_grp setCombatMode "YELLOW";
		_grp setSpeedMode "FULL";
	};
	
	[grp_heli_1,heli_1, "mrk_wp_heli_1", "SAD"] spawn _goGrp;
	
	[grp_mbt_1, mbt_1, "mrk_wp_mbt_1", "SAD"] spawn _goGrp;
	[grp_mbt_2, mbt_2, "mrk_wp_mbt_2", "MOVE"] spawn _goGrp;
	[grp_mbt_3, mbt_3, "mrk_wp_mbt_3", "MOVE"] spawn _goGrp;
	[grp_mbt_4, mbt_4, "mrk_wp_mbt_4", "MOVE"] spawn _goGrp;
	
	[grp_ifv_1, ifv_1, "mrk_wp_ifv_1", "SAD"] spawn _goGrp;

	{_x enableAI "PATH"} forEach units grp_guard_1;
	{_x enableAI "PATH"} forEach units grp_guard_2;

}