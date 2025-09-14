/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\BigHeadRules.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class BigHeadRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var MutBigHead BigHeadMutator;

function ScoreKill(Controller Killer, Controller Killed)
{
    // End:0xd7
    if(Killer != none && Killer.Pawn != none)
    {
        // End:0xa2
        if(Vehicle(Killer.Pawn) != none)
        {
            // End:0x9f
            if(Vehicle(Killer.Pawn).Driver != none)
            {
                Vehicle(Killer.Pawn).Driver.SetHeadScale(BigHeadMutator.GetHeadScaleFor(Killer.Pawn));
            }
        }
        // End:0xd7
        else
        {
            Killer.Pawn.SetHeadScale(BigHeadMutator.GetHeadScaleFor(Killer.Pawn));
        }
    }
    // End:0xfb
    if(NextGameRules != none)
    {
        NextGameRules.ScoreKill(Killer, Killed);
    }
}
