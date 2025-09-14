class MasterServerGameStats extends GameStats
    native
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var MasterServerUplink Uplink;

function Init()
{
    Log("MasterServerGameStats initializing");
    super.Init();
    //return;    
}

function Logf(string LogString)
{
    super.Logf(LogString);
    // End:0x19
    if(Uplink == none)
    {        
    }
    else
    {
        // End:0x39
        if(!Uplink.LogStatLine(LogString))
        {
            Uplink = none;
        }
    }
    //return;    
}
