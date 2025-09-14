class UT2MainMenu extends UT2K3GUIPage
    editinlinenew
    instanced;

var bool AllowClose;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    // End:0x50
    if(PlayerOwner().Level.IsDemoBuild())
    {
        Controls[3].SetFocus(none);
        Controls[2].MenuStateChange(4);
    }
    //return;    
}

function OnClose(optional bool bCanceled)
{
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2A
    if((int(key) == 27) && int(State) == 1)
    {
        AllowClose = true;
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool CanClose(optional bool bCanceled)
{
    // End:0x30
    if(AllowClose)
    {
        Controller.OpenMenu("xinterface.UT2QuitPage");
    }
    return false;
    //return;    
}

function bool ButtonClick(GUIComponent Sender)
{
    // End:0x41
    if(Sender == Controls[2])
    {
        Controller.OpenMenu("xinterface.UT2SinglePlayerMain");
    }
    // End:0x7C
    if(Sender == Controls[3])
    {
        Controller.OpenMenu("xinterface.ServerBrowser");
    }
    // End:0xC0
    if(Sender == Controls[4])
    {
        Controller.OpenMenu("xinterface.UT2MultiplayerHostPage");
    }
    // End:0x102
    if(Sender == Controls[5])
    {
        Controller.OpenMenu("xinterface.UT2InstantActionPage");
    }
    // End:0x13F
    if(Sender == Controls[6])
    {
        Controller.OpenMenu("xinterface.UT2SettingsPage");
    }
    // End:0x178
    if(Sender == Controls[7])
    {
        Controller.OpenMenu("xinterface.UT2QuitPage");
    }
    return true;
    //return;    
}

defaultproperties
{
    bDisconnectOnOpen=true
    bAllowedAsLast=true
    OnCanClose=UT2MainMenu.CanClose
    // Reference: GUIImage'XInterface_Decompressed.UT2MainMenu.ImgUT2Logo'
    begin object name="ImgUT2Logo" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=-0.0338540
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.5000000
    end object
    Controls[0]=ImgUT2Logo
    // Reference: GUIImage'XInterface_Decompressed.UT2MainMenu.ImgUT2Shader'
    begin object name="ImgUT2Shader" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.2239580
        WinLeft=0.3994140
        WinWidth=0.1982420
        WinHeight=0.1328130
    end object
    Controls[1]=ImgUT2Shader
    // Reference: GUIButton'XInterface_Decompressed.UT2MainMenu.SinglePlayerButton'
    begin object name="SinglePlayerButton" class=XInterface_Decompressed.GUIButton
        Caption="SINGLE PLAYER"
        StyleName="TextButton"
        Hint="Play through the Tournament"
        WinTop=0.4388020
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.0750000
        bFocusOnWatch=true
        OnClick=UT2MainMenu.ButtonClick
        OnKeyEvent=SinglePlayerButton.InternalOnKeyEvent
    end object
    Controls[2]=SinglePlayerButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MainMenu.MultiplayerButton'
    begin object name="MultiplayerButton" class=XInterface_Decompressed.GUIButton
        Caption="PLAY ON-LINE/LAN"
        StyleName="TextButton"
        Hint="Play with Human Opponents Over the Lan or the Internet"
        WinTop=0.5062510
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.0750000
        bFocusOnWatch=true
        OnClick=UT2MainMenu.ButtonClick
        OnKeyEvent=MultiplayerButton.InternalOnKeyEvent
    end object
    Controls[3]=MultiplayerButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MainMenu.HostButton'
    begin object name="HostButton" class=XInterface_Decompressed.GUIButton
        Caption="HOST MULTIPLAYER GAME"
        StyleName="TextButton"
        Hint="Start a server an invite others to join your game"
        WinTop=0.5778660
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.0750000
        bFocusOnWatch=true
        OnClick=UT2MainMenu.ButtonClick
        OnKeyEvent=HostButton.InternalOnKeyEvent
    end object
    Controls[4]=HostButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MainMenu.InstantActionButton'
    begin object name="InstantActionButton" class=XInterface_Decompressed.GUIButton
        Caption="INSTANT ACTION"
        StyleName="TextButton"
        Hint="Play a Practice Match"
        WinTop=0.6583340
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.0750000
        bFocusOnWatch=true
        OnClick=UT2MainMenu.ButtonClick
        OnKeyEvent=InstantActionButton.InternalOnKeyEvent
    end object
    Controls[5]=InstantActionButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MainMenu.SettingsButton'
    begin object name="SettingsButton" class=XInterface_Decompressed.GUIButton
        Caption="SETTINGS"
        StyleName="TextButton"
        Hint="Change Your Controls and Settings"
        WinTop=0.7335950
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.0750000
        bFocusOnWatch=true
        OnClick=UT2MainMenu.ButtonClick
        OnKeyEvent=SettingsButton.InternalOnKeyEvent
    end object
    Controls[6]=SettingsButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MainMenu.QuitButton'
    begin object name="QuitButton" class=XInterface_Decompressed.GUIButton
        Caption="QUIT"
        StyleName="SquareMenuButton"
        Hint="Exit Unreal Tournament 2003"
        WinTop=0.9057250
        WinLeft=0.3916020
        WinWidth=0.2050780
        WinHeight=0.0427730
        bFocusOnWatch=true
        OnClick=UT2MainMenu.ButtonClick
        OnKeyEvent=QuitButton.InternalOnKeyEvent
    end object
    Controls[7]=QuitButton
    OnKeyEvent=UT2MainMenu.MyKeyEvent
}