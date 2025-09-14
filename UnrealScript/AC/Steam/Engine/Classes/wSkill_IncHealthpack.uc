/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_IncHealthpack.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_IncHealthpack extends wSkill;

simulated function PostBeginPlay()
{
    Base.bIncHealthPack = true;
    PlayerController(Base.Owner).ServerIncHealthPack(true);
}

simulated function RemoveSkill()
{
    Base.bIncHealthPack = false;
    PlayerController(Base.Owner).ServerIncHealthPack(false);
}
