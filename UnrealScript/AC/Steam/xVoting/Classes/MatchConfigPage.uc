/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchConfigPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:10
 *
 *******************************************************************************/
class MatchConfigPage extends VotingPage
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl c_Groups;
var array<export editinline MatchSetupPanelBase> Panels;
var() config array<string> PanelClass;
var() config array<string> PanelHint;
var() bool bDirty;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    local int i;
    local export editinline MatchSetupPanelBase Panel;

    super.InitComponent(InController, inOwner);
    f_Chat.__OnAccept__Delegate = AcceptAndSave;
    f_Chat.__OnSubmit__Delegate = SubmitActive;
    c_Groups.MyFooter = f_Chat;
    MVRI.__ProcessResponse__Delegate = OnResponse;
    i = 0;
    J0x67:
    // End:0x15a [While If]
    if(i < PanelClass.Length && i < PanelHint.Length)
    {
        Panel = MatchSetupPanelBase(c_Groups.AddTab("", PanelClass[i],, PanelHint[i]));
        // End:0x150
        if(Panel != none)
        {
            Panels[Panels.Length] = Panel;
            Panel.VRI = MVRI;
            Panel.__SendCommand__Delegate = SendCommand;
            Panel.__OnChange__Delegate = PanelChanged;
            // End:0x13d
            if(Panel.IsLoggedIn())
            {
                Panel.OnLogIn();
            }
            // End:0x150
            else
            {
                Panel.OnLogOut();
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x18
    if(MatchSetupPanelBase(Sender) != none)
    {
        bDirty = true;
    }
}

function SendCommand(string Command)
{
    // End:0x1f
    if(MVRI != none)
    {
        MVRI.SendCommand(Command);
    }
}

function OnResponse(string Response)
{
    local int i;
    local string Type, Info, Data;

    DecodeResponse(Response, Type, Info, Data);
    // End:0x34
    if(HandleResponse(Type, Info, Data))
    {
        return;
    }
    i = 0;
    J0x3b:
    // End:0x7e [While If]
    if(i < Panels.Length)
    {
        // End:0x74
        if(Panels[i].HandleResponse(Type, Info, Data))
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local int i;

    // End:0xd9
    if(Type ~= "login")
    {
        // End:0x8c
        if(Info == "")
        {
            i = 0;
            J0x24:
            // End:0x8a [While If]
            if(i < Panels.Length)
            {
                // End:0x67
                if(MatchSetupLoginPanel(Panels[i]) != none)
                {
                    MatchSetupLoginPanel(Panels[i]).LoginFailed();
                }
                // End:0x80
                else
                {
                    Panels[i].OnLogOut();
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x24;
            }
            return true;
        }
        i = 0;
        J0x93:
        // End:0xd7 [While If]
        if(i < Panels.Length)
        {
            // End:0xcd
            if(Panels[i] != none)
            {
                Panels[i].OnLogIn();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x93;
        }
        return true;
    }
    // End:0x136
    if(Type ~= "logout")
    {
        i = 0;
        J0xf2:
        // End:0x136 [While If]
        if(i < Panels.Length)
        {
            // End:0x12c
            if(Panels[i] != none)
            {
                Panels[i].OnLogOut();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xf2;
        }
    }
    // End:0x19e
    if(Type ~= class'VotingReplicationInfo'.default.StatusID)
    {
        // End:0x19e
        if(Info ~= class'VotingReplicationInfo'.default.CompleteID)
        {
            i = 0;
            J0x16d:
            // End:0x19c [While If]
            if(i < Panels.Length)
            {
                Panels[i].ReceiveComplete();
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x16d;
            }
            return true;
        }
    }
    return false;
}

static function DecodeResponse(string Response, out string Type, out string Info, out string Data)
{
    local string str;

    Type = "";
    Info = "";
    Data = "";
    // End:0x26
    if(Response == "")
    {
        return;
    }
    // End:0x64
    if(Divide(Response, ":", Type, str))
    {
        // End:0x61
        if(!Divide(str, ";", Info, Data))
        {
            Info = str;
        }
    }
    // End:0x6f
    else
    {
        Type = Response;
    }
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
}

function PanelChanged(GUIComponent Sender)
{
    bDirty = true;
}

function SubmitActive()
{
    local int i;

    // End:0xae
    if(c_Groups.ActiveTab != none && c_Groups.ActiveTab.MyPanel != none)
    {
        i = 0;
        J0x3a:
        // End:0xae [While If]
        if(i < Panels.Length)
        {
            // End:0xa4
            if(Panels[i] == c_Groups.ActiveTab.MyPanel)
            {
                // End:0xa1
                if(Panels[i].bDirty == true)
                {
                    Panels[i].SubmitChanges();
                }
            }
            // End:0xae
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x3a;
            }
        }
    }
}

function AcceptAndSave()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4e [While If]
    if(i < Panels.Length)
    {
        // End:0x44
        if(Panels[i].bDirty)
        {
            Panels[i].SubmitChanges();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    MVRI.MatchSettingsSubmit();
    bDirty = false;
}

defaultproperties
{
    begin object name=MatchSetupTabControl class=GUITabControl
        bDockPanels=true
        TabHeight=0.040
        StyleName="TabBackground"
        WinTop=0.0208330
        WinLeft=0.0140620
        WinWidth=0.9718750
        WinHeight=0.7181250
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=InternalOnActivate
    object end
    // Reference: GUITabControl'MatchConfigPage.MatchSetupTabControl'
    c_Groups=MatchSetupTabControl
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    bPersistent=true
}