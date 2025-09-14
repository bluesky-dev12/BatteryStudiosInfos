/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\LeavingBattleFieldVolume.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class LeavingBattleFieldVolume extends Volume;

var VolumeTimer CheckTimer;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x3f
    if(CheckTimer == none)
    {
        CheckTimer = Spawn(class'VolumeTimer', self);
        // End:0x3f
        if(CheckTimer != none)
        {
            CheckTimer.TimerFrequency = 2.0;
        }
    }
}

function Destroyed()
{
    // End:0x1e
    if(CheckTimer != none)
    {
        CheckTimer.Destroy();
        CheckTimer = none;
    }
    super(Actor).Destroyed();
}

function TimerPop(VolumeTimer t)
{
    local Pawn P;

    // End:0x4e
    foreach TouchingActors(class'Pawn', P)
    {
        // End:0x4d
        if(PlayerController(P.Controller) != none)
        {
            PlayerController(P.Controller).ReceiveLocalizedMessage(class'Message_ASKillMessages', 7);
        }                
    }
}
