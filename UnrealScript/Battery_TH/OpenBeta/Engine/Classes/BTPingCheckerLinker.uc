class BTPingCheckerLinker extends Object
    native;

var GameEngine m_GEngine;
var wMatchMaker m_MM;

// Export UBTPingCheckerLinker::execSendPing(FFrame&, void* const)
native function bool SendPing(string toAddr)
{
    //native.toAddr;        
}

// Export UBTPingCheckerLinker::execSendText(FFrame&, void* const)
native function bool SendText(string strDest_IP, int nDest_Port, string strTextData)
{
    //native.strDest_IP;
    //native.nDest_Port;
    //native.strTextData;        
}

event ReceivedPingAck(array<string> fromAddr, array<int> ElapsedMiliSec)
{
    local int i;

    // End:0x2B
    if(m_MM == none)
    {
        Log("Received Ping : m_MM == None");
    }
    i = 0;
    J0x32:

    // End:0x71 [Loop If]
    if(i < fromAddr.Length)
    {
        m_MM.ReceivedPingHK(fromAddr[i], ElapsedMiliSec[i]);
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    //return;    
}
