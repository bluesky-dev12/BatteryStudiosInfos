class LeavingBattleFieldVolume extends Volume;

var VolumeTimer CheckTimer;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x3F
    if(CheckTimer == none)
    {
        CheckTimer = Spawn(Class'Engine.VolumeTimer', self);
        // End:0x3F
        if(CheckTimer != none)
        {
            CheckTimer.TimerFrequency = 2.0000000;
        }
    }
    //return;    
}

function Destroyed()
{
    // End:0x1E
    if(CheckTimer != none)
    {
        CheckTimer.Destroy();
        CheckTimer = none;
    }
    super(Actor).Destroyed();
    //return;    
}

function TimerPop(VolumeTimer t)
{
    local Pawn P;

    // End:0x4E
    foreach TouchingActors(Class'Engine.Pawn', P)
    {
        // End:0x4D
        if(PlayerController(P.Controller) != none)
        {
            PlayerController(P.Controller).ReceiveLocalizedMessage(Class'UT2k4Assault_Decompressed.Message_ASKillMessages', 7);
        }        
    }    
    //return;    
}
