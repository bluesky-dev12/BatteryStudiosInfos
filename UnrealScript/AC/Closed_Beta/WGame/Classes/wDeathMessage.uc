class wDeathMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string KilledString;
var(Message) localized string SomeoneString;
var bool bNoConsoleDeathMessages;

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
    // End:0x2F
    if(RelatedPRI_1.Team.TeamIndex == 0)
    {
        return Class'Engine.HUD'.default.RedColor;        
    }
    else
    {
        // End:0x5E
        if(RelatedPRI_1.Team.TeamIndex == 1)
        {
            return Class'Engine.HUD'.default.BlueColor;            
        }
        else
        {
            return Class'Engine.HUD'.default.GreenColor;
        }
    }
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string KillerName, VictimName;

    // End:0x13
    if(Class<DamageType>(OptionalObject) == none)
    {
        return "";
    }
    // End:0x2C
    if(RelatedPRI_2 == none)
    {
        VictimName = default.SomeoneString;        
    }
    else
    {
        VictimName = RelatedPRI_2.PlayerName;
    }
    // End:0x59
    if(RelatedPRI_1 == none)
    {
        KillerName = default.SomeoneString;        
    }
    else
    {
        KillerName = RelatedPRI_1.PlayerName;
    }
    return Class'Engine.GameInfo'.static.ParseKillMessage(KillerName, VictimName, Class<DamageType>(OptionalObject).static.DeathMessage(RelatedPRI_1, RelatedPRI_2));
    //return;    
}

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x5D
    if((P != none) && RelatedPRI_2 != none)
    {
        // End:0x5D
        if(P.myHUD != none)
        {
            P.myHUD.OnClientReceiveDeathMessage(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
    }
    //return;    
}

defaultproperties
{
    KilledString="?? ?????"
    SomeoneString="??"
    bIsSpecial=false
    ChildMessage=Class'WGame_Decompressed.wKillerMessagePlus'
    DrawColor=(R=255,G=0,B=0,A=255)
}