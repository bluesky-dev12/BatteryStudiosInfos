/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GetPassword.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *
 *******************************************************************************/
class UT2K4GetPassword extends UT2K4GetDataMenu
    editinlinenew
    instanced;

var string RetryURL;
var localized string IncorrectPassword;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
    ed_Data.MyEditBox.bConvertSpaces = true;
}

function HandleParameters(string URL, string FailCode)
{
    RetryURL = URL;
    // End:0x32
    if(FailCode ~= "WRONGPW")
    {
        l_Text.Caption = IncorrectPassword;
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_OK)
    {
        RetryPassword();
    }
    // End:0x45
    else
    {
        // End:0x45
        if(Sender == b_Cancel)
        {
            Controller.ReplaceMenu(Controller.GetServerBrowserPage());
        }
    }
    return true;
}

function RetryPassword()
{
    local string EntryString;
    local ExtendedConsole MyConsole;

    EntryString = ed_Data.GetText();
    MyConsole = ExtendedConsole(PlayerOwner().Player.Console);
    // End:0x5e
    if(MyConsole != none && EntryString != "")
    {
        SavePassword(MyConsole, EntryString);
    }
    PlayerOwner().ClientTravel(Eval(EntryString != "", RetryURL $ "?password=" $ EntryString, RetryURL), 0, false);
    Controller.CloseAll(false, true);
}

function SavePassword(ExtendedConsole InConsole, string InPassword)
{
    local int i;

    // End:0x111
    if(InConsole != none)
    {
        i = 0;
        J0x12:
        // End:0x83 [While If]
        if(i < InConsole.SavedPasswords.Length)
        {
            // End:0x79
            if(InConsole.SavedPasswords[i].Server == InConsole.LastConnectedServer)
            {
                InConsole.SavedPasswords[i].Password = InPassword;
            }
            // End:0x83
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x12;
            }
        }
        // End:0x105
        if(i == InConsole.SavedPasswords.Length)
        {
            InConsole.SavedPasswords.Length = InConsole.SavedPasswords.Length + 1;
            InConsole.SavedPasswords[i].Server = InConsole.LastConnectedServer;
            InConsole.SavedPasswords[i].Password = InPassword;
        }
        InConsole.SaveConfig();
    }
}

defaultproperties
{
    IncorrectPassword="????? ?????.  ?? ??? ??? ????."
    begin object name=GetPassFail class=GUIButton
        Caption="??"
        WinTop=0.5471220
        WinLeft=0.5865230
        WinWidth=0.14750
        WinHeight=0.0450
        TabOrder=2
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4GetPassword.GetPassFail'
    b_Cancel=GetPassFail
    begin object name=GetPassPW class=moEditBox
        CaptionWidth=0.40
        Caption="?? ????"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4853660
        WinLeft=0.2093750
        WinWidth=0.56250
        TabOrder=0
    object end
    // Reference: moEditBox'UT2K4GetPassword.GetPassPW'
    ed_Data=GetPassPW
    begin object name=GetPassRetry class=GUIButton
        Caption="??"
        WinTop=0.7304550
        WinLeft=0.3208990
        WinWidth=0.14750
        WinHeight=0.0450
        TabOrder=1
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4GetPassword.GetPassRetry'
    b_OK=GetPassRetry
    begin object name=GetPassLabel class=GUILabel
        Caption="? ??? ???? ??? ????? ?????."
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.302230
        WinLeft=0.027930
        WinWidth=0.940430
        WinHeight=0.0546880
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4GetPassword.GetPassLabel'
    l_Text=GetPassLabel
    bAllowedAsLast=true
}