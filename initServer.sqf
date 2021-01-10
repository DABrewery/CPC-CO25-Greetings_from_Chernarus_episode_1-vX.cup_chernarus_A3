//PLUTO Opfor
[
	blufor,		        //0 camp
	[1000,2000,6000],	//1 revealRange [man,land,air]
	[1500,2000,3000],	//2 sensorRange [man,land,air]
	120,			    //3 QRFtimeout
	[1000,2000,6000],	//4 QRFrange [man,land,air]
	[20,30,60],		    //5 QRFdelay [min,mid,max]
	240,			    //6 ARTYtimeout
	[20,30,60],		    //7 ARTYdelay [min,mid,max]
	[1,2,4],		    //8 ARTYrounds [min,mid,max]
	[0,40,100]		    //9 ARTYerror [min,mid,max]
] call GDC_fnc_pluto;

gdc_plutoDebug = false;

//On adapte le nombre d'hostiles par rapport au nombre de joueurs
nbJoueurs = playersNumber east;

/* Groups definition */
	private _fsl    = "rhsgref_cdf_b_reg_rifleman";
	private _lat    = "rhsgref_cdf_b_reg_rifleman_rpg75";
	private _aa     = "rhsgref_cdf_b_reg_specialist_aa";
	private _at     = "rhsgref_cdf_b_reg_grenadier_rpg" ;
	private _ass_at = "rhsgref_cdf_b_reg_rifleman";
	private _lmg    = "rhsgref_cdf_b_reg_machinegunner";
	private _mg     = "rhsgref_cdf_b_reg_machinegunner";
	private _ass_mg = "rhsgref_cdf_b_reg_rifleman";
	private _gl     = "rhsgref_cdf_b_reg_grenadier";
	private _tl     = "rhsgref_cdf_b_reg_squadleader";
	private _sl     = "rhsgref_cdf_b_reg_officer";
	private _medic  = "rhsgref_cdf_b_reg_medic";

// Groupes de max 4
GROUPE_BLUFOR_PETIT = [
	[_tl, _fsl, _fsl],
	[_tl, _lat, _fsl],
	[_tl, _lmg, _fsl],
	[_tl, _gl, _fsl],
	[_tl, _lat, _fsl, _fsl],
	[_tl, _lmg, _fsl, _fsl],
	[_tl, _gl, _lmg , _fsl],
	[_tl, _mg, _ass_mg, _fsl]
];
// Groupes de 8
GROUPE_BLUFOR_MOYEN = [
	[_tl, _lat, _lmg, _fsl, _fsl, _fsl, _fsl, _fsl],
	[_tl, _mg, _ass_mg, _fsl, _fsl, _fsl, _fsl, _fsl],
	[_tl, _gl, _lmg, _fsl, _fsl, _fsl, _fsl, _fsl]
];
// Groupe de 14
GROUPE_BLUFOR_GRAND = [
	[_sl, _medic, _tl, _at, _ass_at, _fsl, _fsl, _tl, _mg, _ass_mg, _fsl, _fsl, _tl, _gl]
];

//Spawn des hostiles
execVM "spawn_IA\spawnHostile_1.sqf";