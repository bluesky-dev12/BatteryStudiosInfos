/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wVictimMessage.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class wVictimMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string YouWereKilledBy;
var(Message) localized string KilledByTrailer;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x0e
    if(RelatedPRI_1 == none)
    {
        return "";
    }
    // End:0x40
    if(RelatedPRI_1.PlayerName != "")
    {
        return default.YouWereKilledBy @ RelatedPRI_1.PlayerName $ default.KilledByTrailer;
    }
}

defaultproperties
{
    YouWereKilledBy="??? ???????"
    KilledByTrailer="!"
    bIsUnique=true
    bFadeMessage=true
    Lifetime=6
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.10
}