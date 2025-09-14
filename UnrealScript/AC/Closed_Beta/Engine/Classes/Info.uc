class Info extends Actor
    abstract
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    //return;    
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    return true;
    //return;    
}

static event bool AllowClassRemoval()
{
    return true;
    //return;    
}

static event byte GetSecurityLevel(string PropName)
{
    return 0;
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    return "";
    //return;    
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
    NetUpdateFrequency=10.0000000
}