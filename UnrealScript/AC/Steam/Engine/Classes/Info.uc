/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Info.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class Info extends Actor
    dependson(PlayInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    abstract
    notplaceable;

var const localized string RulesGroup;
var const localized string GameGroup;
var const localized string ServerGroup;
var const localized string ChatGroup;
var const localized string BotsGroup;
var const localized string MapVoteGroup;
var const localized string KickVoteGroup;

static function FillPlayInfo(PlayInfo PlayInfo)
{
    PlayInfo.AddClass(default.Class);
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    return true;
}

static event bool AllowClassRemoval()
{
    return true;
}

static event byte GetSecurityLevel(string PropName)
{
    return 0;
}

static event string GetDescriptionText(string PropName)
{
    return "";
}

defaultproperties
{
    RulesGroup="Rules"
    GameGroup="Games"
    ServerGroup="Servers"
    ChatGroup="Chat"
    BotsGroup="Bots"
    MapVoteGroup="Map Vote"
    KickVoteGroup="Vote Kick"
    bHidden=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    RemoteRole=0
    NetUpdateFrequency=10.0
}