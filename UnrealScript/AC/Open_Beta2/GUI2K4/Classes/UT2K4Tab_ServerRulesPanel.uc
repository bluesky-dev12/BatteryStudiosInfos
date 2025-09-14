class UT2K4Tab_ServerRulesPanel extends IAMultiColumnRulesPanel
    config(User)
    editinlinenew
    instanced;

var config bool bLANServer;
var() automated moCheckBox ch_Webadmin;
var() automated moCheckBox ch_LANServer;
var() automated moNumericEdit nu_Port;
var int Port;
var bool bWebadmin;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    lb_Rules.WinHeight = 0.8750080;
    ch_Advanced.WinWidth = 0.3312500;
    ch_Advanced.WinHeight = 0.0437500;
    ch_Advanced.WinLeft = 0.0731260;
    ch_Advanced.WinTop = 0.8900000;
    RemoveComponent(b_Symbols);
    i_bk.SetPosition(0.0005050, 0.0147330, 0.9969970, 0.8531230);
    lb_Rules.SetPosition(0.0249120, 0.0663440, 0.9501750, 0.7354990);
    //return;    
}

protected function bool ShouldDisplayRule(int Index)
{
    // End:0x35
    if(GamePI.Settings[Index].bAdvanced && !Controller.bExpertMode)
    {
        return false;
    }
    return GamePI.Settings[Index].bMPOnly;
    //return;    
}

protected function SetGamePI()
{
    GamePI = p_Anchor.RuleInfo;
    GamePI.Sort(6);
    //return;    
}

function Change(GUIComponent Sender)
{
    // End:0x2E
    if(Sender == ch_Webadmin)
    {
        bWebadmin = ch_Webadmin.IsChecked();
        UpdatePortState();        
    }
    else
    {
        // End:0x59
        if(Sender == ch_LANServer)
        {
            bLANServer = ch_LANServer.IsChecked();
            SaveConfig();            
        }
        else
        {
            // End:0x7D
            if(Sender == nu_Port)
            {
                Port = nu_Port.GetValue();
            }
        }
    }
    //return;    
}

function string Play()
{
    local bool B;

    // End:0x38
    if(bWebadmin != Class'UWeb.WebServer'.default.bEnabled)
    {
        Class'UWeb.WebServer'.default.bEnabled = bWebadmin;
        B = true;
    }
    // End:0x6C
    if(Port != Class'UWeb.WebServer'.default.ListenPort)
    {
        Class'UWeb.WebServer'.default.ListenPort = Port;
        B = true;
    }
    // End:0x84
    if(B)
    {
        Class'UWeb.WebServer'.static.StaticSaveConfig();
    }
    // End:0x99
    if(bLANServer)
    {
        return " -lanplay";
    }
    return "";
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    switch(Sender)
    {
        // End:0x43
        case ch_Webadmin:
            bWebadmin = Class'UWeb.WebServer'.default.bEnabled;
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
            Port = Class'UWeb.WebServer'.default.ListenPort;
            nu_Port.SetValue(Port);
            // End:0x99
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function UpdateBotSetting(int i)
{
    //return;    
}

function UpdateSymbolButton()
{
    //return;    
}

function UpdatePortState()
{
    // End:0x17
    if(bWebadmin)
    {
        EnableComponent(nu_Port);        
    }
    else
    {
        DisableComponent(nu_Port);
    }
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local bool B;

    super(GUIMultiComponent).Closed(Sender, bCancelled);
    // End:0x49
    if(bWebadmin != Class'UWeb.WebServer'.default.bEnabled)
    {
        Class'UWeb.WebServer'.default.bEnabled = bWebadmin;
        B = true;
    }
    // End:0x7D
    if(Port != Class'UWeb.WebServer'.default.ListenPort)
    {
        Class'UWeb.WebServer'.default.ListenPort = Port;
        B = true;
    }
    // End:0x95
    if(B)
    {
        Class'UWeb.WebServer'.static.StaticSaveConfig();
    }
    //return;    
}

defaultproperties
{
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_ServerRulesPanel.EnableWebadmin'
    begin object name="EnableWebadmin" class=XInterface.moCheckBox
        Caption="? ?? ??"
        OnCreateComponent=EnableWebadmin.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ? ?? ?? ?? ?? ??"
        WinTop=0.8933340
        WinLeft=0.5868740
        WinWidth=0.2950630
        WinHeight=0.0437500
        TabOrder=4
        OnChange=UT2K4Tab_ServerRulesPanel.Change
        OnLoadINI=UT2K4Tab_ServerRulesPanel.InternalOnLoadINI
    end object
    ch_Webadmin=EnableWebadmin
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_ServerRulesPanel.LANServer'
    begin object name="LANServer" class=XInterface.moCheckBox
        Caption="? ??"
        OnCreateComponent=LANServer.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ???? ?? ??? ??? ???? ??? ??????. ?? ? ??? ????? ??? ? ??? ???? ?? ? ??? ?????!"
        WinTop=0.9533340
        WinLeft=0.0731260
        WinWidth=0.3312500
        WinHeight=0.0437500
        TabOrder=3
        OnChange=UT2K4Tab_ServerRulesPanel.Change
        OnLoadINI=UT2K4Tab_ServerRulesPanel.InternalOnLoadINI
    end object
    ch_LANServer=LANServer
    // Reference: moNumericEdit'GUI2K4_Decompressed.UT2K4Tab_ServerRulesPanel.WebadminPort'
    begin object name="WebadminPort" class=XInterface.moNumericEdit
        MinValue=1
        MaxValue=65536
        CaptionWidth=0.7000000
        ComponentWidth=0.3000000
        Caption="? ?? ??"
        OnCreateComponent=WebadminPort.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ?? ??? ??? ??? ?????"
        WinTop=0.9533340
        WinLeft=0.5868740
        WinWidth=0.2950630
        WinHeight=0.0437500
        TabOrder=5
        OnChange=UT2K4Tab_ServerRulesPanel.Change
        OnLoadINI=UT2K4Tab_ServerRulesPanel.InternalOnLoadINI
    end object
    nu_Port=WebadminPort
}