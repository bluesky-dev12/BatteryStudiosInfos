/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBTR_Turret_FNM240_DF.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wBTR_Turret_FNM240_DF extends wBTR_Turret_FNM240;

function Reset()
{
    bResetting = true;
    bEnabled = BACKUP_bEnabled;
    BlockCount = 0;
    bResetting = false;
}

defaultproperties
{
    VehicleClass=class'wTurret_FNM240_DF'
}