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
    //return;    
}

function HandleParameters(string URL, string FailCode)
{
    RetryURL = URL;
    // End:0x32
    if(FailCode ~= "WRONGPW")
    {
        l_Text.Caption = IncorrectPassword;
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_OK)
    {
        RetryPassword();        
    }
    else
    {
        // End:0x45
        if(Sender == b_Cancel)
        {
            Controller.ReplaceMenu(Controller.GetServerBrowserPage());
        }
    }
    return true;
    //return;    
}

function RetryPassword()
{
    local string EntryString;
    local ExtendedConsole MyConsole;

    EntryString = ed_Data.GetText();
    MyConsole = ExtendedConsole(PlayerOwner().Player.Console);
    // End:0x5E
    if((MyConsole != none) && EntryString != "")
    {
        SavePassword(MyConsole, EntryString);
    }
    PlayerOwner().ClientTravel(Eval(EntryString != "", (RetryURL $ "?password=") $ EntryString, RetryURL), 0, false);
    Controller.CloseAll(false, true);
    //return;    
}

function SavePassword(ExtendedConsole InConsole, string InPassword)
{
    local int i;

    // End:0x111
    if(InConsole != none)
    {
        i = 0;
        J0x12:

        // End:0x83 [Loop If]
        if(i < InConsole.SavedPasswords.Length)
        {
            // End:0x79
            if(InConsole.SavedPasswords[i].Server == InConsole.LastConnectedServer)
            {
                InConsole.SavedPasswords[i].Password = InPassword;
                // [Explicit Break]
                goto J0x83;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
        J0x83:

        // End:0x105
        if(i == InConsole.SavedPasswords.Length)
        {
            InConsole.SavedPasswords.Length = InConsole.SavedPasswords.Length + 1;
            InConsole.SavedPasswords[i].Server = InConsole.LastConnectedServer;
            InConsole.SavedPasswords[i].Password = InPassword;
        }
        InConsole.SaveConfig();
    }
    //return;    
}

defaultproperties
{
    IncorrectPassword="????? ?????.  ?? ??? ??? ????."
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4GetPassword.GetPassFail'
    begin object name="GetPassFail" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5471220
        WinLeft=0.5865230
        WinWidth=0.1475000
        WinHeight=0.0450000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4GetPassword.InternalOnClick
        OnKeyEvent=GetPassFail.InternalOnKeyEvent
    end object
    b_Cancel=GetPassFail
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4GetPassword.GetPassPW'
    begin object name="GetPassPW" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        Caption="?? ????"
        OnCreateComponent=GetPassPW.InternalOnCreateComponent
        WinTop=0.4853660
        WinLeft=0.2093750
        WinWidth=0.5625000
        TabOrder=0
    end object
    ed_Data=GetPassPW
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4GetPassword.GetPassRetry'
    begin object name="GetPassRetry" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.7304550
        WinLeft=0.3208990
        WinWidth=0.1475000
        WinHeight=0.0450000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4GetPassword.InternalOnClick
        OnKeyEvent=GetPassRetry.InternalOnKeyEvent
    end object
    b_OK=GetPassRetry
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4GetPassword.GetPassLabel'
    begin object name="GetPassLabel" class=XInterface.GUILabel
        Caption="? ??? ???? ??? ????? ?????."
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3022300
        WinLeft=0.0279300
        WinWidth=0.9404300
        WinHeight=0.0546880
        bBoundToParent=true
    end object
    l_Text=GetPassLabel
    bAllowedAsLast=true
}