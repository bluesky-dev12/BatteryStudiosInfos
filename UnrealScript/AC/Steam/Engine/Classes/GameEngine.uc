/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GameEngine.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:52
 *
 *******************************************************************************/
class GameEngine extends Engine
    dependson(Engine)
    native
    config()
    transient
    noexport;

struct URL
{
    var string Protocol;
    var string Host;
    var int Port;
    var string Map;
    var array<string> Op;
    var string Portal;
    var int Valid;
};

var Level GLevel;
var Level GEntry;
var PendingLevel GPendingLevel;
var WebLog GWebLog;
var PendingLevel GServerPendingLevel;
var bool IsRelayServer;
var string strRelayServerURL;
var bool IsNatCheck;
var int NatType;
var string HostIP;
var int hostPortNum;
var string natServerIP1;
var int natServerPortNum1;
var string natServerIP2;
var int natServerPortNum2;
var TickChecker GTickChecker;
var BTMapLoader GMapLoader;
var BTLoadingAdvancer GLoadingAdvancer;
var BTPingChecker GPingChecker;
var BTTcpLink_Channel_DS GBTTcpLink_Channel_DS;
var BTTcpLink_DStoDP_DS GBTTcpLink_DStoDP_DS;
var float CurrentTickTime;
var wCharacterManager GCharMgr;
var wWeaponManager GWeaponMgr;
var wGameManager GGameMgr;
var ItemIterator GItemIterator;
var bool GIsDemoPlayback;
var PlayerController LevelLoadingController;
var int LevelLoadingTotalActorCount;
var int LevelLoadingActorCount;
var bool FramePresentPending;
var URL LastURL;
var array<string> ServerActors;
var array<string> ServerPackages;
var array<Object> DummyArray;
var Object DummyObject;
var string DummyString;
var string MainMenuClass;
var string SinglePlayerMenuClass;
var string ConnectingMenuClass;
var string LoadingBackgroundVignetteClass;
var string DisconnectMenuClass;
var string LoadingClass;
var bool bCheatProtection;
var bool ColorHighDetailMeshes;
var bool ColorSlowCollisionMeshes;
var bool ColorNoCollisionMeshes;
var bool ColorWorldTextures;
var bool ColorPlayerAndWeaponTextures;
var bool ColorInterfaceTextures;
var(VoiceChat) bool VoIPAllowVAD;
var string strMD5Digest;

defaultproperties
{
    MainMenuClass="GUIWarfare.BTNetMainMenu"
    SinglePlayerMenuClass="GUI2K4.UT2K4SP_Main"
    ConnectingMenuClass="GUIWarfare.wVignette"
    LoadingBackgroundVignetteClass="GUIWarfare.wVignetteEx"
    DisconnectMenuClass="GUIWarfare.BTDisconnectOptionPage"
    LoadingClass="GUI2K4.UT2K4SP_LadderLoading"
}