class RemoteAdmin extends LargeWindow
    config(User)
    editinlinenew
    instanced;

var() automated GUITitleBar t_Title;
var() automated moComboBox co_Options;
var() automated moCheckBox ch_Autologout;
var() automated GUIImage i_Border;
var() noexport bool bLoggedIn;
var() config array<string> AdminOptionClass;
var() config bool bAutologout;
var() /*0x00000000-0x00000008*/ editconst noexport editinline AdminPanelBase ap_Active;
var() localized string LoggedInText;
var() localized string LoggedOutText;

event InitComponent(GUIController C, GUIComponent o)
{
    super(FloatingWindow).InitComponent(C, o);
    InitializePanels();
    //return;    
}

event Opened(GUIComponent Sender)
{
    super(PopupPageBase).Opened(Sender);
    Controller.__OnAdminReply__Delegate = InternalAdminReply;
    ReloadActivePanel();
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    // End:0x34
    if(bAutologout)
    {
        PlayerOwner().AdminCommand("AdminLogout");
    }
    Controller.__OnAdminReply__Delegate = None;
    //return;    
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
    //return;    
}

function InitializePanels()
{
    local int i;
    local Class<AdminPanelBase> PanelClass;

    co_Options.ResetComponent();
    i = 0;
    J0x16:

    // End:0x97 [Loop If]
    if(i < AdminOptionClass.Length)
    {
        // End:0x3B
        if(AdminOptionClass[i] == "")
        {
            // [Explicit Continue]
            goto J0x8D;
        }
        PanelClass = Class<AdminPanelBase>(DynamicLoadObject(AdminOptionClass[i], Class'Core.Class'));
        // End:0x8D
        if(PanelClass != none)
        {
            co_Options.AddItem(PanelClass.default.PanelCaption, new (none) PanelClass);
        }
        J0x8D:

        i++;
        // [Loop Continue]
        goto J0x16;
    }
    // End:0xC2
    if(IsAdmin())
    {
        co_Options.MyComboBox.List.SilentSetIndex(1);
    }
    //return;    
}

function ReloadActivePanel()
{
    local export editinline AdminPanelBase Panel;

    Panel = AdminPanelBase(co_Options.GetObject());
    // End:0x62
    if(Panel != none)
    {
        // End:0x3C
        if(ap_Active != none)
        {
            RemoveComponent(ap_Active, true);
        }
        ap_Active = AdminPanelBase(AppendComponent(Panel, true));
        ap_Active.ShowPanel();
    }
    //return;    
}

function bool IsAdmin()
{
    return ((PlayerOwner() != none) && PlayerOwner().PlayerReplicationInfo != none) && PlayerOwner().PlayerReplicationInfo.bAdmin;
    //return;    
}

function InternalAdminReply(string Reply)
{
    local int i;
    local array<string> Results;
    local string key, Value;

    // End:0x14
    if(Reply == "")
    {
        LoggedOut();
        return;
    }
    Log(("Received AdminReply '" $ Reply) $ "'");
    Split(Reply, ";", Results);
    i = 0;
    J0x4F:

    // End:0xCB [Loop If]
    if(i < Results.Length)
    {
        // End:0xC1
        if(Divide(Results[i], "=", key, Value))
        {
            // End:0xA5
            if((key ~= "name") && IsAdmin())
            {
                LoggedIn(Value);
                // [Explicit Continue]
                goto J0xC1;
            }
            // End:0xC1
            if(key ~= "adv")
            {
                SetAdvanced(bool(Value));
            }
        }
        J0xC1:

        i++;
        // [Loop Continue]
        goto J0x4F;
    }
    //return;    
}

function LoggedIn(string AdminName)
{
    t_Title.SetCaption(Repl(LoggedInText, "%name%", AdminName));
    EnableComponent(co_Options);
    // End:0x55
    if(!bLoggedIn)
    {
        bLoggedIn = true;
        ap_Active.LoggedIn(AdminName);
    }
    //return;    
}

function LoggedOut()
{
    bLoggedIn = false;
    ap_Active.LoggedOut();
    t_Title.SetCaption(LoggedOutText);
    co_Options.SetIndex(0);
    DisableComponent(co_Options);
    //return;    
}

function SetAdvanced(coerce bool bIsAdvanced)
{
    local int i;
    local export editinline AdminPanelBase P;

    i = 0;
    J0x07:

    // End:0x7B [Loop If]
    if(i < co_Options.ItemCount())
    {
        P = AdminPanelBase(co_Options.MyComboBox.List.GetObjectAtIndex(i));
        // End:0x71
        if(P != none)
        {
            P.SetAdvanced(bIsAdvanced);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    switch(Sender)
    {
        // End:0x18
        case co_Options:
            ReloadActivePanel();
            // End:0x3F
            break;
        // End:0x3C
        case ch_Autologout:
            bAutologout = ch_Autologout.IsChecked();
            SaveConfig();
            // End:0x3F
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

defaultproperties
{
    // Reference: moComboBox'GUI2K4_Decompressed.RemoteAdmin.OptionsCombo'
    begin object name="OptionsCombo" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.2700000
        Caption="??:"
        OnCreateComponent=OptionsCombo.InternalOnCreateComponent
        MenuState=4
        Hint="????? ?? ??? ?? ??? ?????"
        WinTop=0.0312490
        WinLeft=0.0106250
        WinWidth=0.5953110
        WinHeight=0.0781250
        bBoundToParent=true
        bScaleToParent=true
        OnChange=RemoteAdmin.InternalOnChange
    end object
    co_Options=OptionsCombo
    // Reference: moCheckBox'GUI2K4_Decompressed.RemoteAdmin.AutoLogout'
    begin object name="AutoLogout" class=XInterface.moCheckBox
        Caption="?? ????"
        OnCreateComponent=AutoLogout.InternalOnCreateComponent
        Hint="? ??? ??? ???? ???? ???? ??? ???."
        WinTop=0.0312490
        WinLeft=0.6687500
        WinWidth=0.3125000
        WinHeight=0.0781250
        OnChange=RemoteAdmin.InternalOnChange
    end object
    ch_Autologout=AutoLogout
    AdminOptionClass[0]="GUI2K4.AdminPanelLogin"
    AdminOptionClass[1]="GUI2K4.AdminPanelGeneral"
    AdminOptionClass[2]="GUI2K4.AdminPanelMaps"
    AdminOptionClass[3]="GUI2K4.AdminPanelPlayers"
    LoggedInText="?? ???? ??? ?????: '%name%'"
    LoggedOutText="??? ?? ?????"
}