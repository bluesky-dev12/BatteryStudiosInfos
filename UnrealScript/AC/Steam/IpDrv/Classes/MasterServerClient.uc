/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\MasterServerClient.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:4
 *	Structs:1
 *	Properties:11
 *	Functions:8
 *
 *******************************************************************************/
class MasterServerClient extends ServerQueryClient
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient;

enum EClientToMaster
{
    CTM_Query,
    CTM_GetMOTD,
    CTM_QueryUpgrade,
    CTM_GetModMOTD,
    CTM_GetOwnageList
};

enum EQueryType
{
    QT_Equals,
    QT_NotEquals,
    QT_LessThan,
    QT_LessThanEquals,
    QT_GreaterThan,
    QT_GreaterThanEquals,
    QT_Disabled
};

enum EResponseInfo
{
    RI_AuthenticationFailed,
    RI_ConnectionFailed,
    RI_ConnectionTimeout,
    RI_Success,
    RI_MustUpgrade,
    RI_DevClient,
    RI_BadClient,
    RI_BannedClient,
    RI_UTANBan
};

enum EMOTDResponse
{
    MR_MOTD,
    MR_MandatoryUpgrade,
    MR_OptionalUpgrade,
    MR_NewServer,
    MR_IniSetting,
    MR_Command
};

struct native export QueryData
{
    var() string key;
    var() string Value;
    var() MasterServerClient.EQueryType QueryType;
};

var native const transient pointer MSLinkPtr;
var int OwnageLevel;
var int ModRevLevel;
var(Query) array<QueryData> Query;
var(Query) const int ResultCount;
var string OptionalResult;
var delegate<OnQueryFinished> __OnQueryFinished__Delegate;
var delegate<OnReceivedServer> __OnReceivedServer__Delegate;
var delegate<OnReceivedMOTDData> __OnReceivedMOTDData__Delegate;
var delegate<OnReceivedModMOTDData> __OnReceivedModMOTDData__Delegate;
var delegate<OnReceivedOwnageItem> __OnReceivedOwnageItem__Delegate;

// Export UMasterServerClient::execStartQuery(FFrame&, void* const)
native function StartQuery(MasterServerClient.EClientToMaster Command);
// Export UMasterServerClient::execStop(FFrame&, void* const)
native function Stop();
// Export UMasterServerClient::execLaunchAutoUpdate(FFrame&, void* const)
native function LaunchAutoUpdate();
delegate OnQueryFinished(MasterServerClient.EResponseInfo ResponseInfo, int Info);
delegate OnReceivedServer(ServerResponseLine S);
delegate OnReceivedMOTDData(MasterServerClient.EMOTDResponse Command, string Value);
delegate OnReceivedModMOTDData(string Value);
delegate OnReceivedOwnageItem(int Level, string ItemName, string ItemDesc, string ItemURL);
