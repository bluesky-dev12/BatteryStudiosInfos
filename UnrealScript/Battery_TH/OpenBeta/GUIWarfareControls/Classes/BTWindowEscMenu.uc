class BTWindowEscMenu extends FloatingWindow
    editinlinenew
    instanced;

var localized string strLabelMenu;
var() automated FloatBox fbLabelBackground[3];
var export editinline BTOwnerDrawImageHK LabelBackground[3];
var localized string strButtonMenu[4];
var() automated FloatBox fbButtonMenu[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonMenu[4];
var localized string strLabelTopLine;
var localized string strLabelInfo;
var localized string strLabelInfo2;
var localized string strLabelTopLineTutorial;
var localized string strLabelInfoTutorial;
var localized string strLabelInfo2Turorial;
//var delegate<OnOK> __OnOK__Delegate;

delegate bool OnOK(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    Log("[BTWindowEscMenu::InitComponent]");
    super.InitComponent(MyController, myOwner);
    LabelBackground[0] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelBackground[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_1;
    LabelBackground[0].InitComponent(Controller, self);
    AppendComponent(LabelBackground[0]);
    LabelBackground[1] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelBackground[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.hud_back_3;
    LabelBackground[1].InitComponent(Controller, self);
    AppendComponent(LabelBackground[1]);
    LabelBackground[2] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelBackground[2].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.hud_back_3;
    LabelBackground[2].Caption = strLabelMenu;
    LabelBackground[2].InitComponent(Controller, self);
    AppendComponent(LabelBackground[2]);
    i = 0;
    J0x152:

    // End:0x1F6 [Loop If]
    if(i < (4 - 1))
    {
        ButtonMenu[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonMenu[i].SetDefaultButtonImage();
        ButtonMenu[i].SetDefaultFontColor();
        ButtonMenu[i].Caption = strButtonMenu[i];
        ButtonMenu[i].InitComponent(Controller, self);
        AppendComponent(ButtonMenu[i]);
        i++;
        // [Loop Continue]
        goto J0x152;
    }
    ButtonMenu[0].__OnClick__Delegate = ButtonSettings_OnClick;
    ButtonMenu[1].__OnClick__Delegate = ButtonDisconnect_OnClick;
    ButtonMenu[2].__OnClick__Delegate = ButtonCancel_OnClick;
    //return;    
}

event Opened(GUIComponent Sender)
{
    local int i;

    Log("[BTWindowEscMenu::Opened]");
    i = 0;
    J0x24:

    // End:0x72 [Loop If]
    if(i < (4 - 1))
    {
        ButtonMenu[i].AWinPos = fbButtonMenu[i];
        ButtonMenu[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x24;
    }
    i = 0;
    J0x79:

    // End:0xC4 [Loop If]
    if(i < 3)
    {
        LabelBackground[i].AWinPos = fbLabelBackground[i];
        LabelBackground[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x79;
    }
    LabelBackground[0].FocusFirst(none);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    local PlayerController PC;

    Log("[BTWindowEscMenu::Closed]");
    super(GUIPage).Closed(Sender, bCancelled);
    PC = PlayerOwner();
    // End:0x71
    if((PC != none) && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x46
    if(int(iAction) == int(3))
    {
        // End:0x46
        if(int(iKey) == int(27))
        {
            Controller.CloseMenu(false);
        }
    }
    return true;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function bool ButtonChangeTeam_OnClick(GUIComponent Sender)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x3F
    if((PC.PlayerReplicationInfo == none) || PC.PlayerReplicationInfo.Team == none)
    {        
    }
    else
    {
        PC = PlayerOwner();
        // End:0x7E
        if((PC.PlayerReplicationInfo == none) || PC.PlayerReplicationInfo.Team == none)
        {            
        }
        else
        {
            switch(PC.PlayerReplicationInfo.Team.TeamIndex)
            {
                // End:0xB7
                case 0:
                    PC.ChangeTeam(1);
                    // End:0xD1
                    break;
                // End:0xCE
                case 1:
                    PC.ChangeTeam(0);
                    // End:0xD1
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
    }
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonCancel_OnClick]");
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonSettings_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonSettings_OnClick]");
    Controller.CloseMenu(false);
    Controller.OpenMenu(Controller.GetSettingsPage());
    return true;
    //return;    
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
    //return;    
}

function bool ButtonDisconnect_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonDisconnect_OnClick]");
    Controller.CloseMenu();
    Controller.OpenMenu("GUIWarfareControls.BTWindowDisconnectGameHK");
    // End:0x15B
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().BotTutorial)
    {
        BTWindowDisconnectGameHK(Controller.TopPage()).TopLine.Caption = strLabelTopLine;
        BTWindowDisconnectGameHK(Controller.TopPage()).LabelInfo.Caption = strLabelInfo;
        BTWindowDisconnectGameHK(Controller.TopPage()).LabelInfo2.Caption = strLabelInfo2;
        BTWindowDisconnectGameHK(Controller.TopPage()).__OnOK__Delegate = CheckTurorial_OnOK;        
    }
    else
    {
        BTWindowDisconnectGameHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDisconnectGameHK_OnOK;
    }
    return true;
    //return;    
}

function bool CheckTurorial_OnOK(GUIComponent Sender)
{
    // End:0x95
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().kExp == 0)
    {
        Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 44);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDisconnectGameHK_OnOK;
        Controller.ConsoleCommand("SendQuestUpdate");        
    }
    else
    {
        Controller.ConsoleCommand("endTutorial");
    }
    return true;
    //return;    
}

function bool ButtonExitGame_OnClick(GUIComponent Sender)
{
    Log("[BTWindowEscMenu::ButtonExitGame_OnClick]");
    Controller.OpenMenu(Controller.GetQuitPage());
    return true;
    //return;    
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
    else
    {
        PC.BecomeSpectator();
    }
    return true;
    //return;    
}

defaultproperties
{
    strLabelMenu="????"
    fbLabelBackground[0]=(X1=0.0000000,Y1=261.0000000,X2=1024.0000000,Y2=507.0000000)
    fbLabelBackground[1]=(X1=365.0000000,Y1=298.0000000,X2=659.0000000,Y2=470.0000000)
    fbLabelBackground[2]=(X1=365.0000000,Y1=298.0000000,X2=659.0000000,Y2=323.0000000)
    strButtonMenu[0]="??????????"
    strButtonMenu[1]="???"
    strButtonMenu[2]="??????"
    strButtonMenu[3]="???????????"
    fbButtonMenu[0]=(X1=384.0000000,Y1=345.0000000,X2=640.0000000,Y2=378.0000000)
    fbButtonMenu[1]=(X1=384.0000000,Y1=380.0000000,X2=640.0000000,Y2=413.0000000)
    fbButtonMenu[2]=(X1=384.0000000,Y1=415.0000000,X2=640.0000000,Y2=448.0000000)
    fbButtonMenu[3]=(X1=384.0000000,Y1=450.0000000,X2=640.0000000,Y2=483.0000000)
    strLabelTopLine="???? Tutorial_gc204"
    strLabelInfo="??????????????????????"
    strLabelInfo2="?????????????????????????????????????????????????????????????  FPS ?????????????????????"
    t_WindowTitle=none
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bMoveAllowed=false
    DefaultLeft=0.3900000
    DefaultTop=0.3400000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bRequire640x480=true
    bPersistent=true
    bAllowedAsLast=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    bUseAWinPos=true
    AWinPos=(X1=413.0000000,Y1=294.0000000,X2=611.0000000,Y2=474.0000000)
    OnKeyEvent=BTWindowEscMenu.InternalOnKeyEvent
}