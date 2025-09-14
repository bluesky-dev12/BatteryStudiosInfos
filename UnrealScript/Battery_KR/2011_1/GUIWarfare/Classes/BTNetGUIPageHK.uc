class BTNetGUIPageHK extends BTNetGUIPage
    editinlinenew
    instanced;

var wMatchMaker MM;
var wGameManager GameMgr;
var string currentBGM;
var() automated FloatBox fbTPTopMenu;
var export editinline BTTPTopMenuHK TPTopMenu;
var() automated FloatBox fbLabelBackground;
var export editinline BTOwnerDrawImageHK LabelBackground;
var() automated FloatBox fbLabelRoomName;
var export editinline BTOwnerDrawSourceClipImageHK LabelRoomName;
var() automated FloatBox fbLabelLeftTopRoll;
var() automated FloatBox fbLabelLeftTopRollSource;
var export editinline BTOwnerDrawSourceClipImageHK LabelLeftTopRoll;
var() automated FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() automated FloatBox fbLabelBottomLine;
var export editinline BTLabelNoticeHK LabelBottomLine;
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

event Opened(GUIComponent Sender)
{
    FadeIn(bUseTranslate, false);
    super.Opened(Sender);
    TPTopMenu.SetNewMailArrived(page_Main.bNewMailArrived);
    //return;    
}

function RefreshPage()
{
    TPTopMenu.SetNewMailArrived(page_Main.bNewMailArrived);
    //return;    
}

function InitializeDefaultPage()
{
    TPTopMenu = BTTPTopMenuHK(NewComponent(new Class'GUIWarfareControls.BTTPTopMenuHK', fbTPTopMenu, 1.0000000));
    LabelBackground = NewLabelComponent(fbLabelBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_back1, 0.0001000);
    LabelTopLine = NewLabelComponent(fbLabelTopLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_top_default, 0.0001300);
    LabelBottomLine = BTLabelNoticeHK(NewComponent(new Class'GUIWarfare_Decompressed.BTLabelNoticeHK', fbLabelBottomLine, 0.0200000));
    LabelBottomLine.SetMainMenu(page_Main);
    LabelBottomLine.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_upper;
    LabelRoomName = BTOwnerDrawSourceClipImageHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawSourceClipImageHK', fbLabelRoomName, 0.0200000));
    LabelRoomName.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_page_thema;
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x22
    if(bSkipInitializeDefaultPage == false)
    {
        InitializeDefaultPage();
    }
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
    fbTPTopMenu=(X1=442.0000000,Y1=6.0000000,X2=1016.0000000,Y2=70.0000000)
    fbLabelBackground=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=758.0000000)
    fbLabelRoomName=(X1=10.0000000,Y1=15.0000000,X2=290.0000000,Y2=63.0000000)
    fbLabelLeftTopRoll=(X1=0.0000000,Y1=0.0000000,X2=140.0000000,Y2=128.0000000)
    fbLabelLeftTopRollSource=(X1=116.0000000,Y1=128.0000000,X2=256.0000000,Y2=256.0000000)
    fbLabelTopLine=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=128.0000000)
    fbLabelBottomLine=(X1=0.0000000,Y1=736.0000000,X2=1024.0000000,Y2=768.0000000)
    FadeTime=0.3000000
    CurFade=255
    DesiredFade=100
    bPersistent=true
    bAllowedAsLast=true
    FadedOut=BTNetGUIPageHK.Default_FadedOut
    OnPreDraw=BTNetGUIPageHK.Internal_OnPreDraw
}