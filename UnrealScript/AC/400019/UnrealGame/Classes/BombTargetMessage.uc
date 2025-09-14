class BombTargetMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string TargetMessage;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.TargetMessage;
    //return;    
}

defaultproperties
{
    TargetMessage="?? ??"
    bIsUnique=true
    bIsConsoleMessage=false
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=200,G=200,B=200,A=200)
    PosY=0.6500000
}