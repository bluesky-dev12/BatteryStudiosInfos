/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutSpeciesStats.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class MutSpeciesStats extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local GameRules G;

    super(Actor).PostBeginPlay();
    G = Spawn(class'SpeciesGameRules');
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
}

function ModifyPlayer(Pawn Other)
{
    local wPawn xp;

    super.ModifyPlayer(Other);
    xp = wPawn(Other);
    // End:0x28
    if(xp == none)
    {
        return;
    }
    xp.Species.static.ModifyPawn(xp);
}

defaultproperties
{
    GroupName="Species"
    FriendlyName="??? ??"
    Description="? ???? ???? ??? ??? ??? ???."
}