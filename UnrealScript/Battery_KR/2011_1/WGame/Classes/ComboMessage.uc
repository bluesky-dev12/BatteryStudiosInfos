class ComboMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return Class<Combo>(OptionalObject).default.ExecMessage;
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x61
    if(Class<Combo>(OptionalObject).default.ComboAnnouncementName != 'None')
    {
        P.PlayRewardAnnouncement(Class<Combo>(OptionalObject).default.ComboAnnouncementName, 1, true);
    }
    //return;    
}

defaultproperties
{
    bIsUnique=true
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.1000000
}