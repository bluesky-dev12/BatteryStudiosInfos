class PickupMessagePlus extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x31
    if(Class<Pickup>(OptionalObject) == none)
    {
        return;
    }
    // End:0x67
    if(P.myHUD != none)
    {
        Class<Pickup>(OptionalObject).static.UpdateHUD(P.myHUD);
    }
    // End:0x9B
    if(P.bEnablePickupForceFeedback)
    {
        P.ClientPlayForceFeedback(Class<Pickup>(OptionalObject).default.PickupForce);
    }
    //return;    
}

defaultproperties
{
    bIsUnique=true
    bFadeMessage=true
    PosY=0.9000000
}