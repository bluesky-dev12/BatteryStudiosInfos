/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_QuickDemolition.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_QuickDemolition extends wSkill;

simulated function PostBeginPlay()
{
    Base.bQuickDemolition = true;
    PlayerController(Base.Owner).ServerQuickDemolition(true);
}

simulated function RemoveSkill()
{
    Base.bQuickDemolition = false;
    PlayerController(Base.Owner).ServerQuickDemolition(false);
}
