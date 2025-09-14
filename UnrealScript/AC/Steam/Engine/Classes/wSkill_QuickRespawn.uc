/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_QuickRespawn.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_QuickRespawn extends wSkill;

simulated function PostBeginPlay()
{
    Base.bQuickRespawn = true;
    PlayerController(Base.Owner).ServerQuickRespawn(true);
}

simulated function RemoveSkill()
{
    Base.bQuickRespawn = false;
    PlayerController(Base.Owner).ServerQuickRespawn(false);
}
