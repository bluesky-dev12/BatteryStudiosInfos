/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_SatchelCharge.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class wSkill_SatchelCharge extends wSkill;

simulated function DeadPlayer()
{
    super.DeadPlayer();
}

simulated function PostBeginPlay()
{
    // End:0xdd
    if(AttachWeaponID != -1 && IsEnable == false && !Base.Owner.Level.GetMatchMaker().bChangingHost && Base.Owner.PlayerReplicationInfo.Kills >= 10)
    {
        PlayerController(Base.Owner).myHUD.InsertUsingSkillList(SkillID);
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        SetIsEnable(true);
        SetbUpdateCall(true);
    }
}

simulated function UpdateProcess()
{
    // End:0xb5
    if(bUpdateCall == false && Base.Owner.PlayerReplicationInfo.Kills >= 10)
    {
        PlayerController(Base.Owner).myHUD.InsertUsingSkillList(SkillID);
        // End:0xae
        if(Base.Owner.Role == 4)
        {
            Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        }
        SetbUpdateCall(true);
    }
}
