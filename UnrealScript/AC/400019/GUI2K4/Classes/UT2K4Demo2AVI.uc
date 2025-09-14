class UT2K4Demo2AVI extends LockedFloatingWindow
    editinlinenew
    instanced;

var() automated GUILabel lb_SavePos;
var() automated moEditBox eb_Filename;
var() automated moComboBox co_Resolution;
var() automated moSlider so_Quality;
var string DemoName;

function InitComponent(GUIController Controller, GUIComponent Owner)
{
    super.InitComponent(Controller, Owner);
    sb_Main.bFillClient = true;
    sb_Main.TopPadding = 0.0500000;
    sb_Main.SetPosition(0.0337500, 0.1000000, 0.6508590, 0.3447260);
    sb_Main.ManageComponent(eb_Filename);
    sb_Main.ManageComponent(co_Resolution);
    sb_Main.ManageComponent(so_Quality);
    co_Resolution.AddItem("160x120");
    co_Resolution.AddItem("320x240");
    co_Resolution.AddItem("640x480");
    co_Resolution.AddItem("800x600");
    co_Resolution.AddItem("1280x720");
    co_Resolution.SetIndex(1);
    so_Quality.SetValue(1.0000000);
    b_OK.__OnClick__Delegate = OkClick;
    //return;    
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
    else
    {
        S = Param1;
    }
    S = S $ ".AVI";
    eb_Filename.SetText(S);
    //return;    
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
        Y = int(Right(S, (Len(S) - P) - 1));
    }
    PlayerOwner().ConsoleCommand((((((((("demodump DEMO=" $ DemoName) @ "FILENAME=") $ eb_Filename.GetText()) @ "QUALITY=") $ string(so_Quality.GetValue())) @ "FPS=30 Width=") $ string(X)) @ "Height=") $ string(Y));
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Demo2AVI.lbSavePos'
    begin object name="lbSavePos" class=XInterface.GUILabel
        Caption="AVI ??? ..\\UserMovies? ??"
        TextAlign=1
        StyleName="ServerBrowserGrid"
        WinTop=0.7156250
        WinLeft=0.1178570
        WinWidth=0.7642860
        WinHeight=0.0618640
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_SavePos=lbSavePos
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4Demo2AVI.ebFilename'
    begin object name="ebFilename" class=XInterface.moEditBox
        Caption="?? ??: "
        OnCreateComponent=ebFilename.InternalOnCreateComponent
        Hint="??? AVI??? ??"
        WinTop=0.0916670
        WinLeft=0.0890630
        WinWidth=0.8953120
        WinHeight=0.0984380
        bBoundToParent=true
        bScaleToParent=true
    end object
    eb_Filename=ebFilename
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Demo2AVI.coResolution'
    begin object name="coResolution" class=XInterface.moComboBox
        ComponentJustification=0
        Caption="???"
        OnCreateComponent=coResolution.InternalOnCreateComponent
        Hint="??? ??? ???."
        WinTop=0.0793390
        WinLeft=0.0312500
        WinHeight=0.0600000
        TabOrder=0
    end object
    co_Resolution=coResolution
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Demo2AVI.soQuality'
    begin object name="soQuality" class=XInterface.moSlider
        MaxValue=1.0000000
        SliderCaptionStyleName="TextLabel"
        Caption="???"
        OnCreateComponent=soQuality.InternalOnCreateComponent
        Hint="?? ???? ?????."
        WinTop=0.1076180
        WinLeft=0.3453130
        WinWidth=0.5984380
        WinHeight=0.0375000
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    end object
    so_Quality=soQuality
    WindowName="AVI ??? ??..."
    DefaultLeft=0.1500000
    DefaultTop=0.2500000
    DefaultWidth=0.7000000
    DefaultHeight=0.5000000
    WinTop=0.2500000
    WinLeft=0.1500000
    WinWidth=0.7000000
    WinHeight=0.5000000
}