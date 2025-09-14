class wKillerMessagePlus extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string YouKilled;
var(Message) localized string YouKilledTrailer;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x0E
    if(RelatedPRI_1 == none)
    {
        return "";
    }
    // End:0x1C
    if(RelatedPRI_2 == none)
    {
        return "";
    }
    // End:0x4E
    if(RelatedPRI_2.PlayerName != "")
    {
        return (default.YouKilled @ RelatedPRI_2.PlayerName) @ default.YouKilledTrailer;
    }
    //return;    
}

defaultproperties
{
    YouKilled="??? ?????"
    bIsUnique=true
    bFadeMessage=true
    DrawColor=(R=0,G=160,B=255,A=255)
    StackMode=2
    PosY=0.1000000
}