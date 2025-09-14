/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Interaction.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:18
 *
 *******************************************************************************/
class Interaction extends Interactions
    dependson(Interactions)
    dependson(InteractionMaster)
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
native function bool ConsoleCommand(coerce string S);
// Export UInteraction::execWorldToScreen(FFrame&, void* const)
native function Vector WorldToScreen(Vector Location, optional Vector CameraLocation, optional Rotator CameraRotation);
// Export UInteraction::execScreenToWorld(FFrame&, void* const)
native function Vector ScreenToWorld(Vector Location, optional Vector CameraLocation, optional Rotator CameraRotation);
event Initialized();
event NotifyLevelChange();
function Message(coerce string Msg, float MsgLife);
function bool KeyType(out Interactions.EInputKey key, optional string Unicode)
{
    return false;
}

function bool KeyEvent(out Interactions.EInputKey key, out Interactions.EInputAction Action, float Delta)
{
    return false;
}

function PreRender(Canvas Canvas);
function PostRender(Canvas Canvas);
function SetFocus()
{
    Master.SetFocusTo(self, ViewportOwner);
}

function Tick(float DeltaTime);
function StreamFinished(int Handle, Interactions.EStreamFinishReason Reason);
event NotifyMusicChange();
event DisableInteraction()
{
    // End:0x0e
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
}

event EnableInteraction()
{
    // End:0x0e
    if(bDisabledInteraction == false)
    {
        return;
    }
    bDisabledInteraction = false;
    bActive = bOldActive;
    bVisible = bOldVisible;
    bRequiresTick = bOldRequiresTick;
    bNativeEvents = bOldNativeEvents;
}

event bool OnIME_Notify(int Type, int LangID, string strText, int StartPos, int Size);

defaultproperties
{
    bActive=true
}