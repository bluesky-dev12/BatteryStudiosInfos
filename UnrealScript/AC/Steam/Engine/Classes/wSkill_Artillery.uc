/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_Artillery.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class wSkill_Artillery extends wSkill;

var int iMinimulKills;
var int iGapKills;

simulated function PostBeginPlay()
{
    local bool bAdd;
    local int iTemp;

    // End:0x4b
    if(AttachWeaponID == -1 || IsEnable == true || Base.Owner.PlayerReplicationInfo.Kills < iMinimulKills)
    {
        return;
    }
    bAdd = false;
    iTemp = Base.Owner.PlayerReplicationInfo.Kills / iGapKills;
    // End:0x99
    if(iTemp > byAddCount)
    {
        bAdd = true;
    }
    // End:0xdf
    if(bAdd == true)
    {
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        SetIsEnable(true);
        SetbUpdateCall(true);
    }
}

simulated function UpdateProcess()
{
    // End:0xc2
    if(bUpdateCall == false && Base.Owner.PlayerReplicationInfo.Kills >= iMinimulKills && byAddCount < Base.Owner.PlayerReplicationInfo.Kills / iGapKills)
    {
        // End:0xbb
        if(Base.Owner.Role == 4)
        {
            Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        }
        SetbUpdateCall(true);
    }
}

simulated function UsedbyWeapon()
{
    SetbyAddCount(byte(Base.Owner.PlayerReplicationInfo.Kills / iGapKills));
    SetbUpdateCall(false);
}

defaultproperties
{
    iMinimulKills=20
    iGapKills=10
}