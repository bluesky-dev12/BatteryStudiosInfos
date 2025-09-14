/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\FirstBloodMessage.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class FirstBloodMessage extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string FirstBloodString;
var Sound FirstBloodSound;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x0e
    if(RelatedPRI_1 == none)
    {
        return "";
    }
    // End:0x26
    if(RelatedPRI_1.PlayerName == "")
    {
        return "";
    }
    return RelatedPRI_1.PlayerName @ default.FirstBloodString;
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x39
    if(RelatedPRI_1 != P.PlayerReplicationInfo)
    {
        return;
    }
    P.PlayRewardAnnouncement('First_Blood', 1, true);
}

defaultproperties
{
    FirstBloodString="? ??? ??!"
    DrawColor=(R=255,G=0,B=0,A=255)
}