class LastSecondMessage extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string LastSecondRed;
var(Message) localized string LastSecondBlue;

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x44
    if(Switch == 1)
    {
        P.PlayRewardAnnouncement('Denied', 1, true);        
    }
    else
    {
        P.PlayStatusAnnouncement("Last_Second_Save", 1, true);
    }
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x13
    if(TeamInfo(OptionalObject) == none)
    {
        return "";
    }
    // End:0x35
    if(TeamInfo(OptionalObject).TeamIndex == 0)
    {
        return default.LastSecondRed;        
    }
    else
    {
        return default.LastSecondBlue;
    }
    //return;    
}

defaultproperties
{
    LastSecondRed="??? ??? ?? ???!"
    LastSecondBlue="??? ??? ?? ???!"
    StackMode=2
    PosY=0.1000000
}