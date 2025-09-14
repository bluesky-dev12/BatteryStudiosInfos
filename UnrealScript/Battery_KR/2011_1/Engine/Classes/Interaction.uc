class Interaction extends Interactions
    native;

var bool bActive;
var bool bVisible;
var bool bRequiresTick;
var bool bNativeEvents;
var bool bDisabledInteraction;
var bool bOldActive;
var bool bOldVisible;
var bool bOldRequiresTick;
var bool bOldNativeEvents;
var Player ViewportOwner;
var InteractionMaster Master;

// Export UInteraction::execInitialize(FFrame&, void* const)
native function Initialize();

// Export UInteraction::execConsoleCommand(FFrame&, void* const)
native function bool ConsoleCommand(coerce string S)
{
    //native.S;        
}

// Export UInteraction::execWorldToScreen(FFrame&, void* const)
native function Vector WorldToScreen(Vector Location, optional Vector CameraLocation, optional Rotator CameraRotation)
{
    //native.Location;
    //native.CameraLocation;
    //native.CameraRotation;        
}

// Export UInteraction::execScreenToWorld(FFrame&, void* const)
native function Vector ScreenToWorld(Vector Location, optional Vector CameraLocation, optional Rotator CameraRotation)
{
    //native.Location;
    //native.CameraLocation;
    //native.CameraRotation;        
}

event Initialized()
{
    //return;    
}

event NotifyLevelChange()
{
    //return;    
}

function Message(coerce string Msg, float MsgLife)
{
    //return;    
}

function bool KeyType(out Interactions.EInputKey key, optional string Unicode)
{
    return false;
    //return;    
}

function bool KeyEvent(out Interactions.EInputKey key, out Interactions.EInputAction Action, float Delta)
{
    return false;
    //return;    
}

function PreRender(Canvas Canvas)
{
    //return;    
}

function PostRender(Canvas Canvas)
{
    //return;    
}

function SetFocus()
{
    Master.SetFocusTo(self, ViewportOwner);
    //return;    
}

function Tick(float DeltaTime)
{
    //return;    
}

function StreamFinished(int Handle, Interactions.EStreamFinishReason Reason)
{
    //return;    
}

event NotifyMusicChange()
{
    //return;    
}

event DisableInteraction()
{
    // End:0x0E
    if(bDisabledInteraction == true)
    {
        return;
    }
    bDisabledInteraction = true;
    bOldActive = bActive;
    bOldVisible = bVisible;
    bOldRequiresTick = bRequiresTick;
    bOldNativeEvents = bNativeEvents;
    bActive = false;
    bVisible = false;
    bRequiresTick = false;
    bNativeEvents = false;
    //return;    
}

event EnableInteraction()
{
    // End:0x0E
    if(bDisabledInteraction == false)
    {
        return;
    }
    bDisabledInteraction = false;
    bActive = bOldActive;
    bVisible = bOldVisible;
    bRequiresTick = bOldRequiresTick;
    bNativeEvents = bOldNativeEvents;
    //return;    
}

defaultproperties
{
    bActive=true
}