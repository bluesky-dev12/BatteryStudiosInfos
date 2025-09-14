/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_RPG7.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class wSkill_RPG7 extends wSkill;

simulated function DeadPlayer()
{
    super.DeadPlayer();
    SetbUpdateCall(false);
}

simulated function PostBeginPlay();
simulated function UpdateProcess()
{
    // End:0xb5
    if(bUpdateCall == false && Base.Owner.PlayerReplicationInfo.KillSuccession >= 4)
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
