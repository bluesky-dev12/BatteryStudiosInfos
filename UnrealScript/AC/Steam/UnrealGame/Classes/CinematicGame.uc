/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CinematicGame.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class CinematicGame extends GameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    hidedropdown;

var config bool bPreviouslyViewed;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x2e
    if(Level.Title ~= "End Game")
    {
        Tag = 'BackToMenu';
    }
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x68 [While If]
    if(C != none)
    {
        // End:0x51
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientOpenMenu(class'GameEngine'.default.MainMenuClass);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    return;
}

function SetGameSpeed(float t)
{
    GameSpeed = 1.0;
    Level.TimeDilation = 1.0;
    SetTimer(Level.TimeDilation, true);
}

event PostLogin(PlayerController NewPlayer)
{
    // End:0x59
    if(NewPlayer.Player != none && NewPlayer.Player.Console != none)
    {
        NewPlayer.Player.Console.TimeTooIdle = 0.0;
    }
    super.PostLogin(NewPlayer);
    TriggerEvent('StartGame', NewPlayer, NewPlayer.Pawn);
}

function Logout(Controller Exiting)
{
    local PlayerController PC;

    PC = PlayerController(Exiting);
    // End:0x91
    if(PC != none && PC.Player != none && PC.Player.Console != none)
    {
        PC.Player.Console.TimeTooIdle = PC.Player.Console.default.TimeTooIdle;
    }
    super.Logout(Exiting);
}

defaultproperties
{
    HUDType="UnrealGame.CinematicHud"
    PlayerControllerClassName="UnrealGame.CinematicPlayer"
}