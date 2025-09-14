class MutNoAdrenaline extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
    // End:0x1E
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
    //return;    
}

defaultproperties
{
    GroupName="Adrenaline"
    FriendlyName="????? ??"
    Description="??? ?????? ??? ? ????."
}