class BTNetGUIPageHK extends BTNetGUIPage
    editinlinenew
    instanced;

var wMatchMaker MM;
var wGameManager GameMgr;
var string currentBGM;
var() automated FloatBox fbTPTopMenu;
var export editinline BTTPTopMenuHK TPTopMenu;
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
    //return;    
}

function bool ButtonTest_OnClick(GUIComponent Sender)
{
    page_Main.StartAutoMove(1, 0, 0);
    //return;    
}

function LabelBottomLine_OnNextNotice(string NextNotice)
{
    local MessageItem msgItem;
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
    local MessageItem msgItem;
    local BTConsole BTConsole;
    local wMatchMaker MM;

    Log("[BTNetGUIPageHK::LabelAAS_OnNextAAS] NextAAS=" $ NextAAS);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
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
    //return;    
}

function bool BTWIndowTodayResultHK_OnOK(GUIComponent Sender)
{
    ExitGame();
    BTWindowTodayResultHK(Controller.TopPage()).FadeOut();
    return true;
    //return;    
}

function OpenTodayResultPage()
{
    // End:0x76
    if(Controller.FindMenuByClass(Class'GUIWarfareControls.BTWindowTodayResultHK') == none)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWIndowTodayResultHK");
        BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWIndowTodayResultHK_OnOK;
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

defaultproperties
{
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
    bPersistent=true
    bAllowedAsLast=true
    FadedOut=BTNetGUIPageHK.Default_FadedOut
    OnPreDraw=BTNetGUIPageHK.Internal_OnPreDraw
}