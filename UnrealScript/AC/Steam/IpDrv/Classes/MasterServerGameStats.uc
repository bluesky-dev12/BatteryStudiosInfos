/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\MasterServerGameStats.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class MasterServerGameStats extends GameStats
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    config();

var MasterServerUplink Uplink;

function Init()
{
    Log("MasterServerGameStats initializing");
    super.Init();
}

function Logf(string LogString)
{
    super.Logf(LogString);
    // End:0x19
    if(Uplink == none)
    {
    }
    // End:0x39
    else
    {
        // End:0x39
        if(!Uplink.LogStatLine(LogString))
        {
            Uplink = none;
        }
    }
}
