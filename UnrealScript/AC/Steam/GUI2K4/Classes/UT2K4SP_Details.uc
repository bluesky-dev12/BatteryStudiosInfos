/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_Details.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:7
 *
 *******************************************************************************/
class UT2K4SP_Details extends UT2k4MainPage
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnClose;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnExport;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbAlwaysShow;
var localized string PageCaption;
var localized string ProfileExported;
var globalconfig string ProfileExporter;
var UT2K4GameProfile GP;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline UT2K4SPTab_DetailEnemies detab;

    super.InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    t_Header.SetCaption(PageCaption);
    c_Tabs.AddTab(PanelCaption[0], PanelClass[0],, PanelHint[0], true);
    // End:0xb1
    if(GP.PhantomMatches.Length > 0)
    {
        c_Tabs.AddTab(PanelCaption[2], PanelClass[2],, PanelHint[2], false);
    }
    detab = UT2K4SPTab_DetailEnemies(c_Tabs.AddTab(PanelCaption[1], PanelClass[1],, PanelHint[1], false));
    // End:0x115
    if(detab.TeamStats.Length == 0)
    {
        c_Tabs.RemoveTab(, detab.MyButton);
    }
    cbAlwaysShow.Checked(GP.bShowDetails);
}

function bool InternalOnPreDraw(Canvas Canvas)
{
    local float XL, YL;

    btnExport.Style.TextSize(Canvas, btnExport.MenuState, btnExport.Caption, XL, YL, btnExport.FontScale);
    btnClose.WinWidth = XL + float(32);
    btnClose.WinLeft = Canvas.ClipX - btnClose.WinWidth;
    btnExport.WinWidth = XL + float(32);
    btnExport.WinLeft = btnClose.WinLeft - btnExport.WinWidth;
    return false;
}

function bool btnCloseOnClick(GUIComponent Sender)
{
    return Controller.CloseMenu(true);
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    t_Header.SetCaption(PageCaption @ "|" @ GUITabButton(Sender).Caption);
}

function cbAlwaysShowOnChange(GUIComponent Sender)
{
    GP.bShowDetails = cbAlwaysShow.IsChecked();
    return;
}

function bool btnExportOnClick(GUIComponent Sender)
{
    local export editinline GUIQuestionPage QPage;
    local class<SPProfileExporter> expclass;
    local SPProfileExporter Exporter;

    expclass = class<SPProfileExporter>(DynamicLoadObject(ProfileExporter, class'Class'));
    // End:0x4c
    if(expclass == none)
    {
        Warn("Invalid profile exporter:" @ ProfileExporter);
        return true;
    }
    Exporter = new expclass;
    Exporter.Create(GP, PlayerOwner().Level);
    Exporter.ExportProfile();
    // End:0x103
    if(Controller.OpenMenu(Controller.QuestionMenuClass))
    {
        QPage = GUIQuestionPage(Controller.TopPage());
        QPage.SetupQuestion(QPage.Replace(ProfileExported, "%filename%", Exporter.ResultFile), 1);
    }
    return true;
}

function OnDetailClose(optional bool bCanceled)
{
    local export editinline UT2K4SP_Main Main;

    Main = UT2K4SP_Main(Controller.FindMenuByClass(class'UT2K4SP_Main'));
    // End:0x72
    if(Main != none)
    {
        // End:0x72
        if(Main.c_Tabs.PendingTab == none)
        {
            Main.c_Tabs.ActiveTab.MyPanel.ShowPanel(true);
        }
    }
}

defaultproperties
{
    begin object name=SPDbtnClose class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ???? ????"
        WinTop=0.9594790
        WinWidth=0.120
        WinHeight=0.0407030
        RenderWeight=1.0
        TabOrder=0
        bBoundToParent=true
        OnClick=btnCloseOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Details.SPDbtnClose'
    btnClose=SPDbtnClose
    begin object name=SPDbtnExport class=GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="????? ??? ?????."
        WinTop=0.9594790
        WinLeft=0.880
        WinWidth=0.120
        WinHeight=0.0407030
        RenderWeight=1.0
        TabOrder=1
        bBoundToParent=true
        OnClick=btnExportOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Details.SPDbtnExport'
    btnExport=SPDbtnExport
    begin object name=SPDcbAlwaysShow class=moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.9661460
        WinLeft=0.006250
        WinWidth=0.2890630
        RenderWeight=1.0
        TabOrder=2
        OnChange=cbAlwaysShowOnChange
    object end
    // Reference: moCheckBox'UT2K4SP_Details.SPDcbAlwaysShow'
    cbAlwaysShow=SPDcbAlwaysShow
    PageCaption="???? ????"
    ProfileExported="???? ????? ?? ??? ?????:|%filename%"
    ProfileExporter="GUI2K4.SPProfileExporter"
    begin object name=SPDhdrHeader class=GUIHeader
        RenderWeight=0.30
    object end
    // Reference: GUIHeader'UT2K4SP_Details.SPDhdrHeader'
    t_Header=SPDhdrHeader
    begin object name=SPDftrFooter class=ButtonFooter
        RenderWeight=0.30
        OnPreDraw=InternalOnPreDraw
    object end
    // Reference: ButtonFooter'UT2K4SP_Details.SPDftrFooter'
    t_Footer=SPDftrFooter
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    bPersistent=true
    OnClose=OnDetailClose
    bDrawFocusedLast=true
    OnPreDraw=InternalOnPreDraw
}