/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTNetGUIPageHK.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:36
 *	Functions:18
 *
 *******************************************************************************/
class BTNetGUIPageHK extends BTNetGUIPage
    dependson(BTLabelNoticeHK)
    editinlinenew
    instanced;

var wMatchMaker MM;
var wGameManager GameMgr;
var string currentBGM;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPTopMenu;
var export editinline BTTPTopMenuHK TPTopMenu;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelRoomName;
var export editinline BTOwnerDrawSourceClipImageHK LabelRoomName;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTitle;
var export editinline BTOwnerDrawImageHK LabelTitle;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLeftTopRoll;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLeftTopRollSource;
var export editinline BTOwnerDrawSourceClipImageHK LabelLeftTopRoll;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBottomLine;
var export editinline BTLabelNoticeHK LabelBottomLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelAAS;
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
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbNewBackground;
var export editinline BTOwnerDrawImageHK NewBackground;
var export editinline BTOwnerDrawImageHK WeaponListBg;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbWeaponListBg;
var localized string strWeaponList[6];
var array<export editinline BTOwnerDrawCaptionButtonHK> WeaponeTypeBtnList;
var bool bShowWeaponeTypeList;

event Opened(GUIComponent Sender)
{
    FadeIn(bUseTranslate, false);
    super.Opened(Sender);
    // End:0x41
    if(TPTopMenu != none)
    {
        TPTopMenu.SetNewMailArrived(page_Main.bNewMailArrived);
    }
}

function RefreshPage()
{
    // End:0x29
    if(TPTopMenu != none)
    {
        TPTopMenu.SetNewMailArrived(page_Main.bNewMailArrived);
    }
}

function SetDefaultWeapon(int SlotIndex)
{
    switch(SlotIndex)
    {
        // End:0x6a
        case 0:
            GameMgr.ChangeInstance_DefaultWeapon(0);
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
            MM.kPrimaryID = GameMgr.GetMainWeaponID();
            // End:0xd0
            break;
        // End:0xcd
        case 1:
            GameMgr.ChangeInstance_DefaultWeapon(1);
            TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
            MM.kSecondaryID = GameMgr.GetSubWeaponID();
            // End:0xd0
            break;
        // End:0xffff
        default:
}

function InitializeDefaultPage()
{
    TPTopMenu = BTTPTopMenuHK(NewComponent(new class'BTTPTopMenuHK', fbTPTopMenu, 1.0));
    LabelBottomLine.__OnNextNotice__Delegate = LabelBottomLine_OnNextNotice;
}

function bool ButtonTest_OnClick(GUIComponent Sender)
{
    page_Main.StartAutoMove(1, 0, 0);
}

function LabelBottomLine_OnNextNotice(string NextNotice)
{
    local BTConsole BTConsole;
    local wMatchMaker MM;

    Log("[BTNetGUIPageHK::LabelBottomLine_OnNextNotice] NextNotice=" $ NextNotice);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
    page_Main.AddChatLog(NextNotice, 5, true);
}

function LabelAAS_OnNextAAS(string NextAAS)
{
    local BTConsole BTConsole;
    local wMatchMaker MM;

    Log("[BTNetGUIPageHK::LabelAAS_OnNextAAS] NextAAS=" $ NextAAS);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK temp;

    super.InitComponent(MyController, myOwner);
    LabelTitle = NewLabelComponent(fbLabelTitle, class'BTUIResourcePoolHK'.default.img_Tilte, 0.90);
    LabelBottomLine = BTLabelNoticeHK(NewComponent(new class'BTLabelNoticeHK', fbLabelBottomLine, 0.90));
    LabelBottomLine.FontColor[0].R = byte(255);
    LabelBottomLine.FontColor[0].G = 192;
    LabelBottomLine.FontColor[0].B = 0;
    LabelBottomLine.FontSize[0] = 9;
    LabelBottomLine.SetMainMenu(page_Main);
    LabelBottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    // End:0xf8
    if(bSkipInitializeDefaultPage == false)
    {
        InitializeDefaultPage();
    }
    Controller.__PressedCloseWndBtn__Delegate = OpenTodayResultPage;
    i = 0;
    J0x113:
    // End:0x32d [While If]
    if(i < 6)
    {
        temp = new class'BTOwnerDrawCaptionButtonHK';
        temp.bVisible = false;
        temp.bUseAWinPos = true;
        temp.AWinPos.X1 = 603.0;
        temp.AWinPos.Y1 = 193.0 + float(i * 22);
        temp.AWinPos.X2 = 685.0;
        temp.AWinPos.Y2 = 215.0 + float(i * 22);
        temp.ApplyAWinPos();
        temp.RenderWeight = 1.0;
        temp.ButtonID = i;
        temp.Caption = strWeaponList[i];
        temp.buttonImage[0] = class'BTUIResourcePoolHK'.default.MainWeapon_List_n;
        temp.buttonImage[1] = class'BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[2] = class'BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[3] = class'BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[4] = class'BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[5] = class'BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.__OnClick__Delegate = WeaponListClick;
        temp.InitComponent(Controller, self);
        AppendComponent(temp);
        WeaponeTypeBtnList[WeaponeTypeBtnList.Length] = temp;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x113;
    }
    fbWeaponListBg.Y2 = WeaponeTypeBtnList[WeaponeTypeBtnList.Length - 1].AWinPos.Y2 + float(5);
    WeaponListBg = NewLabelComponent(fbWeaponListBg, class'BTUIResourcePoolHK'.default.MainWeapon_List_Bg, 0.90);
    WeaponListBg.bVisible = false;
}

function bool WeaponListClick(GUIComponent Sender)
{
    return true;
}

function bool BTWIndowTodayResultHK_OnOK(GUIComponent Sender)
{
    ExitGame();
    BTWindowTodayResultHK(Controller.TopPage()).FadeOut();
    return true;
}

function OpenTodayResultPage()
{
    // End:0x79
    if(Controller.FindMenuByClass(class'BTWindowTodayResultHK') == none)
    {
        // End:0x79
        if(Controller.OpenMenu("GUIWarfareControls.BTWIndowTodayResultHK"))
        {
            BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWIndowTodayResultHK_OnOK;
        }
    }
}

function ExitGame()
{
    local int i;

    PlayerOwner().SendWebLog(4130, -1);
    Log("[BTPageServerSelection::HeaderButton_OnClick] Exit!!!");
    Log("Exit Chat Log Message Start");
    i = 0;
    J0x76:
    // End:0xb4 [While If]
    if(i < page_Main.ChatLog.Length)
    {
        Log(page_Main.ChatLog[i].chatText);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x76;
    }
    Log("Exit Chat Log Message End");
    Controller.ConsoleCommand("exit");
}

function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new class'BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
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
    // End:0x1aa
    if(CurFadeTime < FadeTime)
    {
        // End:0x5f
        if(CurFadeTime + Controller.RenderDelta >= FadeTime)
        {
            CurFadeTime = FadeTime;
            CurFade = DesiredFade;
        }
        // End:0xa5
        else
        {
            CurFadeTime += Controller.RenderDelta;
            CurFade = byte(float(StartFade) + float(DesiredFade - StartFade) * CurFadeTime / FadeTime);
        }
        // End:0xca
        if(bCallFadeIn)
        {
            fadeDirection = 1.0 - CurFadeTime / FadeTime;
        }
        // End:0xdc
        else
        {
            fadeDirection = CurFadeTime / FadeTime;
        }
        fadeByte = byte(1.0 - fadeDirection * 255.0);
        ActiveFadeColor = class'Canvas'.static.MakeColorNoEmpty(fadeByte, fadeByte, fadeByte, fadeByte);
        // End:0x16b
        if(bFadeTimeTranslate)
        {
            AWinFrame.X1 = fadeDirection * float(1024);
            AWinFrame.X2 = fadeDirection + float(1) * float(1024);
            self.TraversalApplyAWinPos();
        }
        // End:0x1aa
        if(CurFadeTime >= FadeTime)
        {
            bFading = false;
            // End:0x1a0
            if(bClosing)
            {
                bClosing = false;
                FadedOut();
            }
            // End:0x1aa
            else
            {
                FadedIn();
            }
        }
    }
    return false;
}

function FadeIn(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x57
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = true;
        bClosing = false;
        bFading = true;
        CurFadeTime = 0.0;
        DesiredFade = 100;
        StartFade = byte(255);
        bFadeTimeTranslate = bTranslate;
    }
    // End:0x61
    else
    {
        FadedIn();
    }
}

function FadeOut(optional bool bTranslate, optional bool bChangeAlpha)
{
    // End:0x57
    if(Controller.bModulateStackedMenus)
    {
        bCallFadeIn = false;
        bFading = true;
        bClosing = true;
        CurFadeTime = 0.0;
        DesiredFade = byte(255);
        StartFade = 100;
        bFadeTimeTranslate = bTranslate;
    }
    // End:0x61
    else
    {
        FadedOut();
    }
}

function Default_FadedOut()
{
    Controller.CloseMenuPage(self);
}

defaultproperties
{
    fbLabelRoomName=(X1=14.0,Y1=18.0,X2=272.0,Y2=68.0)
    fbLabelTitle=(X1=0.0,Y1=0.0,X2=289.0,Y2=75.0)
    fbLabelLeftTopRoll=(X1=0.0,Y1=0.0,X2=140.0,Y2=128.0)
    fbLabelLeftTopRollSource=(X1=116.0,Y1=128.0,X2=256.0,Y2=256.0)
    fbLabelTopLine=(X1=0.0,Y1=0.0,X2=1024.0,Y2=128.0)
    fbLabelBottomLine=(X1=18.0,Y1=751.0,X2=1006.0,Y2=765.0)
    fbLabelAAS=(X1=169.0,Y1=10.0,X2=511.0,Y2=67.0)
    FadeTime=0.30
    CurFade=255
    DesiredFade=100
    fbNewBackground=(X1=0.0,Y1=0.0,X2=1024.0,Y2=758.0)
    fbWeaponListBg=(X1=601.0,Y1=191.0,X2=687.0,Y2=305.0)
    strWeaponList[0]="All"
    strWeaponList[1]="Assault Rifle"
    strWeaponList[2]="SMG"
    strWeaponList[3]="Sniper Rifle"
    strWeaponList[4]="Shotgun"
    strWeaponList[5]="Machine Gun"
    bPersistent=true
    bAllowedAsLast=true
    FadedOut=Default_FadedOut
    OnPreDraw=Internal_OnPreDraw
}