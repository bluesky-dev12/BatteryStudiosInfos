/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\RemoteAdmin.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:12
 *
 *******************************************************************************/
class RemoteAdmin extends LargeWindow
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITitleBar t_Title;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Options;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Autologout;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Border;
var() noexport bool bLoggedIn;
var() config array<string> AdminOptionClass;
var() config bool bAutologout;
var() editconst noexport editinline AdminPanelBase ap_Active;
var() localized string LoggedInText;
var() localized string LoggedOutText;

event InitComponent(GUIController C, GUIComponent o)
{
    super(FloatingWindow).InitComponent(C, o);
    InitializePanels();
}

event Opened(GUIComponent Sender)
{
    super(PopupPageBase).Opened(Sender);
    Controller.__OnAdminReply__Delegate = InternalAdminReply;
    ReloadActivePanel();
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
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
}

function InitializePanels()
{
    local int i;
    local class<AdminPanelBase> PanelClass;

    co_Options.ResetComponent();
    i = 0;
    J0x16:
    // End:0x97 [While If]
    if(i < AdminOptionClass.Length)
    {
        // End:0x3b
        if(AdminOptionClass[i] == "")
        {
        }
        // End:0x8d
        else
        {
            PanelClass = class<AdminPanelBase>(DynamicLoadObject(AdminOptionClass[i], class'Class'));
            // End:0x8d
            if(PanelClass != none)
            {
                co_Options.AddItem(PanelClass.default.PanelCaption, new (none) PanelClass);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
    // End:0xc2
    if(IsAdmin())
    {
        co_Options.MyComboBox.List.SilentSetIndex(1);
    }
}

function ReloadActivePanel()
{
    local export editinline AdminPanelBase Panel;

    Panel = AdminPanelBase(co_Options.GetObject());
    // End:0x62
    if(Panel != none)
    {
        // End:0x3c
        if(ap_Active != none)
        {
            RemoveComponent(ap_Active, true);
        }
        ap_Active = AdminPanelBase(AppendComponent(Panel, true));
        ap_Active.ShowPanel();
    }
}

function bool IsAdmin()
{
    return PlayerOwner() != none && PlayerOwner().PlayerReplicationInfo != none && PlayerOwner().PlayerReplicationInfo.bAdmin;
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
    Log("Received AdminReply '" $ Reply $ "'");
    Split(Reply, ";", Results);
    i = 0;
    J0x4f:
    // End:0xcb [While If]
    if(i < Results.Length)
    {
        // End:0xc1
        if(Divide(Results[i], "=", key, Value))
        {
            // End:0xa5
            if(key ~= "name" && IsAdmin())
            {
                LoggedIn(Value);
            }
            // End:0xc1
            else
            {
                // End:0xc1
                if(key ~= "adv")
                {
                    SetAdvanced(bool(Value));
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
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
}

function LoggedOut()
{
    bLoggedIn = false;
    ap_Active.LoggedOut();
    t_Title.SetCaption(LoggedOutText);
    co_Options.SetIndex(0);
    DisableComponent(co_Options);
}

function SetAdvanced(coerce bool bIsAdvanced)
{
    local int i;
    local export editinline AdminPanelBase P;

    i = 0;
    J0x07:
    // End:0x7b [While If]
    if(i < co_Options.ItemCount())
    {
        P = AdminPanelBase(co_Options.MyComboBox.List.GetObjectAtIndex(i));
        // End:0x71
        if(P != none)
        {
            P.SetAdvanced(bIsAdvanced);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function InternalOnChange(GUIComponent Sender)
{
    switch(Sender)
    {
        // End:0x18
        case co_Options:
            ReloadActivePanel();
            // End:0x3f
            break;
        // End:0x3c
        case ch_Autologout:
            bAutologout = ch_Autologout.IsChecked();
            SaveConfig();
            // End:0x3f
            break;
        // End:0xffff
        default:
}

defaultproperties
{
    begin object name=OptionsCombo class=moComboBox
        bReadOnly=true
        CaptionWidth=0.270
        Caption="??:"
        OnCreateComponent=InternalOnCreateComponent
        MenuState=4
        Hint="????? ?? ??? ?? ??? ?????"
        WinTop=0.0312490
        WinLeft=0.0106250
        WinWidth=0.5953110
        WinHeight=0.0781250
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: moComboBox'RemoteAdmin.OptionsCombo'
    co_Options=OptionsCombo
    begin object name=AutoLogout class=moCheckBox
        Caption="?? ????"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ??? ??? ???? ???? ???? ??? ???."
        WinTop=0.0312490
        WinLeft=0.668750
        WinWidth=0.31250
        WinHeight=0.0781250
        OnChange=InternalOnChange
    object end
    // Reference: moCheckBox'RemoteAdmin.AutoLogout'
    ch_Autologout=AutoLogout
    AdminOptionClass=// Object reference not set to an instance of an object.
    
    LoggedInText="?? ???? ??? ?????: '%name%'"
    LoggedOutText="??? ?? ?????"
}