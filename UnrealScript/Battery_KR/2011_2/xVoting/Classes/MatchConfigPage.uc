class MatchConfigPage extends VotingPage
    config(User)
    editinlinenew
    instanced;

var() automated GUITabControl c_Groups;
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

    // End:0x15A [Loop If]
    if((i < PanelClass.Length) && i < PanelHint.Length)
    {
        Panel = MatchSetupPanelBase(c_Groups.AddTab("", PanelClass[i],, PanelHint[i]));
        // End:0x150
        if(Panel != none)
        {
            Panels[Panels.Length] = Panel;
            Panel.VRI = MVRI;
            Panel.__SendCommand__Delegate = SendCommand;
            Panel.__OnChange__Delegate = PanelChanged;
            // End:0x13D
            if(Panel.IsLoggedIn())
            {
                Panel.OnLogIn();
                // [Explicit Continue]
                goto J0x150;
            }
            Panel.OnLogOut();
        }
        J0x150:

        i++;
        // [Loop Continue]
        goto J0x67;
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x18
    if(MatchSetupPanelBase(Sender) != none)
    {
        bDirty = true;
    }
    //return;    
}

function SendCommand(string Command)
{
    // End:0x1F
    if(MVRI != none)
    {
        MVRI.SendCommand(Command);
    }
    //return;    
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
    J0x3B:

    // End:0x7E [Loop If]
    if(i < Panels.Length)
    {
        // End:0x74
        if(Panels[i].HandleResponse(Type, Info, Data))
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x3B;
    }
    //return;    
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local int i;

    // End:0xD9
    if(Type ~= "login")
    {
        // End:0x8C
        if(Info == "")
        {
            i = 0;
            J0x24:

            // End:0x8A [Loop If]
            if(i < Panels.Length)
            {
                // End:0x67
                if(MatchSetupLoginPanel(Panels[i]) != none)
                {
                    MatchSetupLoginPanel(Panels[i]).LoginFailed();
                    // [Explicit Continue]
                    goto J0x80;
                }
                Panels[i].OnLogOut();
                J0x80:

                i++;
                // [Loop Continue]
                goto J0x24;
            }
            return true;
        }
        i = 0;
        J0x93:

        // End:0xD7 [Loop If]
        if(i < Panels.Length)
        {
            // End:0xCD
            if(Panels[i] != none)
            {
                Panels[i].OnLogIn();
            }
            i++;
            // [Loop Continue]
            goto J0x93;
        }
        return true;
    }
    // End:0x136
    if(Type ~= "logout")
    {
        i = 0;
        J0xF2:

        // End:0x136 [Loop If]
        if(i < Panels.Length)
        {
            // End:0x12C
            if(Panels[i] != none)
            {
                Panels[i].OnLogOut();
            }
            i++;
            // [Loop Continue]
            goto J0xF2;
        }
    }
    // End:0x19E
    if(Type ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.StatusID)
    {
        // End:0x19E
        if(Info ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.CompleteID)
        {
            i = 0;
            J0x16D:

            // End:0x19C [Loop If]
            if(i < Panels.Length)
            {
                Panels[i].ReceiveComplete();
                i++;
                // [Loop Continue]
                goto J0x16D;
            }
            return true;
        }
    }
    return false;
    //return;    
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
    else
    {
        Type = Response;
    }
    //return;    
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
    //return;    
}

function PanelChanged(GUIComponent Sender)
{
    bDirty = true;
    //return;    
}

function SubmitActive()
{
    local int i;

    // End:0xAE
    if((c_Groups.ActiveTab != none) && c_Groups.ActiveTab.MyPanel != none)
    {
        i = 0;
        J0x3A:

        // End:0xAE [Loop If]
        if(i < Panels.Length)
        {
            // End:0xA4
            if(Panels[i] == c_Groups.ActiveTab.MyPanel)
            {
                // End:0xA1
                if(Panels[i].bDirty == true)
                {
                    Panels[i].SubmitChanges();
                }
                // [Explicit Break]
                goto J0xAE;
            }
            i++;
            // [Loop Continue]
            goto J0x3A;
        }
    }
    J0xAE:

    //return;    
}

function AcceptAndSave()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4E [Loop If]
    if(i < Panels.Length)
    {
        // End:0x44
        if(Panels[i].bDirty)
        {
            Panels[i].SubmitChanges();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    MVRI.MatchSettingsSubmit();
    bDirty = false;
    //return;    
}

defaultproperties
{
    // Reference: GUITabControl'xVoting_Decompressed.MatchConfigPage.MatchSetupTabControl'
    begin object name="MatchSetupTabControl" class=XInterface.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        StyleName="TabBackground"
        WinTop=0.0208330
        WinLeft=0.0140620
        WinWidth=0.9718750
        WinHeight=0.7181250
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=MatchSetupTabControl.InternalOnActivate
    end object
    c_Groups=MatchSetupTabControl
    PanelClass[0]="xVoting.MatchSetupLoginPanel"
    PanelClass[1]="xVoting.MatchSetupMain"
    PanelClass[2]="xVoting.MatchSetupMaps"
    PanelClass[3]="xVoting.MatchSetupMutator"
    PanelClass[4]="xVoting.MatchSetupRules"
    PanelHint[0]="Enter your match setup username and password"
    PanelHint[1]="General match parameters"
    PanelHint[2]="Select the maps that should be played during the match"
    PanelHint[3]="Select the mutators that should be active during the match"
    PanelHint[4]="Select the rules that will be used in the match"
    bPersistent=true
}