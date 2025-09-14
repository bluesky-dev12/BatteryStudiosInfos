class UdpGamespyUplink extends UdpLink
    transient
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() config int UpdateMinutes;
var() string MasterServerAddress;
var() config int MasterServerPort;
var() config int ServerRegion;
var() name TargetQueryName;
var IpAddr MasterServerIpAddr;
var string HeartbeatMessage;
var UdpGamespyQuery Query;
var int CurrentQueryNum;

function PreBeginPlay()
{
    // End:0x19
    foreach AllActors(Class'IpDrv_Decompressed.UdpGamespyQuery', Query, TargetQueryName)
    {
        // End:0x19
        break;        
    }    
    // End:0x6F
    if(Query == none)
    {
        Log("UdpGameSpyUplink: Could not find a UdpGameSpyQuery object, aborting.");
        return;
    }
    HeartbeatMessage = (("\\heartbeat\\" $ string(Query.Port)) $ "\\gamename\\") $ (GameSpyGameName());
    MasterServerIpAddr.Port = MasterServerPort;
    // End:0xED
    if(MasterServerAddress == "")
    {
        MasterServerAddress = ("master" $ string(ServerRegion)) $ ".gamespy.com";
    }
    Resolve(MasterServerAddress);
    //return;    
}

function Resolved(IpAddr Addr)
{
    local int UplinkPort;

    MasterServerIpAddr.Addr = Addr.Addr;
    // End:0x65
    if(MasterServerIpAddr.Addr == 0)
    {
        Log("UdpGameSpyUplink: Invalid master server address, aborting.");
        return;
    }
    Log((("UdpGameSpyUplink: Master Server is " $ MasterServerAddress) $ ":") $ string(MasterServerIpAddr.Port));
    UplinkPort = Query.Port + 1;
    // End:0x104
    if((BindPort(UplinkPort, true)) == 0)
    {
        Log("UdpGameSpyUplink: Error binding port, aborting.");
        return;
    }
    Log(("UdpGameSpyUplink: Port " $ string(UplinkPort)) $ " successfully bound.");
    Resume();
    //return;    
}

function ResolveFailed()
{
    Log("UdpGameSpyUplink: Failed to resolve master server address, aborting.");
    //return;    
}

function Timer()
{
    local bool Result;

    Result = SendText(MasterServerIpAddr, HeartbeatMessage);
    // End:0x50
    if(!Result)
    {
        Log("Failed to send heartbeat to master server.");
    }
    //return;    
}

function Halt()
{
    SetTimer(0.0000000, false);
    //return;    
}

function Resume()
{
    SetTimer(float(UpdateMinutes * 60), true);
    Timer();
    //return;    
}

event ReceivedText(IpAddr Addr, string Text)
{
    local string QueryStr;
    local bool QueryRemaining;
    local int QueryNum, PacketNum;

    CurrentQueryNum++;
    // End:0x1A
    if(CurrentQueryNum > 100)
    {
        CurrentQueryNum = 1;
    }
    QueryNum = CurrentQueryNum;
    QueryStr = Text;
    // End:0x47
    if(QueryStr == "")
    {
        QueryRemaining = false;        
    }
    else
    {
        QueryRemaining = true;
    }
    J0x4F:

    // End:0x9A [Loop If]
    if(QueryRemaining)
    {
        QueryStr = ParseQuery(Addr, QueryStr, QueryNum, PacketNum);
        // End:0x8F
        if(QueryStr == "")
        {
            QueryRemaining = false;            
        }
        else
        {
            QueryRemaining = true;
        }
        // [Loop Continue]
        goto J0x4F;
    }
    //return;    
}

function bool ParseNextQuery(string Query, out string QueryType, out string QueryValue, out string QueryRest, out string FinalPacket)
{
    local string TempQuery;
    local int ClosingSlash;

    // End:0x0E
    if(Query == "")
    {
        return false;
    }
    // End:0x163
    if(Left(Query, 1) == "\\")
    {
        ClosingSlash = InStr(Right(Query, Len(Query) - 1), "\\");
        // End:0x47
        if(ClosingSlash == 0)
        {
            return false;
        }
        TempQuery = Query;
        QueryType = Right(Query, Len(Query) - 1);
        QueryType = Left(QueryType, ClosingSlash);
        QueryRest = Right(Query, Len(Query) - (Len(QueryType) + 2));
        // End:0xC9
        if((QueryRest == "") || Len(QueryRest) == 1)
        {
            FinalPacket = "final";
            return true;            
        }
        else
        {
            // End:0xDB
            if(Left(QueryRest, 1) == "\\")
            {
                return true;
            }
        }
        ClosingSlash = InStr(QueryRest, "\\");
        // End:0x10B
        if(ClosingSlash >= 0)
        {
            QueryValue = Left(QueryRest, ClosingSlash);            
        }
        else
        {
            QueryValue = QueryRest;
        }
        QueryRest = Right(Query, Len(Query) - ((Len(QueryType) + Len(QueryValue)) + 3));
        // End:0x15E
        if(QueryRest == "")
        {
            FinalPacket = "final";
            return true;            
        }
        else
        {
            return true;
        }        
    }
    else
    {
        return false;
    }
    //return;    
}

function string ParseQuery(IpAddr Addr, coerce string QueryStr, int QueryNum, out int PacketNum)
{
    local string QueryType, QueryValue, QueryRest, ValidationString;
    local bool Result;
    local string FinalPacket;

    Result = ParseNextQuery(QueryStr, QueryType, QueryValue, QueryRest, FinalPacket);
    // End:0x34
    if(!Result)
    {
        return "";
    }
    // End:0x50
    if(QueryType == "basic")
    {
        Result = true;        
    }
    else
    {
        // End:0xA9
        if(QueryType == "secure")
        {
            ValidationString = "\\validate\\" $ (GameSpyValidate(QueryValue));
            Result = SendQueryPacket(Addr, ValidationString, QueryNum, ++PacketNum, FinalPacket);
        }
    }
    return QueryRest;
    //return;    
}

function bool SendQueryPacket(IpAddr Addr, coerce string SendString, int QueryNum, int PacketNum, string FinalPacket)
{
    local bool Result;

    // End:0x27
    if(FinalPacket == "final")
    {
        SendString = SendString $ "\\final\\";
    }
    SendString = (((SendString $ "\\queryid\\") $ string(QueryNum)) $ ".") $ string(PacketNum);
    Result = SendText(Addr, SendString);
    return Result;
    //return;    
}

defaultproperties
{
    UpdateMinutes=1
    MasterServerPort=27900
    TargetQueryName="MasterUplink"
}