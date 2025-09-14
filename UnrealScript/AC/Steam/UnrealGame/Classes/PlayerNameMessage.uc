/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\PlayerNameMessage.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class PlayerNameMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return RelatedPRI_1.PlayerName;
}

defaultproperties
{
    bIsUnique=true
    bIsConsoleMessage=true
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=255,G=0,B=0,A=255)
    PosY=0.580
}