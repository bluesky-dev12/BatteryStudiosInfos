class wAlienGameMutator extends DMMutator
    config
    hidedropdown
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
    // End:0x1E
    if(Other.IsA('AdrenalinePickup'))
    {
        bSuperRelevant = 0;
        return false;
    }
    // End:0x6F
    if((Controller(Other) != none) && MessagingSpectator(Other) == none)
    {
        Controller(Other).bAdrenalineEnabled = false;
        Controller(Other).PlayerReplicationInfoClass = Class'WMission_Decompressed.wAlienPlayerReplicationInfo';
    }
    return super(Mutator).IsRelevant(Other, bSuperRelevant);
    //return;    
}
