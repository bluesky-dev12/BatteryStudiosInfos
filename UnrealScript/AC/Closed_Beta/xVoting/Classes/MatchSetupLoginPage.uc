class MatchSetupLoginPage extends LargeWindow
    editinlinenew
    instanced;

var() automated GUILabel l_Title;
var() automated moEditBox ed_UserID;
var() automated moEditBox ed_Password;
var() automated GUIButton b_Login;
var() automated GUIButton b_Cancel;
var VotingReplicationInfo VRI;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local VotingReplicationInfo ri;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    ed_Password.MyEditBox.bConvertSpaces = true;
    // End:0x74
    foreach AllObjects(Class'xVoting_Decompressed.VotingReplicationInfo', ri)
    {
        // End:0x73
        if((ri.PlayerOwner != none) && ri.PlayerOwner == PlayerOwner())
        {
            VRI = ri;
            // End:0x74
            break;
        }        
    }    
    // End:0x90
    if(VRI == none)
    {
        Controller.CloseAll(false);
    }
    ed_Password.MyEditBox.bMaskText = true;
    ed_UserID.SetComponentValue(PlayerOwner().PlayerReplicationInfo.PlayerName);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x77
    if(((Sender == b_Login) && Len(ed_UserID.GetText()) > 0) && Len(ed_Password.GetText()) > 0)
    {
        VRI.MatchSetupLogin(ed_UserID.GetText(), ed_Password.GetText());
        SetTimer(1.0000000, true);
    }
    // End:0x96
    if(Sender == b_Cancel)
    {
        Controller.CloseAll(false);
    }
    return true;
    //return;    
}

function Timer()
{
    super(GUIComponent).Timer();
    // End:0x35
    if((VRI != none) && VRI.bMatchSetupPermitted)
    {
        Controller.CloseMenu(false);
    }
    //return;    
}

function bool UserIDKeyPress(out byte key, out byte State, float Delta)
{
    // End:0x2F
    if((int(key) == 13) && int(State) == 1)
    {
        ed_Password.SetFocus(none);
        return true;
    }
    // End:0x5E
    if((int(key) == 40) && int(State) == 1)
    {
        ed_Password.SetFocus(none);
        return true;
    }
    return false;
    //return;    
}

function bool PasswordKeyPress(out byte key, out byte State, float Delta)
{
    // End:0x85
    if((int(key) == 13) && int(State) == 1)
    {
        // End:0x83
        if((Len(ed_UserID.GetText()) > 0) && Len(ed_Password.GetText()) > 0)
        {
            VRI.MatchSetupLogin(ed_UserID.GetText(), ed_Password.GetText());
            SetTimer(1.0000000, true);
        }
        return true;
    }
    // End:0xB4
    if((int(key) == 38) && int(State) == 1)
    {
        ed_UserID.SetFocus(none);
        return true;
    }
    return false;
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    VRI = none;
    super(GUIPage).Closed(Sender, bCancelled);
    //return;    
}

event bool NotifyLevelChange()
{
    VRI = none;
    return super(GUIPage).NotifyLevelChange();
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'xVoting_Decompressed.MatchSetupLoginPage.TitleLabel'
    begin object name="TitleLabel" class=XInterface.GUILabel
        Caption="?? ?? ???"
        TextAlign=1
        TextColor=(R=0,G=0,B=255,A=255)
        TextFont="UT2SmallFont"
        WinTop=0.2875000
        WinLeft=0.3028130
        WinWidth=0.3828130
        WinHeight=0.0531250
        RenderWeight=1.0000000
    end object
    l_Title=TitleLabel
    // Reference: moEditBox'xVoting_Decompressed.MatchSetupLoginPage.UserIDEditBox'
    begin object name="UserIDEditBox" class=XInterface.moEditBox
        Caption="???ID"
        OnCreateComponent=UserIDEditBox.InternalOnCreateComponent
        WinTop=0.3666670
        WinLeft=0.3012500
        WinWidth=0.3812500
        WinHeight=0.0337500
        TabOrder=1
        OnKeyEvent=MatchSetupLoginPage.UserIDKeyPress
    end object
    ed_UserID=UserIDEditBox
    // Reference: moEditBox'xVoting_Decompressed.MatchSetupLoginPage.PasswordEditBox'
    begin object name="PasswordEditBox" class=XInterface.moEditBox
        Caption="????"
        OnCreateComponent=PasswordEditBox.InternalOnCreateComponent
        WinTop=0.4316670
        WinLeft=0.3000000
        WinWidth=0.3825000
        WinHeight=0.0312500
        TabOrder=2
        OnKeyEvent=MatchSetupLoginPage.PasswordKeyPress
    end object
    ed_Password=PasswordEditBox
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupLoginPage.LoginButton'
    begin object name="LoginButton" class=XInterface.GUIButton
        Caption="???"
        WinTop=0.5266670
        WinLeft=0.3300000
        WinWidth=0.1200000
        WinHeight=0.0332030
        RenderWeight=1.0000000
        TabOrder=3
        OnClick=MatchSetupLoginPage.InternalOnClick
        OnKeyEvent=LoginButton.InternalOnKeyEvent
    end object
    b_Login=LoginButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupLoginPage.CancelButton'
    begin object name="CancelButton" class=XInterface.GUIButton
        Caption="????"
        WinTop=0.5266670
        WinLeft=0.5362490
        WinWidth=0.1200000
        WinHeight=0.0332030
        RenderWeight=1.0000000
        TabOrder=4
        OnClick=MatchSetupLoginPage.InternalOnClick
        OnKeyEvent=CancelButton.InternalOnKeyEvent
    end object
    b_Cancel=CancelButton
    bAllowedAsLast=true
    WinTop=0.2486970
    WinLeft=0.0000000
    WinWidth=1.0000000
    WinHeight=0.3528640
}