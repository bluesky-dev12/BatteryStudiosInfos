class wMessage_Sabotage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    switch(Switch)
    {
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

defaultproperties
{
    bIsSpecial=false
    bIsConsoleMessage=false
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.2420000
    FontSize=1
}