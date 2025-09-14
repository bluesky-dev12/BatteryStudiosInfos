class BigHeadRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var MutBigHead BigHeadMutator;

function ScoreKill(Controller Killer, Controller Killed)
{
    // End:0xD7
    if((Killer != none) && Killer.Pawn != none)
    {
        // End:0xA2
        if(Vehicle(Killer.Pawn) != none)
        {
            // End:0x9F
            if(Vehicle(Killer.Pawn).Driver != none)
            {
                Vehicle(Killer.Pawn).Driver.SetHeadScale(BigHeadMutator.GetHeadScaleFor(Killer.Pawn));
            }            
        }
        else
        {
            Killer.Pawn.SetHeadScale(BigHeadMutator.GetHeadScaleFor(Killer.Pawn));
        }
    }
    // End:0xFB
    if(NextGameRules != none)
    {
        NextGameRules.ScoreKill(Killer, Killed);
    }
    //return;    
}
