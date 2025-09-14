/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\StringMessagePlus.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class StringMessagePlus extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string AssembleString(HUD myHUD, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional string MessageString)
{
    return MessageString;
}

defaultproperties
{
    bIsSpecial=true
}