/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\IdleKickWarningMessage.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class IdleKickWarningMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    UnrealPlayer(OptionalObject).LastKickWarningTime = UnrealPlayer(OptionalObject).Level.TimeSeconds;
    return class'GameMessage'.default.KickWarning;
}

defaultproperties
{
    bIsPartiallyUnique=true
    bIsConsoleMessage=true
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=255,G=255,B=64,A=255)
    StackMode=2
    PosY=0.2420
    FontSize=1
}