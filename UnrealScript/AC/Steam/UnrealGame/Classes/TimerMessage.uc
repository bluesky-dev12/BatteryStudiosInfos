/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TimerMessage.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class TimerMessage extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() Sound CountDownSounds[10];
var name CountDown[10];
var() localized string CountDownTrailer;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return string(Switch) $ default.CountDownTrailer;
}

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0xca
    if(Switch > 0 && Switch < 11 && P.GameReplicationInfo != none && P.GameReplicationInfo.Winner == none && P.GameReplicationInfo.RemainingTime > 10 || P.GameReplicationInfo.RemainingTime == 0)
    {
        P.QueueAnnouncement(string(default.CountDown[0]), 1, 3, 1);
    }
}

defaultproperties
{
    CountDown=Warfare_Sound_ATS.com.ats_com_time_countdown
    CountDownTrailer="..."
    bIsConsoleMessage=true
    Lifetime=1
    DrawColor=(R=255,G=255,B=0,A=255)
    StackMode=2
    PosY=0.10
    FontSize=0
}