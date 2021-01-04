//Le nom de la zone qui sera utilisé pour tous les spawns 
private _zn = "StationRadar";
private _grpGarn = objNull;
private _nbPat = objNull;
private _probaManedFW = objNull;

switch true do {
		case (nbJoueurs < 19): {
			//16 pax en garnison (+ 8 sur les miradors)
			_grpGarn = GROUPE_BLUFOR_MOYEN;
			//Entre 9 et 16 pax en patrouille
			_nbPat = [3,4];
			//Proba arme fixe occupée au départ 
			_probaManedFW = 0.6;
		};
		case (nbJoueurs > 18 && nbJoueurs < 23): {
			//16 pax en garnison (+ 8 sur les miradors)
			_grpGarn = GROUPE_BLUFOR_MOYEN;
			//Entre 12 et 20 pax en patrouille
			_nbPat = [4,5];
			//Proba arme fixe occupée au départ 
			_probaManedFW = 0.8;
		};
		case (nbJoueurs > 22): {
			//16 pax en garnison (+ 8 sur les miradors)
			_grpGarn = GROUPE_BLUFOR_MOYEN;
			//Entre 15 et 24 pax en patrouille
			_nbPat = [5,6];
			//Proba arme fixe occupée au départ 
			_probaManedFW = 1;
		}; 
};

//Spawn des patrouilles
[_zn,_nbPat,GROUPE_BLUFOR_PETIT,blufor] spawn int_fnc_spawnRdmPatrols;

//Spawn des garnisons
[_zn,_grpGarn, blufor, nil, nil, 0.1, 0.5] spawn int_fnc_spawnGarnisons;

//Spawn des armes fixes
[_zn,blufor,"RHS_M2StaticMG_D","rhs_vmf_flora_rifleman",1,_probaManedFW,0.8] spawn int_fnc_spawnFixedWeapons;