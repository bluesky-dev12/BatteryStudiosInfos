class wBTR_Turret_FNM240_DF extends wBTR_Turret_FNM240;

function Reset()
{
    bResetting = true;
    bEnabled = BACKUP_bEnabled;
    BlockCount = 0;
    bResetting = false;
    //return;    
}

defaultproperties
{
    VehicleClass=Class'WGame_Decompressed.wTurret_FNM240_DF'
}