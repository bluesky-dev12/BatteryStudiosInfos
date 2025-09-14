/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_ServerRulesPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:10
 *
 *******************************************************************************/
class UT2K4Tab_ServerRulesPanel extends IAMultiColumnRulesPanel
    dependson(IAMultiColumnRulesPanel)
    config(User)
    editinlinenew
    instanced;

var config bool bLANServer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Webadmin;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_LANServer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moNumericEdit nu_Port;
var int Port;
var bool bWebadmin;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    lb_Rules.WinHeight = 0.8750080;
    ch_Advanced.WinWidth = 0.331250;
    ch_Advanced.WinHeight = 0.043750;
    ch_Advanced.WinLeft = 0.0731260;
    ch_Advanced.WinTop = 0.890;
    RemoveComponent(b_Symbols);
    i_bk.SetPosition(0.0005050, 0.0147330, 0.9969970, 0.8531230);
    lb_Rules.SetPosition(0.0249120, 0.0663440, 0.9501750, 0.7354990);
}

protected function bool ShouldDisplayRule(int Index)
{
    // End:0x35
    if(GamePI.Settings[Index].bAdvanced && !Controller.bExpertMode)
    {
        return false;
    }
    return GamePI.Settings[Index].bMPOnly;
}

protected function SetGamePI()
{
    GamePI = p_Anchor.RuleInfo;
    GamePI.Sort(6);
}

function Change(GUIComponent Sender)
{
    // End:0x2e
    if(Sender == ch_Webadmin)
    {
        bWebadmin = ch_Webadmin.IsChecked();
        UpdatePortState();
    }
    // End:0x7d
    else
    {
        // End:0x59
        if(Sender == ch_LANServer)
        {
            bLANServer = ch_LANServer.IsChecked();
            SaveConfig();
        }
        // End:0x7d
        else
        {
            // End:0x7d
            if(Sender == nu_Port)
            {
                Port = nu_Port.GetValue();
            }
        }
    }
}

function string Play()
{
    local bool B;

    // End:0x38
    if(bWebadmin != class'WebServer'.default.bEnabled)
    {
        class'WebServer'.default.bEnabled = bWebadmin;
        B = true;
    }
    // End:0x6c
    if(Port != class'WebServer'.default.ListenPort)
    {
        class'WebServer'.default.ListenPort = Port;
        B = true;
    }
    // End:0x84
    if(B)
    {
        class'WebServer'.static.StaticSaveConfig();
    }
    // End:0x99
    if(bLANServer)
    {
        return " -lanplay";
    }
    return "";
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    switch(Sender)
    {
        // End:0x43
        case ch_Webadmin:
            bWebadmin = class'WebServer'.default.bEnabled;
            ch_Webadmin.Checked(bWebadmin);
            UpdatePortState();
            // End:0x99
            break;
        // End:0x63
        case ch_LANServer:
            ch_LANServer.Checked(bLANServer);
            // End:0x99
            break;
        // End:0x96
        case nu_Port:
            Port = class'WebServer'.default.ListenPort;
            nu_Port.SetValue(Port);
            // End:0x99
            break;
        // End:0xffff
        default:
}

function UpdateBotSetting(int i);
function UpdateSymbolButton();
function UpdatePortState()
{
    // End:0x17
    if(bWebadmin)
    {
        EnableComponent(nu_Port);
    }
    // End:0x22
    else
    {
        DisableComponent(nu_Port);
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local bool B;

    super(GUIMultiComponent).Closed(Sender, bCancelled);
    // End:0x49
    if(bWebadmin != class'WebServer'.default.bEnabled)
    {
        class'WebServer'.default.bEnabled = bWebadmin;
        B = true;
    }
    // End:0x7d
    if(Port != class'WebServer'.default.ListenPort)
    {
        class'WebServer'.default.ListenPort = Port;
        B = true;
    }
    // End:0x95
    if(B)
    {
        class'WebServer'.static.StaticSaveConfig();
    }
}

defaultproperties
{
    begin object name=EnableWebadmin class=moCheckBox
        Caption="? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ? ?? ?? ?? ?? ??"
        WinTop=0.8933340
        WinLeft=0.5868740
        WinWidth=0.2950630
        WinHeight=0.043750
        TabOrder=4
        OnChange=Change
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_ServerRulesPanel.EnableWebadmin'
    ch_Webadmin=EnableWebadmin
    begin object name=LANServer class=moCheckBox
        Caption="? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ???? ?? ??? ??? ???? ??? ??????. ?? ? ??? ????? ??? ? ??? ???? ?? ? ??? ?????!"
        WinTop=0.9533340
        WinLeft=0.0731260
        WinWidth=0.331250
        WinHeight=0.043750
        TabOrder=3
        OnChange=Change
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_ServerRulesPanel.LANServer'
    ch_LANServer=LANServer
    begin object name=WebadminPort class=moNumericEdit
        MinValue=1
        MaxValue=65536
        CaptionWidth=0.70
        ComponentWidth=0.30
        Caption="? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ?? ??? ??? ??? ?????"
        WinTop=0.9533340
        WinLeft=0.5868740
        WinWidth=0.2950630
        WinHeight=0.043750
        TabOrder=5
        OnChange=Change
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moNumericEdit'UT2K4Tab_ServerRulesPanel.WebadminPort'
    nu_Port=WebadminPort
}