/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutVampire.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class MutVampire extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local GameRules G;

    super(Actor).PostBeginPlay();
    G = Spawn(class'VampireGameRules');
    // End:0x51
    if(Level.Game.GameRulesModifiers == none)
    {
        Level.Game.GameRulesModifiers = G;
    }
    // End:0x77
    else
    {
        Level.Game.GameRulesModifiers.AddGameRules(G);
    }
    Destroy();
}

defaultproperties
{
    GroupName="Vampire"
    FriendlyName="????"
    Description="?? ????? ????? ??? ?????"
}