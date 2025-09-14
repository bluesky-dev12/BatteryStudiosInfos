/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_BombDetection.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_BombDetection extends wSkill;

simulated function PostBeginPlay()
{
    Base.bBombDetection = true;
    PlayerController(Base.Owner).ServerBombDetection(true);
}

simulated function RemoveSkill()
{
    Base.bBombDetection = false;
    PlayerController(Base.Owner).ServerBombDetection(false);
}
