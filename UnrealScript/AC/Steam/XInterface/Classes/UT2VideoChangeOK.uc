/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2VideoChangeOK.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:4
 *
 *******************************************************************************/
class UT2VideoChangeOK extends UT2K3GUIPage
    editinlinenew
    instanced;

var int Count;
var string OrigRes;
var localized string RestoreTextPre;
var localized string RestoreTextPost;
var localized string RestoreTextSingular;

event Timer()
{
    -- Count;
    // End:0x41
    if(Count > 1)
    {
        GUILabel(Controls[4]).Caption = RestoreTextPre $ string(Count) $ RestoreTextPost;
    }
    // End:0x5d
    else
    {
        GUILabel(Controls[4]).Caption = RestoreTextSingular;
    }
    // End:0xef
    if(Count <= 0)
    {
        SetTimer(0.0);
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(OrigRes, "x16") != -1));
        PlayerOwner().ConsoleCommand("setres" @ OrigRes);
        Controller.CloseMenu(true);
    }
}

function Execute(string DesiredRes)
{
    local string res, bit, X, Y;
    local int i;

    // End:0x0e
    if(DesiredRes == "")
    {
        return;
    }
    res = Controller.GetCurrentRes();
    bit = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice Use16bit");
    // End:0x88
    if(bit == "true")
    {
        OrigRes = res $ "x16";
    }
    // End:0x9a
    else
    {
        OrigRes = res $ "x32";
    }
    // End:0xcd
    if(bool(PlayerOwner().ConsoleCommand("ISFULLSCREEN")))
    {
        OrigRes = OrigRes $ "f";
    }
    // End:0xdd
    else
    {
        OrigRes = OrigRes $ "w";
    }
    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(DesiredRes, "x16") != -1));
    PlayerOwner().ConsoleCommand("setres" @ DesiredRes);
    i = InStr(DesiredRes, "x");
    X = Left(DesiredRes, i);
    Y = Mid(DesiredRes, i + 1);
    // End:0x223
    if(int(X) < 640 || int(Y) < 480)
    {
        PlayerOwner().ConsoleCommand("tempsetres 640x480");
        SetTimer(0.0, false);
        Controller.ReplaceMenu("xinterface.UT2DeferChangeRes");
        Controller.GameResolution = Left(DesiredRes, Len(DesiredRes) - 4);
    }
    // End:0x234
    else
    {
        Controller.GameResolution = "";
    }
}

function StartTimer()
{
    Count = 15;
    SetTimer(1.0, true);
}

function bool InternalOnClick(GUIComponent Sender)
{
    SetTimer(0.0);
    // End:0x89
    if(Sender == Controls[2])
    {
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(OrigRes, "x16") != -1));
        PlayerOwner().ConsoleCommand("setres" @ OrigRes);
    }
    GUILabel(Controls[3]).Caption = "Accept these settings?";
    Controller.CloseMenu(Sender == Controls[2]);
    return true;
}

defaultproperties
{
    RestoreTextPre="(Restoring to original settings in "
    RestoreTextPost=" seconds)"
    RestoreTextSingular="(Restoring to original settings in 1 second.)"
    InactiveFadeColor=(R=128,G=128,B=128,A=255)
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.3750
    WinHeight=0.250
    OnActivate=StartTimer
}