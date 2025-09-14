/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_DrawHUDMaterial.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:4
 *
 *******************************************************************************/
class Action_DrawHUDMaterial extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) Material HUDMaterial;
var(Action) float PosX;
var(Action) float PosY;
var(Action) float width;
var(Action) float Height;
var(Action) float DisplayTime;
var ScriptedHudOverlay Overlay;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController PC;

    PC = C.Level.GetLocalPlayerController();
    // End:0x3f
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
    Overlay = C.Spawn(class'ScriptedHudOverlay', PC);
    Overlay.HUDMaterial = HUDMaterial;
    Overlay.PosX = PosX;
    Overlay.PosY = PosY;
    Overlay.width = width;
    Overlay.Height = Height;
    PC.myHUD.AddHudOverlay(Overlay);
    C.CurrentAction = self;
    C.SetTimer(DisplayTime, false);
    return true;
}

function ActionCompleted()
{
    Overlay.Destroy();
}

function bool CompleteWhenTriggered()
{
    return true;
}

function bool CompleteWhenTimer()
{
    return true;
}

defaultproperties
{
    PosX=0.40
    PosY=0.40
    width=0.20
    Height=0.20
    DisplayTime=1.0
    ActionString="HUD texture? ?????"
}