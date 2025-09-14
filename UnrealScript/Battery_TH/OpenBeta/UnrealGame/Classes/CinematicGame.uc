class CinematicGame extends GameInfo
    config
    hidedropdown
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var config bool bPreviouslyViewed;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x2E
    if(Level.Title ~= "End Game")
    {
        Tag = 'BackToMenu';
    }
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x68 [Loop If]
    if(C != none)
    {
        // End:0x51
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientOpenMenu(Class'Engine.GameEngine'.default.MainMenuClass);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function AddDefaultInventory(Pawn PlayerPawn)
{
    return;
    //return;    
}

function SetGameSpeed(float t)
{
    GameSpeed = 1.0000000;
    Level.TimeDilation = 1.0000000;
    SetTimer(Level.TimeDilation, true);
    //return;    
}

event PostLogin(PlayerController NewPlayer)
{
    // End:0x59
    if((NewPlayer.Player != none) && NewPlayer.Player.Console != none)
    {
        NewPlayer.Player.Console.TimeTooIdle = 0.0000000;
    }
    super.PostLogin(NewPlayer);
    TriggerEvent('StartGame', NewPlayer, NewPlayer.Pawn);
    //return;    
}

function Logout(Controller Exiting)
{
    local PlayerController PC;

    PC = PlayerController(Exiting);
    // End:0x91
    if(((PC != none) && PC.Player != none) && PC.Player.Console != none)
    {
        PC.Player.Console.TimeTooIdle = PC.Player.Console.default.TimeTooIdle;
    }
    super.Logout(Exiting);
    //return;    
}

defaultproperties
{
    HUDType="UnrealGame.CinematicHud"
    PlayerControllerClassName="UnrealGame.CinematicPlayer"
}