class ActionMessage extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string Messages[32];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.Messages[Switch];
    //return;    
}

defaultproperties
{
    Lifetime=8
    DrawColor=(R=255,G=255,B=0,A=255)
    PosY=0.8500000
    FontSize=0
}