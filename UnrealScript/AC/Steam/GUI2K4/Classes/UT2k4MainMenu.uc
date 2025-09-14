/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4MainMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:29
 *	Functions:20
 *
 *******************************************************************************/
class UT2k4MainMenu extends UT2K4GUIPage
    dependson(Ut2K4Community)
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BackgroundImage i_bkChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BackgroundImage i_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_UT2Logo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_PanHuge;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_PanBig;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_PanSmall;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_UT2Shader;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_TV;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_SinglePlayer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MultiPlayer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Host;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_InstantAction;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_ModsAndDemo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Settings;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Quit;
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
    // End:0x5e
    if(PlayerOwner().Level.IsDemoBuild())
    {
        b_SinglePlayer.DisableMe();
        b_MultiPlayer.SetFocus(none);
    }
    i_bkChar.Image = CharShots[Rand(CharShots.Length)];
}

event Timer()
{
    bNoInitDelay = true;
    // End:0x2d
    if(!Controller.bQuietMenu)
    {
        PlayerOwner().PlaySound(SlideInSound, 0);
    }
    i_TV.Animate(-0.0009770, 0.3322920, 0.350);
    i_UT2Logo.Animate(0.0072260, 0.0169260, 0.350);
    i_UT2Shader.Animate(0.2490230, 0.1809880, 0.350);
    i_TV.__OnEndAnimation__Delegate = MenuIn_OnArrival;
    i_UT2Logo.__OnEndAnimation__Delegate = MenuIn_OnArrival;
    i_UT2Shader.__OnEndAnimation__Delegate = MenuIn_OnArrival;
}

function MenuIn_OnArrival(GUIComponent Sender, XInterface.GUI.EAnimationType Type)
{
    Sender.__OnArrival__Delegate = None;
    // End:0x1f
    if(bAnimating)
    {
        return;
    }
    i_UT2Shader.__OnDraw__Delegate = MyOnDraw;
    DesiredCharFade = 255.0;
    CharFadeTime = 0.750;
    // End:0x6c
    if(!Controller.bQuietMenu)
    {
        PlayerOwner().PlaySound(FadeInSound);
    }
    b_SinglePlayer.Animate(0.3153590, 0.3688130, 0.350);
    b_SinglePlayer.__OnArrival__Delegate = PlayPopSound;
    b_MultiPlayer.Animate(0.3632460, 0.4492820, 0.40);
    b_MultiPlayer.__OnArrival__Delegate = PlayPopSound;
    b_Host.Animate(0.3950970, 0.5340270, 0.450);
    b_Host.__OnArrival__Delegate = PlayPopSound;
    b_InstantAction.Animate(0.423640, 0.6186190, 0.50);
    b_InstantAction.__OnArrival__Delegate = PlayPopSound;
    b_ModsAndDemo.Animate(0.4334060, 0.7058590, 0.550);
    b_ModsAndDemo.__OnArrival__Delegate = PlayPopSound;
    b_Settings.Animate(0.4344770, 0.8003270, 0.60);
    b_Settings.__OnArrival__Delegate = PlayPopSound;
    b_Quit.Animate(0.4247110, 0.8875670, 0.650);
    b_Quit.__OnArrival__Delegate = MenuIn_Done;
}

event Opened(GUIComponent Sender)
{
    // End:0x37
    if(bDebugging)
    {
        Log(string(Name) $ ".Opened()   Sender:" $ string(Sender), 'Debug');
    }
    // End:0x73
    if(Sender != none && PlayerOwner().Level.IsPendingConnection())
    {
        PlayerOwner().ConsoleCommand("CANCEL");
    }
    super(GUIMultiComponent).Opened(Sender);
    bNewNews = class'Ut2K4Community'.default.ModRevLevel != class'Ut2K4Community'.default.LastModRevLevel;
    FadeTime = 0.0;
    FadeOut = true;
    selected = none;
    i_TV.Animate(-0.0009770, 1.6686190, 0.0);
    i_UT2Logo.Animate(0.0072260, -0.3925790, 0.0);
    i_UT2Shader.Animate(0.2490230, -0.105470, 0.0);
    b_SinglePlayer.Animate(1.0, 0.3688130, 0.0);
    b_MultiPlayer.Animate(1.150, 0.4492820, 0.0);
    b_Host.Animate(1.30, 0.5340270, 0.0);
    b_InstantAction.Animate(1.450, 0.6186190, 0.0);
    b_ModsAndDemo.Animate(1.60, 0.7058590, 0.0);
    b_Settings.Animate(1.750, 0.8003270, 0.0);
    b_Quit.Animate(1.90, 0.8875670, 0.0);
}

function MenuIn_Done(GUIComponent Sender, XInterface.GUI.EAnimationType Type)
{
    Sender.__OnArrival__Delegate = None;
    PlayPopSound(Sender, Type);
}

function PlayPopSound(GUIComponent Sender, XInterface.GUI.EAnimationType Type)
{
    // End:0x23
    if(!Controller.bQuietMenu)
    {
        PlayerOwner().PlaySound(PopInSound);
    }
}

function bool PanHugeDraw(Canvas Canvas)
{
    i_PanHuge.ImageColor.A = byte(float(40) * CharFade / float(255));
    i_PanBig.ImageColor.A = byte(float(75) * CharFade / float(255));
    i_PanSmall.ImageColor.A = i_bkChar.ImageColor.A;
    return false;
}

function bool BkCharDraw(Canvas Canvas)
{
    // End:0x71
    if(CharFadeTime > float(0))
    {
        CharFade += DesiredCharFade - CharFade * Controller.RenderDelta / CharFadeTime;
        CharFadeTime -= Controller.RenderDelta;
        // End:0x71
        if(CharFadeTime <= 0.0)
        {
            CharFade = DesiredCharFade;
            CharFadeTime = 0.0;
        }
    }
    i_bkChar.ImageColor.A = byte(int(CharFade));
    return false;
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
}

function InternalOnOpen()
{
    // End:0x12
    if(bNoInitDelay)
    {
        Timer();
    }
    // End:0x1b
    else
    {
        SetTimer(0.50, false);
    }
    Controller.PerformRestore();
    PlayerOwner().ClientSetInitialMusic(MenuSong, 2);
}

function OnClose(optional bool bCancelled);
function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x25
    if(key == 27 && State == 1)
    {
        bAllowClose = true;
    }
    return false;
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
        // End:0xf7
        case b_MultiPlayer:
            // End:0xad
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
            // End:0x14d
            if(!Controller.AuthroizeFirewall())
            {
                Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", FireWallTitle, FireWallMsg);
                return;
            }
            Profile("MPHost");
            Controller.OpenMenu(Controller.GetMultiplayerPage());
            Profile("MPHost");
            return;
        // End:0x1db
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
        // End:0x2c1
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
        // End:0xffff
        default:
            StopWatch(true);
}

function bool ButtonClick(GUIComponent Sender)
{
    // End:0x20
    if(GUIButton(Sender) != none)
    {
        selected = GUIButton(Sender);
    }
    // End:0x2d
    if(selected == none)
    {
        return false;
    }
    InitAnimOut(i_TV, -0.0009770, 1.6686190, 0.350);
    InitAnimOut(i_UT2Logo, 0.0072260, -0.3925790, 0.350);
    InitAnimOut(i_UT2Shader, 0.2490230, -0.105470, 0.350);
    InitAnimOut(b_SinglePlayer, 1.0, 0.3688130, 0.350);
    InitAnimOut(b_MultiPlayer, 1.150, 0.4492820, 0.350);
    InitAnimOut(b_Host, 1.30, 0.5340270, 0.350);
    InitAnimOut(b_InstantAction, 1.450, 0.6186190, 0.350);
    InitAnimOut(b_ModsAndDemo, 1.60, 0.7058590, 0.350);
    InitAnimOut(b_Settings, 1.750, 0.8003270, 0.350);
    InitAnimOut(b_Quit, 1.90, 0.8875670, 0.350);
    DesiredCharFade = 0.0;
    CharFadeTime = 0.350;
    return true;
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
}

function MenuOut_Done(GUIComponent Sender, XInterface.GUI.EAnimationType Type)
{
    Sender.__OnArrival__Delegate = None;
    // End:0x1f
    if(bAnimating)
    {
        return;
    }
    MoveOn();
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
    J0x3c:
    // End:0x1f8 [While If]
    if(i < Controls.Length)
    {
        // End:0x1ee
        if(GUIButton(Controls[i]) != none)
        {
            FButton = GUIButton(Controls[i]);
            // End:0xee
            if(FButton.Tag > 0 && FButton.MenuState != 2)
            {
                FButton.Tag -= int(float(784) * DeltaTime);
                // End:0xeb
                if(FButton.Tag < 0)
                {
                    FButton.Tag = 0;
                }
            }
            // End:0x118
            else
            {
                // End:0x118
                if(FButton.MenuState == 2)
                {
                    FButton.Tag = 200;
                }
            }
            // End:0x1ee
            if(FButton.Tag > 0)
            {
                FButton.Style.TextSize(Canvas, 2, FButton.Caption, XL, YL, FButton.FontScale);
                X2 = int(FButton.ActualLeft() + XL + float(16));
                Canvas.Style = 5;
                Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(FButton.Tag));
                Canvas.SetPos(0.0, FButton.ActualTop());
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return false;
}

event bool NotifyLevelChange()
{
    // End:0x55
    if(bDebugging)
    {
        Log(string(Name) @ "NotifyLevelChange  PendingConnection:" $ string(PlayerOwner().Level.IsPendingConnection()));
    }
    return PlayerOwner().Level.IsPendingConnection();
}

function bool CommunityDraw(Canvas C)
{
    local float X, Y, XL, YL, A;

    // End:0x1d0
    if(bNewNews)
    {
        A = 255.0 * FadeTime / 1.0;
        // End:0x3d
        if(FadeOut)
        {
            A = 255.0 - A;
        }
        FadeTime += Controller.RenderDelta;
        // End:0x7b
        if(FadeTime >= 1.0)
        {
            FadeTime = 0.0;
            FadeOut = !FadeOut;
        }
        A = FClamp(A, 1.0, 254.0);
        X = b_ModsAndDemo.ActualLeft();
        Y = b_Settings.ActualTop();
        C.Font = Controller.GetMenuFont("UT2MenuFont").GetFont(int(C.ClipX));
        C.StrLen("Qz,q", XL, YL);
        Y -= YL - float(5);
        C.Style = 5;
        C.SetPos(X + float(1), Y + float(1));
        C.SetDrawColor(0, 0, 0, byte(A));
        C.DrawText(NewNewsMsg);
        C.SetPos(X, Y);
        C.SetDrawColor(207, 185, 103, byte(A));
        C.DrawText(NewNewsMsg);
    }
    return false;
}

defaultproperties
{
    begin object name=ImgBkChar class=BackgroundImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageRenderStyle=5
        X1=0
        Y1=0
        X2=1024
        Y2=768
        RenderWeight=0.040
        Tag=0
        OnDraw=BkCharDraw
    object end
    // Reference: BackgroundImage'UT2k4MainMenu.ImgBkChar'
    i_bkChar=ImgBkChar
    begin object name=PageBackground class=BackgroundImage
        ImageStyle=2
        ImageRenderStyle=5
        X1=0
        Y1=0
        X2=1024
        Y2=768
    object end
    // Reference: BackgroundImage'UT2k4MainMenu.PageBackground'
    i_Background=PageBackground
    begin object name=ImgUT2Logo class=GUIImage
        ImageStyle=2
        WinTop=0.0169260
        WinLeft=0.0072260
        WinWidth=0.6388680
        WinHeight=0.3925790
        RenderWeight=0.050
    object end
    // Reference: GUIImage'UT2k4MainMenu.ImgUT2Logo'
    i_UT2Logo=ImgUT2Logo
    begin object name=iPanHuge class=GUIImage
        ImageColor=(R=255,G=255,B=255,A=40)
        ImageStyle=2
        WinTop=0.0017190
        WinHeight=0.3679690
        RenderWeight=0.020
        OnDraw=PanHugeDraw
    object end
    // Reference: GUIImage'UT2k4MainMenu.iPanHuge'
    i_PanHuge=iPanHuge
    begin object name=iPanBig class=GUIImage
        ImageColor=(R=255,G=255,B=255,A=75)
        ImageStyle=2
        WinTop=0.0817710
        WinHeight=0.1524220
        RenderWeight=0.0230
    object end
    // Reference: GUIImage'UT2k4MainMenu.iPanBig'
    i_PanBig=iPanBig
    begin object name=iPanSmall class=GUIImage
        ImageStyle=2
        WinTop=0.2260420
        WinHeight=0.040
        RenderWeight=0.0260
    object end
    // Reference: GUIImage'UT2k4MainMenu.iPanSmall'
    i_PanSmall=iPanSmall
    begin object name=ImgUT2Shader class=GUIImage
        ImageStyle=2
        WinTop=0.1809880
        WinLeft=0.2490230
        WinWidth=0.1552730
        WinHeight=0.105470
        RenderWeight=0.060
    object end
    // Reference: GUIImage'UT2k4MainMenu.ImgUT2Shader'
    i_UT2Shader=ImgUT2Shader
    begin object name=ImgTV class=GUIImage
        ImageStyle=2
        X1=0
        Y1=1
        X2=512
        Y2=511
        WinTop=0.3322920
        WinLeft=-0.0009770
        WinWidth=0.50
        WinHeight=0.6686190
        RenderWeight=5.070
    object end
    // Reference: GUIImage'UT2k4MainMenu.ImgTV'
    i_TV=ImgTV
    begin object name=SinglePlayerButton class=GUIButton
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
        WinHeight=0.0750
        TabOrder=0
        bFocusOnWatch=true
        OnClick=ButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4MainMenu.SinglePlayerButton'
    b_SinglePlayer=SinglePlayerButton
    begin object name=MultiplayerButton class=GUIButton
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
        WinHeight=0.0750
        TabOrder=1
        bFocusOnWatch=true
        OnClick=ButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4MainMenu.MultiplayerButton'
    b_MultiPlayer=MultiplayerButton
    begin object name=HostButton class=GUIButton
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
        WinHeight=0.0750
        TabOrder=2
        bFocusOnWatch=true
        OnClick=ButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4MainMenu.HostButton'
    b_Host=HostButton
    begin object name=InstantActionButton class=GUIButton
        CaptionAlign=0
        CaptionEffectStyleName="TextButtonEffect"
        Caption="???? ??"
        bUseCaptionHeight=true
        FontScale=0
        StyleName="TextButton"
        Hint="?? ??? ?? ??? ???"
        WinTop=0.6186190
        WinLeft=0.423640
        WinWidth=0.5936660
        WinHeight=0.0750
        TabOrder=3
        bFocusOnWatch=true
        OnClick=ButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4MainMenu.InstantActionButton'
    b_InstantAction=InstantActionButton
    begin object name=ModsAndDemosButton class=GUIButton
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
        WinHeight=0.0750
        TabOrder=4
        bFocusOnWatch=true
        OnDraw=CommunityDraw
        OnClick=ButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4MainMenu.ModsAndDemosButton'
    b_ModsAndDemo=ModsAndDemosButton
    begin object name=SettingsButton class=GUIButton
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
        WinHeight=0.0750
        TabOrder=5
        bFocusOnWatch=true
        OnClick=ButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4MainMenu.SettingsButton'
    b_Settings=SettingsButton
    begin object name=QuitButton class=GUIButton
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
        WinHeight=0.0750
        TabOrder=6
        bFocusOnWatch=true
        OnClick=ButtonClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4MainMenu.QuitButton'
    b_Quit=QuitButton
    MenuSong="KR-Battery-Menu"
    NewNewsMsg="  (New Update Available)"
    FireWallTitle="Important"
    FireWallMsg="It has been determined that the Windows Firewall is enabled and that UT2004 is not yet authorized to connect to the internet.  Authorization is required in order to use the online components of the game.  Please refer to the README.TXT for more information."
    bDisconnectOnOpen=true
    bAllowedAsLast=true
    OnOpen=InternalOnOpen
    OnReOpen=MainReopened
    OnCanClose=CanClose
    bDebugging=true
    OnKeyEvent=MyKeyEvent
}