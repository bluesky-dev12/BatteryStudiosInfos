class UT2K4VideoChangeOK extends UT2K4GenericMessageBox
    editinlinenew
    instanced;

enum EVideoChangeType
{
    VCT_Resolution,                 // 0
    VCT_FullScreen,                 // 1
    VCT_Device                      // 2
};

var() noexport UT2K4VideoChangeOK.EVideoChangeType ChangeType;
var() noexport transient int Count;
var() noexport transient string RevertString;
var() localized string RestoreText;
var() localized string SecondText;
var() localized string SecondsText;
var() string OverrideResNotice;
var() automated GUIButton b_Cancel;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIPage).InitComponent(InController, inOwner);
    OverrideResNotice = ((Localize("UT2DeferChangeRes", "DialogText.Caption", "XInterface")) $ "|") $ (Localize("UT2DeferChangeRes", "DialogText2.Caption", "XInterface"));
    //return;    
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
    if((InStr(DesiredRes, "x16") != -1) || InStr(DesiredRes, "x32") != -1)
    {
        ChangeType = 0;
        ChangeResolution(DesiredRes);        
    }
    else
    {
        // End:0xA5
        if(DesiredRes ~= "togglefullscreen")
        {
            ChangeType = 1;
            ToggleFullScreen();            
        }
        else
        {
            ChangeType = 2;
            SetDevice(DesiredRes);
        }
    }
    //return;    
}

function ToggleFullScreen()
{
    RevertString = "togglefullscreen";
    PlayerOwner().ConsoleCommand(RevertString);
    StartTimer();
    //return;    
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
    else
    {
        RevertString $= "x32";
    }
    // End:0xC4
    if(bool(PlayerOwner().ConsoleCommand("ISFULLSCREEN")))
    {
        RevertString $= "f";        
    }
    else
    {
        RevertString $= "w";
    }
    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(DesiredRes, "x16") != -1));
    i = InStr(DesiredRes, "x");
    NewX = Left(DesiredRes, i);
    NewY = Mid(DesiredRes, i + 1);
    i = InStr(NewY, "x");
    // End:0x1E3
    if(i != -1)
    {
        NewDepth = Mid(NewY, i);
        NewY = Left(NewY, i);
        // End:0x1E3
        if((Right(NewDepth, 1) ~= "f") || Right(NewDepth, 1) ~= "w")
        {
            NewScreen = Right(NewDepth, 1);
            NewDepth = Left(NewDepth, Len(NewDepth) - 1);
        }
    }
    // End:0x292
    if((int(NewX) < 640) || int(NewY) < 480)
    {
        KillTimer();
        PlayerOwner().ConsoleCommand(("TEMPSETRES 640x480" $ NewDepth) $ NewScreen);
        // End:0x28F
        if(Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", "", OverrideResNotice))
        {
            Controller.ActivePage.__OnClose__Delegate = DeferChangeOnClose;
        }        
    }
    else
    {
        PlayerOwner().ConsoleCommand("SETRES" @ DesiredRes);
        StartTimer();
    }
    //return;    
}

function SetDevice(string NewRenderDevice)
{
    RevertString = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice Class");
    // End:0x8F
    if((RevertString ~= NewRenderDevice) || !Controller.SetRenderDevice(NewRenderDevice))
    {
        KillTimer();
        // End:0x8D
        if(Controller.ActivePage == self)
        {
            Controller.CloseMenu();
        }
        return;
    }
    StartTimer();
    //return;    
}

function DeferChangeOnClose(optional bool bCancelled)
{
    StartTimer();
    //return;    
}

function StartTimer()
{
    Count = 15;
    SetTimer(1.0000000, true);
    //return;    
}

event Timer()
{
    Count--;
    l_Text2.Caption = Repl(RestoreText, "%count%", string(Count));
    // End:0x6A
    if(Count == 1)
    {
        l_Text2.Caption = Repl(l_Text2.Caption, "%seconds%", SecondText);        
    }
    else
    {
        l_Text2.Caption = Repl(l_Text2.Caption, "%seconds%", SecondsText);
    }
    // End:0xAF
    if(Count <= 0)
    {
        InternalOnClick(b_Cancel);
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    KillTimer();
    // End:0xC0
    if(Sender == b_Cancel)
    {
        switch(ChangeType)
        {
            // End:0x86
            case 0:
                PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice Use16bit" @ string(InStr(RevertString, "x16") != -1));
                PlayerOwner().ConsoleCommand(RevertString);
                // End:0xC0
                break;
            // End:0xA1
            case 1:
                PlayerOwner().ConsoleCommand(RevertString);
                // End:0xC0
                break;
            // End:0xBD
            case 2:
                Controller.SetRenderDevice(RevertString);
                // End:0xC0
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        Controller.CloseMenu(Sender == b_Cancel);
        return true;
        //return;        
    }
}

defaultproperties
{
    RestoreText="(?? ??? ?? ?? ?? ?? ???. %count% %seconds%)"
    SecondText="?"
    SecondsText="?"
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4VideoChangeOK.bCancel'
    begin object name="bCancel" class=XInterface.GUIButton
        Caption="?? ??"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5583340
        WinLeft=0.6500000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2K4VideoChangeOK.InternalOnClick
        OnKeyEvent=bCancel.InternalOnKeyEvent
    end object
    b_Cancel=bCancel
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4VideoChangeOK.bOk'
    begin object name="bOk" class=XInterface.GUIButton
        Caption="?? ??"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5583340
        WinLeft=0.1750000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2K4VideoChangeOK.InternalOnClick
        OnKeyEvent=bOk.InternalOnKeyEvent
    end object
    b_OK=bOk
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4VideoChangeOK.lbText'
    begin object name="lbText" class=XInterface.GUILabel
        Caption="? ??? ?????????"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3900000
        WinHeight=0.0687500
    end object
    l_Text=lbText
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4VideoChangeOK.lbText2'
    begin object name="lbText2" class=XInterface.GUILabel
        Caption="(?? ??? 15? ?? ?????)"
        TextAlign=1
        StyleName="TextButton"
        WinTop=0.4600000
        WinHeight=0.0450000
    end object
    l_Text2=lbText2
    InactiveFadeColor=(R=128,G=128,B=128,A=255)
}