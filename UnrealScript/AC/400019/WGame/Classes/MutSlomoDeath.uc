class MutSlomoDeath extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    Level.RagdollTimeScale = 0.3000000;
    //return;    
}

function ModifyPlayer(Pawn Other)
{
    local wPawn X;

    X = wPawn(Other);
    // End:0x2F
    if(X != none)
    {
        X.RagdollLifeSpan = 18.0000000;
    }
    super.ModifyPlayer(Other);
    //return;    
}

defaultproperties
{
    GroupName="CorpseTimeScale"
    FriendlyName="?? ??? ??"
    Description="??? ??? ??? ????."
}