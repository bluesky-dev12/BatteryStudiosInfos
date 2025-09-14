/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wMessage_Awards.uc
 * Package Imports:
 *	WMission
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class wMessage_Awards extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string Msg[2];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x13
        case 0:
            return default.Msg[0];
        // End:0x2f
        case 1:
            return RelatedPRI_1.PlayerName @ default.Msg[1];
        // End:0xffff
        default:
            return default.Msg[Min(Switch, 1)];
    }
}

static function RenderComplexMessage(Canvas Canvas, out float XL, out float YL, optional string MessageString, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    Canvas.DrawTextClipped(MessageString, false);
}

defaultproperties
{
    Msg[0]="You have completed the Objective!"
    Msg[1]="completed the Objective!"
    bComplexString=true
    bIsUnique=true
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.2420
    FontSize=1
}