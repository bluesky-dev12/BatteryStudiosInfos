class Action_DrawHUDMaterial extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Material HUDMaterial;
var(Action) float PosX;
var(Action) float PosY;
var(Action) float Width;
var(Action) float Height;
var(Action) float DisplayTime;
var ScriptedHudOverlay Overlay;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController PC;

    PC = C.Level.GetLocalPlayerController();
    // End:0x3F
    if(PC == none)
    {
        Warn("No local player!");
        return false;
    }
    // End:0x71
    if(PC.myHUD == none)
    {
        Warn("Local player has no HUD!");
        return false;
    }
    Overlay = C.Spawn(Class'GamePlay_Decompressed.ScriptedHudOverlay', PC);
    Overlay.HUDMaterial = HUDMaterial;
    Overlay.PosX = PosX;
    Overlay.PosY = PosY;
    Overlay.Width = Width;
    Overlay.Height = Height;
    PC.myHUD.AddHudOverlay(Overlay);
    C.CurrentAction = self;
    C.SetTimer(DisplayTime, false);
    return true;
    //return;    
}

function ActionCompleted()
{
    Overlay.Destroy();
    //return;    
}

function bool CompleteWhenTriggered()
{
    return true;
    //return;    
}

function bool CompleteWhenTimer()
{
    return true;
    //return;    
}

defaultproperties
{
    PosX=0.4000000
    PosY=0.4000000
    Width=0.2000000
    Height=0.2000000
    DisplayTime=1.0000000
    ActionString="HUD texture? ?????"
}