/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wMessage_MSKillMessages.uc
 * Package Imports:
 *	WMission
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class wMessage_MSKillMessages extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MaxMSGs = 8;

var localized string KillString[8];
var name KillSound[8];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.KillString[Min(Switch, 8 - 1)];
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x5f
    if(default.KillSound[Min(Switch, 8 - 1)] != 'None')
    {
        P.PlayRewardAnnouncement(default.KillSound[Min(Switch, 8 - 1)], 1, true);
    }
}

defaultproperties
{
    KillString[0]="Top Gun!"
    KillString[1]="Wrecker!"
    KillString[2]="Vehicle spawn blocking! 5 secs warning"
    KillString[3]="Vehicle spawn blocking! 4 secs warning"
    KillString[4]="Vehicle spawn blocking! 3 secs warning"
    KillString[5]="Vehicle spawn blocking! 2 secs warning"
    KillString[6]="Vehicle spawn blocking! 1 sec warning"
    KillString[7]="Leaving battle field!"
    KillSound[0]=top_gun
    KillSound[1]=Wrecker
    bIsConsoleMessage=true
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.2420
    FontSize=1
}