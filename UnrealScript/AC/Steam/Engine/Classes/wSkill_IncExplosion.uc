/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_IncExplosion.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_IncExplosion extends wSkill;

simulated function PostBeginPlay()
{
    Base.bIncExplosion = true;
    PlayerController(Base.Owner).ServerIncExplosion(true);
}

simulated function RemoveSkill()
{
    Base.bIncExplosion = false;
    PlayerController(Base.Owner).ServerIncExplosion(false);
}
