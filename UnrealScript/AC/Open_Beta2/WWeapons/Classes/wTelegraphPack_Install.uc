class wTelegraphPack_Install extends wTelegraphPack;

var name m_naAnim_StopPlant;
var string m_FmodSound_Putdown_Plant;
var string m_FmodSound_Putdown_Defuse;
var bool m_bPlayedPutdownSound;
var name m_Anim_Test;

simulated function bool UseWeapon()
{
    // End:0x41
    if(false == Instigator.Controller.ActivateSupplyItem(Instigator.Controller, 4))
    {
        FireMode[0].StopFiring();
        return false;
    }
    // End:0x60
    if(false == (InstallPack()))
    {
        FireMode[0].StopFiring();
        return false;
    }
    ChangePrevWeapon();
    ServerDestroy();
    return true;
    //return;    
}

function ServerDestroy()
{
    Instigator.Controller.SkillBase.RemoveSupplyItem(4);
    Destroy();
    //return;    
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    super(wWeapon).BringUp(PrevWeapon);
    ClientState = 4;
    m_bPlayedPutdownSound = false;
    switch(BaseParams.eType)
    {
        // End:0x4B
        case 19:
            wWeaponFireInstallPack(FireMode[0]).byFirstTick = 0;
            // End:0x4E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function bool IsCanUseWeapon()
{
    return true;
    //return;    
}

simulated function bool PutDown()
{
    local bool bPlant;

    // End:0x1B
    if(0 == int(byActionThrowsWeapon))
    {
        PutDownAnim = PutDownAnim;        
    }
    else
    {
        PutDownAnim = m_naAnim_Plant;
        bPlant = true;
    }
    // End:0x3C
    if(super(wWeapon).PutDown() == false)
    {
        return false;
    }
    // End:0x10C
    if(m_bPlayedPutdownSound == false)
    {
        // End:0xAC
        if(bPlant)
        {
            Instigator.FmodPlaySoundUseID(m_FmodSound_Putdown_Plant, 3, FireMode[0].FireAnimRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);            
        }
        else
        {
            Instigator.FmodPlaySoundUseID(m_FmodSound_Putdown_Defuse, 3, FireMode[0].FireAnimRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        }
        m_bPlayedPutdownSound = true;
    }
    return true;
    //return;    
}

simulated function PlayPlantAnimation()
{
    // End:0x1D
    if(HasAnim(m_naAnim_Plant))
    {
        PlayAnim(m_naAnim_Plant, PutDownAnimRate, 0.0000000);
    }
    //return;    
}

simulated function StopPlantAnimation()
{
    // End:0x1D
    if(HasAnim(m_naAnim_StopPlant))
    {
        PlayAnim(m_naAnim_StopPlant, PutDownAnimRate, 0.0000000);
    }
    //return;    
}

function bool InstallPack()
{
    local DeathMatch DeathMatch;
    local Pawn Pawn;
    local Vector v3RegenLocation;
    local string strNPCID;
    local int iTeamID;

    Pawn = Pawn(Owner);
    DeathMatch = DeathMatch(Pawn.Level.Game);
    v3RegenLocation = Pawn.Location;
    switch(BaseParams.eType)
    {
        // End:0x68
        case 19:
            strNPCID = string(200);
            // End:0x6B
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xC3
    if(none != Instigator.Controller.PlayerReplicationInfo.Team)
    {
        iTeamID = Instigator.Controller.PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamID = Instigator.Controller.PlayerReplicationInfo.TeamID;
    }
    DeathMatch.AddwAIBot("1", string(iTeamID), "WGame.wAISentryGunController", "0", strNPCID,, Pawn.Controller, true, v3RegenLocation, true);
    return true;
    //return;    
}

defaultproperties
{
    m_naAnim_StopPlant="PlantStop"
    m_FmodSound_Putdown_Plant="Warfare_Sound_Weapon/ETC/DemolitionPack/demolition_plant_d"
    m_FmodSound_Putdown_Defuse="Warfare_Sound_Weapon/ETC/DemolitionPack/demolition_defuse_d"
    m_naAnim_Plant="plant"
    IdleAnim="SentryG_Idle"
    InventoryGroup=6
}