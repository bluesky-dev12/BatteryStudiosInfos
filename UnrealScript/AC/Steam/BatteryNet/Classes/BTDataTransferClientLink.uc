/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BatteryNet\Classes\BTDataTransferClientLink.uc
 * Package Imports:
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class BTDataTransferClientLink extends Object
    native;

var string ChannelServerIP;
var int ServerDataTransferPort;
var BTNetGameData NetGameData;
var int iCompleteCheck;

// Export UBTDataTransferClientLink::execInitNetwork(FFrame&, void* const)
native function bool InitNetwork(string ServerIP, int serverPort);
// Export UBTDataTransferClientLink::execRequestData(FFrame&, void* const)
native function bool RequestData();
// Export UBTDataTransferClientLink::execClose(FFrame&, void* const)
native function bool Close();
event OnReceivedParamDataComplete(int Result)
{
    // End:0x6c
    if(Result == 0)
    {
        iCompleteCheck = 0;
        Log("[BTDataTransferClientLink::OnReceivedParamDataComplete, Data Receive Success.!!!!!]");
    }
    // End:0xc9
    else
    {
        iCompleteCheck = 1;
        Log("[BTDataTransferClientLink::OnReceivedParamDataComplete, Data Receive Failed.!!!!!]");
    }
}

defaultproperties
{
    iCompleteCheck=-1
}