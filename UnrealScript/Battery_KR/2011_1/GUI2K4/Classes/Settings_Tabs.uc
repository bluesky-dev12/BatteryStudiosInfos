class Settings_Tabs extends UT2K4TabPanel
    editinlinenew
    instanced;

var export editinline GUIFooter t_Footer;
var export editinline UT2K4SettingsPage Setting;
var bool bAlwaysApply;
var bool bNeedApply;
var bool bExpert;
var string PerformanceWarningMenu;
var localized string PerformanceWarningText;
var float WarningCounter;
var float WarningLength;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x67
    if(UT2K4SettingsPage(myOwner.MenuOwner) != none)
    {
        Setting = UT2K4SettingsPage(myOwner.MenuOwner);
        bAlwaysApply = bAlwaysApply && Setting.bApplyImmediately;
        t_Footer = Setting.t_Footer;
    }
    super(GUIPanel).InitComponent(MyController, myOwner);
    //return;    
}

event Opened(GUIComponent Sender)
{
    // End:0x6F
    if(((Setting == none) || t_Footer == none) && UT2K4SettingsPage(Sender) != none)
    {
        Setting = UT2K4SettingsPage(Sender);
        bAlwaysApply = bAlwaysApply && Setting.bApplyImmediately;
        t_Footer = Setting.t_Footer;
    }
    super(GUIMultiComponent).Opened(Sender);
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x100
    if(bShow)
    {
        // End:0xCB
        if(Setting.b_Apply != none)
        {
            // End:0x70
            if(bAlwaysApply)
            {
                DisableComponent(Setting.b_Apply);
                Setting.b_Apply.Hide();
                Setting.GetSizingButton();                
            }
            else
            {
                Setting.b_Apply.Show();
                Setting.GetSizingButton();
                // End:0xB7
                if(bNeedApply)
                {
                    EnableComponent(Setting.b_Apply);                    
                }
                else
                {
                    DisableComponent(Setting.b_Apply);
                }
            }
        }
        Setting.t_Header.SetCaption((Setting.PageCaption @ "|") @ PanelCaption);        
    }
    else
    {
        // End:0x140
        if(!bAlwaysApply)
        {
            // End:0x138
            if(int(Setting.b_Apply.MenuState) != int(4))
            {
                bNeedApply = true;                
            }
            else
            {
                bNeedApply = false;
            }
        }
    }
    //return;    
}

function AcceptClicked()
{
    // End:0x1F
    if(!bAlwaysApply)
    {
        DisableComponent(Setting.b_Apply);
    }
    SaveSettings();
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIMultiComponent).Closed(Sender, bCancelled);
    // End:0x22
    if(bAlwaysApply)
    {
        AcceptClicked();
        return;
    }
    // End:0x33
    if(!bCancelled)
    {
        SaveSettings();
    }
    //return;    
}

function SaveSettings()
{
    //return;    
}

function ResetClicked()
{
    //return;    
}

function string GetNativeClassName(string VarName)
{
    local int i;
    local string str;

    str = PlayerOwner().ConsoleCommand(("get ini:" $ VarName) @ "Class");
    i = InStr(str, "'");
    // End:0x7D
    if(i != -1)
    {
        str = Mid(str, InStr(str, "'") + 1);
        str = Left(str, Len(str) - 1);
    }
    return str;
    //return;    
}

function ShowPerformanceWarning(optional float Seconds)
{
    // End:0x18
    if((Controller == none) || default.bExpert)
    {
        return;
    }
    // End:0x7C
    if(!Controller.OpenMenu(PerformanceWarningMenu, string(Seconds)))
    {
        // End:0x52
        if(Seconds <= 0.0000000)
        {
            Seconds = 3.5000000;
        }
        WarningLength = Seconds;
        WarningCounter = 0.0000000;
        SetTimer(0.1000000, true);
        __OnRendered__Delegate = DrawPerfWarn;
    }
    //return;    
}

event Timer()
{
    WarningCounter += 0.1000000;
    //return;    
}

function DrawPerfWarn(Canvas C)
{
    C.Style = 5;
    C.SetDrawColor(250, 250, 250, byte(float(255) * FMax((WarningLength - WarningCounter) / WarningLength, 0.0000000)));
    C.Font = Controller.GetMenuFont("UT2SmallHeaderFont").GetFont(C.SizeX);
    C.DrawTextJustified(PerformanceWarningText, 1, ActualLeft(), ActualTop(), ActualLeft() + ActualWidth(), (ActualTop() + ActualHeight()) * 0.8000000);
    // End:0xF8
    if(WarningCounter >= WarningLength)
    {
        WarningLength = 0.0000000;
        WarningCounter = 0.0000000;
        __OnRendered__Delegate = None;
        KillTimer();
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x35
    if(!bAlwaysApply && Setting.b_Apply != none)
    {
        EnableComponent(Setting.b_Apply);
    }
    //return;    
}

defaultproperties
{
    bAlwaysApply=true
    bExpert=true
    PerformanceWarningMenu="GUI2K4.UT2K4PerformWarn"
    PerformanceWarningText="??? ?? ??? ??? ??? ?? ? ????."
    FadeInTime=0.1500000
}