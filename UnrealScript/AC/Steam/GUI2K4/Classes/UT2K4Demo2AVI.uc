/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Demo2AVI.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4Demo2AVI extends LockedFloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lb_SavePos;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox eb_Filename;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Resolution;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider so_Quality;
var string DemoName;

function InitComponent(GUIController Controller, GUIComponent Owner)
{
    super.InitComponent(Controller, Owner);
    sb_Main.bFillClient = true;
    sb_Main.TopPadding = 0.050;
    sb_Main.SetPosition(0.033750, 0.10, 0.6508590, 0.3447260);
    sb_Main.ManageComponent(eb_Filename);
    sb_Main.ManageComponent(co_Resolution);
    sb_Main.ManageComponent(so_Quality);
    co_Resolution.AddItem("160x120");
    co_Resolution.AddItem("320x240");
    co_Resolution.AddItem("640x480");
    co_Resolution.AddItem("800x600");
    co_Resolution.AddItem("1280x720");
    co_Resolution.SetIndex(1);
    so_Quality.SetValue(1.0);
    b_OK.__OnClick__Delegate = OkClick;
}

event HandleParameters(string Param1, string Param2)
{
    local string S;
    local int P;

    DemoName = Param1;
    P = InStr(Caps(Param1), ".DEMO4");
    // End:0x42
    if(P >= 0)
    {
        S = Left(Param1, P);
    }
    // End:0x4d
    else
    {
        S = Param1;
    }
    S = S $ ".AVI";
    eb_Filename.SetText(S);
}

function bool OkClick(GUIComponent Sender)
{
    local string S;
    local int P, X, Y;

    S = Caps(co_Resolution.GetText());
    P = InStr(S, "X");
    X = 320;
    Y = 240;
    // End:0x79
    if(P >= 0)
    {
        X = int(Left(S, P));
        Y = int(Right(S, Len(S) - P - 1));
    }
    PlayerOwner().ConsoleCommand("demodump DEMO=" $ DemoName @ "FILENAME=" $ eb_Filename.GetText() @ "QUALITY=" $ string(so_Quality.GetValue()) @ "FPS=30 Width=" $ string(X) @ "Height=" $ string(Y));
    return true;
}

defaultproperties
{
    begin object name=lbSavePos class=GUILabel
        Caption="AVI ??? ..\UserMovies? ??"
        TextAlign=1
        StyleName="ServerBrowserGrid"
        WinTop=0.7156250
        WinLeft=0.1178570
        WinWidth=0.7642860
        WinHeight=0.0618640
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUILabel'UT2K4Demo2AVI.lbSavePos'
    lb_SavePos=lbSavePos
    begin object name=ebFilename class=moEditBox
        Caption="?? ??: "
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? AVI??? ??"
        WinTop=0.0916670
        WinLeft=0.0890630
        WinWidth=0.8953120
        WinHeight=0.0984380
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moEditBox'UT2K4Demo2AVI.ebFilename'
    eb_Filename=ebFilename
    begin object name=coResolution class=moComboBox
        ComponentJustification=0
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ???."
        WinTop=0.0793390
        WinLeft=0.031250
        WinHeight=0.060
        TabOrder=0
    object end
    // Reference: moComboBox'UT2K4Demo2AVI.coResolution'
    co_Resolution=coResolution
    begin object name=soQuality class=moSlider
        MaxValue=1.0
        SliderCaptionStyleName="TextLabel"
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ???? ?????."
        WinTop=0.1076180
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.03750
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moSlider'UT2K4Demo2AVI.soQuality'
    so_Quality=soQuality
    WindowName="AVI ??? ??..."
    DefaultLeft=0.150
    DefaultTop=0.250
    DefaultWidth=0.70
    DefaultHeight=0.50
    WinTop=0.250
    WinLeft=0.150
    WinWidth=0.70
    WinHeight=0.50
}