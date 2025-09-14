/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BatteryNet\Classes\BTNatDiag.uc
 * Package Imports:
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:3
 *	Functions:11
 *
 *******************************************************************************/
class BTNatDiag extends Object
    native
    config();

enum NAT_TYPE
{
    NAT_FULL_CONE,
    NAT_RESTRICTED_CONE,
    NAT_PORT_RESTRICTED_CONE,
    NAT_SYMMETRIC_CONE
};

var config array<string> nat_server_ip;
var config array<int> nat_port;
var native int NatType;

function bool Start(array<string> ipaddresses, array<int> ports)
{
    nat_server_ip.Length = 4;
    nat_server_ip[0] = ipaddresses[0];
    nat_server_ip[1] = ipaddresses[0];
    nat_server_ip[2] = ipaddresses[1];
    nat_server_ip[3] = ipaddresses[1];
    nat_port.Length = 4;
    nat_port[0] = ports[0];
    nat_port[1] = ports[1];
    nat_port[2] = ports[0];
    nat_port[3] = ports[1];
    Log("[BTNatDiag] before InitNatSocket");
    InitNatSocket();
    Log("[BTNatDiag] before SetNatServerIp");
    SetNatServerIp(nat_server_ip, nat_port);
    Log("[BTNatDiag] before SetPrimaryServer");
    SetPrimaryServer(nat_server_ip[0], nat_port[0]);
    Log("[BTNatDiag] before SetSecondServer");
    SetSecondServer(nat_server_ip[2], nat_port[2]);
    Log("[BTNatDiag] before StartNatCheck");
    return StartNatCheck(nat_server_ip[0], nat_port[0], "127.0.0.1");
}

// Export UBTNatDiag::execSetNatServerIp(FFrame&, void* const)
native function bool SetNatServerIp(array<string> nat_server_ip, array<int> nPorts);
// Export UBTNatDiag::execInitNatSocket(FFrame&, void* const)
native function bool InitNatSocket();
// Export UBTNatDiag::execStartNatCheck(FFrame&, void* const)
native function bool StartNatCheck(string nat_server_ip, int nPort, string sLocalBindAddr);
// Export UBTNatDiag::execSetPrimaryServer(FFrame&, void* const)
native function bool SetPrimaryServer(string server_ip, int nPort);
// Export UBTNatDiag::execSetSecondServer(FFrame&, void* const)
native function bool SetSecondServer(string server_ip, int nPort);
// Export UBTNatDiag::execCheckPhrase1(FFrame&, void* const)
native function int CheckPhrase1();
// Export UBTNatDiag::execCheckPhrase2(FFrame&, void* const)
native function int CheckPhrase2();
// Export UBTNatDiag::execGetNatType(FFrame&, void* const)
native function BTNatDiag.NAT_TYPE GetNatType();
function bool ProcessStep1()
{
    local int nResult;

    nResult = CheckPhrase1();
    // End:0x20
    if(nResult == -2)
    {
        return false;
    }
    // End:0x41
    else
    {
        // End:0x34
        if(nResult == -1)
        {
            return false;
        }
        // End:0x41
        else
        {
            NatType = nResult;
            return true;
        }
    }
}

function bool ProcessStep2()
{
    local int nResult;

    nResult = CheckPhrase2();
    // End:0x20
    if(-1 == nResult)
    {
        return false;
    }
    // End:0x2d
    else
    {
        NatType = nResult;
        return true;
    }
}
