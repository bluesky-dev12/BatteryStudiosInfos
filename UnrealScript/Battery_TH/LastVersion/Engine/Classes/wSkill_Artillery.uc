class wSkill_Artillery extends wSkill;

var int iMinimulKills;
var int iGapKills;

simulated function PostBeginPlay()
{
    local bool bAdd;
    local int iTemp;

    // End:0x4B
    if(((AttachWeaponID == -1) || IsEnable == true) || Base.Owner.PlayerReplicationInfo.Kills < iMinimulKills)
    {
        return;
    }
    bAdd = false;
    iTemp = Base.Owner.PlayerReplicationInfo.Kills / iGapKills;
    // End:0x99
    if(iTemp > int(byAddCount))
    {
        bAdd = true;
    }
    // End:0xDF
    if(bAdd == true)
    {
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        SetIsEnable(true);
        SetbUpdateCall(true);
    }
    //return;    
}

simulated function UpdateProcess()
{
    // End:0xC2
    if(((bUpdateCall == false) && Base.Owner.PlayerReplicationInfo.Kills >= iMinimulKills) && int(byAddCount) < (Base.Owner.PlayerReplicationInfo.Kills / iGapKills))
    {
        // End:0xBB
        if(int(Base.Owner.Role) == int(ROLE_Authority))
        {
            Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        }
        SetbUpdateCall(true);
    }
    //return;    
}

simulated function UsedbyWeapon()
{
    SetbyAddCount(byte(Base.Owner.PlayerReplicationInfo.Kills / iGapKills));
    SetbUpdateCall(false);
    //return;    
}

defaultproperties
{
    iMinimulKills=20
    iGapKills=10
}