class wDeathMessage_Defence extends wDeathMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x50
    if(P != none)
    {
        // End:0x50
        if(P.myHUD != none)
        {
            P.myHUD.OnClientReceiveDeathMessage(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
    }
    //return;    
}
