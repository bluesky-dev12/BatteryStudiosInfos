/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDeathMessage.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class wDeathMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string KilledString;
var(Message) localized string SomeoneString;
var bool bNoConsoleDeathMessages;

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
    // End:0x2f
    if(RelatedPRI_1.Team.TeamIndex == 0)
    {
        return class'HUD'.default.RedColor;
    }
    // End:0x6d
    else
    {
        // End:0x5e
        if(RelatedPRI_1.Team.TeamIndex == 1)
        {
            return class'HUD'.default.BlueColor;
        }
        // End:0x6d
        else
        {
            return class'HUD'.default.GreenColor;
        }
    }
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string KillerName, VictimName;

    // End:0x13
    if(class<DamageType>(OptionalObject) == none)
    {
        return "";
    }
    // End:0x2c
    if(RelatedPRI_2 == none)
    {
        VictimName = default.SomeoneString;
    }
    // End:0x40
    else
    {
        VictimName = RelatedPRI_2.PlayerName;
    }
    // End:0x59
    if(RelatedPRI_1 == none)
    {
        KillerName = default.SomeoneString;
    }
    // End:0x6d
    else
    {
        KillerName = RelatedPRI_1.PlayerName;
    }
    return class'GameInfo'.static.ParseKillMessage(KillerName, VictimName, class<DamageType>(OptionalObject).static.DeathMessage(RelatedPRI_1, RelatedPRI_2));
}

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x5d
    if(P != none && RelatedPRI_2 != none)
    {
        // End:0x5d
        if(P.myHUD != none)
        {
            P.myHUD.OnClientReceiveDeathMessage(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
    }
}

defaultproperties
{
    KilledString="?? ?????"
    SomeoneString="??"
    bIsSpecial=true
    ChildMessage=class'wKillerMessagePlus'
    DrawColor=(R=255,G=0,B=0,A=255)
}