class BTPageOption extends BTNetGUIPage
    editinlinenew
    instanced;

var() automated BTBackgroundImage BackgroundImg;
var() automated BTLogo Logo;
var() automated BTInputImage BorderTitle;
var() automated FloatingImage Title;
var() automated BTBoxImage BorderPanel;
var() automated BTTailImage TailLeft;
var() automated BTTailImage TailRight;
var() automated GUIButton ButtonReset;
var() automated GUIButton ButtonOK;
var() automated GUIButton ButtonCancel;
var() automated GUIButton TabButtonGraphic;
var() automated GUIButton TabButtonSound;
var() automated GUIButton TabButtonControl;
var() automated GUIButton TabButtonCommunity;
var() automated GUIButton TabButtonEtc;
var() automated BTPageOption_Graphic PanelGraphic;
var() automated BTPageOption_Community PanelCommunity;
var() automated BTPageOption_ETC PanelETC;
var() automated BTPageOption_Control PanelControl;
var() automated BTPageOption_Sound PanelSound;
var() automated TabControlMocker TabControlMain;
var localized string CaptionGraphic;
var localized string CaptionSound;
var localized string CaptionControl;
var localized string CaptionCommunity;
var localized string CaptionEtc;
var localized string CaptionReset;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Log("[BTPageOption::InitComponent]");
    ApplyLocalizedStrings();
    TabControlMain.BindTabButtonAndPanel(TabButtonGraphic, PanelGraphic);
    TabControlMain.BindTabButtonAndPanel(TabButtonCommunity, PanelCommunity);
    TabControlMain.BindTabButtonAndPanel(TabButtonEtc, PanelETC);
    TabControlMain.BindTabButtonAndPanel(TabButtonControl, PanelControl);
    TabControlMain.BindTabButtonAndPanel(TabButtonSound, PanelSound);
    TabControlMain.SetVisiblePanel(0);
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    return none;
    //return;    
}

function ApplyLocalizedStrings()
{
    local GlobalLocalization gloc;

    gloc = new Class'Engine.GlobalLocalization';
    TabButtonGraphic.Caption = CaptionGraphic;
    TabButtonSound.Caption = CaptionSound;
    TabButtonControl.Caption = CaptionControl;
    TabButtonCommunity.Caption = CaptionCommunity;
    TabButtonEtc.Caption = CaptionEtc;
    ButtonReset.Caption = CaptionReset;
    ButtonOK.Caption = gloc.CaptionOK;
    ButtonCancel.Caption = gloc.CaptionCancel;
    //return;    
}

function InternalOnOpen()
{
    Log("[BTPageOption::InternalOnOpen]");
    //return;    
}

function bool ButtonReset_OnClick(GUIComponent Sender)
{
    Log("[BTPageOption::ButtonReset_OnClick]");
    PanelGraphic.ResetSettings();
    PanelCommunity.ResetSettings();
    PanelControl.ResetSettings();
    PanelSound.ResetSettings();
    PanelETC.ResetSettings();
    return true;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local PlayerController PC;

    Log("[BTPageOption::ButtonOK_OnClick]");
    PC = PlayerOwner();
    // End:0x60
    if(PanelGraphic.SaveSettings())
    {
        PC.ConsoleCommand("RELOADRESOURCES");
    }
    PanelCommunity.SaveSettings();
    PanelETC.SaveSettings();
    PanelControl.SaveSettings();
    PanelSound.SaveSettings();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("[BTPageOption::ButtonCancel_OnClick]");
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    OnClose(bCanceled);
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
    //return;    
}

defaultproperties
{
    CaptionGraphic="???"
    CaptionSound="???"
    CaptionControl="???"
    CaptionCommunity="????"
    CaptionEtc="??"
    CaptionReset="???"
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTPageOption.InternalOnOpen
    OnClose=BTPageOption.InternalOnClose
    OnKeyEvent=BTPageOption.internalKeyEvent
}