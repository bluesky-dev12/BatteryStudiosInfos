/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutUDamageReward.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class MutUDamageReward extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x31
    if(!bDeleteMe)
    {
        Level.Game.AddGameModifier(Spawn(class'UDamageRules'));
    }
}

defaultproperties
{
    FriendlyName="UDamage ???"
    Description="?? ???? ??, ?? ????? UDamege(?: ?? ???) ???? ???? ?? ??? ?? ??? ???."
}