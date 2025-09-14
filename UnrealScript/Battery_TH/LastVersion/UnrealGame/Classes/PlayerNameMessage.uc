class PlayerNameMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return RelatedPRI_1.PlayerName;
    //return;    
}

defaultproperties
{
    bIsUnique=true
    bIsConsoleMessage=false
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=255,G=0,B=0,A=255)
    PosY=0.5800000
}