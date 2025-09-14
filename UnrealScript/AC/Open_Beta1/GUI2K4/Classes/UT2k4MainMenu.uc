class UT2k4MainMenu extends UT2K4GUIPage
    config(User)
    editinlinenew
    instanced;

var() automated BackgroundImage i_bkChar;
var() automated BackgroundImage i_Background;
var() automated GUIImage i_UT2Logo;
var() automated GUIImage i_PanHuge;
var() automated GUIImage i_PanBig;
var() automated GUIImage i_PanSmall;
var() automated GUIImage i_UT2Shader;
var() automated GUIImage i_TV;
var() automated GUIButton b_SinglePlayer;
var() automated GUIButton b_MultiPlayer;
var() automated GUIButton b_Host;
var() automated GUIButton b_InstantAction;
var() automated GUIButton b_ModsAndDemo;
var() automated GUIButton b_Settings;
var() automated GUIButton b_Quit;
var bool bAllowClose;
var array<Material> CharShots;
var float CharFade;
var float DesiredCharFade;
var float CharFadeTime;
var export editinline GUIButton selected;
var() bool bNoInitDelay;
var() config string MenuSong;
var bool bNewNews;
var float FadeTime;
var bool FadeOut;
var localized string NewNewsMsg;
var localized string FireWallTitle;
var localized string FireWallMsg;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    Background = MyController.DefaultPens[0];
    // End:0x5E
    if(PlayerOwner().Level.IsDemoBuild())
    {
        b_SinglePlayer.DisableMe();
        b_MultiPlayer.SetFocus(none);
    }
    i_bkChar.Image = CharShots[Rand(CharShots.Length)];
    //return;    
}

event Timer()
{
    bNoInitDelay = true;
    // End:0x2D
    if(!Controller.bQuietMenu)
    {
        PlayerOwner().PlaySound(SlideInSound, 0);
    }
    i_TV.Animate(-0.0009770, 0.3322920, 0.3500000);
    i_UT2Logo.Animate(0.0072260, 0.0169260, 0.3500000);
    i_UT2Shader.Animate(0.2490230, 0.1809880, 0.3500000);
    i_TV.__OnEndAnimation__Delegate = MenuIn_OnArrival;
    i_UT2Logo.__OnEndAnimation__Delegate = MenuIn_OnArrival;
    i_UT2Shader.__OnEndAnimation__Delegate = MenuIn_OnArrival;
    //return;    
}

function MenuIn_OnArrival(GUIComponent Sender, GUI.EAnimationType Type)
{
    Sender.__OnArrival__Delegate = None;
    // End:0x1F
    if(bAnimating)
    {
        return;
    }
    i_UT2Shader.__OnDraw__Delegate = MyOnDraw;
    DesiredCharFade = 255.0000000;
    CharFadeTime = 0.7500000;
    // End:0x6C
    if(!Controller.bQuietMenu)
    {
        PlayerOwner().PlaySound(FadeInSound);
    }
    b_SinglePlayer.Animate(0.3153590, 0.3688130, 0.3500000);
    b_SinglePlayer.__OnArrival__Delegate = PlayPopSound;
    b_MultiPlayer.Animate(0.3632460, 0.4492820, 0.4000000);
    b_MultiPlayer.__OnArrival__Delegate = PlayPopSound;
    b_Host.Animate(0.3950970, 0.5340270, 0.4500000);
    b_Host.__OnArrival__Delegate = PlayPopSound;
    b_InstantAction.Animate(0.4236400, 0.6186190, 0.5000000);
    b_InstantAction.__OnArrival__Delegate = PlayPopSound;
    b_ModsAndDemo.Animate(0.4334060, 0.7058590, 0.5500000);
    b_ModsAndDemo.__OnArrival__Delegate = PlayPopSound;
    b_Settings.Animate(0.4344770, 0.8003270, 0.6000000);
    b_Settings.__OnArrival__Delegate = PlayPopSound;
    b_Quit.Animate(0.4247110, 0.8875670, 0.6500000);
    b_Quit.__OnArrival__Delegate = MenuIn_Done;
    //return;    
}

event Opened(GUIComponent Sender)
{
    // End:0x37
    if(bDebugging)
    {
        Log((string(Name) $ ".Opened()   Sender:") $ string(Sender), 'Debug');
    }
    // End:0x73
    if((Sender != none) && PlayerOwner().Level.IsPendingConnection())
    {
        PlayerOwner().ConsoleCommand("CANCEL");
    }
    super(GUIMultiComponent).Opened(Sender);
    bNewNews = Class'GUI2K4_Decompressed.Ut2K4Community'.default.ModRevLevel != Class'GUI2K4_Decompressed.Ut2K4Community'.default.LastModRevLevel;
    FadeTime = 0.0000000;
    FadeOut = true;
    selected = none;
    i_TV.Animate(-0.0009770, 1.6686190, 0.0000000);
    i_UT2Logo.Animate(0.0072260, -0.3925790, 0.0000000);
    i_UT2Shader.Animate(0.2490230, -0.1054700, 0.0000000);
    b_SinglePlayer.Animate(1.0000000, 0.3688130, 0.0000000);
    b_MultiPlayer.Animate(1.1500000, 0.4492820, 0.0000000);
    b_Host.Animate(1.3000000, 0.5340270, 0.0000000);
    b_InstantAction.Animate(1.4500000, 0.6186190, 0.0000000);
    b_ModsAndDemo.Animate(1.6000000, 0.7058590, 0.0000000);
    b_Settings.Animate(1.7500000, 0.8003270, 0.0000000);
    b_Quit.Animate(1.9000000, 0.8875670, 0.0000000);
    //return;    
}

function MenuIn_Done(GUIComponent Sender, GUI.EAnimationType Type)
{
    Sender.__OnArrival__Delegate = None;
    PlayPopSound(Sender, Type);
    //return;    
}

function PlayPopSound(GUIComponent Sender, GUI.EAnimationType Type)
{
    // End:0x23
    if(!Controller.bQuietMenu)
    {
        PlayerOwner().PlaySound(PopInSound);
    }
    //return;    
}

function bool PanHugeDraw(Canvas Canvas)
{
    i_PanHuge.ImageColor.A = byte(float(40) * (CharFade / float(255)));
    i_PanBig.ImageColor.A = byte(float(75) * (CharFade / float(255)));
    i_PanSmall.ImageColor.A = i_bkChar.ImageColor.A;
    return false;
    //return;    
}

function bool BkCharDraw(Canvas Canvas)
{
    // End:0x71
    if(CharFadeTime > float(0))
    {
        CharFade += ((DesiredCharFade - CharFade) * (Controller.RenderDelta / CharFadeTime));
        CharFadeTime -= Controller.RenderDelta;
        // End:0x71
        if(CharFadeTime <= 0.0000000)
        {
            CharFade = DesiredCharFade;
            CharFadeTime = 0.0000000;
        }
    }
    i_bkChar.ImageColor.A = byte(int(CharFade));
    return false;
    //return;    
}

function MainReopened()
{
    // End:0x45
    if(!PlayerOwner().Level.IsPendingConnection())
    {
        i_bkChar.Image = CharShots[Rand(CharShots.Length)];
        Opened(none);
        Timer();
    }
    //return;    
}

function InternalOnOpen()
{
    // End:0x12
    if(bNoInitDelay)
    {
        Timer();        
    }
    else
    {
        SetTimer(0.5000000, false);
    }
    Controller.PerformRestore();
    PlayerOwner().ClientSetInitialMusic(MenuSong, 2);
    //return;    
}

function OnClose(optional bool bCancelled)
{
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x25
    if((int(key) == 27) && int(State) == 1)
    {
        bAllowClose = true;
    }
    return false;
    //return;    
}

function bool CanClose(optional bool bCancelled)
{
    // End:0x14
    if(bAllowClose)
    {
        ButtonClick(b_Quit);
    }
    bAllowClose = false;
    return PlayerOwner().Level.IsPendingConnection();
    //return;    
}

function MoveOn()
{
    switch(selected)
    {
        // End:0x57
        case b_SinglePlayer:
            Profile("SinglePlayer");
            Controller.OpenMenu(Controller.GetSinglePlayerPage());
            Profile("SinglePlayer");
            return;
        // End:0xF7
        case b_MultiPlayer:
            // End:0xAD
            if(!Controller.AuthroizeFirewall())
            {
                Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", FireWallTitle, FireWallMsg);
                return;
            }
            Profile("ServerBrowser");
            Controller.OpenMenu(Controller.GetServerBrowserPage());
            Profile("ServerBrowser");
            return;
        // End:0x189
        case b_Host:
            // End:0x14D
            if(!Controller.AuthroizeFirewall())
            {
                Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", FireWallTitle, FireWallMsg);
                return;
            }
            Profile("MPHost");
            Controller.OpenMenu(Controller.GetMultiplayerPage());
            Profile("MPHost");
            return;
        // End:0x1DB
        case b_InstantAction:
            Profile("InstantAction");
            Controller.OpenMenu(Controller.GetInstantActionPage());
            Profile("InstantAction");
            return;
        // End:0x279
        case b_ModsAndDemo:
            // End:0x231
            if(!Controller.AuthroizeFirewall())
            {
                Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", FireWallTitle, FireWallMsg);
                return;
            }
            Profile("ModsandDemos");
            Controller.OpenMenu(Controller.GetModPage());
            Profile("ModsandDemos");
            return;
        // End:0x2C1
        case b_Settings:
            Profile("Settings");
            Controller.OpenMenu(Controller.GetSettingsPage());
            Profile("Settings");
            return;
        // End:0x301
        case b_Quit:
            Profile("Quit");
            Controller.OpenMenu(Controller.GetQuitPage());
            Profile("Quit");
            return;
        // End:0xFFFF
        default:
            StopWatch(true);
            //return;
            break;
    }    
}

function bool ButtonClick(GUIComponent Sender)
{
    // End:0x20
    if(GUIButton(Sender) != none)
    {
        selected = GUIButton(Sender);
    }
    // End:0x2D
    if(selected == none)
    {
        return false;
    }
    InitAnimOut(i_TV, -0.0009770, 1.6686190, 0.3500000);
    InitAnimOut(i_UT2Logo, 0.0072260, -0.3925790, 0.3500000);
    InitAnimOut(i_UT2Shader, 0.2490230, -0.1054700, 0.3500000);
    InitAnimOut(b_SinglePlayer, 1.0000000, 0.3688130, 0.3500000);
    InitAnimOut(b_MultiPlayer, 1.1500000, 0.4492820, 0.3500000);
    InitAnimOut(b_Host, 1.3000000, 0.5340270, 0.3500000);
    InitAnimOut(b_InstantAction, 1.4500000, 0.6186190, 0.3500000);
    InitAnimOut(b_ModsAndDemo, 1.6000000, 0.7058590, 0.3500000);
    InitAnimOut(b_Settings, 1.7500000, 0.8003270, 0.3500000);
    InitAnimOut(b_Quit, 1.9000000, 0.8875670, 0.3500000);
    DesiredCharFade = 0.0000000;
    CharFadeTime = 0.3500000;
    return true;
    //return;    
}

function InitAnimOut(GUIComponent C, float X, float Y, float Z)
{
    // End:0x46
    if(C == none)
    {
        Warn("UT2K4MainMenu.InitAnimOut called with null component!");
        return;
    }
    C.Animate(X, Y, Z);
    C.__OnEndAnimation__Delegate = MenuOut_Done;
    //return;    
}

function MenuOut_Done(GUIComponent Sender, GUI.EAnimationType Type)
{
    Sender.__OnArrival__Delegate = None;
    // End:0x1F
    if(bAnimating)
    {
        return;
    }
    MoveOn();
    //return;    
}

function bool MyOnDraw(Canvas Canvas)
{
    local export editinline GUIButton FButton;
    local int i, X2;
    local float XL, YL, DeltaTime;

    // End:0x21
    if(bAnimating || !Controller.bCurMenuInitialized)
    {
        return false;
    }
    DeltaTime = Controller.RenderDelta;
    i = 0;
    J0x3C:

    // End:0x1F8 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x1EE
        if(GUIButton(Controls[i]) != none)
        {
            FButton = GUIButton(Controls[i]);
            // End:0xEE
            if((FButton.Tag > 0) && int(FButton.MenuState) != int(2))
            {
                FButton.Tag -= int(float(784) * DeltaTime);
                // End:0xEB
                if(FButton.Tag < 0)
                {
                    FButton.Tag = 0;
                }                
            }
            else
            {
                // End:0x118
                if(int(FButton.MenuState) == int(2))
                {
                    FButton.Tag = 200;
                }
            }
            // End:0x1EE
            if(FButton.Tag > 0)
            {
                FButton.Style.TextSize(Canvas, 2, FButton.Caption, XL, YL, FButton.FontScale);
                X2 = int((FButton.ActualLeft() + XL) + float(16));
                Canvas.Style = 5;
                Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(FButton.Tag));
                Canvas.SetPos(0.0000000, FButton.ActualTop());
            }
        }
        i++;
        // [Loop Continue]
        goto J0x3C;
    }
    return false;
    //return;    
}

event bool NotifyLevelChange()
{
    // End:0x55
    if(bDebugging)
    {
        Log((string(Name) @ "NotifyLevelChange  PendingConnection:") $ string(PlayerOwner().Level.IsPendingConnection()));
    }
    return PlayerOwner().Level.IsPendingConnection();
    //return;    
}

function bool CommunityDraw(Canvas C)
{
    local float X, Y, XL, YL, A;

    // End:0x1D0
    if(bNewNews)
    {
        A = 255.0000000 * (FadeTime / 1.0000000);
        // End:0x3D
        if(FadeOut)
        {
            A = 255.0000000 - A;
        }
        FadeTime += Controller.RenderDelta;
        // End:0x7B
        if(FadeTime >= 1.0000000)
        {
            FadeTime = 0.0000000;
            FadeOut = !FadeOut;
        }
        A = FClamp(A, 1.0000000, 254.0000000);
        X = b_ModsAndDemo.ActualLeft();
        Y = b_Settings.ActualTop();
        C.Font = Controller.GetMenuFont("UT2MenuFont").GetFont(int(C.ClipX));
        C.StrLen("Qz,q", XL, YL);
        Y -= (YL - float(5));
        C.Style = 5;
        C.SetPos(X + float(1), Y + float(1));
        C.SetDrawColor(0, 0, 0, byte(A));
        C.DrawText(NewNewsMsg);
        C.SetPos(X, Y);
        C.SetDrawColor(207, 185, 103, byte(A));
        C.DrawText(NewNewsMsg);
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: BackgroundImage'GUI2K4_Decompressed.UT2k4MainMenu.ImgBkChar'
    begin object name="ImgBkChar" class=XInterface.BackgroundImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageRenderStyle=5
        X1=0
        Y1=0
        X2=1024
        Y2=768
        RenderWeight=0.0400000
        Tag=0
        OnDraw=UT2k4MainMenu.BkCharDraw
    end object
    i_bkChar=ImgBkChar
    // Reference: BackgroundImage'GUI2K4_Decompressed.UT2k4MainMenu.PageBackground'
    begin object name="PageBackground" class=XInterface.BackgroundImage
        ImageStyle=2
        ImageRenderStyle=5
        X1=0
        Y1=0
        X2=1024
        Y2=768
    end object
    i_Background=PageBackground
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4MainMenu.ImgUT2Logo'
    begin object name="ImgUT2Logo" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.0169260
        WinLeft=0.0072260
        WinWidth=0.6388680
        WinHeight=0.3925790
        RenderWeight=0.0500000
    end object
    i_UT2Logo=ImgUT2Logo
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4MainMenu.iPanHuge'
    begin object name="iPanHuge" class=XInterface.GUIImage
        ImageColor=(R=255,G=255,B=255,A=40)
        ImageStyle=2
        WinTop=0.0017190
        WinHeight=0.3679690
        RenderWeight=0.0200000
        OnDraw=UT2k4MainMenu.PanHugeDraw
    end object
    i_PanHuge=iPanHuge
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4MainMenu.iPanBig'
    begin object name="iPanBig" class=XInterface.GUIImage
        ImageColor=(R=255,G=255,B=255,A=75)
        ImageStyle=2
        WinTop=0.0817710
        WinHeight=0.1524220
        RenderWeight=0.0230000
    end object
    i_PanBig=iPanBig
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4MainMenu.iPanSmall'
    begin object name="iPanSmall" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.2260420
        WinHeight=0.0400000
        RenderWeight=0.0260000
    end object
    i_PanSmall=iPanSmall
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4MainMenu.ImgUT2Shader'
    begin object name="ImgUT2Shader" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1809880
        WinLeft=0.2490230
        WinWidth=0.1552730
        WinHeight=0.1054700
        RenderWeight=0.0600000
    end object
    i_UT2Shader=ImgUT2Shader
    // Reference: GUIImage'GUI2K4_Decompressed.UT2k4MainMenu.ImgTV'
    begin object name="ImgTV" class=XInterface.GUIImage
        ImageStyle=2
        X1=0
        Y1=1
        X2=512
        Y2=511
        WinTop=0.3322920
        WinLeft=-0.0009770
        WinWidth=0.5000000
        WinHeight=0.6686190
        RenderWeight=5.0700002
    end object
    i_TV=ImgTV
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4MainMenu.SinglePlayerButton'
    begin object name="SinglePlayerButton" class=XInterface.GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="?? ???"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="??? ?? ??? ???? ??? ???? ? ????"
        WinTop=0.3688130
        WinLeft=0.3153590
        WinWidth=0.7150220
        WinHeight=0.0750000
        TabOrder=0
        bFocusOnWatch=true
        OnClick=UT2k4MainMenu.ButtonClick
        OnKeyEvent=SinglePlayerButton.InternalOnKeyEvent
    end object
    b_SinglePlayer=SinglePlayerButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4MainMenu.MultiplayerButton'
    begin object name="MultiplayerButton" class=XInterface.GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="?? ??? ??"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="??? ???? ?? ?? ???? ??? ??? ? ? ????"
        WinTop=0.4492820
        WinLeft=0.3632460
        WinWidth=0.6598990
        WinHeight=0.0750000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=UT2k4MainMenu.ButtonClick
        OnKeyEvent=MultiplayerButton.InternalOnKeyEvent
    end object
    b_MultiPlayer=MultiplayerButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4MainMenu.HostButton'
    begin object name="HostButton" class=XInterface.GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="?? ???"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="??? ????, ?? ???? ??? ?????"
        WinTop=0.5340270
        WinLeft=0.3950970
        WinWidth=0.6271310
        WinHeight=0.0750000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=UT2k4MainMenu.ButtonClick
        OnKeyEvent=HostButton.InternalOnKeyEvent
    end object
    b_Host=HostButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4MainMenu.InstantActionButton'
    begin object name="InstantActionButton" class=XInterface.GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="???? ??"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="?? ??? ?? ??? ???"
        WinTop=0.6186190
        WinLeft=0.4236400
        WinWidth=0.5936660
        WinHeight=0.0750000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=UT2k4MainMenu.ButtonClick
        OnKeyEvent=InstantActionButton.InternalOnKeyEvent
    end object
    b_InstantAction=InstantActionButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4MainMenu.ModsAndDemosButton'
    begin object name="ModsAndDemosButton" class=XInterface.GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="????"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="UT2004 ?????? ?? ??, ??, ?? ?? ??? ? ????."
        WinTop=0.7058590
        WinLeft=0.4334060
        WinWidth=0.5741350
        WinHeight=0.0750000
        TabOrder=4
        bFocusOnWatch=true
        OnDraw=UT2k4MainMenu.CommunityDraw
        OnClick=UT2k4MainMenu.ButtonClick
        OnKeyEvent=ModsAndDemosButton.InternalOnKeyEvent
    end object
    b_ModsAndDemo=ModsAndDemosButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4MainMenu.SettingsButton'
    begin object name="SettingsButton" class=XInterface.GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="??"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="???? ???? ??? ?????"
        WinTop=0.8003270
        WinLeft=0.4344770
        WinWidth=0.5804780
        WinHeight=0.0750000
        TabOrder=5
        bFocusOnWatch=true
        OnClick=UT2k4MainMenu.ButtonClick
        OnKeyEvent=SettingsButton.InternalOnKeyEvent
    end object
    b_Settings=SettingsButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4MainMenu.QuitButton'
    begin object name="QuitButton" class=XInterface.GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="UT2004 ???"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="??? ????"
        WinTop=0.8875670
        WinLeft=0.4247110
        WinWidth=0.5267670
        WinHeight=0.0750000
        TabOrder=6
        bFocusOnWatch=true
        OnClick=UT2k4MainMenu.ButtonClick
        OnKeyEvent=QuitButton.InternalOnKeyEvent
    end object
    b_Quit=QuitButton
    MenuSong="KR-Battery-Menu"
    NewNewsMsg="  (New Update Available)"
    FireWallTitle="Important"
    FireWallMsg="It has been determined that the Windows Firewall is enabled and that UT2004 is not yet authorized to connect to the internet.  Authorization is required in order to use the online components of the game.  Please refer to the README.TXT for more information."
    bDisconnectOnOpen=true
    bAllowedAsLast=true
    OnOpen=UT2k4MainMenu.InternalOnOpen
    OnReOpen=UT2k4MainMenu.MainReopened
    OnCanClose=UT2k4MainMenu.CanClose
    bDebugging=true
    OnKeyEvent=UT2k4MainMenu.MyKeyEvent
}