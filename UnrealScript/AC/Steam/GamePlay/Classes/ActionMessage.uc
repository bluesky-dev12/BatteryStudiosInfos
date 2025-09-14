/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ActionMessage.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ActionMessage extends CriticalEventPlus
    dependson(CriticalEventPlus)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string Messages[32];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.Messages[Switch];
}

defaultproperties
{
    Lifetime=8
    DrawColor=(R=255,G=255,B=0,A=255)
    PosY=0.850
    FontSize=0
}