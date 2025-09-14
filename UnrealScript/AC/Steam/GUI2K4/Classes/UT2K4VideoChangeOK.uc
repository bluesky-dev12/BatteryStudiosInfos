/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4VideoChangeOK.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:8
 *	Functions:9
 *
 *******************************************************************************/
class UT2K4VideoChangeOK extends UT2K4GenericMessageBox
    editinlinenew
    instanced;

enum EVideoChangeType
{
    VCT_Resolution,
    VCT_FullScreen,
    VCT_Device
};

var() noexport UT2K4VideoChangeOK.EVideoChangeType ChangeType;
var() noexport transient int Count;
var() noexport transient string RevertString;
var() localized string RestoreText;
var() localized string SecondText;
var() localized string SecondsText;
var() string OverrideResNotice;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIPage).InitComponent(InController, inOwner);
    OverrideResNotice = Localize("UT2DeferChangeRes", "DialogText.Caption", "XInterface") $ "|" $ Localize("UT2DeferChangeRes", "DialogText2.Caption", "XInterface");
}

function Execute(string DesiredRes)
{
    // End:0x34
    if(DesiredRes == "")
    {
        KillTimer();
        // End:0x32
        if(Controller.ActivePage == self)
        {
            Controller.CloseMenu();
        }
        return;
    }
    // End:0x78
    if(InStr(DesiredRes, "x16") != -1 || InStr(DesiredRes, "x32") != -1)
    {
        ChangeType = 0;
        ChangeResolution(DesiredRes);
    }
    // End:0xb8
    else
    {
        // End:0xa5
        if(DesiredRes ~= "togglefullscreen")
        {
            ChangeType = 1;
            ToggleFullScreen();
        }
        // End:0xb8
        else
        {
            ChangeType = 2;
            SetDevice(DesiredRes);
        }
    }
}

function ToggleFullScreen()
{
    RevertString = "togglefullscreen";
    PlayerOwner().ConsoleCommand(RevertString);
    StartTimer();
}

function ChangeResolution(string DesiredRes)
{
    local int i;
    local string CurrentRes, NewX, NewY, NewDepth, NewScreen;

    local bool lowres;

    CurrentRes = Controller.GetCurrentRes();
    lowres = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice Use16bit"));
    RevertString = "setres" @ CurrentRes;
    // End:0x87
    if(lowres)
    {
        RevertString $= "x16";
    }
    // End:0x95
    else
    {
        RevertString $= "x32";
    }
    // End:0xc4
    if(bool(PlayerOwner().ConsoleCommand("ISFULLSCREEN")))
    {
        RevertString $= "f";
    }
    // End:0xd0
    else
    {
        RevertString $= "w";
    }
    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(DesiredRes, "x16") != -1));
    i = InStr(DesiredRes, "x");
    NewX = Left(DesiredRes, i);
    NewY = Mid(DesiredRes, i + 1);
    i = InStr(NewY, "x");
    // End:0x1e3
    if(i != -1)
    {
        NewDepth = Mid(NewY, i);
        NewY = Left(NewY, i);
        // End:0x1e3
        if(Right(NewDepth, 1) ~= "f" || Right(NewDepth, 1) ~= "w")
        {
            NewScreen = Right(NewDepth, 1);
            NewDepth = Left(NewDepth, Len(NewDepth) - 1);
        }
    }
    // End:0x292
    if(int(NewX) < 640 || int(NewY) < 480)
    {
        KillTimer();
        PlayerOwner().ConsoleCommand("TEMPSETRES 640x480" $ NewDepth $ NewScreen);
        // End:0x28f
        if(Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", "", OverrideResNotice))
        {
            Controller.ActivePage.__OnClose__Delegate = DeferChangeOnClose;
        }
    }
    // End:0x2b5
    else
    {
        PlayerOwner().ConsoleCommand("SETRES" @ DesiredRes);
        StartTimer();
    }
}

function SetDevice(string NewRenderDevice)
{
    RevertString = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice Class");
    // End:0x8f
    if(RevertString ~= NewRenderDevice || !Controller.SetRenderDevice(NewRenderDevice))
    {
        KillTimer();
        // End:0x8d
        if(Controller.ActivePage == self)
        {
            Controller.CloseMenu();
        }
        return;
    }
    StartTimer();
}

function DeferChangeOnClose(optional bool bCancelled)
{
    StartTimer();
}

function StartTimer()
{
    Count = 15;
    SetTimer(1.0, true);
}

event Timer()
{
    -- Count;
    l_Text2.Caption = Repl(RestoreText, "%count%", string(Count));
    // End:0x6a
    if(Count == 1)
    {
        l_Text2.Caption = Repl(l_Text2.Caption, "%seconds%", SecondText);
    }
    // End:0x99
    else
    {
        l_Text2.Caption = Repl(l_Text2.Caption, "%seconds%", SecondsText);
    }
    // End:0xaf
    if(Count <= 0)
    {
        InternalOnClick(b_Cancel);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    KillTimer();
    // End:0xc0
    if(Sender == b_Cancel)
    {
        switch(ChangeType)
        {
            // End:0x86
            case 0:
                PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(RevertString, "x16") != -1));
                PlayerOwner().ConsoleCommand(RevertString);
                // End:0xc0
                break;
            // End:0xa1
            case 1:
                PlayerOwner().ConsoleCommand(RevertString);
                // End:0xc0
                break;
            // End:0xbd
            case 2:
                Controller.SetRenderDevice(RevertString);
                // End:0xc0
                break;
            // End:0xffff
            default:
            }
            Controller.CloseMenu(Sender == b_Cancel);
            return true;
}

defaultproperties
{
    RestoreText="(?? ??? ?? ?? ?? ?? ???. %count% %seconds%)"
    SecondText="?"
    SecondsText="?"
    begin object name=bCancel class=GUIButton
        Caption="?? ??"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5583340
        WinLeft=0.650
        WinWidth=0.20
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4VideoChangeOK.bCancel'
    b_Cancel=bCancel
    begin object name=bOk class=GUIButton
        Caption="?? ??"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5583340
        WinLeft=0.1750
        WinWidth=0.20
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4VideoChangeOK.bOk'
    b_OK=bOk
    begin object name=lbText class=GUILabel
        Caption="? ??? ?????????"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.390
        WinHeight=0.068750
    object end
    // Reference: GUILabel'UT2K4VideoChangeOK.lbText'
    l_Text=lbText
    begin object name=lbText2 class=GUILabel
        Caption="(?? ??? 15? ?? ?????)"
        TextAlign=1
        StyleName="TextButton"
        WinTop=0.460
        WinHeight=0.0450
    object end
    // Reference: GUILabel'UT2K4VideoChangeOK.lbText2'
    l_Text2=lbText2
    InactiveFadeColor=(R=128,G=128,B=128,A=255)
}