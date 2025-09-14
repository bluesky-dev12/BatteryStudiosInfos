/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowEscMenu.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:14
 *
 *******************************************************************************/
class BTWindowEscMenu extends FloatingWindow
    editinlinenew
    instanced;

var localized string strLabelMenu;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBackground[3];
var export editinline BTOwnerDrawImageHK LabelBackground[3];
var localized string strButtonMenu[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonMenu[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonMenu[4];
var localized string strLabelTopLine;
var localized string strLabelInfo;
var localized string strLabelInfo2;
var localized string strLabelTopLineTutorial;
var localized string strLabelInfoTutorial;
var localized string strLabelInfo2Turorial;
var delegate<OnOK> __OnOK__Delegate;

delegate bool OnOK(GUIComponent Sender);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    Log("[BTWindowEscMenu::InitComponent]");
    super.InitComponent(MyController, myOwner);
    LabelBackground[0] = new class'BTOwnerDrawImageHK';
    LabelBackground[0].BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_1;
    LabelBackground[0].InitComponent(Controller, self);
    AppendComponent(LabelBackground[0]);
    LabelBackground[1] = new class'BTOwnerDrawImageHK';
    LabelBackground[1].BackgroundImage = class'BTUIResourcePoolHK'.default.hud_back_3;
    LabelBackground[1].InitComponent(Controller, self);
    AppendComponent(LabelBackground[1]);
    LabelBackground[2] = new class'BTOwnerDrawImageHK';
    LabelBackground[2].BackgroundImage = class'BTUIResourcePoolHK'.default.hud_back_3;
    LabelBackground[2].Caption = strLabelMenu;
    LabelBackground[2].InitComponent(Controller, self);
    AppendComponent(LabelBackground[2]);
    i = 0;
    J0x152:
    // End:0x1f6 [While If]
    if(i < 4 - 1)
    {
        ButtonMenu[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonMenu[i].SetDefaultButtonImage();
        ButtonMenu[i].SetDefaultFontColor();
        ButtonMenu[i].Caption = strButtonMenu[i];
        ButtonMenu[i].InitComponent(Controller, self);
        AppendComponent(ButtonMenu[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x152;
    }
    ButtonMenu[0].__OnClick__Delegate = ButtonSettings_OnClick;
    ButtonMenu[1].__OnClick__Delegate = ButtonDisconnect_OnClick;
    ButtonMenu[2].__OnClick__Delegate = ButtonCancel_OnClick;
    // End:0x2f6
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        ButtonMenu[3] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonMenu[3].SetDefaultButtonImage();
        ButtonMenu[3].SetDefaultFontColor();
        ButtonMenu[3].Caption = strButtonMenu[3];
        ButtonMenu[3].InitComponent(Controller, self);
        AppendComponent(ButtonMenu[3]);
        ButtonMenu[3].__OnClick__Delegate = ButtonSpectate_OnClick;
    }
}

event Opened(GUIComponent Sender)
{
    local int i;

    Log("[BTWindowEscMenu::Opened]");
    i = 0;
    J0x24:
    // End:0x6f [While If]
    if(i < 3)
    {
        LabelBackground[i].AWinPos = fbLabelBackground[i];
        LabelBackground[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x24;
    }
    i = 0;
    J0x76:
    // End:0xc4 [While If]
    if(i < 4 - 1)
    {
        ButtonMenu[i].AWinPos = fbButtonMenu[i];
        ButtonMenu[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x76;
    }
    // End:0x120
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        ButtonMenu[3].AWinPos = fbButtonMenu[3];
        ButtonMenu[3].ApplyAWinPos();
    }
    LabelBackground[0].FocusFirst(none);
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    local PlayerController PC;

    Log("[BTWindowEscMenu::Closed]");
    super(GUIPage).Closed(Sender, bCancelled);
    PC = PlayerOwner();
    // End:0x71
    if(PC != none && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
}

function bool InternalOnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x46
    if(iAction == 3)
    {
        // End:0x46
        if(iKey == 27)
        {
            Controller.CloseMenu(false);
        }
    }
    return true;
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
}

function bool ButtonChangeTeam_OnClick(GUIComponent Sender)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x3f
    if(PC.PlayerReplicationInfo == none || PC.PlayerReplicationInfo.Team == none)
    {
    }
    // End:0xd1
    else
    {
        PC = PlayerOwner();
        // End:0x7e
        if(PC.PlayerReplicationInfo == none || PC.PlayerReplicationInfo.Team == none)
        {
        }
        // End:0xd1
        else
        {
            switch(PC.PlayerReplicationInfo.Team.TeamIndex)
            {
                // End:0xb7
                case 0:
                    PC.ChangeTeam(1);
                    // End:0xd1
                    break;
                // End:0xce
                case 1:
                    PC.ChangeTeam(0);
                    // End:0xd1
                    break;
                // End:0xffff
                default:
                }
            }
            Controller.CloseMenu(false);
            return true;
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonCancel_OnClick]");
    Controller.CloseMenu(false);
    return true;
}

function bool ButtonSettings_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonSettings_OnClick]");
    Controller.CloseMenu(false);
    Controller.OpenMenu(Controller.GetSettingsPage());
    return true;
}

function bool BTWindowDisconnectGameHK_OnOK(GUIComponent Sender)
{
    local PlayerController PC;

    Log("BTWindowESCMenu::BTWindowDisconnectedGameHK_OnOK");
    PC = PlayerOwner();
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().bForceGameOut = true;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SetTcpTimeOutInUI();
    Controller.TcpHandler.sfReqNotifyExpiredItemIDs();
    Controller.TcpHandler.sfReqDisconnectGame();
    return true;
}

function bool ButtonDisconnect_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonDisconnect_OnClick]");
    Controller.CloseMenu();
    Controller.OpenMenu("GUIWarfareControls.BTWindowDisconnectGameHK");
    // End:0x15b
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().BotTutorial)
    {
        BTWindowDisconnectGameHK(Controller.TopPage()).TopLine.Caption = strLabelTopLine;
        BTWindowDisconnectGameHK(Controller.TopPage()).LabelInfo.Caption = strLabelInfo;
        BTWindowDisconnectGameHK(Controller.TopPage()).LabelInfo2.Caption = strLabelInfo2;
        BTWindowDisconnectGameHK(Controller.TopPage()).__OnOK__Delegate = CheckTurorial_OnOK;
    }
    // End:0x17e
    else
    {
        BTWindowDisconnectGameHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDisconnectGameHK_OnOK;
    }
    return true;
}

function bool CheckTurorial_OnOK(GUIComponent Sender)
{
    // End:0x95
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().kExp == 0)
    {
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 44);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDisconnectGameHK_OnOK;
        Controller.ConsoleCommand("SendQuestUpdate");
    }
    // End:0xb1
    else
    {
        Controller.ConsoleCommand("endTutorial");
    }
    return true;
}

function bool ButtonExitGame_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonExitGame_OnClick]");
    Controller.OpenMenu(Controller.GetQuitPage());
    return true;
}

function bool ButtonSpectate_OnClick(GUIComponent Sender)
{
    local PlayerController PC;

    Log("[BTWindowEscMenu::ButtonSpectate_OnClick]");
    PC = PlayerOwner();
    Controller.CloseMenu();
    // End:0x72
    if(PC.PlayerReplicationInfo.bOnlySpectator)
    {
        PC.BecomeActivePlayer();
    }
    // End:0x81
    else
    {
        PC.BecomeSpectator();
    }
    return true;
}

defaultproperties
{
    strLabelMenu="Menu"
    fbLabelBackground[0]=(X1=0.0,Y1=261.0,X2=1024.0,Y2=507.0)
    fbLabelBackground[1]=(X1=365.0,Y1=298.0,X2=659.0,Y2=470.0)
    fbLabelBackground[2]=(X1=365.0,Y1=298.0,X2=659.0,Y2=323.0)
    strButtonMenu[0]="Options"
    strButtonMenu[1]="Exit"
    strButtonMenu[2]="Cancel"
    strButtonMenu[3]="Watch"
    fbButtonMenu[0]=(X1=384.0,Y1=345.0,X2=640.0,Y2=378.0)
    fbButtonMenu[1]=(X1=384.0,Y1=380.0,X2=640.0,Y2=413.0)
    fbButtonMenu[2]=(X1=384.0,Y1=415.0,X2=640.0,Y2=448.0)
    fbButtonMenu[3]=(X1=384.0,Y1=450.0,X2=640.0,Y2=483.0)
    strLabelTopLine="Quit Tutorial"
    strLabelInfo="Are you sure you want to quit?"
    strLabelInfo2="We recommend completing the Tutorial. Arctic Combat features controls that differ from other FPS games."
    t_WindowTitle=none
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bMoveAllowed=true
    DefaultLeft=0.390
    DefaultTop=0.340
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bRequire640x480=true
    bPersistent=true
    bAllowedAsLast=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    bUseAWinPos=true
    AWinPos=(X1=413.0,Y1=294.0,X2=611.0,Y2=474.0)
    OnKeyEvent=InternalOnKeyEvent
}