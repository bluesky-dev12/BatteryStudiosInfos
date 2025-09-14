class UT2K4SP_Details extends UT2k4MainPage
    config(User)
    editinlinenew
    instanced;

var() automated GUIButton btnClose;
var() automated GUIButton btnExport;
var() automated moCheckBox cbAlwaysShow;
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
    // End:0xB1
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
    //return;    
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
    //return;    
}

function bool btnCloseOnClick(GUIComponent Sender)
{
    return Controller.CloseMenu(true);
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    t_Header.SetCaption((PageCaption @ "|") @ GUITabButton(Sender).Caption);
    //return;    
}

function cbAlwaysShowOnChange(GUIComponent Sender)
{
    GP.bShowDetails = cbAlwaysShow.IsChecked();
    return;
    //return;    
}

function bool btnExportOnClick(GUIComponent Sender)
{
    local export editinline GUIQuestionPage QPage;
    local Class<SPProfileExporter> expclass;
    local SPProfileExporter Exporter;

    expclass = Class<SPProfileExporter>(DynamicLoadObject(ProfileExporter, Class'Core.Class'));
    // End:0x4C
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
    //return;    
}

function OnDetailClose(optional bool bCanceled)
{
    local export editinline UT2K4SP_Main Main;

    Main = UT2K4SP_Main(Controller.FindMenuByClass(Class'GUI2K4_Decompressed.UT2K4SP_Main'));
    // End:0x72
    if(Main != none)
    {
        // End:0x72
        if(Main.c_Tabs.PendingTab == none)
        {
            Main.c_Tabs.ActiveTab.MyPanel.ShowPanel(true);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Details.SPDbtnClose'
    begin object name="SPDbtnClose" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ???? ????"
        WinTop=0.9594790
        WinWidth=0.1200000
        WinHeight=0.0407030
        RenderWeight=1.0000000
        TabOrder=0
        bBoundToParent=true
        OnClick=UT2K4SP_Details.btnCloseOnClick
        OnKeyEvent=SPDbtnClose.InternalOnKeyEvent
    end object
    btnClose=SPDbtnClose
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Details.SPDbtnExport'
    begin object name="SPDbtnExport" class=XInterface.GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="????? ??? ?????."
        WinTop=0.9594790
        WinLeft=0.8800000
        WinWidth=0.1200000
        WinHeight=0.0407030
        RenderWeight=1.0000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SP_Details.btnExportOnClick
        OnKeyEvent=SPDbtnExport.InternalOnKeyEvent
    end object
    btnExport=SPDbtnExport
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4SP_Details.SPDcbAlwaysShow'
    begin object name="SPDcbAlwaysShow" class=XInterface.moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=SPDcbAlwaysShow.InternalOnCreateComponent
        WinTop=0.9661460
        WinLeft=0.0062500
        WinWidth=0.2890630
        RenderWeight=1.0000000
        TabOrder=2
        OnChange=UT2K4SP_Details.cbAlwaysShowOnChange
    end object
    cbAlwaysShow=SPDcbAlwaysShow
    PageCaption="???? ????"
    ProfileExported="???? ????? ?? ??? ?????:|%filename%"
    ProfileExporter="GUI2K4.SPProfileExporter"
    // Reference: GUIHeader'GUI2K4_Decompressed.UT2K4SP_Details.SPDhdrHeader'
    begin object name="SPDhdrHeader" class=XInterface.GUIHeader
        RenderWeight=0.3000000
    end object
    t_Header=SPDhdrHeader
    // Reference: ButtonFooter'GUI2K4_Decompressed.UT2K4SP_Details.SPDftrFooter'
    begin object name="SPDftrFooter" class=GUI2K4_Decompressed.ButtonFooter
        RenderWeight=0.3000000
        OnPreDraw=SPDftrFooter.InternalOnPreDraw
    end object
    t_Footer=SPDftrFooter
    PanelClass[0]="GUI2K4.UT2K4SPTab_DetailMatch"
    PanelClass[1]="GUI2K4.UT2K4SPTab_DetailEnemies"
    PanelClass[2]="GUI2K4.UT2K4SPTab_DetailPhantom"
    PanelCaption[0]="?? ??"
    PanelCaption[1]="?? ?"
    PanelCaption[2]="?? ???? ???"
    PanelHint[0]="????? ??? ?? ??? ??"
    PanelHint[1]="?? ?? ?? ??"
    PanelHint[2]="?? ??? ??? ?? ?? ??"
    bPersistent=false
    OnClose=UT2K4SP_Details.OnDetailClose
    bDrawFocusedLast=false
    OnPreDraw=UT2K4SP_Details.InternalOnPreDraw
}