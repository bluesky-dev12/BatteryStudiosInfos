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
    Count--;
    // End:0x41
    if(Count > 1)
    {
        GUILabel(Controls[4]).Caption = (RestoreTextPre $ string(Count)) $ RestoreTextPost;        
    }
    else
    {
        GUILabel(Controls[4]).Caption = RestoreTextSingular;
    }
    // End:0xEF
    if(Count <= 0)
    {
        SetTimer(0.0000000);
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(OrigRes, "x16") != -1));
        PlayerOwner().ConsoleCommand("setres" @ OrigRes);
        Controller.CloseMenu(true);
    }
    //return;    
}

function Execute(string DesiredRes)
{
    local string res, bit, X, Y;
    local int i;

    // End:0x0E
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
    else
    {
        OrigRes = res $ "x32";
    }
    // End:0xCD
    if(bool(PlayerOwner().ConsoleCommand("ISFULLSCREEN")))
    {
        OrigRes = OrigRes $ "f";        
    }
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
    if((int(X) < 640) || int(Y) < 480)
    {
        PlayerOwner().ConsoleCommand("tempsetres 640x480");
        SetTimer(0.0000000, false);
        Controller.ReplaceMenu("xinterface.UT2DeferChangeRes");
        Controller.GameResolution = Left(DesiredRes, Len(DesiredRes) - 4);        
    }
    else
    {
        Controller.GameResolution = "";
    }
    //return;    
}

function StartTimer()
{
    Count = 15;
    SetTimer(1.0000000, true);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    SetTimer(0.0000000);
    // End:0x89
    if(Sender == Controls[2])
    {
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(OrigRes, "x16") != -1));
        PlayerOwner().ConsoleCommand("setres" @ OrigRes);
    }
    GUILabel(Controls[3]).Caption = "Accept these settings?";
    Controller.CloseMenu(Sender == Controls[2]);
    return true;
    //return;    
}

defaultproperties
{
    RestoreTextPre="(??? ????? ?????"
    RestoreTextPost=" ?)"
    RestoreTextSingular="(??? ????? 1? ?? ?????)"
    InactiveFadeColor=(R=128,G=128,B=128,A=255)
    // Reference: GUIButton'XInterface_Decompressed.UT2VideoChangeOK.VidOKBackground'
    begin object name="VidOKBackground" class=XInterface_Decompressed.GUIButton
        StyleName="SquareBar"
        WinHeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=VidOKBackground.InternalOnKeyEvent
    end object
    Controls[0]=VidOKBackground
    // Reference: GUIButton'XInterface_Decompressed.UT2VideoChangeOK.AcceptButton'
    begin object name="AcceptButton" class=XInterface_Decompressed.GUIButton
        Caption="????? ?????"
        WinTop=0.7500000
        WinLeft=0.1250000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2VideoChangeOK.InternalOnClick
        OnKeyEvent=AcceptButton.InternalOnKeyEvent
    end object
    Controls[1]=AcceptButton
    // Reference: GUIButton'XInterface_Decompressed.UT2VideoChangeOK.BackButton'
    begin object name="BackButton" class=XInterface_Decompressed.GUIButton
        Caption="???? ????"
        WinTop=0.7500000
        WinLeft=0.6500000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2VideoChangeOK.InternalOnClick
        OnKeyEvent=BackButton.InternalOnKeyEvent
    end object
    Controls[2]=BackButton
    // Reference: GUILabel'XInterface_Decompressed.UT2VideoChangeOK.VideoOKDesc'
    begin object name="VideoOKDesc" class=XInterface_Decompressed.GUILabel
        Caption="????? ???????"
        TextAlign=1
        TextColor=(R=230,G=200,B=0,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4000000
        WinHeight=32.0000000
    end object
    Controls[3]=VideoOKDesc
    // Reference: GUILabel'XInterface_Decompressed.UT2VideoChangeOK.VideoOkTimerDesc'
    begin object name="VideoOkTimerDesc" class=XInterface_Decompressed.GUILabel
        Caption="(??? ????? 15? ?? ??)"
        TextAlign=1
        TextColor=(R=230,G=200,B=0,A=255)
        WinTop=0.4600000
        WinHeight=32.0000000
    end object
    Controls[4]=VideoOkTimerDesc
    WinTop=0.3750000
    WinHeight=0.2500000
    OnActivate=UT2VideoChangeOK.StartTimer
}