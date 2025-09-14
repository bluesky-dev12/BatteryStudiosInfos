/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutSlomoDeath.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class MutSlomoDeath extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    Level.RagdollTimeScale = 0.30;
}

function ModifyPlayer(Pawn Other)
{
    local wPawn X;

    X = wPawn(Other);
    // End:0x2f
    if(X != none)
    {
        X.RagdollLifeSpan = 18.0;
    }
    super.ModifyPlayer(Other);
}

defaultproperties
{
    GroupName="CorpseTimeScale"
    FriendlyName="?? ??? ??"
    Description="??? ??? ??? ????."
}