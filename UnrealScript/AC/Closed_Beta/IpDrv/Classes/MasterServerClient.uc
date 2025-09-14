class MasterServerClient extends ServerQueryClient
    transient
    native
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EClientToMaster
{
    CTM_Query,                      // 0
    CTM_GetMOTD,                    // 1
    CTM_QueryUpgrade,               // 2
    CTM_GetModMOTD,                 // 3
    CTM_GetOwnageList               // 4
};

enum EQueryType
{
    QT_Equals,                      // 0
    QT_NotEquals,                   // 1
    QT_LessThan,                    // 2
    QT_LessThanEquals,              // 3
    QT_GreaterThan,                 // 4
    QT_GreaterThanEquals,           // 5
    QT_Disabled                     // 6
};

enum EResponseInfo
{
    RI_AuthenticationFailed,        // 0
    RI_ConnectionFailed,            // 1
    RI_ConnectionTimeout,           // 2
    RI_Success,                     // 3
    RI_MustUpgrade,                 // 4
    RI_DevClient,                   // 5
    RI_BadClient,                   // 6
    RI_BannedClient,                // 7
    RI_UTANBan                      // 8
};

enum EMOTDResponse
{
    MR_MOTD,                        // 0
    MR_MandatoryUpgrade,            // 1
    MR_OptionalUpgrade,             // 2
    MR_NewServer,                   // 3
    MR_IniSetting,                  // 4
    MR_Command                      // 5
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
//var delegate<OnQueryFinished> __OnQueryFinished__Delegate;
//var delegate<OnReceivedServer> __OnReceivedServer__Delegate;
//var delegate<OnReceivedMOTDData> __OnReceivedMOTDData__Delegate;
//var delegate<OnReceivedModMOTDData> __OnReceivedModMOTDData__Delegate;
//var delegate<OnReceivedOwnageItem> __OnReceivedOwnageItem__Delegate;

// Export UMasterServerClient::execStartQuery(FFrame&, void* const)
native function StartQuery(MasterServerClient.EClientToMaster Command)
{
    //native.Command;        
}

// Export UMasterServerClient::execStop(FFrame&, void* const)
native function Stop();

// Export UMasterServerClient::execLaunchAutoUpdate(FFrame&, void* const)
native function LaunchAutoUpdate();

delegate OnQueryFinished(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    //return;    
}

delegate OnReceivedServer(ServerResponseLine S)
{
    //return;    
}

delegate OnReceivedMOTDData(MasterServerClient.EMOTDResponse Command, string Value)
{
    //return;    
}

delegate OnReceivedModMOTDData(string Value)
{
    //return;    
}

delegate OnReceivedOwnageItem(int Level, string ItemName, string ItemDesc, string ItemURL)
{
    //return;    
}
