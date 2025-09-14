/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UTJumppad.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class UTJumppad extends JumpPad
    hidecategories(Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local int i;

    super.PostBeginPlay();
    // End:0x96
    if(Level.Game != none && Level.Game.IsA('ONSOnslaughtGame'))
    {
        i = 0;
        J0x40:
        // End:0x96 [While If]
        if(i < PathList.Length)
        {
            // End:0x8c
            if(PathList[i].End == JumpTarget)
            {
                PathList[i].Distance *= 0.50;
            }
            // End:0x96
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x40;
            }
        }
    }
}

event Touch(Actor Other)
{
    // End:0x2d
    if(UnrealPawn(Other) == none || Other.Physics == 0)
    {
        return;
    }
    PendingTouch = Other.PendingTouch;
    Other.PendingTouch = self;
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
    // End:0x9c
    if(B != none && PhysicsVolume.Gravity.Z > PhysicsVolume.default.Gravity.Z)
    {
        B.Focus = B.FaceActor(2.0);
    }
}
