/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BTPingCheckerLinker.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BTPingCheckerLinker extends Object
    native;

var GameEngine m_GEngine;
var wMatchMaker m_MM;

// Export UBTPingCheckerLinker::execSendPing(FFrame&, void* const)
native function bool SendPing(string toAddr);
// Export UBTPingCheckerLinker::execSendText(FFrame&, void* const)
native function bool SendText(string strDest_IP, int nDest_Port, string strTextData);
event ReceivedPingAck(array<string> fromAddr, array<int> ElapsedMiliSec)
{
    local int i;

    // End:0x2b
    if(m_MM == none)
    {
        Log("Received Ping : m_MM == None");
    }
    i = 0;
    J0x32:
    // End:0x71 [While If]
    if(i < fromAddr.Length)
    {
        m_MM.ReceivedPingHK(fromAddr[i], ElapsedMiliSec[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
}
