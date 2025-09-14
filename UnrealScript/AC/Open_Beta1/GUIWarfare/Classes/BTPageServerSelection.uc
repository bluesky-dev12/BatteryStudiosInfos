class BTPageServerSelection extends BTNetGUIPageHK
    editinlinenew
    instanced;

struct ConnectingInfo
{
    var int ServerID;
    var int ChannelID;
    var string IP;
    var int Port;
    var int DataPort;
};

struct CheckToReceivedPacket
{
    var bool bItemListEnd;
    var bool bSkillListEnd;
    var bool bQSListEnd;
    var bool bServerTimeEnd;
    var bool bGetMyMailBoxState;
    var bool bGetServerTimeEnd;
    var bool bHashEnd;
};

var array<ClanNameAndMark> ClanMarkList;
var export editinline GUIPage SavePg;
var Canvas SaveCanvas;
var bool bButtonRefresh;
var int SaveServerListIndex;
var int ToggleButCredit;
var float CurrentTime;
var float LastRefreshTime;
var float RefreshCycleTime;
var string currentBGM;
var ConnectingInfo ConnectingChannel;
var() automated FloatBox fbLabelBackground;
var export editinline BTOwnerDrawImageHK LabelBackground;
var() automated FloatBox fbLabelBackgrounddeco;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() automated FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() automated FloatBox fbLabelLeftTopRoll;
var() automated FloatBox fbLabelLeftTopRollSource;
var export editinline BTOwnerDrawSourceClipImageHK LabelLeftTopRoll;
var() automated FloatBox fbLabelBottomLine;
var export editinline BTLabelNoticeHK LabelBottomLine;
var export editinline BTOwnerDrawImageHK BGImageServer;
var export editinline BTOwnerDrawImageHK BGImageChannel;
var export editinline BTOwnerDrawImageHK BGImageAD1;
var export editinline BTOwnerDrawImageHK BGImageAD2;
var export editinline BTOwnerDrawCaptionButtonHK ButtonServerList[7];
var export editinline BTACLServerSelectionHK ACLServerList[7];
var() automated TabControlMocker TabControl;
var() automated BTTPTopMenuSCHK TPTopMenu;
var localized string strButtonCredit;
var export editinline BTOwnerDrawCaptionButtonHK ButtonCredit;
var export editinline BTOwnerDrawCaptionButtonHK ChannelADSmall;
var export editinline BTOwnerDrawCaptionButtonHK ChannelADLarge;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTemp;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTemp2;
var export editinline BTOwnerDrawImageHK BGImageTotalServer;
var CheckToReceivedPacket CTRP;
var localized string strPCBangFriend;
var localized string HashMessage;
var localized string strCW_GameMode;
var export editinline BTOwnerDrawCaptionButtonHK ButtonEnterCh;
var export editinline BTACLGroutSelection ServerList;
var export editinline BTACLServerSelectionHK ChannelList;
var byte iProcessExpiredStep;

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageServerSelection_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageServerSelection_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageServerSelection_TcpLogin TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageServerSelection_TcpLogin';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0x142
            break;
        // End:0x2E
        case 1:
            // End:0x142
            break;
        // End:0x80
        case 2:
            // End:0x7D
            if(bButtonRefresh)
            {
                bButtonRefresh = false;
                TPTopMenu.ButtonRefresh.DisableMe();
                RefreshPage();
                LastRefreshTime = PlayerOwner().Level.TimeSeconds;
            }
            // End:0x142
            break;
        // End:0x88
        case 3:
            // End:0x142
            break;
        // End:0x9F
        case 4:
            page_Main.ShowHelpWindow();
            // End:0x142
            break;
        // End:0xDB
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x142
            break;
        // End:0x13F
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWIndowTodayResultHK");
            BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWIndowTodayResultHK_OnOK;
            // End:0x142
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function ExitGame()
{
    local int i;

    Log("[BTPageServerSelection::HeaderButton_OnClick] Exit!!!");
    Log("Exit Chat Log Message Start");
    i = 0;
    J0x5F:

    // End:0x9D [Loop If]
    if(i < page_Main.ChatLog.Length)
    {
        Log(page_Main.ChatLog[i].chatText);
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    Log("Exit Chat Log Message End");
    Controller.ConsoleCommand("exit");
    //return;    
}

function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
    //return;    
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bSkipInitializeDefaultPage = true;
    super.InitComponent(MyController, myOwner);
    LabelBackground = NewLabelComponent(fbLabelBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_back1, 0.0001000);
    LabelTopLine = NewLabelComponent(fbLabelTopLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_top_default, 0.0001300);
    LabelBottomLine = BTLabelNoticeHK(NewComponent(new Class'GUIWarfare_Decompressed.BTLabelNoticeHK', fbLabelBottomLine, 0.0100000));
    LabelBottomLine.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_upper;
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 144.0000000;
    LabelRoomName.ClipArea.X2 = 387.0000000;
    LabelRoomName.ClipArea.Y2 = 192.0000000;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    bButtonRefresh = false;
    TPTopMenu.ButtonRefresh.DisableMe();
    MyController.ResetFocus();
    ApplyLocalizedString();
    Console(Controller.Master.Console).ConsoleCommand("NatCheckOn");
    // End:0x1B3
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {        
    }
    else
    {
        page_Main.DefaultLobbyBGM = "bgm_lobby_part" $ string(int((float(page_Main.GameRunningCount) % float(2)) + float(1)));
        page_Main.LastMainPageBGM = page_Main.DefaultLobbyBGM;
        PlayerOwner().Player.Console.SetOneBGM(page_Main.DefaultLobbyBGM);
    }
    BGImageServer = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(264.0000000, 87.0000000, 761.0000000, 736.0000000), Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1, 0.0100000);
    BGImageChannel = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 87.0000000, 254.0000000, 401.0000000), Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1, 0.0100000);
    BGImageAD1 = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 443.0000000, 254.0000000, 736.0000000), Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1, 0.0100000);
    BGImageAD2 = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(771.0000000, 87.0000000, 1014.0000000, 260.0000000), Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1, 0.0100000);
    page_Main.bFirstLogin = true;
    //return;    
}

function bool ButtonCredit_OnClick(GUIComponent Sender)
{
    page_Main.SetPage(25, false);
    return true;
    //return;    
}

function gameMgr_UpdateEventTimer(int EventType, BtrDouble EventTime)
{
    local BtrTime t;

    Log("gameMgr_UpdateEventTimer EventType=" $ string(EventType));
    BtrDoubleToBtrTime(GameMgr.kClientTime, t);
    BtrDoubleToBtrTime(EventTime, t);
    //return;    
}

function Event0_Timer(int Index)
{
    Log("--------------------------------- Event0_Timer --------------------------------------------");
    //return;    
}

function Event3_Timer(int Index)
{
    Log("--------------------------------- Event3_Timer --------------------------------------------");
    //return;    
}

function bool ButtonTemp_OnClick(GUIComponent Sender)
{
    local BtrTime t;
    local BtrDouble D;
    local DelegateEventTimer det;

    Controller.LaunchURL("http://payment.webzen.co.kr/Payment/PaymentMainFrm.asp");
    // End:0x5B5
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        // End:0x555
        if(ToggleButCredit == 0)
        {
            Log("=============================================");
            GameMgr.__dele_UpdateEventTimer__Delegate = gameMgr_UpdateEventTimer;
            GameMgr.UpdateClientTime();
            BtrDoubleToBtrTime(GameMgr.kClientTime, t);
            t.Second += 3;
            // End:0x147
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log((((((((((("t0 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = Event0_Timer;
            GameMgr.AddEventTimer(0, D, det);
            t.Second += 4;
            // End:0x267
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log((((((((((("t1 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            GameMgr.AddEventTimer(1, D);
            t.Second += 50;
            // End:0x35F
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log((((((((((("t2 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            GameMgr.AddEventTimer(2, D);
            t.Second += 6;
            // End:0x458
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = Event0_Timer;
            Log((((((((((("t3 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            GameMgr.AddEventTimer(3, D, det);
            Log("=============================================");            
        }
        else
        {
            // End:0x59C
            if(ToggleButCredit == 1)
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
            }
        }
        ToggleButCredit++;
        // End:0x5B5
        if(ToggleButCredit > 1)
        {
            ToggleButCredit = 0;
        }
    }
    return true;
    //return;    
}

function bool ButtonTemp2_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
    return true;
    //return;    
}

function bool BTWIndowTodayResultHK_OnOK(GUIComponent Sender)
{
    page_Main.TcpLogin.sfReqLogOut(1);
    BTWindowTodayResultHK(Controller.TopPage()).FadeOut();
    return true;
    //return;    
}

function ApplyLocalizedString()
{
    //return;    
}

function InternalOnReOpen()
{
    __NFUN_270__("BTPageServerSelection::InternalOnReOpen()");
    Log("[BTPageServerSelection::InternalOnReOpen] Start");
    Controller.LogMenuStack();
    Log("[BTPageServerSelection::InternalOnReOpen] End");
    //return;    
}

function OnBackToLastPage()
{
    Log("[BTPageServerSelection::OnBackToLastPage] Start");
    currentBGM = page_Main.DefaultLobbyBGM;
    page_Main.LastMainPageBGM = currentBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    RefreshPage();
    // End:0xAC
    if(page_Main.bAutoMove)
    {
        Class'GUIWarfareControls.BTWindowAutoStateHK'.static.ShowState(Controller, 1);
    }
    Log("[BTPageServerSelection::OnBackToLastPage] End");
    //return;    
}

function LogMenuStack()
{
    local int i;
    local export editinline GUIPage Page;

    PlayerOwner().dblog("[CallMenuStack] Start");
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Controller.MenuStack.Length = " $ string(Controller.Count()));
    i = 0;
    J0xA5:

    // End:0x108 [Loop If]
    if(i < Controller.Count())
    {
        Page = Controller.GetMenuByIndex(i);
        PlayerOwner().dblog(string(i) @ string(Page.Name));
        i++;
        // [Loop Continue]
        goto J0xA5;
    }
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("[CallMenuStack] End");
    //return;    
}

function LogControllerInfo()
{
    PlayerOwner().dblog("[ControllerInfo] Start");
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Controller Log!!!!!!");
    // End:0xD8
    if(Controller.FocusedControl != none)
    {
        PlayerOwner().dblog("    FocusedControl = " $ string(Controller.FocusedControl.Name));        
    }
    else
    {
        PlayerOwner().dblog("    FocusedControl = none");
    }
    // End:0x155
    if(Controller.ActiveControl != none)
    {
        PlayerOwner().dblog("    ActiveControl = " $ string(Controller.ActiveControl.Name));        
    }
    else
    {
        PlayerOwner().dblog("    ActiveControl = none");
    }
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Page Log!!!!!!");
    // End:0x449
    if(Controller.ActivePage != none)
    {
        PlayerOwner().dblog("ActivePage = " $ string(Controller.ActivePage.Name));
        // End:0x286
        if(Controller.ActivePage.FocusedControl != none)
        {
            PlayerOwner().dblog("    FocusedControl = " $ string(Controller.ActivePage.FocusedControl.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusedControl = none");
        }
        // End:0x314
        if(Controller.ActivePage.FocusInstead != none)
        {
            PlayerOwner().dblog("    FocusInstead = " $ string(Controller.ActivePage.FocusInstead.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusInstead = none");
        }
        // End:0x39D
        if(Controller.ActivePage.PageOwner != none)
        {
            PlayerOwner().dblog("    PageOwner = " $ string(Controller.ActivePage.PageOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    PageOwner = none");
        }
        // End:0x423
        if(Controller.ActivePage.MenuOwner != none)
        {
            PlayerOwner().dblog("    MenuOwner = " $ string(Controller.ActivePage.MenuOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    MenuOwner = none");
        }        
    }
    else
    {
        PlayerOwner().dblog("ActivePage = none");
    }
    // End:0x6E6
    if(Controller.TopPage() != none)
    {
        PlayerOwner().dblog("TopPage = " $ string(Controller.TopPage().Name));
        // End:0x51D
        if(Controller.TopPage().FocusedControl != none)
        {
            PlayerOwner().dblog("    FocusedControl = " $ string(Controller.TopPage().FocusedControl.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusedControl = none");
        }
        // End:0x5AD
        if(Controller.TopPage().FocusInstead != none)
        {
            PlayerOwner().dblog("    FocusInstead = " $ string(Controller.TopPage().FocusInstead.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusInstead = none");
        }
        // End:0x638
        if(Controller.TopPage().PageOwner != none)
        {
            PlayerOwner().dblog("    PageOwner = " $ string(Controller.TopPage().PageOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    PageOwner = none");
        }
        // End:0x6C0
        if(Controller.TopPage().MenuOwner != none)
        {
            PlayerOwner().dblog("    MenuOwner = " $ string(Controller.TopPage().MenuOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    MenuOwner = none");
        }        
    }
    else
    {
        PlayerOwner().dblog("TopPage = none");
    }
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("[ControllerInfo] End");
    //return;    
}

function CMDHK(int Index, optional string Param1, optional string Param2, optional string param3)
{
    local int i;
    local string mergestring;
    local DelegateEventTimer det;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<string> arrStr;
    local array<int> BootyUID, BootyIID, BootyPID;

    switch(Index)
    {
        // End:0x11A
        case -999:
            page_Main.page_ServerSelection.ACLServerList[0].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[1].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[2].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[3].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[4].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[5].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[6].bShowCount = true;
            // End:0xD3C
            break;
        // End:0x1AB
        case -1:
            // End:0x148
            if(MM.kClanMatch_InChannel)
            {
                MM.kClanMatch_InChannel = false;                
            }
            else
            {
                MM.kClanMatch_InChannel = true;
            }
            // End:0x1A8
            if((page_Main.page_Lobby2 != none) && page_Main.page_curr == page_Main.page_Lobby2)
            {
                page_Main.page_Lobby2.RefreshPage();
            }
            // End:0xD3C
            break;
        // End:0x1F5
        case 0:
            page_Main.page_Lobby2.ButtonRegularClanWar.EnableMe();
            page_Main.page_Lobby2.ButtonRegularClanWar.SetVisibility(true);
            // End:0xD3C
            break;
        // End:0x23F
        case 1:
            page_Main.page_Lobby2.ButtonRegularClanWar.DisableMe();
            page_Main.page_Lobby2.ButtonRegularClanWar.SetVisibility(false);
            // End:0xD3C
            break;
        // End:0x25F
        case 2:
            page_Main.page_ClanWar.RefreshPage();
            // End:0xD3C
            break;
        // End:0x27F
        case 3:
            page_Main.TcpLogin.sfReqClientChallenge();
            // End:0xD3C
            break;
        // End:0x2DC
        case 4:
            // End:0x2AA
            if(page_Main.bNewMailArrived)
            {
                page_Main.bNewMailArrived = false;                
            }
            else
            {
                page_Main.bNewMailArrived = true;
            }
            page_Main.SetNewMailArrived(page_Main.bNewMailArrived);
            // End:0xD3C
            break;
        // End:0x306
        case 5:
            MM.GMLevelFlag = 1;
            MM.bAdminSpectator = true;
            // End:0xD3C
            break;
        // End:0x330
        case 55:
            MM.GMLevelFlag = 2;
            MM.bAdminSpectator = true;
            // End:0xD3C
            break;
        // End:0x37A
        case 6:
            SavePg = Controller.CreateMenu("GUIWarfareControls.BTWindowCreateClanmarkHK");
            // End:0xD3C
            break;
        // End:0x396
        case 7:
            Controller.OpenMenuByObject(SavePg);
            // End:0xD3C
            break;
        // End:0x41E
        case 8:
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = ChatBlockStartTime_OnEventTimer;
            GameMgr.AddEventTimerHMS(1000, 0, 0, 3, det);
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = ChatBlockEndTime_OnEventTimer;
            GameMgr.AddEventTimerHMS(1001, 0, 0, 6, det);
            // End:0xD3C
            break;
        // End:0x45F
        case 9:
            instanceInfo = GameMgr.FindFirstInstanceItemByItemID(int(Param1));
            GameMgr.AddBlockedItem(instanceInfo.UniqueID);
            // End:0xD3C
            break;
        // End:0x5BB
        case 10:
            mergestring = "";
            // End:0x4A3
            if(Param1 != "")
            {
                // End:0x495
                if(mergestring != "")
                {
                    mergestring @= Param1;                    
                }
                else
                {
                    mergestring $= Param1;
                }
            }
            // End:0x4DA
            if(Param2 != "")
            {
                // End:0x4CC
                if(mergestring != "")
                {
                    mergestring @= Param2;                    
                }
                else
                {
                    mergestring $= Param2;
                }
            }
            // End:0x511
            if(param3 != "")
            {
                // End:0x503
                if(mergestring != "")
                {
                    mergestring @= param3;                    
                }
                else
                {
                    mergestring $= param3;
                }
            }
            page_Main.PushNoticeQueue(mergestring);
            PlayerOwner().dblog("Push Notice = " $ mergestring);
            i = 0;
            J0x550:

            // End:0x5B8 [Loop If]
            if(i < page_Main.BatteryNotice.Length)
            {
                PlayerOwner().dblog((("Current Notice [" $ string(i)) $ "]= ") $ page_Main.BatteryNotice[i]);
                i++;
                // [Loop Continue]
                goto J0x550;
            }
            // End:0xD3C
            break;
        // End:0x626
        case 11:
            // End:0x5EC
            if(SaveCanvas == none)
            {
                PlayerOwner().dblog("SaveCanvas si none");
            }
            PlayerOwner().dblog("Font Toggle UseD3DFont!!!");
            SaveCanvas.BtrToggleUseD3DFont();
            // End:0xD3C
            break;
        // End:0x68A
        case 12:
            // End:0x657
            if(SaveCanvas == none)
            {
                PlayerOwner().dblog("SaveCanvas si none");
            }
            PlayerOwner().dblog("Font texture GC!!!");
            SaveCanvas.BtrFontTextureGC();
            // End:0xD3C
            break;
        // End:0x706
        case 13:
            // End:0x6B5
            if(page_Main.kClanWarUserCountIgnore)
            {
                page_Main.kClanWarUserCountIgnore = false;                
            }
            else
            {
                page_Main.kClanWarUserCountIgnore = true;
            }
            PlayerOwner().dblog("kClanWarUserCountIgnore == " $ string(page_Main.kClanWarUserCountIgnore));
            // End:0xD3C
            break;
        // End:0x714
        case 14:
            LogMenuStack();
            // End:0xD3C
            break;
        // End:0x730
        case 15:
            Controller.LaunchURL(Param1);
            // End:0xD3C
            break;
        // End:0x749
        case 16:
            MM.kTest = true;
            // End:0xD3C
            break;
        // End:0x762
        case 17:
            MM.kCharacterCreation = true;
            // End:0xD3C
            break;
        // End:0x7C6
        case 22:
            // End:0x793
            if(SaveCanvas == none)
            {
                PlayerOwner().dblog("SaveCanvas si none");
            }
            PlayerOwner().dblog("Font SaveTexture!!");
            SaveCanvas.BtrSaveTexture();
            // End:0xD3C
            break;
        // End:0x7CE
        case 23:
            // End:0xD3C
            break;
        // End:0x7D6
        case 24:
            // End:0xD3C
            break;
        // End:0x7DE
        case 25:
            // End:0xD3C
            break;
        // End:0x7FE
        case 26:
            page_Main.page_RoomLobby.RefreshPage();
            // End:0xD3C
            break;
        // End:0x849
        case 50:
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, int(Param1), Param2);
            BTWindowDefineInfoHK(Controller.TopPage()).StartTimeOut(5.0000000);
            // End:0xD3C
            break;
        // End:0x86A
        case 51:
            Class'GUIWarfareControls.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls.BTWindowDefineInfoHK');
            // End:0xD3C
            break;
        // End:0x905
        case 52:
            // End:0x8AA
            if(int(page_Main.AuthLogin_ChannelType) > 0)
            {
                page_Main.AuthLogin_ChannelType = 0;
                MM.kChannelingType = 0;                
            }
            else
            {
                page_Main.AuthLogin_ChannelType = 1;
                MM.kChannelingType = 1;
            }
            PlayerOwner().dblog("MM.kChannelingType = " $ string(MM.kChannelingType));
            // End:0xD3C
            break;
        // End:0x9AE
        case 53:
            // End:0x945
            if(int(page_Main.AuthLogin_ConnectAlpha) > 0)
            {
                page_Main.AuthLogin_ConnectAlpha = 0;
                MM.kConnectAlpha = 0;                
            }
            else
            {
                page_Main.AuthLogin_ConnectAlpha = 1;
                MM.kConnectAlpha = 1;
            }
            PlayerOwner().dblog("page_Main.AuthLogin_ConnectAlpha = " $ string(page_Main.AuthLogin_ConnectAlpha));
            // End:0xD3C
            break;
        // End:0xA55
        case 59:
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 51, "siughviuhrg8iuhrg9u74r3gh gf98wh9fhwreuf ewriufw efhiuwehfuiewhfiuwehfiuwehfiuh2498498hg94h9gh498gh4");
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
            // End:0xD3C
            break;
        // End:0xA5D
        case 111:
            // End:0xD3C
            break;
        // End:0xAFC
        case 221:
            // End:0xAF9
            if(page_Main.page_MatchResult2 == page_Main.page_curr)
            {
                BootyUID.Length = 1;
                BootyUID[0] = MM.kUID;
                BootyIID.Length = 1;
                BootyIID[0] = int(Param1);
                BootyPID.Length = 1;
                BootyPID[0] = int(Param2);
                page_Main.page_RoomLobby.rfAckGetBooty(0, "", BootyUID, BootyIID, BootyPID);
            }
            // End:0xD3C
            break;
        // End:0xBB7
        case 222:
            Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
            ItemInfo = GameMgr.FindUIItem(int(Param1));
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.PartID = int(Param2);
            instanceInfo.PaintID = int(param3);
            BTWindowModifyHK(Controller.TopPage()).SetData(ItemInfo, instanceInfo);
            // End:0xD3C
            break;
        // End:0xC82
        case 223:
            Controller.OpenMenu("GUIWarfareControls.BTWindowTrophyHK2");
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.PartID = int(Param2);
            instanceInfo.OverlapCount = 1;
            BTWindowTrophyHK2(Controller.TopPage()).SetData(MM.kUserName, "", MM.kUserName, none, none, GameMgr.FindUIItem(int(Param1)), instanceInfo);
            // End:0xD3C
            break;
        // End:0xCBE
        case 444:
            PlayerOwner().dblog(Param1 @ Param2);
            page_Main.SetAASMessage(1, int(Param2));
            // End:0xD3C
            break;
        // End:0xD01
        case 999:
            arrStr.Length = 1;
            arrStr[0] = Param1;
            page_Main.TcpChannel.sfReqSendMemo(arrStr, Param2, 0);
            // End:0xD3C
            break;
        // End:0xD39
        case 1000:
            MM.IsFixedAssistPoint = bool(Param1);
            MM.FixedAssistTime = float(Param2);
            // End:0xD3C
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function TestTestTest()
{
    local int ret;
    local ClanMarkManager cmm;

    cmm = new Class'Engine.ClanMarkManager';
    cmm.AddClanMark("b", 2, 2, 2);
    cmm.AddClanMark("a", 1, 1, 1);
    cmm.AddClanMark("z", 5, 5, 5);
    cmm.AddClanMark("d", 4, 4, 4);
    cmm.AddClanMark("c", 3, 3, 3);
    ret = cmm.FindClanMark("b");
    ret = cmm.FindClanMark("c");
    ret = cmm.FindClanMark("d");
    ret = cmm.FindClanMark("e");
    //return;    
}

function InitializeDelegate()
{
    MM.__CMDHK__Delegate = CMDHK;
    //return;    
}

function UnInitializeDelegate()
{
    MM.__CMDHK__Delegate = None;
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    MM.__UpdateCharInfo__Delegate = None;
    MM.__UpdateClanInfo__Delegate = None;
    MM.__UpdateClanList__Delegate = None;
    MM.__UpdateFriendList__Delegate = None;
    MM.__UpdatePCBangList__Delegate = None;
    //return;    
}

function RefreshPage()
{
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    super.RefreshPage();
    MM.SetCurpos(0);
    InitializeDelegate();
    // End:0x185
    if(page_Main.bConnectedLoginServer == false)
    {
        Log("page_Main.bConnectedLoginServer == false");
        // End:0x182
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
        {
            Log("class'BTWindowInfoHK'.static.ShowWindow() Start");
            Class'GUIWarfareControls.BTWindowInfoHK'.static.ShowWindow(Controller, "", "Disconnected a LoginServer");
            Log("class'BTWindowInfoHK'.static.ShowWindow() End");
        }        
    }
    else
    {
        Log("page_Main.bConnectedLoginServer == true");
        Log("page_Main.TcpLogin.sfReqServerList()");
        page_Main.TcpLogin.sfReqServerList();
    }
    LastRefreshTime = PlayerOwner().Level.TimeSeconds;
    MM.SetTcpTimeOutInUI();
    //return;    
}

function RefreshVisibleSet()
{
    Log("page_Main.TcpLogin.sfReqServerList()");
    page_Main.TcpLogin.sfReqServerList();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageServerSelection::InternalOnClose()");
    Controller.LogMenuStack();
    //return;    
}

function OnVisibleChannelListChanged(int Index)
{
    SaveServerListIndex = Index;
    //return;    
}

function AutoMoveAtFirstLogin()
{
    // End:0x50
    if(page_Main.bFirstLogin)
    {
        // End:0x2A
        if(MM.kLevel <= 5)
        {            
        }
        else
        {
            // End:0x3F
            if(MM.kLevel <= 8)
            {
            }
        }
        page_Main.bFirstLogin = false;
    }
    //return;    
}

function AutoMoveTochannel(int ServerID, int ChannelID)
{
    local int i;

    Log("[BTPageServerSelection::AutoMoveTochannel]");
    i = page_Main.FindServerConnectionInfoIndex(ServerID, ChannelID);
    // End:0x69
    if(i < 0)
    {
        page_Main.EndAutoMove();
        return;
    }
    page_Main.iChannel = page_Main.SCIList[i].ChannelID;
    page_Main.ServerGroupName = page_Main.SCIList[i].ServerGroupName;
    page_Main.ServerName = page_Main.SCIList[i].ServerName;
    page_Main.ServerShortName = page_Main.SCIList[i].ServerShortName;
    page_Main.ChannelName = page_Main.SCIList[i].ChannelName;
    page_Main.ServerGroupID = page_Main.SCIList[i].ServerGroupID;
    page_Main.ServerID = page_Main.SCIList[i].ServerID;
    MM.PI_EnterChannel(page_Main.SCIList[i].ServerGroupID, page_Main.SCIList[i].ServerGroupName, page_Main.SCIList[i].ServerID, page_Main.SCIList[i].ServerName, page_Main.SCIList[i].ChannelID, page_Main.SCIList[i].ChannelName, page_Main.SCIList[i].IsClanChannel > 0, page_Main.SCIList[i].IsPracticeChannel, page_Main.SCIList[i].IsDedicatedServer);
    ConnectingChannel.ServerID = page_Main.SCIList[i].ServerID;
    ConnectingChannel.ChannelID = page_Main.SCIList[i].ChannelID;
    ConnectingChannel.IP = page_Main.SCIList[i].ServerIP;
    ConnectingChannel.Port = page_Main.SCIList[i].serverPort;
    ConnectingChannel.DataPort = page_Main.SCIList[i].ServerDataPort;
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
    //return;    
}

function NewMoveToChannel(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelection::MoveToChannel]");
    Index = serverACL.GetCurrentIndex();
    Log(((("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex())) $ ", ChannelIndex = ") $ string(Index)) $ ")");
    // End:0xD1
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xED
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x16C
    if(((int(MM.GMLevelFlag) & 3) == 0) && row.DataPerColumn[5].IntValue >= row.DataPerColumn[5].tempValue)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
        return;
    }
    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 4);
    Log(((("Connecting Info = (" $ ConnectingChannel.IP) $ ":") $ string(ConnectingChannel.Port)) $ ")");
    page_Main.iRoomNum = -1;
    page_Main.iChannel = row.DataPerColumn[0].IntValue;
    page_Main.ServerGroupName = row.DataPerColumn[1].strValue;
    page_Main.ServerName = row.DataPerColumn[3].strValue;
    page_Main.ServerShortName = row.DataPerColumn[5].strValue;
    page_Main.ChannelName = row.DataPerColumn[0].strValue;
    page_Main.ServerGroupID = row.DataPerColumn[3].IntValue;
    page_Main.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ChannelID = row.DataPerColumn[0].IntValue;
    ConnectingChannel.IP = row.DataPerColumn[2].strValue;
    ConnectingChannel.Port = row.DataPerColumn[2].IntValue;
    ConnectingChannel.DataPort = row.DataPerColumn[4].IntValue;
    Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsPracticeChannel, page_Main.SCIList[Index].IsDedicatedServer);
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
    //return;    
}

function ShowChannelList(BTACLGroutSelection serverACL)
{
    local int nIndex, i;
    local BTAutoColumnListDataHK Split, row;

    ChannelList.RemoveAll();
    nIndex = serverACL.GetCurrentIndex();
    // End:0x31
    if(nIndex < 0)
    {
        return;
    }
    Split = serverACL.GetRowByIndex(nIndex);
    i = 0;
    J0x52:

    // End:0x3CE [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3C4
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.list_serv_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
            row.DataPerColumn[1].IntValue = Split.DataPerColumn[1].IntValue;
            row.DataPerColumn[1].strValue = Split.DataPerColumn[1].strValue;
            row.DataPerColumn[2].strValue = Split.DataPerColumn[2].strValue;
            row.DataPerColumn[2].IntValue = Split.DataPerColumn[2].IntValue;
            row.DataPerColumn[3].strValue = Split.DataPerColumn[3].strValue;
            row.DataPerColumn[3].IntValue = Split.DataPerColumn[3].IntValue;
            row.DataPerColumn[3].tempValue = Split.DataPerColumn[3].tempValue;
            row.DataPerColumn[4].IntValue = Split.DataPerColumn[4].IntValue;
            row.DataPerColumn[5].strValue = Split.DataPerColumn[5].strValue;
            row.DataPerColumn[5].IntValue = Split.DataPerColumn[5].IntValue;
            row.DataPerColumn[5].tempValue = Split.DataPerColumn[5].tempValue;
            row.DataPerColumn[6].IntValue = Split.DataPerColumn[6].IntValue;
            ChannelList.AddRow(row);
        }
        i++;
        // [Loop Continue]
        goto J0x52;
    }
    //return;    
}

function FirstShowChannelList()
{
    local int nIndex, i;
    local BTAutoColumnListDataHK Split, row;

    ChannelList.RemoveAll();
    // End:0x1C
    if(nIndex < 0)
    {
        return;
    }
    Split = ServerList.GetRowByIndex(0);
    i = 0;
    J0x39:

    // End:0x3B5 [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3AB
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.list_serv_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
            row.DataPerColumn[1].IntValue = Split.DataPerColumn[1].IntValue;
            row.DataPerColumn[1].strValue = Split.DataPerColumn[1].strValue;
            row.DataPerColumn[2].strValue = Split.DataPerColumn[2].strValue;
            row.DataPerColumn[2].IntValue = Split.DataPerColumn[2].IntValue;
            row.DataPerColumn[3].strValue = Split.DataPerColumn[3].strValue;
            row.DataPerColumn[3].IntValue = Split.DataPerColumn[3].IntValue;
            row.DataPerColumn[3].tempValue = Split.DataPerColumn[3].tempValue;
            row.DataPerColumn[4].IntValue = Split.DataPerColumn[4].IntValue;
            row.DataPerColumn[5].strValue = Split.DataPerColumn[5].strValue;
            row.DataPerColumn[5].IntValue = Split.DataPerColumn[5].IntValue;
            row.DataPerColumn[5].tempValue = Split.DataPerColumn[5].tempValue;
            row.DataPerColumn[6].IntValue = Split.DataPerColumn[6].IntValue;
            ChannelList.AddRow(row);
        }
        i++;
        // [Loop Continue]
        goto J0x39;
    }
    //return;    
}

function MoveToChannel(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelection::MoveToChannel]");
    Index = serverACL.GetCurrentIndex();
    Log(((("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex())) $ ", ChannelIndex = ") $ string(Index)) $ ")");
    // End:0xD1
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xED
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x16C
    if(((int(MM.GMLevelFlag) & 3) == 0) && row.DataPerColumn[5].IntValue >= row.DataPerColumn[5].tempValue)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
        return;
    }
    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 4);
    Log(((("Connecting Info = (" $ ConnectingChannel.IP) $ ":") $ string(ConnectingChannel.Port)) $ ")");
    page_Main.iRoomNum = -1;
    page_Main.iChannel = row.DataPerColumn[0].IntValue;
    page_Main.ServerGroupName = row.DataPerColumn[1].strValue;
    page_Main.ServerName = row.DataPerColumn[3].strValue;
    page_Main.ServerShortName = row.DataPerColumn[5].strValue;
    page_Main.ChannelName = row.DataPerColumn[0].strValue;
    page_Main.ServerGroupID = row.DataPerColumn[3].IntValue;
    page_Main.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ChannelID = row.DataPerColumn[0].IntValue;
    ConnectingChannel.IP = row.DataPerColumn[2].strValue;
    ConnectingChannel.Port = row.DataPerColumn[2].IntValue;
    ConnectingChannel.DataPort = row.DataPerColumn[4].IntValue;
    Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsPracticeChannel, page_Main.SCIList[Index].IsDedicatedServer);
    page_Main.pwm.CloseAndClear();
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.LoginToChannel(ConnectingChannel.IP, ConnectingChannel.Port, ConnectingChannel.DataPort);
    //return;    
}

function bool rfAckServerListFromLoginServer(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    DrawServerSelection(CServername, CServerShortName, ServerIP, serverPort, ChannelName, ChannelNickName, ChannelNum, chMaxUser, chCurUser, ServerGroupName, ServerGroupID, ServerDispOrder, DataPort, OptionCount_byte, OptionKey_byte, OptionValue_byte, OptionCount_int, OptionKey_int, OptionValue_int, OptionCount_float, OptionKey_float, OptionValue_float, IsClanChannel, IsUseDedicateHost);
    return true;
    //return;    
}

function DrawServerSelection(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    local BTAutoColumnListDataHK row, Split;
    local Image uii;
    local export editinline BTACLServerSelectionHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, j, k;
    local array<byte> CurrentOption_Byte_Key, CurrentOption_Byte_Value, CurrentOption_Int_Key;
    local array<int> CurrentOption_Int_Value;
    local array<byte> CurrentOption_Float_Key;
    local array<float> CurrentOption_Float_Value;
    local int ocount_byte_length, ocount_byte_index, ocount_int_length, ocount_float_length;
    local byte CheckPracticeChannel[7];
    local bool IsPracticeChannel;
    local array<string> distinctiveServerNames, distIPs;
    local array<int> distPorts;
    local bool foundDuplicate;

    TabControl.Clear();
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] Start");
    i = 0;
    J0x57:

    // End:0x175 [Loop If]
    if(i < ServerGroupName.Length)
    {
        Log((((((((((((((((((((((((("[" $ string(i)) $ "] ") $ ServerIP[i]) $ ", ") $ string(serverPort[i])) $ ", ") $ ChannelName[i]) $ ", ") $ string(ChannelNum[i])) $ ", ") $ string(chMaxUser[i])) $ ", ") $ string(chMaxUser[i])) $ ", ") $ string(chCurUser[i])) $ ", ") $ ServerGroupName[i]) $ ", ") $ string(ServerGroupID[i])) $ ", ") $ string(DataPort[i])) $ ", ") $ string(IsClanChannel[i])) $ ", ") $ string(IsUseDedicateHost[i]));
        i++;
        // [Loop Continue]
        goto J0x57;
    }
    i = 0;
    J0x17C:

    // End:0x238 [Loop If]
    if(i < ServerGroupName.Length)
    {
        foundDuplicate = false;
        j = 0;
        J0x19B:

        // End:0x1DB [Loop If]
        if(j < distinctiveServerNames.Length)
        {
            // End:0x1D1
            if(distinctiveServerNames[j] == ServerGroupName[i])
            {
                foundDuplicate = true;
                // [Explicit Break]
                goto J0x1DB;
            }
            j++;
            // [Loop Continue]
            goto J0x19B;
        }
        J0x1DB:

        // End:0x22E
        if(!foundDuplicate)
        {
            distinctiveServerNames[distinctiveServerNames.Length] = ServerGroupName[i];
            distIPs[distIPs.Length] = ServerIP[i];
            distPorts[distPorts.Length] = serverPort[i];
        }
        i++;
        // [Loop Continue]
        goto J0x17C;
    }
    i = 0;
    J0x23F:

    // End:0x56F [Loop If]
    if(i < distinctiveServerNames.Length)
    {
        // End:0x272
        if(ButtonServerList[i] == none)
        {
            serverButton = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';            
        }
        else
        {
            serverButton = ButtonServerList[i];
        }
        serverButton.bUseAWinPos = true;
        fb.X1 = 17.0000000;
        fb.Y1 = 98.0000000 + float(43 * i);
        fb.X2 = 247.0000000;
        fb.Y2 = 131.0000000 + float(43 * i);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.2000000;
        serverButton.Caption = distinctiveServerNames[i];
        serverButton.CaptionDrawType = 5;
        serverButton.SetFontSizeAll(12);
        serverButton.SetDefaultButtonImage();
        serverButton.buttonImage[4] = serverButton.buttonImage[1];
        serverButton.FontColor[4] = serverButton.FontColor[1];
        serverButton.FontShadowColor[4] = serverButton.FontShadowColor[1];
        serverButton.CaptionPadding[2] = 10;
        // End:0x40C
        if(ButtonServerList[i] == none)
        {
            serverButton.InitComponent(Controller, self);
            AppendComponent(serverButton);
        }
        ButtonServerList[i] = serverButton;
        // End:0x440
        if(ACLServerList[i] == none)
        {
            serverACL = new Class'GUIWarfareControls.BTACLServerSelectionHK';            
        }
        else
        {
            serverACL = ACLServerList[i];
            serverACL.RemoveAll();
            serverACL.CurrentServerGroup = "";
        }
        serverACL.bUseAWinPos = true;
        fb.X1 = 272.0000000;
        fb.Y1 = 95.0000000;
        fb.X2 = 739.0000000;
        fb.Y2 = 727.0000000;
        serverACL.AWinPos = fb;
        serverACL.RenderWeight = 0.2000000;
        // End:0x51B
        if(ACLServerList[i] == none)
        {
            serverACL.InitComponent(Controller, self);
            AppendComponent(serverACL);
        }
        serverACL.__OnEnterChannel__Delegate = NewMoveToChannel;
        ACLServerList[i] = serverACL;
        TabControl.BindTabButtonAndPanel(ButtonServerList[i], ACLServerList[i]);
        i++;
        // [Loop Continue]
        goto J0x23F;
    }
    i = distinctiveServerNames.Length;
    J0x57B:

    // End:0x609 [Loop If]
    if(i < 7)
    {
        // End:0x5C2
        if(ButtonServerList[i] != none)
        {
            ButtonServerList[i].Hide();
            ButtonServerList[i].DisableMe();
        }
        // End:0x5FF
        if(ACLServerList[i] != none)
        {
            ACLServerList[i].bAcceptsInput = false;
            ACLServerList[i].Hide();
        }
        i++;
        // [Loop Continue]
        goto J0x57B;
    }
    uii = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.list_serv_n;
    page_Main.ClearServerChannelList();
    ocount_byte_index = 0;
    i = 0;
    J0x63A:

    // End:0xF16 [Loop If]
    if(i < CServername.Length)
    {
        ocount_byte_length = int(OptionCount_byte[i]);
        ocount_int_length = int(OptionCount_int[i]);
        ocount_float_length = int(OptionCount_float[i]);
        CurrentOption_Byte_Key.Length = ocount_byte_length;
        CurrentOption_Byte_Value.Length = ocount_byte_length;
        CurrentOption_Int_Key.Length = ocount_int_length;
        CurrentOption_Int_Value.Length = ocount_int_length;
        CurrentOption_Float_Key.Length = ocount_float_length;
        CurrentOption_Float_Value.Length = ocount_float_length;
        k = 0;
        J0x6D2:

        // End:0x7E7 [Loop If]
        if(k < ocount_byte_length)
        {
            // End:0x70B
            if(OptionKey_byte.Length > 0)
            {
                CurrentOption_Byte_Key[k] = OptionKey_byte[k + ocount_byte_index];
            }
            // End:0x735
            if(OptionValue_byte.Length > 0)
            {
                CurrentOption_Byte_Value[k] = OptionValue_byte[k + ocount_byte_index];
            }
            // End:0x75F
            if(OptionKey_int.Length > 0)
            {
                CurrentOption_Int_Key[k] = OptionKey_int[k + ocount_byte_index];
            }
            // End:0x789
            if(OptionValue_int.Length > 0)
            {
                CurrentOption_Int_Value[k] = OptionValue_int[k + ocount_byte_index];
            }
            // End:0x7B3
            if(OptionKey_float.Length > 0)
            {
                CurrentOption_Float_Key[k] = OptionKey_float[k + ocount_byte_index];
            }
            // End:0x7DD
            if(OptionValue_float.Length > 0)
            {
                CurrentOption_Float_Value[k] = OptionValue_float[k + ocount_byte_index];
            }
            k++;
            // [Loop Continue]
            goto J0x6D2;
        }
        ocount_byte_index += ocount_byte_length;
        k = 0;
        J0x7FA:

        // End:0x81E [Loop If]
        if(k < 7)
        {
            CheckPracticeChannel[k] = 0;
            k++;
            // [Loop Continue]
            goto J0x7FA;
        }
        k = 0;
        J0x825:

        // End:0x9AB [Loop If]
        if(k < ocount_byte_length)
        {
            // End:0x867
            if(int(CurrentOption_Byte_Key[k]) == 0)
            {
                // End:0x864
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[0] = 1;
                }
                // [Explicit Continue]
                goto J0x9A1;
            }
            // End:0x89B
            if(int(CurrentOption_Byte_Key[k]) == 2)
            {
                // End:0x898
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[1] = 1;
                }
                // [Explicit Continue]
                goto J0x9A1;
            }
            // End:0x8D0
            if(int(CurrentOption_Byte_Key[k]) == 3)
            {
                // End:0x8CD
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[2] = 1;
                }
                // [Explicit Continue]
                goto J0x9A1;
            }
            // End:0x905
            if(int(CurrentOption_Byte_Key[k]) == 4)
            {
                // End:0x902
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[3] = 1;
                }
                // [Explicit Continue]
                goto J0x9A1;
            }
            // End:0x93A
            if(int(CurrentOption_Byte_Key[k]) == 5)
            {
                // End:0x937
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[4] = 1;
                }
                // [Explicit Continue]
                goto J0x9A1;
            }
            // End:0x96F
            if(int(CurrentOption_Byte_Key[k]) == 6)
            {
                // End:0x96C
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[5] = 1;
                }
                // [Explicit Continue]
                goto J0x9A1;
            }
            // End:0x9A1
            if(int(CurrentOption_Byte_Key[k]) == 7)
            {
                // End:0x9A1
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[6] = 1;
                }
            }
            J0x9A1:

            k++;
            // [Loop Continue]
            goto J0x825;
        }
        IsPracticeChannel = true;
        k = 0;
        J0x9BA:

        // End:0x9EE [Loop If]
        if(k < 7)
        {
            // End:0x9E4
            if(int(CheckPracticeChannel[k]) == 0)
            {
                IsPracticeChannel = false;
                // [Explicit Break]
                goto J0x9EE;
            }
            k++;
            // [Loop Continue]
            goto J0x9BA;
        }
        J0x9EE:

        row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
        row.Init(7);
        row.BackgroundImage = uii;
        row.DataPerColumn[0].Text[0].FontDrawType = 3;
        row.DataPerColumn[0].Text[1].FontDrawType = 3;
        row.DataPerColumn[0].Text[2].FontDrawType = 3;
        row.DataPerColumn[0].strValue = ChannelName[i];
        row.DataPerColumn[0].IntValue = ChannelNum[i];
        row.DataPerColumn[1].IntValue = int((float(chCurUser[i]) / float(chMaxUser[i])) * float(100));
        row.DataPerColumn[1].strValue = ServerGroupName[i];
        row.DataPerColumn[2].strValue = ServerIP[i];
        row.DataPerColumn[2].IntValue = serverPort[i];
        row.DataPerColumn[3].strValue = CServername[i];
        row.DataPerColumn[3].IntValue = ServerGroupID[i];
        row.DataPerColumn[3].tempValue = ServerDispOrder[i];
        row.DataPerColumn[4].IntValue = DataPort[i];
        row.DataPerColumn[5].strValue = CServerShortName[i];
        row.DataPerColumn[5].IntValue = chCurUser[i];
        row.DataPerColumn[5].tempValue = chMaxUser[i];
        row.DataPerColumn[6].IntValue = int(IsClanChannel[i]);
        // End:0xC94
        if(IsPracticeChannel)
        {
            row.DataPerColumn[6].tempValue = 1;
        }
        page_Main.SCIList.Length = page_Main.SCIList.Length + 1;
        page_Main.AddServerChannelList(ServerDispOrder[i], ChannelNum[i], ServerIP[i], serverPort[i], DataPort[i], CServername[i], CServerShortName[i], ChannelName[i], ServerGroupID[i], ServerGroupName[i], int(IsClanChannel[i]), ChannelNickName[i], IsPracticeChannel, int(IsUseDedicateHost[i]) > 0);
        j = 0;
        J0xD68:

        // End:0xF0C [Loop If]
        if(j < 7)
        {
            // End:0xF02
            if(ButtonServerList[j].Caption == ServerGroupName[i])
            {
                // End:0xEE5
                if(ACLServerList[j].CurrentServerGroup != CServername[i])
                {
                    ACLServerList[j].CurrentServerGroup = CServername[i];
                    Split = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
                    Split.Init(4);
                    Split.DataPerColumn[0].strValue = CServername[i];
                    Split.DataPerColumn[3].IntValue = ServerGroupID[i];
                    Split.bSpliter = true;
                    Split.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_ser_listop;
                    Split.DataPerColumn[0].Text[0].FontSize = 11;
                    Split.DataPerColumn[0].Text[1].FontSize = 11;
                    Split.DataPerColumn[0].Text[2].FontSize = 11;
                    ACLServerList[j].AddRow(Split);
                }
                ACLServerList[j].AddRow(row);
                // [Explicit Break]
                goto J0xF0C;
            }
            j++;
            // [Loop Continue]
            goto J0xD68;
        }
        J0xF0C:

        i++;
        // [Loop Continue]
        goto J0x63A;
    }
    TabControl.SetVisiblePanel(SaveServerListIndex);
    // End:0xF56
    if(bButtonRefresh == false)
    {
        bButtonRefresh = true;
        TPTopMenu.ButtonRefresh.EnableMe();
    }
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] End");
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] KeepMoving");
    page_Main.KeepMoving();
    //return;    
}

function NewDrawServerSelection(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i, j, k;
    local array<byte> CurrentOption_Byte_Key, CurrentOption_Byte_Value, CurrentOption_Int_Key;
    local array<int> CurrentOption_Int_Value;
    local array<byte> CurrentOption_Float_Key;
    local array<float> CurrentOption_Float_Value;
    local int ocount_byte_length, ocount_byte_index, ocount_int_length, ocount_float_length;
    local byte CheckPracticeChannel[7];
    local bool IsPracticeChannel;
    local array<string> distinctiveServerNames, distIPs;
    local array<int> distPorts;
    local bool foundDuplicate;

    TabControl.Clear();
    ServerList.RemoveAll();
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] Start");
    i = 0;
    J0x66:

    // End:0x15A [Loop If]
    if(i < ServerGroupName.Length)
    {
        Log((((((((((((((((((((("[" $ string(i)) $ "] ") $ ServerIP[i]) $ ", ") $ string(serverPort[i])) $ ", ") $ ChannelName[i]) $ ", ") $ string(ChannelNum[i])) $ ", ") $ string(chMaxUser[i])) $ ", ") $ string(chMaxUser[i])) $ ", ") $ string(chCurUser[i])) $ ", ") $ ServerGroupName[i]) $ ", ") $ string(ServerGroupID[i])) $ ", ") $ string(DataPort[i]));
        i++;
        // [Loop Continue]
        goto J0x66;
    }
    i = 0;
    J0x161:

    // End:0x21D [Loop If]
    if(i < ServerGroupName.Length)
    {
        foundDuplicate = false;
        j = 0;
        J0x180:

        // End:0x1C0 [Loop If]
        if(j < distinctiveServerNames.Length)
        {
            // End:0x1B6
            if(distinctiveServerNames[j] == ServerGroupName[i])
            {
                foundDuplicate = true;
                // [Explicit Break]
                goto J0x1C0;
            }
            j++;
            // [Loop Continue]
            goto J0x180;
        }
        J0x1C0:

        // End:0x213
        if(!foundDuplicate)
        {
            distinctiveServerNames[distinctiveServerNames.Length] = ServerGroupName[i];
            distIPs[distIPs.Length] = ServerIP[i];
            distPorts[distPorts.Length] = serverPort[i];
        }
        i++;
        // [Loop Continue]
        goto J0x161;
    }
    i = 0;
    J0x224:

    // End:0x5F4 [Loop If]
    if(i < distinctiveServerNames.Length)
    {
        row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
        row.Init(7);
        row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.list_serv_n;
        row.DataPerColumn[0].Text[0].FontDrawType = 3;
        row.DataPerColumn[0].Text[1].FontDrawType = 3;
        row.DataPerColumn[0].Text[2].FontDrawType = 3;
        row.DataPerColumn[0].strValue = ChannelName[i];
        row.DataPerColumn[0].IntValue = ChannelNum[i];
        row.DataPerColumn[1].IntValue = int((float(chCurUser[i]) / float(chMaxUser[i])) * float(100));
        row.DataPerColumn[1].strValue = ServerGroupName[i];
        row.DataPerColumn[2].strValue = ServerIP[i];
        row.DataPerColumn[2].IntValue = serverPort[i];
        row.DataPerColumn[3].strValue = CServername[i];
        row.DataPerColumn[3].IntValue = ServerGroupID[i];
        row.DataPerColumn[3].tempValue = ServerDispOrder[i];
        row.DataPerColumn[4].IntValue = DataPort[i];
        row.DataPerColumn[5].strValue = CServerShortName[i];
        row.DataPerColumn[5].IntValue = chCurUser[i];
        row.DataPerColumn[5].tempValue = chMaxUser[i];
        row.DataPerColumn[6].IntValue = int(IsClanChannel[i]);
        // End:0x4E3
        if(IsPracticeChannel)
        {
            row.DataPerColumn[6].tempValue = 1;
        }
        ServerList.AddRow(row);
        i = 0;
        J0x4FE:

        // End:0x5EA [Loop If]
        if(i < 23)
        {
            row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.list_serv_n;
            row.DataPerColumn[1].strValue = "Test1 " $ string(i);
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            ServerList.AddRow(row);
            i++;
            // [Loop Continue]
            goto J0x4FE;
        }
        i++;
        // [Loop Continue]
        goto J0x224;
    }
    uii = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.list_serv_n;
    page_Main.ClearServerChannelList();
    ocount_byte_index = 0;
    i = 0;
    J0x625:

    // End:0xAB0 [Loop If]
    if(i < CServername.Length)
    {
        ocount_byte_length = int(OptionCount_byte[i]);
        ocount_int_length = int(OptionCount_int[i]);
        ocount_float_length = int(OptionCount_float[i]);
        CurrentOption_Byte_Key.Length = ocount_byte_length;
        CurrentOption_Byte_Value.Length = ocount_byte_length;
        CurrentOption_Int_Key.Length = ocount_int_length;
        CurrentOption_Int_Value.Length = ocount_int_length;
        CurrentOption_Float_Key.Length = ocount_float_length;
        CurrentOption_Float_Value.Length = ocount_float_length;
        k = 0;
        J0x6BD:

        // End:0x7D2 [Loop If]
        if(k < ocount_byte_length)
        {
            // End:0x6F6
            if(OptionKey_byte.Length > 0)
            {
                CurrentOption_Byte_Key[k] = OptionKey_byte[k + ocount_byte_index];
            }
            // End:0x720
            if(OptionValue_byte.Length > 0)
            {
                CurrentOption_Byte_Value[k] = OptionValue_byte[k + ocount_byte_index];
            }
            // End:0x74A
            if(OptionKey_int.Length > 0)
            {
                CurrentOption_Int_Key[k] = OptionKey_int[k + ocount_byte_index];
            }
            // End:0x774
            if(OptionValue_int.Length > 0)
            {
                CurrentOption_Int_Value[k] = OptionValue_int[k + ocount_byte_index];
            }
            // End:0x79E
            if(OptionKey_float.Length > 0)
            {
                CurrentOption_Float_Key[k] = OptionKey_float[k + ocount_byte_index];
            }
            // End:0x7C8
            if(OptionValue_float.Length > 0)
            {
                CurrentOption_Float_Value[k] = OptionValue_float[k + ocount_byte_index];
            }
            k++;
            // [Loop Continue]
            goto J0x6BD;
        }
        ocount_byte_index += ocount_byte_length;
        k = 0;
        J0x7E5:

        // End:0x809 [Loop If]
        if(k < 7)
        {
            CheckPracticeChannel[k] = 0;
            k++;
            // [Loop Continue]
            goto J0x7E5;
        }
        k = 0;
        J0x810:

        // End:0x996 [Loop If]
        if(k < ocount_byte_length)
        {
            // End:0x852
            if(int(CurrentOption_Byte_Key[k]) == 0)
            {
                // End:0x84F
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[0] = 1;
                }
                // [Explicit Continue]
                goto J0x98C;
            }
            // End:0x886
            if(int(CurrentOption_Byte_Key[k]) == 2)
            {
                // End:0x883
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[1] = 1;
                }
                // [Explicit Continue]
                goto J0x98C;
            }
            // End:0x8BB
            if(int(CurrentOption_Byte_Key[k]) == 3)
            {
                // End:0x8B8
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[2] = 1;
                }
                // [Explicit Continue]
                goto J0x98C;
            }
            // End:0x8F0
            if(int(CurrentOption_Byte_Key[k]) == 4)
            {
                // End:0x8ED
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[3] = 1;
                }
                // [Explicit Continue]
                goto J0x98C;
            }
            // End:0x925
            if(int(CurrentOption_Byte_Key[k]) == 5)
            {
                // End:0x922
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[4] = 1;
                }
                // [Explicit Continue]
                goto J0x98C;
            }
            // End:0x95A
            if(int(CurrentOption_Byte_Key[k]) == 6)
            {
                // End:0x957
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[5] = 1;
                }
                // [Explicit Continue]
                goto J0x98C;
            }
            // End:0x98C
            if(int(CurrentOption_Byte_Key[k]) == 7)
            {
                // End:0x98C
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[6] = 1;
                }
            }
            J0x98C:

            k++;
            // [Loop Continue]
            goto J0x810;
        }
        IsPracticeChannel = true;
        k = 0;
        J0x9A5:

        // End:0x9D9 [Loop If]
        if(k < 7)
        {
            // End:0x9CF
            if(int(CheckPracticeChannel[k]) == 0)
            {
                IsPracticeChannel = false;
                // [Explicit Break]
                goto J0x9D9;
            }
            k++;
            // [Loop Continue]
            goto J0x9A5;
        }
        J0x9D9:

        page_Main.SCIList.Length = page_Main.SCIList.Length + 1;
        page_Main.AddServerChannelList(ServerDispOrder[i], ChannelNum[i], ServerIP[i], serverPort[i], DataPort[i], CServername[i], CServerShortName[i], ChannelName[i], ServerGroupID[i], ServerGroupName[i], int(IsClanChannel[i]), ChannelNickName[i], IsPracticeChannel, int(IsUseDedicateHost[i]) > 0);
        i++;
        // [Loop Continue]
        goto J0x625;
    }
    TabControl.SetVisiblePanel(SaveServerListIndex);
    // End:0xAF0
    if(bButtonRefresh == false)
    {
        bButtonRefresh = true;
        TPTopMenu.ButtonRefresh.EnableMe();
    }
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] End");
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] KeepMoving");
    page_Main.KeepMoving();
    FirstShowChannelList();
    ChannelList.__OnEnterChannel__Delegate = NewMoveToChannel;
    ServerList.__OnSelectSvr__Delegate = ShowChannelList;
    //return;    
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageServerSelection::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x130
    if(ErrCode == 0)
    {
        // End:0xEB
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0xAB
            if(page_Main.TcpLogin == none)
            {
                Log("page_Main.TcpLogin is none");
            }
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);            
        }
        else
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    //return;    
}

function TcpChannel_OnConnect(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x20C
    if(ErrCode == 0)
    {
        page_Main.bConnectedChannelServer = true;
        Log(((((((((((((((("page_Main.TcpChannel.sfReqLogin2(" $ page_Main.rMM.kUserName) $ ", ") $ string(page_Main.LoginTimeStamp)) $ ", ") $ string(page_Main.LoginHash1)) $ ", ") $ string(page_Main.LoginHash2)) $ ", ") $ string(page_Main.LoginHash3)) $ ", ") $ string(page_Main.LoginHash4)) $ ", ") $ string(page_Main.LoginHash5)) $ ", ") $ page_Main.AuthLogin_GUID) $ ")");
        page_Main.TcpChannel.sfReqSetClientVersion(page_Main.rMM.GetClientVersion());
        page_Main.TcpChannel.sfReqLogin2(page_Main.rMM.kUserName, page_Main.LoginTimeStamp, page_Main.LoginHash1, page_Main.LoginHash2, page_Main.LoginHash3, page_Main.LoginHash4, page_Main.LoginHash5, page_Main.AuthLogin_GUID);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 9, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(9, string(ErrCode)));
    }
    //return;    
}

function TcpChannel_OnClose(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnClose] ErrCode=" $ string(ErrCode));
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 10, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    // End:0xDD
    if(ErrCode != 0)
    {
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(10, string(ErrCode)));
    }
    page_Main.bConnectedChannelServer = false;
    //return;    
}

function TcpChannel_OnError(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnError] ErrCode=" $ string(ErrCode));
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 11, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(11, string(ErrCode)));
    page_Main.bConnectedChannelServer = false;
    //return;    
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageServerSelection::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Index;
    local SystemMsgParam MsgInfo;

    Log("[BTPageServerSelection::rfAckEnterChannel] Result=" $ string(Result));
    // End:0x6A3
    if(Result == 0)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        page_Main.ResetChatLog();
        // End:0x10E
        if(true == MM.IsPlayingPCBang())
        {
            // End:0x10E
            if(MM.kIsPaidPCBang >= 0)
            {
                // End:0xEB
                if(MM.kIsPaidPCBang == 1)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(178), 5, true);                    
                }
                else
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(177), 5, true);
                }
            }
        }
        Controller.PopPage();
        MsgInfo.MsgCode = 5;
        MsgInfo.CharName = UserID;
        MsgInfo.ServerID = page_Main.rMM.kServerID;
        MsgInfo.ChannelNum = page_Main.rMM.kChannelID;
        page_Main.TcpChannel.sfReqSendSystemMsg(1, UserID, "", MsgInfo);
        Log(("page_Main.TcpChannel.sfReqSendSystemMsg(1, " $ UserID) $ ", , msginfo) MsgCode=5");
        page_Main.bWarningDurabilityAndExpired = true;
        Log("page_Main.TcpChannel.sfReqLimitedListInChannel()");
        page_Main.TcpChannel.sfReqLimitedListInChannel();
        MM.kUserName = UserID;
        MM.kLevel = Level;
        MM.kUID = UID;
        MM.kLevelMarkID = LevelMarkID;
        MM.kTitleMarkID = TitleMarkID;
        MM.kReserved1 = Reserved1;
        MM.kReserved2 = Reserved2;
        MM.kReserved3 = Reserved3;
        MM.kClanName = ClanName;
        MM.kInClanGrade = ClanGrade;
        MM.kClanPattern = ClanMarkPattern;
        MM.kClanBG = ClanMarkBG;
        MM.kClanBL = ClanMarkBL;
        MM.kClanLevel = ClanLevel;
        GameMgr.cmm.AddClanMark(MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, true, int(IsLookFor) > 0);
        GameMgr.cmm.SetClanLevel(MM.kClanName, MM.kClanLevel);
        GameMgr.SP.kClanPattern_Img = GameMgr.GetClanMark32(ClanMarkPattern);
        GameMgr.SP.kClanBG_Img = GameMgr.GetClanMark32(ClanMarkBG);
        GameMgr.SP.kClanBL_Img = GameMgr.GetClanMark32(ClanMarkBL);
        MM.kClanWin = ClanWin;
        MM.kClanLose = ClanLose;
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
        Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
        MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsPracticeChannel, page_Main.SCIList[Index].IsDedicatedServer);
        MM.UpdatePositionInfo(MM);
        MM.kConnectAlpha = byte(int(Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST ConnectAlpha")));
        page_Main.AuthLogin_ConnectAlpha = MM.kConnectAlpha;
        page_Main.bAuthKeySuccess = true;
        page_Main.SetPage(7, false);        
    }
    else
    {
        // End:0x70B
        if(Result == 16)
        {
            page_Main.bAuthKeySuccess = true;
            page_Main.EndAutoMove();
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;            
        }
        else
        {
            // End:0x78A
            if((Result == 498) || Result == 497)
            {
                page_Main.bAuthKeySuccess = true;
                page_Main.EndAutoMove();
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
                BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;                
            }
            else
            {
                page_Main.EndAutoMove();
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
                BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    Log("[BTPageServerSelection::rfAckLeaveChannel] Result=" $ string(Result));
    return true;
    //return;    
}

function bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    local wMyPlayerStatus MyStatus;
    local BtrTime t;
    local DelegateEventTimer det;
    local bool bFirstSet;

    Log(((((("[BTPageServerSelection::rfAckLogin2] UserID=" $ string(UserID)) $ ", Charname=") $ CharName) $ ", ") $ "Result=") $ string(Result));
    // End:0x6BB
    if(Result == 0)
    {
        Log("page_Main.TcpChannel.sfReqServerType()");
        page_Main.TcpChannel.sfReqServerType();
        Log("page_Main.TcpChannel.sfReqServerTime()");
        page_Main.TcpChannel.sfReqServerTime();
        Log("page_Main.TcpChannel.sfReqGetServerTime()");
        page_Main.TcpChannel.sfReqGetServerTime();
        Log("page_Main.TcpChannel.sfReqCharBlockinfo()");
        page_Main.TcpChannel.sfReqCharBlockInfo();
        Log("page_Main.TcpChannel.sfReqGetMyMailBoxState()");
        page_Main.TcpChannel.sfReqGetMyMailBoxState();
        Log(("page_Main.TcpChannel.sfReqItemList(" $ string(UserID)) $ ")");
        GameMgr.ClearInstanceItem();
        page_Main.TcpChannel.sfReqItemList(UserID);
        Log(("page_Main.TcpChannel.sfReqUserSkillList(" $ string(UserID)) $ ")");
        page_Main.TcpChannel.sfReqUserSkillList(UserID);
        Log("page_Main.TcpChannel.sfReqQSlotList()");
        page_Main.TcpChannel.sfReqQSlotList();
        Log("page_Main.TcpChannel.sfReqFriendList()");
        page_Main.TcpChannel.sfReqFriendList();
        Log("page_Main.TcpChannel.sfReqQuestList()");
        page_Main.TcpChannel.sfReqQuestList();
        Log("page_Main.TcpChannel.sfReqWebzenCash()");
        page_Main.TcpChannel.sfReqWebzenCash();
        Log("page_Main.TcpChannel.sfReqShopItemData(0)");
        page_Main.TcpChannel.sfReqShopItemData(0);
        page_Main.TcpChannel.sfReqCharBlockInfo();
        MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
        MyStatus.UserID = UserID;
        MyStatus.NickName = CharName;
        MyStatus.CurrentTime = CurServerTime;
        // End:0x49A
        if((GameMgr.kServerTime.dummy_1_DO_NOT_USE == 0) && GameMgr.kServerTime.dummy_2_DO_NOT_USE == 0)
        {
            bFirstSet = true;            
        }
        else
        {
            bFirstSet = false;
        }
        page_Main.rMM.kUID = UserID;
        page_Main.rMM.kUserName = CharName;
        GameMgr.SetServerTime(CurServerTime);
        GameMgr.UpdateServerTime(GameMgr);
        page_Main.rMM.UpdateCharInfo(page_Main.rMM);
        page_Main.rMM.UpdateClanInfo(page_Main.rMM);
        BtrDoubleToBtrTime(CurServerTime, t);
        Log(((((((((string(t.Year) @ string(t.Month)) @ string(t.Day)) @ "/") @ string(t.Hour)) @ string(t.Minute)) @ string(t.Second)) @ string(t.Milliseconds)) @ "+") @ string(t.DayOfWeek));
        Log((string(CurServerTime.dummy_1_DO_NOT_USE) $ ", ") $ string(CurServerTime.dummy_2_DO_NOT_USE));
        // End:0x659
        if(bFirstSet)
        {
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = page_Main.ShowPlayTimePerHour_OnEventTimer;
            GameMgr.AddEventTimerHMS(9999, 1, 0, 0, det);
        }
        Log("##GMLOG: [BTPageServerSelection] IsGM - " $ string(IsGM));
        switch(IsGM)
        {
            // End:0x6A5
            case 1:
                CMDHK(5);
                // End:0x6B8
                break;
            // End:0x6B5
            case 2:
                CMDHK(55);
                // End:0x6B8
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        Controller.PopPage();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    return true;
    //return;    
}

function bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    Log(((("[BTPageServerSelection::rfAckItemListStart] Count=" $ string(Count)) $ ", ") $ "Result=") $ string(Result));
    // End:0xA9
    if(Result != 0)
    {
        Log("[BTPageServerSelection.rfAckItemListStart] Error ErrMsg=" $ ErrMsg);
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemListStart(Count);
    return true;
    //return;    
}

function bool rfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<int> PaintingItemID;

    Log("[BTPageServerSelection::rfAckItemList]");
    i = 0;
    J0x31:

    // End:0x71 [Loop If]
    if(i < PaintID.Length)
    {
        PaintingItemID[i] = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[i]);
        ++i;
        // [Loop Continue]
        goto J0x31;
    }
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemList(UniqueID, ItemID, ItemType, Durability, UntilTime, SlotPosition, AddPartsID, DamageDegree, ItemState, StackCount, PaintingItemID);
    PlayerOwner().dblog("=========================================");
    PlayerOwner().dblog("Receive ItemList From ChannelServer");
    PlayerOwner().dblog("=========================================");
    i = 0;
    J0x18D:

    // End:0x2E4 [Loop If]
    if(i < UniqueID.Length)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID[i]);
        instanceInfo = GameMgr.AddInstanceItemByParameter(ItemID[i], UniqueID[i], 0, SlotPosition[i], int(ItemState[i]), Durability[i], AddPartsID[i], PaintingItemID[i], StackCount[i], DamageDegree[i], UntilTime[i], false, TradeCount[i]);
        PlayerOwner().dblog((((((("SlotPos = " $ string(instanceInfo.SlotPosition)) @ ", ItemID = ") $ string(ItemInfo.ItemID)) @ ", Dur = ") $ string(instanceInfo.Durability)) @ ", ItemName = ") $ ItemInfo.ItemName);
        i++;
        // [Loop Continue]
        goto J0x18D;
    }
    PlayerOwner().dblog("=========================================");
    return true;
    //return;    
}

function bool rfAckItemListEnd()
{
    local array<int> Pool;
    local int i;

    Log("[BTPageServerSelection::rfAckItemListEnd]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemListEnd();
    MM.kPrimaryID = GameMgr.FindInstanceItemIDBySlotPos(0);
    MM.kSecondaryID = GameMgr.FindInstanceItemIDBySlotPos(1);
    MM.kThrow1ID = GameMgr.FindInstanceItemIDBySlotPos(2);
    MM.kThrow2ID = GameMgr.FindInstanceItemIDBySlotPos(3);
    MM.kSkill1ID = GameMgr.FindInstanceItemIDBySlotPos(14);
    MM.kSkill2ID = GameMgr.FindInstanceItemIDBySlotPos(15);
    MM.kSkill3ID = GameMgr.FindInstanceItemIDBySlotPos(16);
    MM.kSkill4ID = GameMgr.FindInstanceItemIDBySlotPos(17);
    MM.kFaceID = GameMgr.FindInstanceItemIDBySlotPos(19);
    MM.kHelmetID = GameMgr.FindInstanceItemIDBySlotPos(18);
    MM.kFaceAccessoryID = GameMgr.FindInstanceItemIDBySlotPos(20);
    MM.kAFSpecialID = GameMgr.FindInstanceItemIDBySlotPos(21);
    MM.kRSASpecialID = GameMgr.FindInstanceItemIDBySlotPos(22);
    MM.UpdateEquipItemInfo(MM);
    GameMgr.UpdateItemList(GameMgr);
    // End:0x353
    if(GameMgr.CandidateLists.Length == 0)
    {
        Pool.Length = 11;
        Pool[0] = 17096;
        Pool[1] = 17095;
        Pool[2] = 17094;
        Pool[3] = 17093;
        Pool[4] = 17092;
        Pool[5] = 17090;
        Pool[6] = 16013;
        Pool[7] = 16014;
        Pool[8] = 16015;
        Pool[9] = 208026;
        Pool[10] = 305026;
        GameMgr.CandidateLists.Length = Pool.Length;
        i = 0;
        J0x30A:

        // End:0x353 [Loop If]
        if(i < Pool.Length)
        {
            GameMgr.CandidateLists[i] = GameMgr.FindUIItem(Pool[i]);
            i++;
            // [Loop Continue]
            goto J0x30A;
        }
    }
    CTRP.bItemListEnd = true;
    CheckToSetPageLobby();
    Log("[BTPageServerSelection::rfAckItemListEnd] Success Update UIItem");
    return true;
    //return;    
}

function bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckUserSkillListStart] Result=" $ string(Result));
    // End:0xA3
    if(Result == 0)
    {
        GameMgr.ClearSkillBoxList();
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillListStart(Count);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    local int i;
    local wItemBoxHK ItemInfo;

    Log("[BTPageServerSelection::rfAckUserSkillList]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillList(UniqueSkillID, SkillID, UntilTime, SlotPosition);
    PlayerOwner().dblog("=========================================");
    PlayerOwner().dblog("Receive SkillList From ChannelServer");
    PlayerOwner().dblog("=========================================");
    i = 0;
    J0x129:

    // End:0x205 [Loop If]
    if(i < UniqueSkillID.Length)
    {
        ItemInfo = GameMgr.FindUIItem(SkillID[i]);
        PlayerOwner().dblog((((("SkillName = " $ ItemInfo.ItemName) @ "SlotPos = ") $ string(SlotPosition[i])) @ "ItemID = ") $ string(ItemInfo.ItemID));
        GameMgr.AddUISkillBox(SlotPosition[i], SkillID[i], UniqueSkillID[i], UntilTime[i]);
        i++;
        // [Loop Continue]
        goto J0x129;
    }
    PlayerOwner().dblog("=========================================");
    return true;
    //return;    
}

function bool rfAckUserSkillListEnd()
{
    Log("[BTPageServerSelection::rfAckUserSkillListEnd]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillListEnd();
    GameMgr.AddInstanceSkillItemFromSkillBoxList();
    CTRP.bSkillListEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    local int i, DispOrder;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckQSlotList] Result=" $ string(Result));
    // End:0x7CB
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetQSlotList(QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
        // End:0xF8
        if(QSlotID.Length != GameMgr.QuickSlotBoxList.Length)
        {
            GameMgr.ClearQuickSlotBoxList();
            GameMgr.AllocateQuickSlotBoxList(QSlotID.Length);
        }
        PlayerOwner().dblog("=========================================");
        PlayerOwner().dblog("QuickSlot ItemList From ChannelServer");
        PlayerOwner().dblog("=========================================");
        i = 0;
        J0x1A3:

        // End:0x77D [Loop If]
        if(i < QSlotID.Length)
        {
            DispOrder = int(QSlotDispOrder[i]) - 1;
            GameMgr.SetQuickSlotBox_Name(DispOrder, QSlotName[i]);
            GameMgr.SetQuickSlotBox_ID(DispOrder, QSlotID[i]);
            PlayerOwner().dblog("====");
            PlayerOwner().dblog("QSlotDispOrder = " $ string(QSlotDispOrder[i]));
            PlayerOwner().dblog((("QSlotName = " $ QSlotName[i]) $ " QSlotID = ") $ string(QSlotID[i]));
            instanceInfo = GameMgr.FindInstanceItem(MWItemID[i]);
            // End:0x33B
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 0, instanceInfo.ItemID, MWItemID[i]);
                PlayerOwner().dblog(((("0 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(PistolItemID[i]);
            // End:0x3E7
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 1, instanceInfo.ItemID, PistolItemID[i]);
                PlayerOwner().dblog(((("1 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(TWItemID1[i]);
            // End:0x494
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 2, instanceInfo.ItemID, TWItemID1[i]);
                PlayerOwner().dblog(((("2 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(TWItemID2[i]);
            // End:0x541
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 3, instanceInfo.ItemID, TWItemID2[i]);
                PlayerOwner().dblog(((("3 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill1[i]);
            // End:0x5CD
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 0, instanceInfo.ItemID, Skill1[i]);
                PlayerOwner().dblog(("0 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill2[i]);
            // End:0x659
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 1, instanceInfo.ItemID, Skill2[i]);
                PlayerOwner().dblog(("1 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill3[i]);
            // End:0x6E6
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 2, instanceInfo.ItemID, Skill3[i]);
                PlayerOwner().dblog(("2 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill4[i]);
            // End:0x773
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 3, instanceInfo.ItemID, Skill4[i]);
                PlayerOwner().dblog(("3 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            i++;
            // [Loop Continue]
            goto J0x1A3;
        }
        PlayerOwner().dblog("=========================================");
        CTRP.bQSListEnd = true;
        CheckToSetPageLobby();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckServerTime(int Time)
{
    Log("[BTPageServerSelection::rfAckServerTime] Time" $ string(Time));
    Controller.SetTime(Time);
    CTRP.bServerTimeEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function CheckToSetPageLobby()
{
    Log("[BTPageServerSelection::CheckToSetPageLobby]");
    // End:0x159
    if((((((CTRP.bItemListEnd && CTRP.bSkillListEnd) && CTRP.bQSListEnd) && CTRP.bServerTimeEnd) && CTRP.bHashEnd) && CTRP.bGetServerTimeEnd) && CTRP.bGetMyMailBoxState)
    {
        Log(("page_Main.TcpChannel.sfReqEnterChannel(" $ string(ConnectingChannel.ChannelID)) $ ")");
        page_Main.TcpChannel.sfReqEnterChannel(ConnectingChannel.ChannelID);
        CTRP.bItemListEnd = false;
        CTRP.bSkillListEnd = false;
        CTRP.bQSListEnd = false;
        CTRP.bServerTimeEnd = false;
        CTRP.bHashEnd = false;
        CTRP.bGetServerTimeEnd = false;
        CTRP.bGetMyMailBoxState = false;
    }
    //return;    
}

function bool rfAckHash(int Result, string Error)
{
    Log("[BTPageServerSelection::rfAckHash] Error=" $ string(Result));
    // End:0x57
    if(Result == 0)
    {
        CTRP.bHashEnd = true;
        CheckToSetPageLobby();        
    }
    else
    {
        Log("[BTPageServerSelection::rfAckHash] Success, SetPage(EPage_Lobby2)");
        // End:0x10A
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
        {
            page_Main.HaltNetwork();
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = rfAckHash_BTWindowErrorDefineHK_OnOK;
    }
    return true;
    //return;    
}

function bool rfAckHash_BTWindowErrorDefineHK_OnOK(GUIComponent Sender)
{
    // End:0x8E
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
    {
        Console(Controller.Master.Console).ConsoleCommand("exit");        
    }
    else
    {
        CTRP.bHashEnd = true;
        CheckToSetPageLobby();
    }
    CTRP.bHashEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    Log((("Received representive relay server addr: " $ RelayIP) $ " ") $ string(RelayPort));
    page_Main.rMM.szRelayIP = RelayIP;
    page_Main.rMM.nRelayPort = RelayPort;
    return true;
    //return;    
}

function bool rfAckNotifyExpiredItemIDs(int UserID, array<BtrDouble> ExpiredItemUniqueIDs, array<int> ExpiredItemIDs, array<int> ExpiredItemPartIDs, array<byte> ExpiredItemSlotPos, int Result, string ErrMsg)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    Log((((("[BTPageServerSelection::rfAckNotifyExpiredItemIDs] Result=" $ string(Result)) $ ", UserID=") $ string(UserID)) $ ", ExpiredItemIDs.Length=") $ string(ExpiredItemIDs.Length));
    iProcessExpiredStep = 0;
    // End:0xB1
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    iProcessExpiredStep = 1;
    page_Main.CompleteExpiredItem();
    // End:0x1AA
    if(ExpiredItemUniqueIDs.Length > 0)
    {
        i = 0;
        J0xDB:

        // End:0x1AA [Loop If]
        if(i < ExpiredItemUniqueIDs.Length)
        {
            instanceInfo = GameMgr.FindInstanceItem(ExpiredItemUniqueIDs[i]);
            // End:0x149
            if((instanceInfo.SlotPosition == 0) || instanceInfo.SlotPosition == 1)
            {
                SetDefaultWeapon(instanceInfo.SlotPosition);
            }
            GameMgr.RemoveInstanceItem(ExpiredItemUniqueIDs[i]);
            page_Main.AddExpiredItem(ExpiredItemIDs[i], ExpiredItemUniqueIDs[i], int(ExpiredItemSlotPos[i]), ExpiredItemPartIDs[i]);
            i++;
            // [Loop Continue]
            goto J0xDB;
        }
    }
    return true;
    //return;    
}

function bool rfAckNotifyExpiredSkillIDs(int UserID, array<BtrDouble> ExpiredSkillUniqueIDs, array<int> ExpiredSkillIDs, int Result, string ErrMsg, array<byte> ExpiredSkillSlotPositions)
{
    local int i;

    Log("[BTPageServerSelection::rfAckNotifyExpiredSkillIDs]");
    // End:0x5D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x79
    if(int(iProcessExpiredStep) != 1)
    {
        page_Main.CompleteExpiredItem();
    }
    iProcessExpiredStep = 2;
    i = 0;
    J0x88:

    // End:0xF4 [Loop If]
    if(i < ExpiredSkillIDs.Length)
    {
        GameMgr.RemoveInstanceItemByUniqueSkillID(__NFUN_923__(ExpiredSkillUniqueIDs[i]));
        page_Main.AddExpiredSkillItem(ExpiredSkillIDs[i], __NFUN_923__(ExpiredSkillUniqueIDs[i]), int(ExpiredSkillSlotPositions[i]));
        i++;
        // [Loop Continue]
        goto J0x88;
    }
    iProcessExpiredStep = 0;
    return true;
    //return;    
}

function bool BTWindowItemExpiredHK_OnOK_CheckDurX(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    page_Main.CheckDestroyedDurabilityXItemList();
    return true;
    //return;    
}

function bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    local int ReservedItemID, PrevSlotPos;
    local BtrDouble ReservedUniqueID;
    local wItemBoxHK ItemInfo;
    local export editinline BTWindowItemExpiredHK BTWindow;
    local int ReservedCategoryID, ReservedPackageID, ReservedPriceID;
    local array<int> temp;
    local int lp1, iResult;
    local bool bAddItem;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    iResult = 0;
    bAddItem = false;
    Log("[BTPageServerSelection::rfAckBuyShopItem] ItemCount=" $ string(ItemCount));
    lp1 = 0;
    J0x86:

    // End:0x1B9 [Loop If]
    if(lp1 < ItemCount)
    {
        // End:0xBA
        if(Result[lp1] != 0)
        {
            iResult = Result[lp1];
            // [Explicit Continue]
            goto J0x1AF;
        }
        ItemInfo = GameMgr.FindUIItem(BoughtItemTypeID[lp1]);
        bAddItem = true;
        // End:0x15E
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            GameMgr.AddInstanceItemByParameter(BoughtItemTypeID[lp1], EmptyBtrDouble(), __NFUN_923__(BoughtItemUniqueID[lp1]), 13, 1, 100000, BoughtPartID[lp1], 0, BoughtStackCnt[lp1], 0, BoughtUntilTIme[lp1]);
            // [Explicit Continue]
            goto J0x1AF;
        }
        GameMgr.AddInstanceItemByParameter(BoughtItemTypeID[lp1], BoughtItemUniqueID[lp1], 0, 13, 1, 100000, BoughtPartID[lp1], 0, BoughtStackCnt[lp1], 0, BoughtUntilTIme[lp1]);
        J0x1AF:

        ++lp1;
        // [Loop Continue]
        goto J0x86;
    }
    // End:0x209
    if(bAddItem == true)
    {
        GameMgr.UpdateItemList(GameMgr);
        MM.kPoint = PointRemain;
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x32D
    if(iResult != 0)
    {
        BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
        // End:0x2E8
        if(BTWindow != none)
        {
            // End:0x2A0
            if(page_Main.iSendUpdateQuickSlotList.Length > 0)
            {
                page_Main.RequestUpdateQuickSlot(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]);
                page_Main.iSendUpdateQuickSlotList.Length = page_Main.iSendUpdateQuickSlotList.Length - 1;
            }
            BTWindow.RemoveAllExpiredItem();
            page_Main.TcpChannel.sfReqItemList(MM.kUID);
            Controller.CloseMenu(false);            
        }
        else
        {
            // End:0x312
            if(BTWindowHK(Controller.TopPage()) != none)
            {
                Controller.CloseMenu(false);
            }
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, iResult);
        return true;
    }
    BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
    // End:0x5E8
    if(BTWindow != none)
    {
        ReservedItemID = BTWindow.PopExpiredItemID();
        PrevSlotPos = BTWindow.PopExpiredSlotPos();
        ReservedUniqueID = BTWindow.PopExpiredUniqueID();
        Log("[BTPageServerSelection::rfAckBuyShopItem] SlotPos=" $ string(PrevSlotPos));
        // End:0x44F
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            // End:0x42C
            if(PrevSlotPos != 13)
            {
                page_Main.TcpChannel.sfReqEquipSkill(BoughtItemTypeID[0], __NFUN_923__(BoughtItemUniqueID[0]), byte(PrevSlotPos));
            }
            GameMgr.ReplaceQuickSkillSlotItem(BoughtItemTypeID[0], __NFUN_923__(BoughtItemUniqueID[0]));            
        }
        else
        {
            // End:0x486
            if(PrevSlotPos != 13)
            {
                page_Main.TcpChannel.sfReqEquipItem(BoughtItemTypeID[0], BoughtItemUniqueID[0], PrevSlotPos);
            }
            GameMgr.ReplaceQuickSlotBoxItem(ReservedUniqueID, BoughtItemTypeID[0], BoughtItemUniqueID[0]);
        }
        // End:0x5D1
        if(ReservedItemID == -1)
        {
            PlayerOwner().PlaySound(Controller.ItemBuySound, 6, 1.0000000);
            Controller.CloseMenu(false);
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 127);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemExpiredHK_OnOK_CheckDurX;
            page_Main.TcpChannel.sfReqWebzenCash();
            // End:0x59E
            if(page_Main.iSendUpdateQuickSlotList.Length > 0)
            {
                page_Main.RequestUpdateQuickSlot(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]);
                page_Main.iSendUpdateQuickSlotList.Length = page_Main.iSendUpdateQuickSlotList.Length - 1;
            }
            GameMgr.UpdateItemList(GameMgr);
            page_Main.UpdateExpiredItemList(page_Main);            
        }
        else
        {
            BTWindow.PopAndBuy(ReservedItemID);
        }        
    }
    else
    {
        // End:0x66A
        if(BTWindowHK(Controller.TopPage()) != none)
        {
            BTWindowHK(Controller.TopPage()).StopTimeOut();
            BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBuyShopItem_OnOK;
            BTWindowHK(Controller.TopPage()).ButtonOK.EnableMe();
        }
    }
    return true;
    //return;    
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckUpdateQSlot]");
    // End:0xF3
    if(page_Main.iSendUpdateQuickSlotList.Length > 0)
    {
        Log("[BTPageServerSelection::rfAckUpdateQSlot] QuickSlot : " $ string(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]));
        page_Main.RequestUpdateQuickSlot(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]);
        page_Main.iSendUpdateQuickSlotList.Length = page_Main.iSendUpdateQuickSlotList.Length - 1;
    }
    return true;
    //return;    
}

function bool BTWindowBuyShopItem_OnOK(GUIComponent Sender)
{
    PlayerOwner().PlaySound(Controller.ItemBuySound, 6, 1.0000000);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x97
    if(GameMgr.CheckSkillItem(MM.lastBuyItemType))
    {
        page_Main.TcpChannel.sfReqUserSkillList(MM.kUID);        
    }
    else
    {
        page_Main.TcpChannel.sfReqItemList(MM.kUID);
    }
    // End:0xEA
    if(MM.lastBuyItemGrade == 14)
    {
        page_Main.TcpChannel.sfReqWebzenCash();
    }
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfReqNotifyDurabilityZeroItem] Result=" $ string(Result));
    // End:0x71
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x255
    if(page_Main.DurWarningItems.items.Length == 0)
    {
        page_Main.CompleteDurabilityWarningItem();
        PlayerOwner().dblog("[ItemDurabilityWarn]");
        i = 0;
        J0xF3:

        // End:0x23A [Loop If]
        if(i < ItemUniqueIDs.Length)
        {
            PlayerOwner().dblog("ItemID = " $ string(ItemIDs[i]));
            instanceInfo = GameMgr.FindInstanceItem(ItemUniqueIDs[i]);
            // End:0x1DA
            if(instanceInfo != none)
            {
                // End:0x18C
                if(int(ItemSlotPos[i]) == 13)
                {
                    // End:0x18C
                    if(GameMgr.IsQuickSlotBoxItem(ItemUniqueIDs[i]) == false)
                    {
                        // [Explicit Continue]
                        goto J0x230;
                    }
                }
                page_Main.AddDurabilityWarningItem(ItemUniqueIDs[i], ItemIDs[i], int(ItemSlotPos[i]), ItemPartIDs[i], instanceInfo.Durability);
                // [Explicit Continue]
                goto J0x230;
            }
            Log("InstanceInfo != none");
            page_Main.AddDurabilityWarningItem(ItemUniqueIDs[i], ItemIDs[i], int(ItemSlotPos[i]), ItemPartIDs[i], 0);
            J0x230:

            i++;
            // [Loop Continue]
            goto J0xF3;
        }
        page_Main.UpdateDurabilityWarningItemList(page_Main);        
    }
    else
    {
        page_Main.CompleteDurabilityWarningItem();
    }
    return true;
    //return;    
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    local int i;
    local Object.EPage Dest;
    local export editinline BTWindowItemDurabilityWarningHK BTWindow;
    local int nRepairCost;

    Log((("[BTPageServerSelection::rfAckRepairCost] Result=" $ string(Result)) $ " UniqueItemID.Length=") $ string(UniqueItemID.Length));
    // End:0x86
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x303
    if(page_Main.DurWarningItems.bDurWarningItem && page_Main.DurWarningItems.bReqRepairCost)
    {
        page_Main.DurWarningItems.bReqRepairCost = false;
        BTWindow = BTWindowItemDurabilityWarningHK(Controller.TopPage());
        // End:0x1BF
        if(BTWindow == none)
        {
            // End:0x130
            if((int(page_Main.eCurrPage) == int(7)) || int(page_Main.eCurrPage) == int(5))
            {
                Dest = 7;                
            }
            else
            {
                Dest = 10;
            }
            page_Main.pwm.CreateAndPush(Dest, "GUIWarfare.BTWindowItemDurabilityWarningHK", true, 0);
            BTWindow = BTWindowItemDurabilityWarningHK(page_Main.pwm.Last(Dest));
            BTWindow.MainMenu = page_Main;
        }
        i = 0;
        J0x1C6:

        // End:0x21C [Loop If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1F3
            if(RepairCost.Length > 0)
            {
                nRepairCost = RepairCost[i];
            }
            page_Main.AddDurabilityWarningItemRepairCost(UniqueItemID[i], nRepairCost);
            i++;
            // [Loop Continue]
            goto J0x1C6;
        }
        i = 0;
        J0x223:

        // End:0x2F4 [Loop If]
        if(i < page_Main.DurWarningItems.items.Length)
        {
            // End:0x25E
            if(RepairCost.Length > 0)
            {
                nRepairCost = RepairCost[i];
            }
            BTWindow.AddItem(page_Main.DurWarningItems.items[i].UniqueID, page_Main.DurWarningItems.items[i].ItemID, page_Main.DurWarningItems.items[i].PartID, page_Main.DurWarningItems.items[i].Durability, nRepairCost);
            i++;
            // [Loop Continue]
            goto J0x223;
        }
        page_Main.CompleteDurabilityWarningItem();
    }
    return true;
    //return;    
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    local int i;

    Log((("[BTPageServerSelection::rfAckRepairItem] Result=" $ string(Result)) $ " UniqueItemID.Length=") $ string(UniqueItemID.Length));
    // End:0x86
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = RepairCost;
    MM.UpdateMoneyInfo(MM);
    i = 0;
    J0xB9:

    // End:0x117 [Loop If]
    if(i < UniqueItemID.Length)
    {
        GameMgr.ChangeInstance_ItemDurability(UniqueItemID[i], 100000);
        GameMgr.ChangeInstance_ItemDamageDegree(UniqueItemID[i], DamageDegree[i]);
        i++;
        // [Loop Continue]
        goto J0xB9;
    }
    GameMgr.UpdateItemList(GameMgr);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 20);
    return true;
    //return;    
}

function bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    local int i;
    local BTConsole BTConsole;

    Log("[BTPageServerSelection::rfReqRecvNotice_FromGM] Result=" $ string(Result));
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
    // End:0x8C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x93:

    // End:0xC7 [Loop If]
    if(i < NoticeMsg.Length)
    {
        page_Main.PushNoticeQueue(NoticeMsg[i]);
        i++;
        // [Loop Continue]
        goto J0x93;
    }
    return true;
    //return;    
}

function bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfReqRecvForceDisconnected_FromGM]");
    page_Main.HaltNetwork();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 93);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    return true;
    //return;    
}

function bool BackToServerSelection_OnClick(GUIComponent Sender)
{
    Log("[BTPageServerSelection::BackToServerSelection_OnClick]");
    Controller.PopPage();
    page_Main.TcpChannel.sfReqLogOut(3);
    return true;
    //return;    
}

function bool rfAckExceedMaxUser()
{
    Log("[BTPageServerSelection::rfAckExceedMaxUser]");
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
    return true;
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log((((((((((((((((((("[BTPageServerSelection::rfAckLoginInHouseTest] " $ string(Sucess)) $ " ") $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg);
    // End:0x275
    if(int(Sucess) == 0)
    {
        page_Main.BirthDay = BDay;
        page_Main.Sex = Sex;
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        // End:0x1C6
        if(int(NeedChar) == 0)
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name : NULL");
            Controller.PopPage();
            page_Main.SetPage(4, true);            
        }
        else
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
            MM.kUserName = CharName;
            Controller.PopPage();
            RefreshPage();
        }
        return true;        
    }
    else
    {
        // End:0x3FD
        if(int(Sucess) == 50)
        {
            MM.kUserName = CharName;
            page_Main.rMM.My_szName = CharName;
            Log("Retry Login!!");
            // End:0x374
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                Log(("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.AuthLogin_AccountID) $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);                
            }
            else
            {
                Log(("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.szAccountName) $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
            }
            return true;            
        }
        else
        {
            // End:0x446
            if(int(Sucess) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                
            }
            else
            {
                // End:0x490
                if(int(Sucess) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                    
                }
                else
                {
                    // End:0x4DA
                    if(int(Sucess) == 3)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                        
                    }
                    else
                    {
                        // End:0x524
                        if(int(Sucess) == 15)
                        {
                            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                            
                        }
                        else
                        {
                            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, int(Sucess));
                            BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    local BtrTime t;
    local int Day;

    Day = __NFUN_923__(ServerTime);
    Log("[BTPageServerSelection::rfAckGetServerTime] Day=" $ string(Day));
    BtrDoubleToBtrTime(ServerTime, t);
    PlayerOwner().dblog("t(double) = " $ __NFUN_918__(ServerTime));
    PlayerOwner().dblog((((((((((string(t.Year) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
    // End:0x1EA
    if(page_Main.AuthLogin_ClientIP == "")
    {
        page_Main.AuthLogin_ClientIP = ClientIP;
        // End:0x18D
        if(page_Main.Is18YearsOld(ServerTime, page_Main.BirthDay))
        {
            __NFUN_270__("# 18 Years Old Version");
            PlayerOwner().Level.bTeenVersion = false;
            Class'Engine.LevelInfo'.default.bTeenVersion = false;            
        }
        else
        {
            __NFUN_270__("# 15 Years Old Version");
            PlayerOwner().Level.bTeenVersion = true;
            Class'Engine.LevelInfo'.default.bTeenVersion = true;
        }
        __NFUN_270__("# ClientIP = " $ ClientIP);
    }
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.CurrentTime = ServerTime;
    GameMgr.SetServerTime(ServerTime);
    PlayerOwner().dblog("gameMgr.kDiffTime = " $ __NFUN_918__(GameMgr.kDiffTime));
    GameMgr.ChangeInstance_ItemLeftTime(GameMgr.kClientTime);
    GameMgr.UpdateServerTime(GameMgr);
    CTRP.bGetServerTimeEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    SaveCanvas = C;
    super.Internal_OnPreDraw(C);
    // End:0xBF
    if((page_Main.page_curr == page_Main.page_ServerSelection) && page_Main.bConnectedLoginServer)
    {
        CurrentTime = PlayerOwner().Level.TimeSeconds;
        // End:0xBF
        if((CurrentTime - LastRefreshTime) > RefreshCycleTime)
        {
            Log("[BTPageServerSelection::Internal_OnPreDraw] RefreshPage()");
            RefreshPage();
        }
    }
    return false;
    //return;    
}

function bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID)
{
    local int i;
    local export editinline BTWindowItemBoxHK BTWindow;

    Log((((((("[BTPageServerSelection::rfAckItemListInItemBox] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " ItemID.Length=") $ string(ItemID.Length)) $ " PartID.Length=") $ string(PartID.Length));
    // End:0xB7
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemBoxHK");
    BTWindow = BTWindowItemBoxHK(Controller.TopPage());
    BTWindow.BoxItemID = BoxItemID;
    BTWindow.BoxUniqueID = ItemUniqueID;
    i = 0;
    J0x135:

    // End:0x174 [Loop If]
    if(i < ItemID.Length)
    {
        BTWindow.AddItem(ItemID[i], PartID[i]);
        i++;
        // [Loop Continue]
        goto J0x135;
    }
    BTWindow.__OnOK__Delegate = BTWindowItemBoxHK_OnOK;
    return true;
    //return;    
}

function bool BTWindowItemBoxHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBoxHK BTWindow;

    Log("[BTPageServerSelection::BTWindowItemBoxHK_OnOK]");
    BTWindow = BTWindowItemBoxHK(Controller.TopPage());
    page_Main.TcpChannel.sfReqGetItemFromItemBox(BTWindow.BoxUniqueID, BTWindow.BoxItemID, BTWindow.GetLastSelectItemID(), BTWindow.GetLastSelectPartID());
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckCharInfoFromLoginServer(int Result, string CharName, int Level, int Exp, string ClanName)
{
    local wMyPlayerStatus MyStatus;

    Log((("[BTPageServerSelection::rfAckCharInfoFromLoginServer] Result=" $ string(Result)) $ " CharName=") $ CharName);
    // End:0x85
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xA8
    if(page_Main.rMM.kUserName != CharName)
    {
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    page_Main.rMM.My_szName = CharName;
    MyStatus.NickName = CharName;
    MyStatus.Level = Level;
    MyStatus.nExp = Exp;
    MyStatus.ClanName = ClanName;
    page_Main.MyCharInfo.Level = Level;
    page_Main.MyCharInfo.Exp = Exp;
    page_Main.MyClanName = ClanName;
    page_Main.rMM.kLevel = Level;
    page_Main.rMM.kExp = Exp;
    page_Main.rMM.kStartExp = GameMgr.GetStartExp(Level);
    page_Main.rMM.kEndExp = GameMgr.GetEndExp(Level);
    page_Main.rMM.UpdateCharInfo(page_Main.rMM);
    return true;
    //return;    
}

function bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    Log("[BTPageServerSelection::rfAckInviteGameRoom]");
    // End:0x57
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);        
    }
    else
    {
        switch(Answer)
        {
            // End:0x8E
            case 0:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(129, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xBE
            case 1:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(130, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xEE
            case 2:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(131, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0x11E
            case 3:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(132, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    return true;
    //return;    
}

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    local int sciindex;
    local GameModeInfo gmi;
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserServerName=" $ InviteUserServerName);
    // End:0xFC
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        PlayerOwner().dblog((("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserChannelNumber=" $ string(InviteUserChannelNumber)) $ ", RoomNumber=") $ string(RoomNumber));
    }
    // End:0x340
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        sciindex = page_Main.FindServerConnectionInfoIndex(InviteUserServerID, InviteUserChannelNumber);
        // End:0x15B
        if(sciindex == -1)
        {
            Log("Failed! sciindex == -1");
            return true;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteGameHK");
        BTWindow = BTWindowInviteGameHK(Controller.TopPage());
        BTWindow.SetData((InviteUserServerName $ "/") $ page_Main.SCIList[sciindex].ChannelName, InviteCharName);
        BTWindow.RoomInfo.SetMapName(MapName);
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(GameMode));
        BTWindow.RoomInfo.SetRoomInfo((("[" $ string(RoomNumber)) $ "] ") $ RoomName, int(RoomState), OwnerName, gmi.UserFriendlyName, "", "", "");
        BTWindow.ServerID = InviteUserServerID;
        BTWindow.ChannelID = InviteUserChannelNumber;
        BTWindow.RoomUniqueID = RoomUniqueID;
        BTWindow.RoomNumber = RoomNumber;
        BTWindow.InviterName = InviteCharName;
        BTWindow.Password = Password;
        BTWindow.TcpChannel = page_Main.TcpChannel;
        BTWindow.ElipsedTime = 0.0000000;
        BTWindow.__OnOK__Delegate = BTWindowInviteGameHK_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowInviteGameHK_OnCancel;        
    }
    else
    {
        page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 3, BTWindow.InviterName);
    }
    return true;
    //return;    
}

function bool BTWindowInviteGameHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteGameHK_OnOK]");
    BTWindow = BTWindowInviteGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 0, BTWindow.InviterName);
    Controller.CloseMenu(false);
    page_Main.StartAutoMove(BTWindow.ServerID, BTWindow.ChannelID, BTWindow.RoomNumber, BTWindow.Password);
    return true;
    //return;    
}

function bool BTWindowInviteGameHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteGameHK_OnCancel]");
    BTWindow = BTWindowInviteGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 1, BTWindow.InviterName);
    BTWindow.FadeOut(false, true);
    return true;
    //return;    
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    return true;
    //return;    
}

function bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckClanMatch_InviteCrew] Result=" $ string(Result));
    // End:0x6D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    local export editinline BTWindowInviteClanWarGameHK BTWindow;
    local int SCIndex;

    Log("[BTPageServerSelection::rfReqClanMatch_RecvInviteCrew] Inviter=" $ Inviter);
    // End:0x249
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        SCIndex = page_Main.FindServerChannelInfoIndexByServerIP(ServerIP, Port, InviteUserChannelNum);
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanWarGameHK");
        BTWindow = BTWindowInviteClanWarGameHK(Controller.TopPage());
        BTWindow.SetData(page_Main.SCIList[SCIndex].ServerName, Inviter);
        BTWindow.RoomInfo.SetMapName(string(MapNum));
        BTWindow.RoomInfo.SetRoomInfo((("[" $ string(WaittingID)) $ "] ") $ RoomName, 0, LeaderName, strCW_GameMode, "", "", "");
        BTWindow.ServerID = page_Main.SCIList[SCIndex].ServerID;
        BTWindow.ChannelID = InviteUserChannelNum;
        BTWindow.RoomUniqueID = "";
        BTWindow.RoomNumber = WaittingID;
        BTWindow.InviterName = Inviter;
        BTWindow.Password = "";
        BTWindow.TcpChannel = page_Main.TcpChannel;
        BTWindow.ElipsedTime = 0.0000000;
        BTWindow.__OnOK__Delegate = BTWindowInviteClanWarGameHK_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowInviteClanWarGameHK_OnCancel;
    }
    return true;
    //return;    
}

function bool BTWindowInviteClanWarGameHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowInviteClanWarGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteClanWarGameHK_OnOK]");
    BTWindow = BTWindowInviteClanWarGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckClanMatch_RecvInviteCrew(0, BTWindow.InviterName);
    Controller.CloseMenu(false);
    page_Main.StartAutoMove(BTWindow.ServerID, BTWindow.ChannelID, BTWindow.RoomNumber, BTWindow.Password);
    return true;
    //return;    
}

function bool BTWindowInviteClanWarGameHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowInviteClanWarGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteClanWarGameHK_OnCancel]");
    BTWindow = BTWindowInviteClanWarGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckClanMatch_RecvInviteCrew(1, BTWindow.InviterName);
    BTWindow.FadeOut(false, true);
    return true;
    //return;    
}

function bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    Log((("[BTPageLobby::rfReqClanMatch_InviteCrewResult] Invitee=" $ Invitee) $ " Result=") $ string(Result));
    return true;
    //return;    
}

function bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    local int i;

    Log("[BTPageServerSelection::rfAckLimitedListInChannel]");
    // End:0x5C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.ChannelRestrictionMaps.Length = LimitedMapID.Length;
    i = 0;
    J0xA9:

    // End:0xE3 [Loop If]
    if(i < LimitedMapID.Length)
    {
        MM.ChannelRestrictionMaps[i] = LimitedMapID[i];
        i++;
        // [Loop Continue]
        goto J0xA9;
    }
    MM.ChannelRestrictionModes.Length = LimitedModeID.Length;
    i = 0;
    J0x100:

    // End:0x13A [Loop If]
    if(i < LimitedModeID.Length)
    {
        MM.ChannelRestrictionModes[i] = LimitedModeID[i];
        i++;
        // [Loop Continue]
        goto J0x100;
    }
    return true;
    //return;    
}

function bool rfAckQuestListStart(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckQuestListStart]");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.bNewDailyQuestAvailable = false;
    MM.QuestList.Length = 0;
    MM.bSortQuestList = false;
    return true;
    //return;    
}

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest)
{
    local int i;

    Log("[BTPageServerSelection::rfAckQuestList] QuestID.Length=" $ string(QuestID.Length));
    i = 0;
    J0x4C:

    // End:0xEC [Loop If]
    if(i < QuestID.Length)
    {
        MM.QuestList.Length = MM.QuestList.Length + 1;
        MM.QuestList[MM.QuestList.Length - 1].QuestID = QuestID[i];
        MM.QuestList[MM.QuestList.Length - 1].CurrentProgress = CountPrograss[i];
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    return true;
    //return;    
}

function bool rfAckQuestListEnd()
{
    Log("[BTPageServerSelection::rfAckQuestListEnd]");
    MM.GenerateMissionList(Controller.ViewportOwner.Actor.Level.GameMgr);
    MM.UpdateQuestList(MM);
    AutoMoveAtFirstLogin();
    return true;
    //return;    
}

function bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckQuestUpdate]");
    page_Main.rMM.bRecvProtocolUpdateQuest = true;
    // End:0xB3
    if(Result != 0)
    {
        // End:0x7E
        if(Result == 513)
        {
            page_Main.rMM.bNoUpdateQuestInfo = true;            
        }
        else
        {
            page_Main.rMM.bNoUpdateQuestInfo = false;
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
        return true;
    }
    Log("[BTPageServerSelection::rfAckQuestUpdate] page_Main.TcpChannel.sfReqQuestList()");
    page_Main.rMM.bNoUpdateQuestInfo = false;
    page_Main.TcpChannel.sfReqQuestList();
    return true;
    //return;    
}

function bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    local int i, RewardPoint, RewardItemID;
    local wQuestParam q;

    Log((((("[BTPageServerSelection::rfReqQuestNewAvailable] AchivedQuestID.Length=" $ string(AchivedQuestID.Length)) $ " NewQuestID=") $ string(NewQuestID.Length)) $ ", ExpiredQuest.Length=") $ string(ExpiredQuest.Length));
    PlayerOwner().dblog((((("[BTPageServerSelection::rfReqQuestNewAvailable] AchivedQuestID.Length=" $ string(AchivedQuestID.Length)) $ " NewQuestID=") $ string(NewQuestID.Length)) $ ", ExpiredQuest.Length=") $ string(ExpiredQuest.Length));
    PlayerOwner().dblog("== AchivedQuestList ======");
    MM.CompletedQuestList.Length = AchivedQuestID.Length;
    i = 0;
    J0x175:

    // End:0x1F9 [Loop If]
    if(i < AchivedQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(AchivedQuestID[i]);
        PlayerOwner().dblog(string(AchivedQuestID[i]) @ q.QuestMissionDesc);
        MM.CompletedQuestList[i] = AchivedQuestID[i];
        i++;
        // [Loop Continue]
        goto J0x175;
    }
    PlayerOwner().dblog("== NewQuestID ============");
    MM.NewQuestList.Length = NewQuestID.Length;
    i = 0;
    J0x23F:

    // End:0x2C3 [Loop If]
    if(i < NewQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(NewQuestID[i]);
        PlayerOwner().dblog(string(NewQuestID[i]) @ q.QuestMissionDesc);
        MM.NewQuestList[i] = NewQuestID[i];
        i++;
        // [Loop Continue]
        goto J0x23F;
    }
    PlayerOwner().dblog("== ExpiredQuestID ========");
    i = 0;
    J0x2F3:

    // End:0x357 [Loop If]
    if(i < ExpiredQuest.Length)
    {
        q = GameMgr.GetQuestInfo(ExpiredQuest[i]);
        PlayerOwner().dblog(string(ExpiredQuest[i]) @ q.QuestMissionDesc);
        i++;
        // [Loop Continue]
        goto J0x2F3;
    }
    PlayerOwner().dblog("==========================");
    // End:0x3C0
    if((MM.CompletedQuestList.Length > 0) || MM.NewQuestList.Length > 0)
    {
        page_Main.bNewAvailableQuest = true;        
    }
    else
    {
        page_Main.bNewAvailableQuest = false;
    }
    i = 0;
    J0x3D8:

    // End:0x455 [Loop If]
    if(i < AchivedQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(AchivedQuestID[i]);
        RewardPoint += q.RewardPoint;
        RewardItemID += q.RewardItemID[0];
        RewardItemID += q.RewardItemID[1];
        i++;
        // [Loop Continue]
        goto J0x3D8;
    }
    // End:0x48D
    if(RewardPoint > 0)
    {
        MM.kPoint += RewardPoint;
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x4BA
    if(RewardItemID > 0)
    {
        MM.kNeedUpdateItemList = true;
        MM.kNeedUpdateSkillList = true;
    }
    MM.RemoveQuestArray(AchivedQuestID);
    MM.RemoveQuestArray(ExpiredQuest);
    MM.AddQuestArray(NewQuestID);
    return true;
    //return;    
}

function bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    local int i;
    local wQuestParam q;

    Log((("[BTPageServerSelection::rfReqDailyQuestNewAvailable] ExpiredQuestID.Length=" $ string(ExpiredQuestID.Length)) $ " NewQuestID.Length=") $ string(NewQuestID.Length));
    PlayerOwner().dblog((("[BTPageServerSelection::rfReqDailyQuestNewAvailable] ExpiredQuestID.Length=" $ string(ExpiredQuestID.Length)) $ " NewQuestID.Length=") $ string(NewQuestID.Length));
    MM.bNewDailyQuestAvailable = true;
    PlayerOwner().dblog("== NewQuestID ============");
    i = 0;
    J0x140:

    // End:0x1A4 [Loop If]
    if(i < NewQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(NewQuestID[i]);
        PlayerOwner().dblog(string(NewQuestID[i]) @ q.QuestMissionDesc);
        i++;
        // [Loop Continue]
        goto J0x140;
    }
    PlayerOwner().dblog("== ExpiredQuestID ========");
    i = 0;
    J0x1D4:

    // End:0x238 [Loop If]
    if(i < ExpiredQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(ExpiredQuestID[i]);
        PlayerOwner().dblog(string(ExpiredQuestID[i]) @ q.QuestMissionDesc);
        i++;
        // [Loop Continue]
        goto J0x1D4;
    }
    PlayerOwner().dblog("==========================");
    // End:0x276
    if(page_Main.IsGameReadyOrPlaying())
    {        
    }
    else
    {
        MM.RemoveQuestArray(ExpiredQuestID);
        MM.AddQuestArray(NewQuestID);
    }
    return true;
    //return;    
}

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    Log("[BTPageServerSelection::rfAckWebzenCash]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kCash = Class'Engine.BTCustomDrawHK'.static.__NFUN_923__(PCoinCash);
    MM.kCCoinCash = Class'Engine.BTCustomDrawHK'.static.__NFUN_923__(CCoinCash);
    Log((("[BTPageServerSelection::rfAckWebzenCash] Cash=" $ string(MM.kCash)) $ " CCoinCash=") $ string(MM.kCCoinCash));
    MM.UpdateMoneyInfo(MM);
    return true;
    //return;    
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckBuyItemByWebzenCash]");
    // End:0x6B
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    Log("[BTPageServerSelection::rfAckMyMoney]");
    // End:0x4F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = Point;
    MM.UpdateMoneyInfo(MM);
    return true;
    //return;    
}

function bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log((((("[BTPageServerSelection::rfAckWebzenShopScriptVersion] Year=" $ string(Year)) $ ", YearID=") $ string(YearId)) $ ", SalesZoneCode=") $ string(SalesZoneCode));
    page_Main.UpdateWebzenShopItemList(Year, YearId, SalesZoneCode);
    GameMgr.UpdateWebzenItemList(GameMgr);
    return true;
    //return;    
}

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    Log(((((("[BTPageServerSelection::rfAckRegisteredPCBangInfo] Name(R,M)=" $ PCBangName) $ "(") $ string(IsRegisteredPCBang)) $ ", ") $ string(IsMainPCBang)) $ ")");
    // End:0x90
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    //return;    
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckCharInfo] CharName=" $ CharName);
    // End:0x718
    if(Result == 0)
    {
        // End:0x60
        if(MM.kUserName != CharName)
        {
            return true;
        }
        page_Main.pwm.StartProcess();
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
        MM.My_Level = stCharInfo.Level;
        page_Main.MyCharInfo = stCharInfo;
        page_Main.MyClanName = ClanName;
        MM.kUID = UserID;
        MM.kLevel = stCharInfo.Level;
        MM.kExp = stCharInfo.Exp;
        MM.kStartExp = GameMgr.GetStartExp(MM.kLevel);
        MM.kEndExp = GameMgr.GetEndExp(MM.kLevel);
        MM.kLevelMarkID = stCharInfo.LevelMarkID;
        MM.kTitleMarkID = stCharInfo.TitleMarkID;
        MM.kReserved1 = stCharInfo.Reserved1;
        MM.kReserved2 = stCharInfo.Reserved2;
        MM.kReserved3 = stCharInfo.Reserved3;
        // End:0x253
        if(ClanName == "none")
        {
            ClanName = "";
        }
        MM.kClanName = ClanName;
        MM.kInClanGrade = int(InClanRank);
        MM.kClanLevel = ClanLevel;
        MM.kClanLookingFor = int(stCharInfo.LookForClan) > 0;
        MM.kClanPattern = CM_Pattern;
        MM.kClanBG = CM_BG;
        MM.kClanBL = CM_BL;
        GameMgr.SP.kClanPattern_Img = GameMgr.GetClanMark32(MM.kClanPattern);
        GameMgr.SP.kClanBG_Img = GameMgr.GetClanMark32(MM.kClanBG);
        GameMgr.SP.kClanBL_Img = GameMgr.GetClanMark32(MM.kClanBL);
        MM.kPrevRanking = stCharInfo.PrevRanking;
        MM.kRanking = stCharInfo.Ranking;
        MM.kPrevHeadShotRanking = stCharInfo.PrevHeadShotRanking;
        MM.kHeadShotRanking = stCharInfo.HeadShotRanking;
        MM.kPrevWomanRanking = stCharInfo.PrevWomanRanking;
        MM.kWomanRanking = stCharInfo.WomanRanking;
        MM.kMonthlyPrevRanking = stCharInfo.MonthlyPrevRanking;
        MM.kMonthlyRanking = stCharInfo.MonthlyRanking;
        MM.kMonthlyPrevHeadShotRanking = stCharInfo.MonthlyPrevHeadShotRanking;
        MM.kMonthlyHeadShotRanking = stCharInfo.MonthlyHeadShotRanking;
        MM.kMonthlyPrevWomanRanking = stCharInfo.MonthlyPrevWomanRanking;
        MM.kMonthlyWomanRanking = stCharInfo.MonthlyWomanRanking;
        MM.kKill = stCharInfo.Kill;
        MM.kDeath = stCharInfo.Death;
        MM.kWin = stCharInfo.Win;
        MM.kLose = stCharInfo.Lose;
        MM.kAssist = stCharInfo.Assist;
        MM.kHeadShot = stCharInfo.HeadShot2;
        MM.kDisConnectCount = stCharInfo.DisCon;
        MM.kTotalPlayTime = stCharInfo.TotPlayTime;
        // End:0x5BC
        if(MM.kClanName == "")
        {
            MM.kUser_ClanContribue = 0;
            page_Main.MyCharInfo.ClanContribue = 0;            
        }
        else
        {
            MM.kUser_ClanContribue = stCharInfo.ClanContribue;
        }
        MM.kUser_ClanWin = stCharInfo.ClanWin;
        MM.kUser_ClanLose = stCharInfo.ClanLose;
        MM.kUser_ClanKill = stCharInfo.ClanKill;
        MM.kUser_ClanDeath = stCharInfo.ClanDeath;
        MM.kUser_ClanAssist = stCharInfo.ClanAssist;
        MM.kUser_ClanHeadshot = stCharInfo.ClanHeadshot;
        MM.kUser_ClanDiscon = stCharInfo.ClanDiscon;
        MM.kPoint = stCharInfo.Point;
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
        MM.UpdateRankingInfo(MM);
        MM.UpdateMoneyInfo(MM);
        MM.UpdateRecv_CharInfo(MM);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return false;
    //return;    
}

function bool rfAckClanInfo(ClanInfo stClanInfo)
{
    Log("[BTPageServerSelection::rfAckClanInfo]");
    page_Main.kRecvClanInfo = stClanInfo;
    // End:0x405
    if(MM.kClanName == stClanInfo.CM_ClanName)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        page_Main.MyClanInfo = stClanInfo;
        MM.kClanPattern = stClanInfo.CM_Pattern;
        MM.kClanBG = stClanInfo.CM_BG;
        MM.kClanBL = stClanInfo.CM_BL;
        GameMgr.SP.kClanPattern_Img = GameMgr.GetClanMark32(stClanInfo.CM_Pattern);
        GameMgr.SP.kClanBG_Img = GameMgr.GetClanMark32(stClanInfo.CM_BG);
        GameMgr.SP.kClanBL_Img = GameMgr.GetClanMark32(stClanInfo.CM_BL);
        MM.kClanExp = stClanInfo.ClanExp;
        MM.kClanMasterName = stClanInfo.ClanMasterCharname;
        MM.kClanWin = stClanInfo.ClanWin;
        MM.kClanLose = stClanInfo.ClanLose;
        MM.kClanDraw = stClanInfo.ClanDraw;
        MM.kClanKill = stClanInfo.ClanKill;
        MM.kClanDeath = stClanInfo.ClanDeath;
        MM.kClanRanking = stClanInfo.tRankCur;
        MM.kClanPrevRanking = stClanInfo.tRankPrev;
        MM.kClanMonthlyRanking = stClanInfo.mRankCur;
        MM.kClanMonthlyPrevRanking = stClanInfo.mRankPrev;
        MM.kClanRegion = stClanInfo.Region;
        MM.kClanMemberCount = stClanInfo.MemberCnt;
        MM.kClanMemberMaximum = stClanInfo.MemberTotal;
        MM.kClanIsRecruit = stClanInfo.IsRecruit;
        MM.kClanHowOld = stClanInfo.HowOld;
        MM.kClanKeyword = stClanInfo.Keyword;
        MM.kClanIntro = stClanInfo.Intro;
        MM.kClanNotice = stClanInfo.ClanNoti;
        MM.kClanActivity = stClanInfo.ClanActivity;
        MM.kClanActivityRank = stClanInfo.ClanActivityRank;
        MM.kClanActivityRankPrev = stClanInfo.ClanActivityRankPrev;
        MM.kClanActivityMRank = stClanInfo.ClanActivityMRank;
        MM.kClanActivityMRankPrev = stClanInfo.ClanActivityMRankPrev;
        MM.kClanLevel = stClanInfo.ClanLevel;
        MM.UpdateClanInfo(MM);
    }
    page_Main.UpdateRecv_ClanInfo(page_Main);
    return true;
    //return;    
}

function bool rfReqIsPaidWebzenPCBang(byte IsPaid)
{
    local export editinline BTWindowDefineInfoHK BTWindow;

    Log("[BTPageServerSelection::rfReqIsPaidWebzenPCBang] IsPaid=" $ string(IsPaid));
    PlayerOwner().dblog("[BTPageServerSelection::rfReqIsPaidWebzenPCBang] IsPaid=" $ string(IsPaid));
    return true;
    //return;    
}

function bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckRegisterMainPCBang]");
    // End:0x5A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqRegisteredPCBangInfo();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 128);
    return true;
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    Log((("[BTPageServerSelection::rfAckClanUserListStart] Result=" $ string(Result)) $ " TotalCount=") $ string(TotalCount));
    MM.ClearClanList();
    MM.SetClanListCount(TotalCount);
    // End:0xBA
    if(MM.kClanListCount == MM.kClanList.Length)
    {
        MM.UpdateClanList(MM);
    }
    return true;
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    local int i;

    Log("[BTPageServerSelection::rfAckClanUserList]");
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x5B:

    // End:0x75 [Loop If]
    if(i < Level.Length)
    {
        i++;
        // [Loop Continue]
        goto J0x5B;
    }
    // End:0xAF
    if(MM.kClanListCount == MM.kClanList.Length)
    {
        MM.UpdateClanList(MM);
    }
    return true;
    //return;    
}

function bool rfAckClanUserListEnd()
{
    Log("[BTPageServerSelection::rfAckClanUserListEnd]");
    return true;
    //return;    
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    Log("[BTPageServerSelection::rfAckFriendListStart]");
    MM.ClearFriendList();
    MM.SetFriendListCount(TotalCount);
    // End:0x8E
    if(MM.kFriendListCount == MM.kFriendList.Length)
    {
        MM.UpdateFriendList(MM);
    }
    return true;
    //return;    
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    local int i;

    Log("[BTPageServerSelection::rfAckFriendList]");
    Log("[BTPageServerSelection::rfAckFriendList] Start");
    Log((("[BTPageServerSelection::rfAckFriendList] FriendName.Length=" $ string(FriendName.Length)) $ ", ClanLevel.Length") $ string(ClanLevel.Length));
    i = 0;
    J0xCE:

    // End:0x165 [Loop If]
    if(i < FriendName.Length)
    {
        MM.AddFriendList(FriendName[i], IsLogOn[i], CM_Pattern[i], CM_BG[i], CM_BL[i], ClanName[i], Level[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i]);
        i++;
        // [Loop Continue]
        goto J0xCE;
    }
    // End:0x19F
    if(MM.kFriendListCount == MM.kFriendList.Length)
    {
        MM.UpdateFriendList(MM);
    }
    Log("[BTPageServerSelection::rfAckFriendList] End");
    return true;
    //return;    
}

function bool rfAckFriendListEnd()
{
    Log("[BTPageServerSelection::rfAckFriendListEnd]");
    return true;
    //return;    
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    Log("[BTPageServerSelection::rfAckPCBangUserListStart]");
    MM.ClearPCBangList();
    MM.SetPCBangListCount(TotalCount);
    // End:0x92
    if(MM.kPCBangListCount == MM.kPCBangList.Length)
    {
        MM.UpdatePCBangList(MM);
    }
    return true;
    //return;    
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageServerSelection::rfAckPCBangUserList] FriendName.Length = " $ string(FriendName.Length));
    Log("[BTPageServerSelection::rfAckPCBangUserList] Start");
    i = 0;
    J0x8C:

    // End:0x170 [Loop If]
    if(i < FriendName.Length)
    {
        Log((((((((((((((((((FriendName[i] $ ", ") $ string(CM_Pattern[i])) $ ", ") $ string(CM_BG[i])) $ ", ") $ string(CM_BL[i])) $ ", ") $ string(Level[i])) $ ", ") $ string(LevelMarkID[i])) $ ", ") $ string(TitleMarkID[i])) $ ", ") $ string(Reserved1[i])) $ ", ") $ string(Reserved2[i])) $ ", ") $ string(Reserved3[i]));
        i++;
        // [Loop Continue]
        goto J0x8C;
    }
    // End:0x1AA
    if(MM.kPCBangListCount == MM.kPCBangList.Length)
    {
        MM.UpdatePCBangList(MM);
    }
    Log("[BTPageServerSelection::rfAckPCBangUserList] End");
    return true;
    //return;    
}

function bool rfAckPCBangUserListEnd()
{
    Log("[BTPageServerSelection::rfAckPCBangUserListEnd]");
    return true;
    //return;    
}

function bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    local int i;
    local export editinline BTWindowOptionHK BTWindow;

    Log((("[BTPageServerSelection::rfAckBlockUserListStart] Result=" $ string(Result)) $ " TotalCount=") $ string(TotalCount));
    MM.ClearBlockList();
    MM.SetBlockListCount(TotalCount);
    // End:0x186
    if(MM.kBlockListCount == MM.kBlockList.Length)
    {
        MM.UpdateBlockList(MM);
        MM.BlockUserListForOption.Length = MM.kBlockList.Length;
        i = 0;
        J0xE1:

        // End:0x132 [Loop If]
        if(i < MM.kBlockList.Length)
        {
            MM.BlockUserListForOption[i] = MM.kBlockList[i].UserName;
            i++;
            // [Loop Continue]
            goto J0xE1;
        }
        BTWindow = BTWindowOptionHK(Controller.TopPage());
        // End:0x186
        if(BTWindow != none)
        {
            BTWindow.TPOption.TPCommunity.UpdateBlockUserList(MM.BlockUserListForOption);
        }
    }
    return true;
    //return;    
}

function bool rfAckBlockUserListEnd()
{
    Log("[BTPageServerSelection::rfAckBlockUserListEnd]");
    return true;
    //return;    
}

function bool rfAckBlockUserList(array<string> CharName)
{
    local int i;
    local export editinline BTWindowOptionHK BTWindow;

    Log("[BTPageServerSelection::rfAckBlockUserList]");
    i = 0;
    J0x36:

    // End:0x6A [Loop If]
    if(i < CharName.Length)
    {
        MM.AddBlockList(CharName[i]);
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    // End:0x16F
    if(MM.kBlockListCount == MM.kBlockList.Length)
    {
        MM.UpdateBlockList(MM);
        MM.BlockUserListForOption.Length = MM.kBlockList.Length;
        i = 0;
        J0xCA:

        // End:0x11B [Loop If]
        if(i < MM.kBlockList.Length)
        {
            MM.BlockUserListForOption[i] = MM.kBlockList[i].UserName;
            i++;
            // [Loop Continue]
            goto J0xCA;
        }
        BTWindow = BTWindowOptionHK(Controller.TopPage());
        // End:0x16F
        if(BTWindow != none)
        {
            BTWindow.TPOption.TPCommunity.UpdateBlockUserList(MM.BlockUserListForOption);
        }
    }
    return true;
    //return;    
}

function bool BTWindowRandBoxHK_OnOK(GUIComponent Sender)
{
    local int i;
    local export editinline BTWindowRandBoxHK BTWindow;
    local wItemBoxHK ItemInfo;

    BTWindow = BTWindowRandBoxHK(Controller.TopPage());
    i = 0;
    J0x21:

    // End:0x184 [Loop If]
    if(i < BTWindow.ItemIDChoose.Length)
    {
        ItemInfo = GameMgr.FindUIItem(BTWindow.ItemIDChoose[i]);
        // End:0x10F
        if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
        {
            GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], BTWindow.ItemIdx[i], 0, 13, 1, 100000, BTWindow.PartIDChoose[i], 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
            // [Explicit Continue]
            goto J0x17A;
        }
        GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], BTWindow.ItemIdx[i], 0, 13, 1, 100000, 0, 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
        J0x17A:

        i++;
        // [Loop Continue]
        goto J0x21;
    }
    GameMgr.UpdateItemList(GameMgr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    local int i, GetItemCount;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local export editinline BTWindowRandBoxHK BTWindow;

    Log("[BTPageServerSelection::rfAckRandomBox_Use] Result=" $ string(Result));
    // End:0x66
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(RandomBoxItemIdx);
    // End:0x8D
    if(instanceInfo == none)
    {
        return true;
    }
    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
    Controller.OpenMenu("GUIWarfareControls.BTWindowRandBoxHK");
    BTWindow = BTWindowRandBoxHK(Controller.TopPage());
    BTWindow.__OnOK__Delegate = BTWindowRandBoxHK_OnOK;
    BTWindow.TopLine.Caption = ItemInfo.ItemName;
    GetItemCount = GameMgr.GetRandBoxItemsCount(instanceInfo.ItemID);
    BTWindow.SetItemCount(GetItemCount);
    PlayerOwner().dblog("== Random Box =======");
    PlayerOwner().dblog("Used Item=" $ ItemInfo.ItemName);
    PlayerOwner().dblog("=====================");
    BTWindow.ItemIDChoose.Length = ItemIDChoose.Length;
    BTWindow.ItemIdx.Length = ItemIdx.Length;
    BTWindow.PartIDChoose.Length = PartIDChoose.Length;
    BTWindow.StackCount.Length = StackCount.Length;
    BTWindow.UntilTime.Length = UntilTime.Length;
    i = 0;
    J0x256:

    // End:0x310 [Loop If]
    if(i < ItemIDChoose.Length)
    {
        BTWindow.ItemIDChoose[i] = ItemIDChoose[i];
        BTWindow.ItemIdx[i] = ItemIdx[i];
        BTWindow.PartIDChoose[i] = PartIDChoose[i];
        BTWindow.StackCount[i] = StackCount[i];
        BTWindow.UntilTime[i] = UntilTime[i];
        i++;
        // [Loop Continue]
        goto J0x256;
    }
    // End:0x332
    if(RandomBxoItemCount == 0)
    {
        GameMgr.RemoveInstanceItem(RandomBoxItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(RandomBoxItemIdx, RandomBxoItemCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    return true;
    //return;    
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckEquipItem] Result=" $ string(Result));
    // End:0x62
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    // End:0x8C
    if(__NFUN_913__(ChangedOldUniqueID, EmptyBtrDouble()))
    {
        GameMgr.ChangeInstance_ItemSlotPos(ChangedOldUniqueID, ChangedOldSlotPosition);
    }
    // End:0xB6
    if(__NFUN_913__(ChangedNewUniqueID, EmptyBtrDouble()))
    {
        GameMgr.ChangeInstance_ItemSlotPos(ChangedNewUniqueID, ChangedNewSlotPosition);
    }
    return true;
    //return;    
}

function bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckAddBlockUserList]");
    // End:0x58
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqBlockUserList();
    return true;
    //return;    
}

function bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckRemoveBlockUserList]");
    // End:0x5B
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqBlockUserList();
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    PlayerOwner().dblog((((((("[BTPageServerSelection::rfAckWebzenBillingStorageListStart] Result=" $ string(Result)) $ ", TotalCount=") $ string(TotalCount)) $ ", TotalPage=") $ string(TotalPage)) $ ", CurPage=") $ string(CurPage));
    Log((((((("[BTPageServerSelection::rfAckWebzenBillingStorageListStart] Result=" $ string(Result)) $ ", TotalCount=") $ string(TotalCount)) $ ", TotalPage=") $ string(TotalPage)) $ ", CurPage=") $ string(CurPage));
    // End:0x1AA
    if(Result != 0)
    {
        // End:0x18F
        if(page_Main.WZILP.bLock)
        {
            page_Main.WZILP.bLock = false;
            page_Main.UpdateWebzenInvenListEnd(page_Main);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x1E9
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        return true;
    }
    // End:0x21E
    if(CurPage == 1)
    {
        page_Main.WZILP.MaxPage = TotalPage;
        GameMgr.kWZInvenList.Length = 0;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    local int i, Len;

    PlayerOwner().dblog("[BTPageServerSelection::rfAckWebzenBillingStorageList] Seq.Length=" $ string(Seq.Length));
    Log("[BTPageServerSelection::rfAckWebzenBillingStorageList] Seq.Length=" $ string(Seq.Length));
    // End:0xEA
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        return true;
    }
    i = 0;
    J0xF1:

    // End:0x493 [Loop If]
    if(i < Seq.Length)
    {
        Len = GameMgr.kWZInvenList.Length;
        GameMgr.kWZInvenList.Length = Len + 1;
        Log((((((((((((((((((((((((string(Len) $ "  Seq=") $ string(Seq[i])) $ ", ItemSeq=") $ string(ItemSeq[i])) $ ", GroupCode=") $ string(GroupCode[i])) $ ", ShareFlag=") $ string(ShareFlag[i])) $ ", ProductSeq=") $ string(ProductSeq[i])) $ ", CashName=") $ CashName[i]) $ ", CashPoint=") $ __NFUN_918__(CashPoint[i])) $ ", SendAccountID=") $ SendAccountID[i]) $ ", SendMessage=") $ SendMessage[i]) $ ", ItemType=") $ string(ItemType[i])) $ ", RelationType=") $ string(RelationType[i])) $ ", ProductType=") $ string(ProductType[i]));
        GameMgr.kWZInvenList[Len].Seq = Seq[i];
        GameMgr.kWZInvenList[Len].ItemSeq = ItemSeq[i];
        GameMgr.kWZInvenList[Len].GroupCode = GroupCode[i];
        GameMgr.kWZInvenList[Len].ShareFlag = ShareFlag[i];
        GameMgr.kWZInvenList[Len].ProductSeq = ProductSeq[i];
        GameMgr.kWZInvenList[Len].PriceSeq = PriceSeq[i];
        GameMgr.kWZInvenList[Len].CashName = CashName[i];
        GameMgr.kWZInvenList[Len].CashPoint = CashPoint[i];
        GameMgr.kWZInvenList[Len].SendAccountID = SendAccountID[i];
        GameMgr.kWZInvenList[Len].SendMessage = SendMessage[i];
        GameMgr.kWZInvenList[Len].ItemType = ItemType[i];
        GameMgr.kWZInvenList[Len].RelationType = RelationType[i];
        GameMgr.kWZInvenList[Len].ProductType = ProductType[i];
        i++;
        // [Loop Continue]
        goto J0xF1;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageListEnd()
{
    PlayerOwner().dblog("[BTPageServerSelection::rfAckWebzenBillingStorageListEnd]");
    Log("[BTPageServerSelection::rfAckWebzenBillingStorageListEnd]");
    // End:0xDC
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        page_Main.UpdateWebzenInvenListEnd(page_Main);
        return true;
    }
    GameMgr.UpdateWebzenItemList(GameMgr);
    // End:0x1B9
    if(page_Main.WZILP.CurPage < page_Main.WZILP.MaxPage)
    {
        page_Main.WZILP.CurPage = page_Main.WZILP.CurPage + 1;
        page_Main.TcpChannel.sfReqWebzenBillingStorageList(page_Main.WZILP.CurPage, page_Main.WZILP.CountPerPage, byte(Asc(page_Main.WZILP.StorageType)));
        page_Main.UpdateWebzenInvenList(page_Main);        
    }
    else
    {
        page_Main.WZILP.bLock = false;
        page_Main.UpdateWebzenInvenListEnd(page_Main);
    }
    Log("page_Main.WZILP.StorageType = " $ page_Main.WZILP.StorageType);
    return true;
    //return;    
}

function bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    local wItemBoxHK ItemInfo;
    local int iItemExtra;

    Log((((((("[BTPageServerSelection::rfAckWebzenBillingUseStorageItem] Result=" $ string(Result)) $ ", ItemIdx=") $ __NFUN_918__(ItemIdx)) $ ", ItemID=") $ string(ItemID)) $ ", ItemExtra=") $ __NFUN_918__(ItemExtra));
    // End:0xBC
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x210
    if(ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID);
        // End:0x210
        if(ItemInfo != none)
        {
            // End:0x152
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                iItemExtra = __NFUN_923__(ItemExtra);
                GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, iItemExtra, 0, 1, 0);                
            }
            else
            {
                // End:0x1AB
                if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
                {
                    GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, 1, 0, ItemExtra);                    
                }
                else
                {
                    // End:0x1F8
                    if(ItemInfo.CostType == 3)
                    {
                        iItemExtra = __NFUN_923__(ItemExtra);
                        GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, iItemExtra, 0);
                    }
                }
            }
            GameMgr.UpdateItemList(GameMgr);
        }
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    Log(("page_Main.sfReqWebzenInvenList(" $ page_Main.WZILP.StorageType) $ ")");
    page_Main.sfReqWebzenInvenList(page_Main.WZILP.StorageType);
    return true;
    //return;    
}

function bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckPaidItem_EraseRecord] RemainCount=" $ string(RemainCount));
    // End:0x72
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(ItemIdx);
    // End:0x1A7
    if(instanceInfo != none)
    {
        // End:0xB9
        if(RemainCount == 0)
        {
            GameMgr.RemoveInstanceItem(ItemIdx);            
        }
        else
        {
            GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
        }
        switch(Command)
        {
            // End:0xF6
            case 1:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 14);
                // End:0x18F
                break;
            // End:0x114
            case 2:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 10);
                // End:0x18F
                break;
            // End:0x132
            case 3:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 12);
                // End:0x18F
                break;
            // End:0x150
            case 4:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 4);
                // End:0x18F
                break;
            // End:0x16E
            case 5:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 58);
                // End:0x18F
                break;
            // End:0x18C
            case 6:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 60);
                // End:0x18F
                break;
            // End:0xFFFF
            default:
                break;
        }
        GameMgr.UpdateItemList(GameMgr);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckPaidItem_BroadCast]");
    // End:0x5A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(ItemIdx);
    // End:0x15A
    if(instanceInfo != none)
    {
        Log("UsedItemID = " $ string(instanceInfo.ItemID));
        // End:0xC4
        if(StackCount == 0)
        {
            GameMgr.RemoveInstanceItem(ItemIdx);            
        }
        else
        {
            GameMgr.ChangeInstance_StackCount(ItemIdx, StackCount);
        }
        switch(instanceInfo.ItemID)
        {
            // End:0xF5
            case 17004:
            // End:0x116
            case 17075:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 31);
                // End:0x142
                break;
            // End:0x11E
            case 17005:
            // End:0x13F
            case 17076:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 32);
                // End:0x142
                break;
            // End:0xFFFF
            default:
                break;
        }
        GameMgr.UpdateItemList(GameMgr);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckPaidItem_ChangeCharname]");
    // End:0x5F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x81
    if(RemainCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 184, MM.kUserName, NewCharname);
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    MyStatus.NickName = NewCharname;
    MM.ReplaceUserName(MM.kUserName, NewCharname);
    MM.kUserName = NewCharname;
    MM.My_szName = NewCharname;
    MM.UpdateCharInfo(MM);
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckPaidItem_ChangeClanname]");
    // End:0x5F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x81
    if(RemainCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 186, MM.kClanName, NewClanname);
    MM.kPrevClanName = MM.kClanName;
    MM.kClanName = NewClanname;
    page_Main.MyClanName = NewClanname;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    MyStatus.ClanName = NewClanname;
    MM.UpdateCharInfo(MM);
    MM.UpdateClanInfo(MM);
    return true;
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    Log("[BTPageServerSelection::rfAckPaidItem_NotifyChangeClanname]");
    // End:0x80
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 186, MM.kClanName, NewClanname);        
    }
    else
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(186, MM.kClanName, NewClanname), 5, true);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTPageServerSelection::rfAckPaidItem_ClanMarkDupCheck]");
    // End:0x96
    if(Result != 0)
    {
        BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
        // End:0x7B
        if(BTWindow != none)
        {
            BTWindow.SetDupCheck(false);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0xE1
    if(BTWindow != none)
    {
        BTWindow.SetDupCheck(true);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 170);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTPageServerSelection::rfAckPaidItem_ClanMarkDupCheck]");
    // End:0x97
    if(Result != 0)
    {
        BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
        // End:0x7C
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xB9
    if(StackCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, StackCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x120
    if(BTWindow != none)
    {
        BTWindow.FadeOut(false, true);
    }
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 173);
    return true;
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    local int i;

    Log((((("[BTPageServerSelection::rfAckPaidItem_NotifyChangeClanMark] Pattern=" $ string(Pattern)) $ ", BG=") $ string(BG)) $ ", BL=") $ string(BL));
    MM.kClanPattern = Pattern;
    MM.kClanBG = BG;
    MM.kClanBL = BL;
    GameMgr.cmm.AddClanMark(ClanName, Pattern, BG, BL);
    // End:0x125
    if(MM.kClanName == ClanName)
    {
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
    }
    i = 0;
    J0x12C:

    // End:0x1DF [Loop If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x1D5
        if(MM.UserInfos[i].ClanName == ClanName)
        {
            MM.UserInfos[i].ClanMark = Pattern;
            MM.UserInfos[i].ClanBG = BG;
            MM.UserInfos[i].ClanBL = BL;
        }
        i++;
        // [Loop Continue]
        goto J0x12C;
    }
    return true;
    //return;    
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    return true;
    //return;    
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return true;
    //return;    
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    return true;
    //return;    
}

function bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    // End:0x1F
    if(Result == 0)
    {
        MM.AddGMList(UserID);
    }
    return true;
    //return;    
}

function bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    // End:0x1F
    if(Result == 0)
    {
        MM.RemoveGMList(UserID);
    }
    return true;
    //return;    
}

function bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    local DelegateEventTimer det;
    local int i;

    Log("[BTPageServerSelection::rfAckCharBlockInfo] Result=" $ string(Result));
    // End:0x66
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xC9
    if((ChatBlockStartTime.dummy_1_DO_NOT_USE != 0) || ChatBlockStartTime.dummy_2_DO_NOT_USE != 0)
    {
        det = new Class'Engine.DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBlockStartTime_OnEventTimer;
        GameMgr.AddEventTimer(1000, ChatBlockStartTime, det);
    }
    // End:0x12C
    if((ChatBlockEndTime.dummy_1_DO_NOT_USE != 0) || ChatBlockEndTime.dummy_2_DO_NOT_USE != 0)
    {
        det = new Class'Engine.DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBlockEndTime_OnEventTimer;
        GameMgr.AddEventTimer(1001, ChatBlockEndTime, det);
    }
    GameMgr.ClearBlockedItem();
    i = 0;
    J0x142:

    // End:0x176 [Loop If]
    if(i < BlockedItemIdx.Length)
    {
        GameMgr.AddBlockedItem(BlockedItemIdx[i]);
        i++;
        // [Loop Continue]
        goto J0x142;
    }
    return true;
    //return;    
}

function ChatBlockStartTime_OnEventTimer(int Index)
{
    local BtrDouble D;
    local BtrTime t;

    Log("[BTPageServerSelection::ChatBlockStartTime_OnEventTimer]");
    D = GameMgr.GetLeftEventTime(1001);
    // End:0xD3
    if((D.dummy_1_DO_NOT_USE != 0) || D.dummy_2_DO_NOT_USE != 0)
    {
        BtrDoubleToBtrTime(D, t);
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(162, string((t.Day * 24) + t.Hour), string(t.Minute)), 5, true);
    }
    page_Main.bSystemChatBlock = true;
    //return;    
}

function ChatBlockEndTime_OnEventTimer(int Index)
{
    Log("[BTPageServerSelection::ChatBlockEndTime_OnEventTimer]");
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(159), 5, true);
    page_Main.bSystemChatBlock = false;
    //return;    
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    local string NewKey;

    Log("[BTPageServerSelection::rfAckClientChallenge]");
    NewKey = PlayerOwner().Level.GetMatchMaker().MakeMD5(Key1 $ PlayerOwner().Level.GetMatchMaker().gEngine.strMD5Digest);
    page_Main.TcpLogin.sfReqClientChecksum(NewKey, Key2);
    return true;
    //return;    
}

function bool rfAckClientChecksum(int Result)
{
    Log("[BTPageServerSelection::rfAckClientChecksum] Result=" $ string(Result));
    // End:0x4F
    if(Result == 0)
    {        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 164);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    return true;
    //return;    
}

function bool BTWindowDefineARHK_40_41_OnOK(GUIComponent Sender)
{
    page_Main.page_Lobby2.HeaderButton_OnClick(page_Main.page_Lobby2.TPTopMenu.PostBox);
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.CloseWindowAll(Controller);
    return true;
    //return;    
}

function bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageServerSelection::rfAckGetMyMailBoxState] Result=" $ string(Result));
    CTRP.bGetMyMailBoxState = true;
    // End:0x7D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        CheckToSetPageLobby();
        return true;
    }
    // End:0x9E
    if(int(IsFull) > 0)
    {
        page_Main.bPostBoxFull = true;        
    }
    else
    {
        page_Main.bPostBoxFull = false;
    }
    // End:0xCE
    if(NewMailCount > 0)
    {
        page_Main.bNewMailArrived = true;        
    }
    else
    {
        page_Main.bNewMailArrived = false;
    }
    page_Main.NewMailCount = NewMailCount;
    // End:0x1C5
    if(int(IsFull) > 0)
    {
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK");
        BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
        BTWindow.SetContentText_Instance(40);
        BTWindow.__OnOK__Delegate = BTWindowDefineARHK_40_41_OnOK;
        // End:0x1C2
        if(BTWindow == none)
        {
            Log("page_Main.pwm.Back(EPage_Lobby2) == none");
        }        
    }
    else
    {
        // End:0x299
        if(NewMailCount > 0)
        {
            page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK");
            BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
            BTWindow.SetContentText_Instance(41, string(NewMailCount));
            BTWindow.__OnOK__Delegate = BTWindowDefineARHK_40_41_OnOK;
            // End:0x299
            if(BTWindow == none)
            {
                Log("page_Main.pwm.Back(EPage_Lobby2) == none");
            }
        }
    }
    CheckToSetPageLobby();
    //return;    
}

function bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    local export editinline BTWindowClanMenuHK BTWindow;

    Log((("[BTPageServerSelection::rfAckSetLookForClan] Result=" $ string(Result)) $ ", IsLookingFor=") $ string(IsLookingFor));
    MM.kClanLookingFor = int(IsLookingFor) > 0;
    BTWindow = BTWindowClanMenuHK(Controller.TopPage());
    // End:0xBA
    if(BTWindow != none)
    {
        BTWindow.SetClanLookingFor(MM.kClanLookingFor);
    }
    return true;
    //return;    
}

function bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    local string RecvMsg;

    Log(((("[BTPageLobby::rfAckChatNormal] Sender=" $ Sender) $ ", ") $ "Message=") $ Message);
    // End:0x57
    if(Result != 0)
    {
        return true;
    }
    // End:0x70
    if(MM.IsBlockUser(Sender))
    {
        return true;
    }
    // End:0xBF
    if(id == MM.kUID)
    {
        RecvMsg = (("[" $ Sender) $ "] ") $ Message;
        page_Main.AddChatLog(RecvMsg, 4, true);        
    }
    else
    {
        RecvMsg = (("[" $ Sender) $ "] ") $ Message;
        page_Main.AddChatLog(RecvMsg, 1, true);
    }
    return true;
    //return;    
}

function bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    local string RecvMsg;

    Log(((("[BTPageLobby:rfReqRecvChatWispher] CharnameFrom=" $ CharnameFrom) $ ", ") $ "Message=") $ Message);
    // End:0x6D
    if(MM.IsBlockUser(CharnameFrom))
    {
        return true;
    }
    RecvMsg = (((("" $ strFrom) $ " [") $ CharnameFrom) $ "]") @ Message;
    page_Main.AddChatLog(RecvMsg, 3, true);
    page_Main.LastRecvWhispherName = CharnameFrom;
    Class'XInterface.HudBase'.static.PlayHUDSound(PlayerOwner(), 6);
    return true;
    //return;    
}

function bool rfAckChatClan(string CharName, string Message, int Result)
{
    local string RecvMsg;

    Log(((("[BTPageLobby::rfAckChatClan] Charname=" $ CharName) $ ", ") $ "Message=") $ Message);
    // End:0x57
    if(Result != 0)
    {
        return true;
    }
    // End:0x70
    if(MM.IsBlockUser(CharName))
    {
        return true;
    }
    RecvMsg = (("[" $ CharName) $ "]") @ Message;
    page_Main.AddChatLog(RecvMsg, 2, true);
    return true;
    //return;    
}

function bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    local string RecvMsg;

    Log((("[BTPageServerSelection::rfAckPaidItem_RelayBroadcast] [" $ CharName) $ "] ") $ Msg);
    RecvMsg = (("[" $ CharName) $ "]") @ Msg;
    page_Main.AddChatLog(RecvMsg, 7, true);
    return true;
    //return;    
}

function bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    local string msgp[7], fmtStr;
    local wItemBoxHK ItemInfo;
    local DelegateEventTimer det;

    msgp[0] = MsgInfo.CharName;
    msgp[1] = page_Main.FindServerName(MsgInfo.ServerID);
    msgp[2] = page_Main.FindChannelNickName(MsgInfo.ServerID, MsgInfo.ChannelNum);
    msgp[3] = GameMgr.GetLevelName(MsgInfo.CharLevel);
    // End:0xCA
    if(MsgInfo.ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(MsgInfo.ItemID);
        msgp[4] = ItemInfo.ItemName;        
    }
    else
    {
        msgp[4] = "";
    }
    msgp[5] = string(MsgInfo.Point);
    // End:0x108
    if(int(CommunityType) == 1)
    {
        msgp[6] = strPCBangFriend;        
    }
    else
    {
        msgp[6] = "";
    }
    // End:0x195
    if(MsgInfo.MsgCode == 14)
    {
        det = new Class'Engine.DelegateEventTimer';
        det.Data_Int[0] = MsgInfo.MsgCode;
        det.Data_String[0] = msgp[0];
        det.__OnEventTimer__Delegate = Receive_EventGift;
        GameMgr.AddEventTimerHMS(0, 0, 0, 59, det);
        return true;
    }
    fmtStr = Class'GUIWarfareControls.BTWindowSystemMsgInfoHK'.static.GetFormatString(MsgInfo.MsgCode, msgp[0], msgp[1], msgp[2], msgp[3], msgp[4], msgp[5], msgp[6]);
    Log((("[BTPageServerSelection::rfAckRecvSystemMsg] " $ fmtStr) $ ", CommunityType=") $ string(CommunityType));
    page_Main.AddChatLog(fmtStr, 5, true);
    // End:0x289
    if((MsgInfo.MsgCode >= 2) && MsgInfo.MsgCode <= 4)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x2BD
    if((MsgInfo.MsgCode >= 9) && MsgInfo.MsgCode <= 13)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x2E2
    if(MsgInfo.MsgCode == 5)
    {
        Class'XInterface.HudBase'.static.PlayHUDSound(PlayerOwner(), 5);
    }
    return true;
    //return;    
}

function Receive_EventGift(int Index)
{
    local string fmtStr;

    fmtStr = Class'GUIWarfareControls.BTWindowSystemMsgInfoHK'.static.GetFormatString(GameMgr.kEventTimerList[Index].EventDelegate.Data_Int[0], GameMgr.kEventTimerList[Index].EventDelegate.Data_String[0]);
    Log("[BTPageServerSelection::Receive_EventGift] " $ fmtStr);
    page_Main.AddChatLog(fmtStr, 5, true);
    page_Main.SetNewMailArrived(true);
    //return;    
}

function bool rfAckServerType(byte Type)
{
    Log("[BTPageServerSelection::rfAckServerType] " $ string(Type));
    MM.kServerType = int(Type);
    // End:0x74
    if(MM.kServerType == 1)
    {
        MM.kClanMatch_InChannel = true;        
    }
    else
    {
        MM.kClanMatch_InChannel = false;
    }
    return true;
    //return;    
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log((("[BTPageServerSelection::rfAckLogOut] Result=" $ string(Result)) $ " Reason=") $ string(Reason));
    // End:0x63
    if(int(Reason) == 1)
    {
        ExitGame();
        return true;
    }
    // End:0xA0
    if(int(Reason) == 4)
    {
        page_Main.HaltNetwork();
        page_Main.Controller.ConsoleCommand("exit");
        return true;
    }
    page_Main.pwm.CloseAndClear();
    Log(((((("[BTPageServerSelection::rfAckLogOut] page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.LoginToChannel(ConnectingChannel.IP, ConnectingChannel.Port, ConnectingChannel.DataPort);
    return true;
    //return;    
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log((((("[BTPageServerSelection::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year)) $ " YearId=") $ string(YearId)) $ " SalesZoneCode=") $ string(SalesZoneCode));
    page_Main.UpdateWebzenShopItemList(Year, YearId, SalesZoneCode);
    return true;
    //return;    
}

event bool rfAckPopUpMessage(int MessageType)
{
    Log("[BTPageServerSelectionCN::rfAckPopUpMessage()] MessageType=" $ string(MessageType));
    // End:0xCF
    if(835 == MessageType)
    {
        page_Main.pwm.CreateAndPush(10, "GUIWarfareControls.BTWindowErrorDefineHK", true, 0);
        BTWindowErrorDefineHK(page_Main.pwm.Last(10)).SetContentText_Instance(1, 835);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 0);
    }
    return true;
    //return;    
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageServerSelection::rfAckMoveToLobby()] MessageType=" $ string(MessageType));
    return true;
    //return;    
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTPageServerSelection::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    // End:0xC1
    if(MM.IsUsingTenProtect)
    {
        // End:0x9E
        if(PlayerOwner().Level.GetIsServiceBuild())
        {
            MM.TenProtectCreate(MM.LoginInfo.UIN);            
        }
        else
        {
            MM.TenProtectCreate(CharDBID);
        }
        MM.TenProtectSendInitData();
    }
    return true;
    //return;    
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local int SlotPosition, OldSlotPosition;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    Log("[BTPage::rfAckEquipSkill] Result=" $ string(Result));
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(ChangedNewSkillID);
    instanceInfo = GameMgr.FindFirstInstanceItemByItemID(ChangedNewSkillID);
    // End:0xFC
    if(instanceInfo == none)
    {
        return false;
    }
    GameMgr.ChangeInstance_SkillSlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
    GameMgr.ChangeSkillBox_SlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
    page_Main.TcpChannel.sfReqConfirmSkillChanged();
    return true;
    //return;    
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    Log((((("[BTPageServerSelection::rfAckLoginWithTencentAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(tc_AccountType)) $ " wzp_IsBlock=") $ string(tc_IsBlock));
    __NFUN_270__((((("[BTPageServerSelection::rfAckLoginWithTencentAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(tc_AccountType)) $ " wzp_IsBlock=") $ string(tc_IsBlock));
    // End:0x150
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithTencentAuth_Test(Result, tc_AccountType, tc_IsBlock);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithTencentAuth_Live(Result, tc_AccountType, tc_IsBlock);
    }
    return true;
    //return;    
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log((((((((("[BTPageServerSelection::rfAckLoginWithWZAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(wzp_AccountType)) $ " wzp_IsBlock=") $ string(wzp_IsBlock)) $ " wzp_AuthKeySuccess=") $ string(wzp_AuthKeySuccess)) $ " ChannelType = ") $ string(ChannelType));
    __NFUN_270__((((((((("[BTPageServerSelection::rfAckLoginWithWZAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(wzp_AccountType)) $ " wzp_IsBlock=") $ string(wzp_IsBlock)) $ " wzp_AuthKeySuccess=") $ string(wzp_AuthKeySuccess)) $ " ChannelType = ") $ string(ChannelType));
    // End:0x1CA
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithWZAuth_Test(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithWZAuth_Live(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
    }
    return true;
    //return;    
}

function bool rfAckLoginWithThailand(int Result)
{
    Log("[BTPageServerSelection::rfAckLoginWithThailand] Result=" $ string(Result));
    __NFUN_270__("[BTPageServerSelection::rfAckLoginWithThailand] Result=" $ string(Result));
    // End:0xD0
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithThailand_Test(Result);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithThailand_Live(Result);
    }
    return true;
    //return;    
}

function bool rfAckLoginWithGlobal(int Result)
{
    Log("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    __NFUN_270__("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    // End:0xCC
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithGlobal_Test(Result);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithGlobal_Live(Result);
    }
    return true;
    //return;    
}

function bool rfAckShopItemData()
{
    GameMgr.kGP20ProductList.Length = 0;
    return true;
    //return;    
}

function bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductRowGuid, array<string> ServiceCode, array<string> ProductName, array<string> ProductCode, array<string> ProductType, array<byte> SaleType, array<string> ItemSaleType, array<byte> ISIncludeBonus, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> TotalQuantity, array<int> ReOrderTerms, array<int> ReorderCount, array<int> PurchaseAvailableQuantity, array<int> AvailableMinLevel, array<int> AvailableMaxLevel, array<byte> AvailableGender, array<int> InventoryKeepDays, array<int> SaleMasterFlag, array<int> SaleStatus, array<string> Description, array<string> Property0, array<string> Property1, array<string> Property2, array<string> Property3, array<string> Property4, array<int> IsGift)
{
    local int i, j, useIndex, ProductCount, costCount;

    local GP20Product GP20Product;

    ProductCount = ProductNo.Length;
    i = 0;
    J0x13:

    // End:0x643 [Loop If]
    if(i < ProductCount)
    {
        useIndex = GameMgr.kGP20ProductList.Length;
        j = 0;
        J0x3E:

        // End:0x98 [Loop If]
        if(j < GameMgr.kGP20ProductList.Length)
        {
            // End:0x8E
            if(GameMgr.kGP20ProductList[j].ProductCode == ProductCode[i])
            {
                useIndex = j;
                // [Explicit Break]
                goto J0x98;
            }
            j++;
            // [Loop Continue]
            goto J0x3E;
        }
        J0x98:

        // End:0xC9
        if(useIndex >= GameMgr.kGP20ProductList.Length)
        {
            GameMgr.kGP20ProductList.Length = useIndex + 1;
        }
        costCount = GameMgr.kGP20ProductList[useIndex].ProductNo.Length;
        GameMgr.kGP20ProductList[useIndex].ProductNo.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductCost.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductHour.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductQuantity.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].SaleType.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].SaleStatus.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].IsGift.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductNo[costCount] = ProductNo[i];
        GameMgr.kGP20ProductList[useIndex].ProductCost[costCount] = ProductCost[i];
        GameMgr.kGP20ProductList[useIndex].ProductHour[costCount] = ProductHour[i];
        GameMgr.kGP20ProductList[useIndex].ProductQuantity[costCount] = ProductQuantity[i];
        GameMgr.kGP20ProductList[useIndex].SaleType[costCount] = SaleType[i];
        GameMgr.kGP20ProductList[useIndex].SaleStatus[costCount] = SaleStatus[i];
        GameMgr.kGP20ProductList[useIndex].IsGift[costCount] = IsGift[i];
        GameMgr.kGP20ProductList[useIndex].ProductRowGuid = ProductRowGuid[i];
        GameMgr.kGP20ProductList[useIndex].ServiceCode = ServiceCode[i];
        GameMgr.kGP20ProductList[useIndex].ProductName = ProductName[i];
        GameMgr.kGP20ProductList[useIndex].ProductCode = ProductCode[i];
        GameMgr.kGP20ProductList[useIndex].ProductType = ProductType[i];
        GameMgr.kGP20ProductList[useIndex].ItemSaleType = ItemSaleType[i];
        GameMgr.kGP20ProductList[useIndex].ISIncludeBonus = ISIncludeBonus[i];
        GameMgr.kGP20ProductList[useIndex].TotalQuantity = TotalQuantity[i];
        GameMgr.kGP20ProductList[useIndex].ReOrderTerms = ReOrderTerms[i];
        GameMgr.kGP20ProductList[useIndex].ReorderCount = ReorderCount[i];
        GameMgr.kGP20ProductList[useIndex].PurchaseAvailableQuantity = PurchaseAvailableQuantity[i];
        GameMgr.kGP20ProductList[useIndex].AvailableMinLevel = AvailableMinLevel[i];
        GameMgr.kGP20ProductList[useIndex].AvailableMaxLevel = AvailableMaxLevel[i];
        GameMgr.kGP20ProductList[useIndex].AvailableGender = AvailableGender[i];
        GameMgr.kGP20ProductList[useIndex].InventoryKeepDays = InventoryKeepDays[i];
        GameMgr.kGP20ProductList[useIndex].SaleMasterFlag = SaleMasterFlag[i];
        GameMgr.kGP20ProductList[useIndex].Description = Description[i];
        GameMgr.kGP20ProductList[useIndex].Property0 = Property0[i];
        GameMgr.kGP20ProductList[useIndex].Property1 = Property1[i];
        GameMgr.kGP20ProductList[useIndex].Property2 = Property2[i];
        GameMgr.kGP20ProductList[useIndex].Property3 = Property3[i];
        GameMgr.kGP20ProductList[useIndex].Property4 = Property4[i];
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    return true;
    //return;    
}

function bool rfReqNotifyShopItemDataEnd(int Ver)
{
    Log("GP20Product : ProductCount =" $ string(GameMgr.kGP20ProductList.Length));
    GameMgr.GP20ShopVersion = Ver;
    GameMgr.UpdateWebzenItemList(GameMgr);
    return true;
    //return;    
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTPageServerSelection::rfReqRecvClanInvite]");
    TcpChannel.sfReqClanInfo(ClanName);
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestClanHK");
    BTWindowRequestClanHK(Controller.TopPage()).SetData(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
    BTWindowRequestClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRequestClanHK_OnOK;
    BTWindowRequestClanHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowRequestClanHK_OnCancel;
    BTWindowRequestClanHK(Controller.TopPage()).ButtonSuspend.__OnClick__Delegate = BTWindowRequestClanHK_OnSuspend;
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;
    local wMatchMaker MM;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnOK]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 0);
    Controller.TopPage().FadeOut(false, true);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kPrevClanName = BTWindow.ClanName;
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnCancel]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 2);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnSuspend]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    local wMatchMaker MM;
    local wGameManager GameMgr;
    local int ClanBL, ClanPT, ClanBG;

    Log("[BTPageClanWar::rfAckRecvClanInviteResult]");
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kClanName = MM.kPrevClanName;
    page_Main.MyClanInfo.CM_ClanName = MM.kClanName;
    page_Main.MyClanName = MM.kClanName;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x1DD
    if(GameMgr.GetClanLevelMarkInfo(MM.kClanName, ClanPT, ClanBG, ClanBL))
    {
        MM.kClanBG = ClanBG;
        MM.kClanBL = ClanBL;
        MM.kClanPattern = ClanPT;
        page_Main.MyClanInfo.CM_BG = ClanBG;
        page_Main.MyClanInfo.CM_BL = ClanBL;
        page_Main.MyClanInfo.CM_Pattern = ClanPT;
        MM.UpdateClanInfo(MM);
    }
    return true;
    //return;    
}

function bool rfNotifyCouponUseError(int Time)
{
    local BtrDouble blockDoubleTime;
    local wGameManager GameMgr;
    local string blockMsg;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    blockDoubleTime = GameMgr.GetLeftEventTime(1020);
    // End:0xC7
    if((blockDoubleTime.dummy_1_DO_NOT_USE == 0) || blockDoubleTime.dummy_2_DO_NOT_USE == 0)
    {
        GameMgr.AddEventTimerHMS(1020, 0, 0, Time);
        blockMsg = Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.GetFormatString(859, string((Time / 60) + 1));
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowErrorMsg(Controller, blockMsg);
    }
    //return;    
}

defaultproperties
{
    RefreshCycleTime=20.0000000
    fbLabelBackground=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=758.0000000)
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    fbLabelTopLine=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=128.0000000)
    fbLabelLeftTopRoll=(X1=0.0000000,Y1=0.0000000,X2=140.0000000,Y2=128.0000000)
    fbLabelLeftTopRollSource=(X1=116.0000000,Y1=128.0000000,X2=256.0000000,Y2=256.0000000)
    fbLabelBottomLine=(X1=0.0000000,Y1=736.0000000,X2=1024.0000000,Y2=768.0000000)
    // Reference: TabControlMocker'GUIWarfare_Decompressed.BTPageServerSelection.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls.TabControlMocker
        OnVisiblePanelChanged=BTPageServerSelection.OnVisibleChannelListChanged
    end object
    TabControl=mTabControl
    // Reference: BTTPTopMenuSCHK'GUIWarfare_Decompressed.BTPageServerSelection.mTPTopMenu'
    begin object name="mTPTopMenu" class=GUIWarfareControls.BTTPTopMenuSCHK
        bUseAWinPos=true
        AWinPos=(X1=454.0000000,Y1=0.0000000,X2=1016.0000000,Y2=70.0000000)
    end object
    TPTopMenu=mTPTopMenu
    strButtonCredit="Creators"
    strPCBangFriend="PC Cafe Friend"
    HashMessage="Invalid protocol version. Please update."
    strCW_GameMode="Regular Clan Battle"
    fbLabelRoomName=(X1=10.0000000,Y1=15.0000000,X2=397.0000000,Y2=63.0000000)
    OnPreDraw=BTPageServerSelection.Internal_OnPreDraw
}