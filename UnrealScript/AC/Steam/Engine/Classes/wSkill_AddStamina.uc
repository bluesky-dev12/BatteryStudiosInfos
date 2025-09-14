/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_AddStamina.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_AddStamina extends wSkill;

simulated function PostBeginPlay()
{
    Base.bAddStamina = true;
    PlayerController(Base.Owner).ServerAddStamina(true);
}

simulated function RemoveSkill()
{
    Base.bAddStamina = false;
    PlayerController(Base.Owner).ServerAddStamina(false);
}
