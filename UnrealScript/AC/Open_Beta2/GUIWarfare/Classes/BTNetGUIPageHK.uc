class BTNetGUIPageHK extends BTNetGUIPage
    editinlinenew
    instanced;

enum eEquipItemPos
{
    Pos_Helmet,                     // 0
    Pos_Face,                       // 1
    Pos_BackPack,                   // 2
    Pos_Pouch,                      // 3
    Pos_Camouflage,                 // 4
    Pos_CharAF,                     // 5
    Pos_CharRSA,                    // 6
    Pos_FakeLv                      // 7
};

var wMatchMaker MM;
var wGameManager GameMgr;
var string currentBGM;
var() automated FloatBox fbTPTopMenu;
var export editinline BTTPTopMenuHK TPTopMenu;
var int SkipTopMenuIndex;
var bool CloseLastMenu;
var() automated FloatBox fbLabelRoomName;
var export editinline BTOwnerDrawSourceClipImageHK LabelRoomName;
var() automated FloatBox fbLabelTitle;
var export editinline BTOwnerDrawImageHK LabelTitle;
var() automated FloatBox fbLabelLeftTopRoll;
var() automated FloatBox fbLabelLeftTopRollSource;
var export editinline BTOwnerDrawSourceClipImageHK LabelLeftTopRoll;
var() automated FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() automated FloatBox fbLabelBottomLine;
var export editinline BTLabelNoticeHK LabelBottomLine;
var() automated FloatBox fbLabelAAS;
var export editinline BTTPAASHK LabelAAS;
var bool bSkipInitializeDefaultPage;
var bool bFadeTimeTranslate;
var bool bUseTranslate;
var bool bCallFadeIn;
var bool bFading;
var bool bClosing;
var float FadeTime;
var float CurFadeTime;
var byte CurFade;
var byte DesiredFade;
var byte StartFade;
var() automated FloatBox fbNewBackground;
var export editinline BTOwnerDrawImageHK NewBackground;
var export editinline BTOwnerDrawImageHK WeaponListBg;
var() automated FloatBox fbWeaponListBg;
var localized string strWeaponList[6];
var array<export editinline BTOwnerDrawCaptionButtonHK> WeaponeTypeBtnList;
var bool bShowWeaponeTypeList;
var export editinline BTOwnerDrawImageHK SkillListBg;
var() automated FloatBox fbSkillListBg;
var localized string strSkillList[6];
var array<export editinline BTOwnerDrawCaptionButtonHK> SkillTypeBtnList;
var bool bShowSkillTypeList;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x2A
    if(SkipTopMenuIndex == btn.ButtonID)
    {
        return false;
    }
    switch(btn.ButtonID)
    {
        // End:0x64
        case int(TPTopMenu.0):
            page_Main.SetPage(20, CloseLastMenu);
            // End:0x30E
            break;
        // End:0x8E
        case int(TPTopMenu.1):
            page_Main.SetPage(21, CloseLastMenu);
            // End:0x30E
            break;
        // End:0xB8
        case int(TPTopMenu.2):
            page_Main.SetPage(22, CloseLastMenu);
            // End:0x30E
            break;
        // End:0x1DC
        case int(TPTopMenu.3):
            // End:0xF2
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, false);                
            }
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x30E
            break;
        // End:0x223
        case int(TPTopMenu.4):
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x30E
            break;
        // End:0x27A
        case int(TPTopMenu.5):
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, CloseLastMenu);
            // End:0x30E
            break;
        // End:0x2C8
        case int(TPTopMenu.6):
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x30E
            break;
        // End:0x2E1
        case int(TPTopMenu.7):
            OpenTodayResultPage();
            // End:0x30E
            break;
        // End:0x30B
        case int(TPTopMenu.8):
            page_Main.SetPage(27, CloseLastMenu);
            // End:0x30E
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

event Opened(GUIComponent Sender)
{
    FadeIn(bUseTranslate, false);
    super.Opened(Sender);
    // End:0x41
    if(TPTopMenu != none)
    {
        TPTopMenu.SetNewMailArrived(page_Main.bNewMailArrived);
    }
    //return;    
}

function RefreshPage()
{
    // End:0x29
    if(TPTopMenu != none)
    {
        TPTopMenu.SetNewMailArrived(page_Main.bNewMailArrived);
    }
    //return;    
}

function SetDefaultWeapon(int SlotIndex)
{
    switch(SlotIndex)
    {
        // End:0x6A
        case 0:
            GameMgr.ChangeInstance_DefaultWeapon(0);
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
            MM.kPrimaryID = GameMgr.GetMainWeaponID();
            // End:0xD0
            break;
        // End:0xCD
        case 1:
            GameMgr.ChangeInstance_DefaultWeapon(1);
            TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
            MM.kSecondaryID = GameMgr.GetSubWeaponID();
            // End:0xD0
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function InitializeDefaultPage()
{
    TPTopMenu = BTTPTopMenuHK(NewComponent(new Class'GUIWarfareControls.BTTPTopMenuHK', fbTPTopMenu, 1.0000000));
    LabelBottomLine.__OnNextNotice__Delegate = LabelBottomLine_OnNextNotice;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    //return;    
}

function bool ButtonTest_OnClick(GUIComponent Sender)
{
    page_Main.StartAutoMove(1, 0, 0);
    //return;    
}

function LabelBottomLine_OnNextNotice(string NextNotice)
{
    local BTConsole BTConsole;
    local wMatchMaker MM;

    Log("[BTNetGUIPageHK::LabelBottomLine_OnNextNotice] NextNotice=" $ NextNotice);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
    page_Main.AddChatLog(NextNotice, 5, true);
    //return;    
}

function LabelAAS_OnNextAAS(string NextAAS)
{
    local BTConsole BTConsole;
    local wMatchMaker MM;

    Log("[BTNetGUIPageHK::LabelAAS_OnNextAAS] NextAAS=" $ NextAAS);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK temp;

    super.InitComponent(MyController, myOwner);
    LabelTitle = NewLabelComponent(fbLabelTitle, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_Tilte, 0.9000000);
    LabelBottomLine = BTLabelNoticeHK(NewComponent(new Class'GUIWarfare_Decompressed.BTLabelNoticeHK', fbLabelBottomLine, 0.9000000));
    LabelBottomLine.FontColor[0].R = byte(255);
    LabelBottomLine.FontColor[0].G = 192;
    LabelBottomLine.FontColor[0].B = 0;
    LabelBottomLine.FontSize[0] = 9;
    LabelBottomLine.SetMainMenu(page_Main);
    LabelBottomLine.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty;
    // End:0xF8
    if(bSkipInitializeDefaultPage == false)
    {
        InitializeDefaultPage();
    }
    Controller.__PressedCloseWndBtn__Delegate = OpenTodayResultPage;
    i = 0;
    J0x113:

    // End:0x32D [Loop If]
    if(i < 6)
    {
        temp = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        temp.bVisible = false;
        temp.bUseAWinPos = true;
        temp.AWinPos.X1 = 603.0000000;
        temp.AWinPos.Y1 = 193.0000000 + float(i * 22);
        temp.AWinPos.X2 = 685.0000000;
        temp.AWinPos.Y2 = 215.0000000 + float(i * 22);
        temp.ApplyAWinPos();
        temp.RenderWeight = 1.0000000;
        temp.ButtonID = i;
        temp.Caption = strWeaponList[i];
        temp.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_n;
        temp.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.__OnClick__Delegate = WeaponListClick;
        temp.InitComponent(Controller, self);
        AppendComponent(temp);
        WeaponeTypeBtnList[WeaponeTypeBtnList.Length] = temp;
        i++;
        // [Loop Continue]
        goto J0x113;
    }
    fbWeaponListBg.Y2 = WeaponeTypeBtnList[WeaponeTypeBtnList.Length - 1].AWinPos.Y2 + float(5);
    WeaponListBg = NewLabelComponent(fbWeaponListBg, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_Bg, 0.9000000);
    WeaponListBg.bVisible = false;
    i = 0;
    J0x397:

    // End:0x5B1 [Loop If]
    if(i < 5)
    {
        temp = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        temp.bVisible = false;
        temp.bUseAWinPos = true;
        temp.AWinPos.X1 = 603.0000000;
        temp.AWinPos.Y1 = 193.0000000 + float(i * 22);
        temp.AWinPos.X2 = 685.0000000;
        temp.AWinPos.Y2 = 215.0000000 + float(i * 22);
        temp.ApplyAWinPos();
        temp.RenderWeight = 1.0000000;
        temp.ButtonID = i;
        temp.Caption = strSkillList[i];
        temp.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_n;
        temp.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.__OnClick__Delegate = SkillListClick;
        temp.InitComponent(Controller, self);
        AppendComponent(temp);
        SkillTypeBtnList[SkillTypeBtnList.Length] = temp;
        i++;
        // [Loop Continue]
        goto J0x397;
    }
    fbSkillListBg.Y2 = SkillTypeBtnList[SkillTypeBtnList.Length - 1].AWinPos.Y2 + float(5);
    SkillListBg = NewLabelComponent(fbSkillListBg, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_Bg, 0.9000000);
    SkillListBg.bVisible = false;
    //return;    
}

function bool WeaponListClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool SkillListClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool BTWIndowTodayResultHK_OnOK(GUIComponent Sender)
{
    Log("BTNetGUIPageHK::BTWIndowTodayResultHK_OnOK");
    // End:0x50
    if(int(page_Main.eCurrPage) <= int(3))
    {
        ExitGame();        
    }
    else
    {
        // End:0x86
        if(int(page_Main.eCurrPage) <= int(5))
        {
            page_Main.TcpLogin.sfReqLogOut(1);            
        }
        else
        {
            page_Main.TcpChannel.sfReqLogOut(1);
        }
    }
    BTWindowTodayResultHK(Controller.TopPage()).FadeOut();
    return true;
    //return;    
}

function OpenTodayResultPage()
{
    // End:0x79
    if(Controller.FindMenuByClass(Class'GUIWarfareControls.BTWindowTodayResultHK') == none)
    {
        // End:0x79
        if(Controller.OpenMenu("GUIWarfareControls.BTWIndowTodayResultHK"))
        {
            BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWIndowTodayResultHK_OnOK;
        }
    }
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

function bool Internal_OnPreDraw(Canvas C)
{
    local float fadeDirection;
    local byte fadeByte;

    CurrentCanvas = C;
    // End:0x18
    if(!bFading)
    {
        return false;
    }
    // End:0x1AA
    if(CurFadeTime < FadeTime)
    {
        // End:0x5F
        if((CurFadeTime + Controller.RenderDelta) >= FadeTime)
        {
            CurFadeTime = FadeTime;
            CurFade = DesiredFade;            
        }
        else
        {
            CurFadeTime += Controller.RenderDelta;
            CurFade = byte(float(StartFade) + (float(int(DesiredFade) - int(StartFade)) * (CurFadeTime / FadeTime)));
        }
        // End:0xCA
        if(bCallFadeIn)
        {
            fadeDirection = 1.0000000 - (CurFadeTime / FadeTime);            
        }
        else
        {
            fadeDirection = CurFadeTime / FadeTime;
        }
        fadeByte = byte((1.0000000 - fadeDirection) * 255.0000000);
        ActiveFadeColor = Class'Engine.Canvas'.static.MakeColorNoEmpty(fadeByte, fadeByte, fadeByte, fadeByte);
        // End:0x16B
        if(bFadeTimeTranslate)
        {
            AWinFrame.X1 = fadeDirection * float(1024);
            AWinFrame.X2 = (fadeDirection + float(1)) * float(1024);
            self.TraversalApplyAWinPos();
        }
        // End:0x1AA
        if(CurFadeTime >= FadeTime)
        {
            bFading = false;
            // End:0x1A0
            if(bClosing)
            {
                bClosing = false;
                FadedOut();                
            }
            else
            {
                FadedIn();
            }
        }
    }
    return false;
    //return;    
}

function FadeIn(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x57
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = true;
        bClosing = false;
        bFading = true;
        CurFadeTime = 0.0000000;
        DesiredFade = 100;
        StartFade = byte(255);
        bFadeTimeTranslate = bTranslate;        
    }
    else
    {
        FadedIn();
    }
    //return;    
}

function FadeOut(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x57
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = false;
        bFading = true;
        bClosing = true;
        CurFadeTime = 0.0000000;
        DesiredFade = byte(255);
        StartFade = 100;
        bFadeTimeTranslate = bTranslate;        
    }
    else
    {
        FadedOut();
    }
    //return;    
}

function Default_FadedOut()
{
    Controller.CloseMenuPage(self);
    //return;    
}

function SetVisibleWeaponeTypeBtnList(bool bVisible, bool bFocus)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(i < WeaponeTypeBtnList.Length)
    {
        WeaponeTypeBtnList[i].bVisible = bVisible;
        // End:0x5C
        if(bFocus)
        {
            WeaponeTypeBtnList[i].SetFocus(WeaponeTypeBtnList[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    WeaponListBg.bVisible = bVisible;
    //return;    
}

function SetVisibleSkillTypeBtnList(bool bVisible, bool bFocus)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(i < SkillTypeBtnList.Length)
    {
        SkillTypeBtnList[i].bVisible = bVisible;
        // End:0x5C
        if(bFocus)
        {
            SkillTypeBtnList[i].SetFocus(SkillTypeBtnList[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    SkillListBg.bVisible = bVisible;
    //return;    
}

function bool IsOpenPopupMenu()
{
    // End:0x28
    if(WeaponListBg.bVisible || SkillListBg.bVisible)
    {
        return true;
    }
    return false;
    //return;    
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageStore::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x74
    if(bCurLookingFor)
    {
        page_Main.TcpChannel.sfReqSetLookForClan(0);        
    }
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
    //return;    
}

function bool ClanMenu_ButtonFindClan_OnClick(GUIComponent Sender)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageStore::ClanMenu_ButtonFindClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowFindClanHK");
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    BTWindow.TcpChannel = page_Main.TcpChannel;
    BTWindow.__OnOK__Delegate = BTWindowFindClanHK_OnRequestJoin;
    BTWindow.ButtonInfo.__OnClick__Delegate = BTWindowFindClanHK_OnInfo;
    return true;
    //return;    
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageStore::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xF3
    if((ClanName != "none") && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    return true;
    //return;    
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageStore::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8B
    if((ClanName != "none") && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
    //return;    
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageStore::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
    //return;    
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xDA
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;        
    }
    else
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
    //return;    
}

function bool BTWindowCreateClanHK_OnOK(GUIComponent Sender)
{
    local string ClanName, Intro, Keyword;
    local int Region;

    Log("[BTPageStore::BTWindowCreateClanHK_OnOK]");
    // End:0x161
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        ClanName = BTWindowCreateClanHK(Controller.TopPage()).ClanName.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).ClanLocation.ComboBox.GetIndex();
        page_Main.SaveClanName = ClanName;
        page_Main.TcpChannel.sfReqCreateClan(ClanName, ClanName, Intro, Keyword, byte(Region));
        Controller.CloseMenu(false);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
    //return;    
}

function bool BTWindowInviteClan_OnOK(GUIComponent Sender)
{
    Log("[BTPageClanWar::BTWindowInviteClan_OnOK]");
    page_Main.TcpChannel.sfReqInviteClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    SkipTopMenuIndex=-1
    CloseLastMenu=true
    fbLabelRoomName=(X1=14.0000000,Y1=18.0000000,X2=272.0000000,Y2=68.0000000)
    fbLabelTitle=(X1=0.0000000,Y1=0.0000000,X2=289.0000000,Y2=75.0000000)
    fbLabelLeftTopRoll=(X1=0.0000000,Y1=0.0000000,X2=140.0000000,Y2=128.0000000)
    fbLabelLeftTopRollSource=(X1=116.0000000,Y1=128.0000000,X2=256.0000000,Y2=256.0000000)
    fbLabelTopLine=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=128.0000000)
    fbLabelBottomLine=(X1=18.0000000,Y1=751.0000000,X2=1006.0000000,Y2=765.0000000)
    fbLabelAAS=(X1=169.0000000,Y1=10.0000000,X2=511.0000000,Y2=67.0000000)
    FadeTime=0.3000000
    CurFade=255
    DesiredFade=100
    fbNewBackground=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=758.0000000)
    fbWeaponListBg=(X1=601.0000000,Y1=191.0000000,X2=687.0000000,Y2=305.0000000)
    strWeaponList[0]="All"
    strWeaponList[1]="Assault Rifle"
    strWeaponList[2]="SMG"
    strWeaponList[3]="Sniper Rifle"
    strWeaponList[4]="Shotgun"
    strWeaponList[5]="Machine Gun"
    fbSkillListBg=(X1=601.0000000,Y1=191.0000000,X2=687.0000000,Y2=305.0000000)
    strSkillList[0]="All"
    strSkillList[1]="Killstreak"
    strSkillList[2]="Scorestreak"
    strSkillList[3]="Assist"
    strSkillList[4]="Deathstreak"
    bPersistent=true
    bAllowedAsLast=true
    FadedOut=BTNetGUIPageHK.Default_FadedOut
    OnPreDraw=BTNetGUIPageHK.Internal_OnPreDraw
}