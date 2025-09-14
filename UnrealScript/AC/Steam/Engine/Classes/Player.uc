/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Player.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:7
 *	Properties:17
 *
 *******************************************************************************/
class Player extends Object
    native
    noexport;

const IDC_ARROW = 0;
const IDC_SIZEALL = 1;
const IDC_SIZENESW = 2;
const IDC_SIZENS = 3;
const IDC_SIZENWSE = 4;
const IDC_SIZEWE = 5;
const IDC_WAIT = 6;

var native const transient pointer vfOut;
var native const transient pointer vfExec;
var const transient PlayerController Actor;
var const transient PlayerController OldActor;
var transient Console Console;
var const transient bool bWindowsMouseAvailable;
var bool bShowWindowsMouse;
var const transient float WindowsMouseX;
var const transient float WindowsMouseY;
var transient int CurrentVoiceBandwidth;
var const int CurrentNetSpeed;
var int ConfiguredInternetSpeed;
var int ConfiguredLanSpeed;
var byte SelectedCursor;
var transient InteractionMaster InteractionMaster;
var transient array<Interaction> LocalInteractions;
var transient BaseGUIController GUIController;

defaultproperties
{
    ConfiguredInternetSpeed=9636
    ConfiguredLanSpeed=20000
}