/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\Settings_Tabs.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:12
 *
 *******************************************************************************/
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
}

event Opened(GUIComponent Sender)
{
    // End:0x6f
    if(Setting == none || t_Footer == none && UT2K4SettingsPage(Sender) != none)
    {
        Setting = UT2K4SettingsPage(Sender);
        bAlwaysApply = bAlwaysApply && Setting.bApplyImmediately;
        t_Footer = Setting.t_Footer;
    }
    super(GUIMultiComponent).Opened(Sender);
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x100
    if(bShow)
    {
        // End:0xcb
        if(Setting.b_Apply != none)
        {
            // End:0x70
            if(bAlwaysApply)
            {
                DisableComponent(Setting.b_Apply);
                Setting.b_Apply.Hide();
                Setting.GetSizingButton();
            }
            // End:0xcb
            else
            {
                Setting.b_Apply.Show();
                Setting.GetSizingButton();
                // End:0xb7
                if(bNeedApply)
                {
                    EnableComponent(Setting.b_Apply);
                }
                // End:0xcb
                else
                {
                    DisableComponent(Setting.b_Apply);
                }
            }
        }
        Setting.t_Header.SetCaption(Setting.PageCaption @ "|" @ PanelCaption);
    }
    // End:0x140
    else
    {
        // End:0x140
        if(!bAlwaysApply)
        {
            // End:0x138
            if(Setting.b_Apply.MenuState != 4)
            {
                bNeedApply = true;
            }
            // End:0x140
            else
            {
                bNeedApply = false;
            }
        }
    }
}

function AcceptClicked()
{
    // End:0x1f
    if(!bAlwaysApply)
    {
        DisableComponent(Setting.b_Apply);
    }
    SaveSettings();
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
}

function SaveSettings();
function ResetClicked();
function string GetNativeClassName(string VarName)
{
    local int i;
    local string str;

    str = PlayerOwner().ConsoleCommand("get ini:" $ VarName @ "Class");
    i = InStr(str, "'");
    // End:0x7d
    if(i != -1)
    {
        str = Mid(str, InStr(str, "'") + 1);
        str = Left(str, Len(str) - 1);
    }
    return str;
}

function ShowPerformanceWarning(optional float Seconds)
{
    // End:0x18
    if(Controller == none || default.bExpert)
    {
        return;
    }
    // End:0x7c
    if(!Controller.OpenMenu(PerformanceWarningMenu, string(Seconds)))
    {
        // End:0x52
        if(Seconds <= 0.0)
        {
            Seconds = 3.50;
        }
        WarningLength = Seconds;
        WarningCounter = 0.0;
        SetTimer(0.10, true);
        __OnRendered__Delegate = DrawPerfWarn;
    }
}

event Timer()
{
    WarningCounter += 0.10;
}

function DrawPerfWarn(Canvas C)
{
    C.Style = 5;
    C.SetDrawColor(250, 250, 250, byte(float(255) * FMax(WarningLength - WarningCounter / WarningLength, 0.0)));
    C.Font = Controller.GetMenuFont("UT2SmallHeaderFont").GetFont(C.SizeX);
    C.DrawTextJustified(PerformanceWarningText, 1, ActualLeft(), ActualTop(), ActualLeft() + ActualWidth(), ActualTop() + ActualHeight() * 0.80);
    // End:0xf8
    if(WarningCounter >= WarningLength)
    {
        WarningLength = 0.0;
        WarningCounter = 0.0;
        __OnRendered__Delegate = None;
        KillTimer();
    }
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x35
    if(!bAlwaysApply && Setting.b_Apply != none)
    {
        EnableComponent(Setting.b_Apply);
    }
}

defaultproperties
{
    bAlwaysApply=true
    bExpert=true
    PerformanceWarningMenu="GUI2K4.UT2K4PerformWarn"
    PerformanceWarningText="??? ?? ??? ??? ??? ?? ? ????."
    FadeInTime=0.150
}