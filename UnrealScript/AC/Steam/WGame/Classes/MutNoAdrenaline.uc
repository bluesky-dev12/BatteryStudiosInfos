/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutNoAdrenaline.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class MutNoAdrenaline extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
    // End:0x1e
    if(Other.IsA('AdrenalinePickup'))
    {
        bSuperRelevant = 0;
        return false;
    }
    // End:0x44
    if(Controller(Other) != none)
    {
        Controller(Other).bAdrenalineEnabled = false;
    }
    return super.IsRelevant(Other, bSuperRelevant);
}

defaultproperties
{
    GroupName="Adrenaline"
    FriendlyName="????? ??"
    Description="??? ?????? ??? ? ????."
}