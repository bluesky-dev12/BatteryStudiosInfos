class BTDataTransferClientLink extends Object
    native;

var string ChannelServerIP;
var int ServerDataTransferPort;
var BTNetGameData NetGameData;
var int iCompleteCheck;

// Export UBTDataTransferClientLink::execInitNetwork(FFrame&, void* const)
native function bool InitNetwork(string ServerIP, int ServerPort)
{
    //native.ServerIP;
    //native.ServerPort;        
}

// Export UBTDataTransferClientLink::execRequestData(FFrame&, void* const)
native function bool RequestData();

// Export UBTDataTransferClientLink::execClose(FFrame&, void* const)
native function bool Close();

event OnReceivedParamDataComplete(int Result)
{
    // End:0x6C
    if(Result == 0)
    {
        iCompleteCheck = 0;
        Log("[BTDataTransferClientLink::OnReceivedParamDataComplete, Data Receive Success.!!!!!]");        
    }
    else
    {
        iCompleteCheck = 1;
        Log("[BTDataTransferClientLink::OnReceivedParamDataComplete, Data Receive Failed.!!!!!]");
    }
    //return;    
}

defaultproperties
{
    iCompleteCheck=-1
}