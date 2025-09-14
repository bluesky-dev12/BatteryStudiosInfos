/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDomMessage.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class wDomMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string YouControlBothPointsString;
var(Message) localized string EnemyControlsBothPointsString;
var(Message) Color RedColor;
var(Message) Color BlueColor;

static function Color GetColor(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    // End:0x14
    if(Switch == 0)
    {
        return default.RedColor;
    }
    // End:0x1a
    else
    {
        return default.BlueColor;
    }
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x14
        case 0:
            return default.YouControlBothPointsString;
            // End:0x24
            break;
        // End:0x21
        case 1:
            return default.EnemyControlsBothPointsString;
            // End:0x24
            break;
        // End:0xffff
        default:
            return "";
    }
}

defaultproperties
{
    YouControlBothPointsString="??? ? ??? ?? ???? ????!"
    EnemyControlsBothPointsString="???? ? ??? ?? ???? ????!"
    RedColor=(R=255,G=255,B=0,A=255)
    BlueColor=(R=255,G=255,B=0,A=255)
    bIsUnique=true
    bIsConsoleMessage=true
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=0,G=160,B=255,A=255)
    StackMode=2
    PosY=0.10
    FontSize=1
}