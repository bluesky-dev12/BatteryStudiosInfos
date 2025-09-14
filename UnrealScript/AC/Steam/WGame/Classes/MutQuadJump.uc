/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutQuadJump.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class MutQuadJump extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ModifyPlayer(Pawn Other)
{
    local wPawn X;

    X = wPawn(Other);
    // End:0x4e
    if(X != none)
    {
        X.MaxMultiJump = 3;
        X.MultiJumpRemaining = 3;
        X.MultiJumpBoost = 50;
    }
    super.ModifyPlayer(Other);
}

defaultproperties
{
    GroupName="Jumping"
    FriendlyName="4? ??"
    Description="?? ???? ?? ?? ?? ? ??????. 4? ??? ??????."
}