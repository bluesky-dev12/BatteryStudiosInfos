/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FailedConnect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class FailedConnect extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    abstract
    notplaceable;

var localized string FailMessage[4];

static function int GetFailSwitch(string FailString)
{
    // End:0x14
    if(FailString ~= "NEEDPW")
    {
        return 0;
    }
    // End:0x29
    if(FailString ~= "WRONGPW")
    {
        return 1;
    }
    // End:0x43
    if(FailString ~= "GAMESTARTED")
    {
        return 2;
    }
    return 3;
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.FailMessage[Clamp(Switch, 0, 3)];
}

defaultproperties
{
    FailMessage[0]="Failed to join the game.  Password required."
    FailMessage[1]="Failed to join the game.  Invalid password."
    FailMessage[2]="Failed to join the game.  The game has already started."
    FailMessage[3]="Failed to join the game."
    bIsUnique=true
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=128,A=255)
    FontSize=1
}