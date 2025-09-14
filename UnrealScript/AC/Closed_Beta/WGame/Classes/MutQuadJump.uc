class MutQuadJump extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ModifyPlayer(Pawn Other)
{
    local wPawn X;

    X = wPawn(Other);
    // End:0x4E
    if(X != none)
    {
        X.MaxMultiJump = 3;
        X.MultiJumpRemaining = 3;
        X.MultiJumpBoost = 50;
    }
    super.ModifyPlayer(Other);
    //return;    
}

defaultproperties
{
    GroupName="Jumping"
    FriendlyName="4? ??"
    Description="?? ???? ?? ?? ?? ? ??????. 4? ??? ??????."
}