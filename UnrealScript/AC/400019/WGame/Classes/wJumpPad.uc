class wJumpPad extends JumpPad
    hidecategories(Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local int i;

    super.PostBeginPlay();
    // End:0x96
    if((Level.Game != none) && Level.Game.IsA('ONSOnslaughtGame'))
    {
        i = 0;
        J0x40:

        // End:0x96 [Loop If]
        if(i < PathList.Length)
        {
            // End:0x8C
            if(PathList[i].End == JumpTarget)
            {
                PathList[i].Distance *= 0.5000000;
                // [Explicit Break]
                goto J0x96;
            }
            i++;
            // [Loop Continue]
            goto J0x40;
        }
    }
    J0x96:

    //return;    
}

event Touch(Actor Other)
{
    // End:0x2D
    if((UnrealPawn(Other) == none) || int(Other.Physics) == int(0))
    {
        return;
    }
    PendingTouch = Other.PendingTouch;
    Other.PendingTouch = self;
    //return;    
}

event PostTouch(Actor Other)
{
    local Pawn P;
    local Bot B;

    super.PostTouch(Other);
    P = UnrealPawn(Other);
    // End:0x28
    if(P == none)
    {
        return;
    }
    B = Bot(P.Controller);
    // End:0x9C
    if((B != none) && PhysicsVolume.Gravity.Z > PhysicsVolume.default.Gravity.Z)
    {
        B.Focus = B.FaceActor(2.0000000);
    }
    //return;    
}
