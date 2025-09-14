class UT2GetPassword extends UT2K3GUIPage
    editinlinenew
    instanced;

var bool bIgnoreEsc;
var localized string LeaveMPButtonText;
var localized string LeaveSPButtonText;
var float ButtonWidth;
var float ButtonHeight;
var float ButtonHGap;
var float ButtonVGap;
var float BarHeight;
var float BarVPos;
var string RetryURL;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
    moEditBox(Controls[1]).MyEditBox.bConvertSpaces = true;
    //return;    
}

function HandleParameters(string URL, string Unused)
{
    RetryURL = URL;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local ExtendedConsole MyConsole;

    // End:0x148
    if((Sender == Controls[2]) && Len(moEditBox(Controls[1]).GetText()) > 0)
    {
        MyConsole = ExtendedConsole(PlayerOwner().Player.Console);
        // End:0xFD
        if(MyConsole != none)
        {
            MyConsole.SavedPasswords.Length = MyConsole.SavedPasswords.Length + 1;
            MyConsole.SavedPasswords[MyConsole.SavedPasswords.Length - 1].Server = MyConsole.LastConnectedServer;
            MyConsole.SavedPasswords[MyConsole.SavedPasswords.Length - 1].Password = moEditBox(Controls[1]).GetText();
            MyConsole.SaveConfig();
        }
        PlayerOwner().ClientTravel((RetryURL $ "?password=") $ moEditBox(Controls[1]).GetText(), 0, false);
        Controller.CloseAll(false);
    }
    // End:0x181
    if(Sender == Controls[3])
    {
        Controller.ReplaceMenu("xinterface.UT2MainMenu");
    }
    return true;
    //return;    
}

defaultproperties
{
    bIgnoreEsc=true
    bAllowedAsLast=true
    // Reference: GUIButton'XInterface_Decompressed.UT2GetPassword.GetPassBackground'
    begin object name="GetPassBackground" class=XInterface_Decompressed.GUIButton
        StyleName="RoundButton"
        WinTop=0.3750000
        WinLeft=0.0875000
        WinWidth=0.8312510
        WinHeight=0.3062500
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=GetPassBackground.InternalOnKeyEvent
    end object
    Controls[0]=GetPassBackground
    // Reference: moEditBox'XInterface_Decompressed.UT2GetPassword.GetPassPW'
    begin object name="GetPassPW" class=XInterface_Decompressed.moEditBox
        CaptionWidth=0.4000000
        Caption="?? ????"
        OnCreateComponent=GetPassPW.InternalOnCreateComponent
        WinTop=0.5085940
        WinLeft=0.2500000
        WinHeight=0.0600000
    end object
    Controls[1]=GetPassPW
    // Reference: GUIButton'XInterface_Decompressed.UT2GetPassword.GetPassRetry'
    begin object name="GetPassRetry" class=XInterface_Decompressed.GUIButton
        Caption="??????"
        StyleName="MidGameButton"
        WinTop=0.9416660
        WinLeft=0.4000000
        WinWidth=0.2500000
        WinHeight=0.0500000
        bBoundToParent=true
        OnClick=UT2GetPassword.InternalOnClick
        OnKeyEvent=GetPassRetry.InternalOnKeyEvent
    end object
    Controls[2]=GetPassRetry
    // Reference: GUIButton'XInterface_Decompressed.UT2GetPassword.GetPassFail'
    begin object name="GetPassFail" class=XInterface_Decompressed.GUIButton
        Caption="??"
        StyleName="MidGameButton"
        WinTop=0.9416660
        WinLeft=0.6500000
        WinWidth=0.2500000
        WinHeight=0.0500000
        bBoundToParent=true
        OnClick=UT2GetPassword.InternalOnClick
        OnKeyEvent=GetPassFail.InternalOnKeyEvent
    end object
    Controls[3]=GetPassFail
    // Reference: GUILabel'XInterface_Decompressed.UT2GetPassword.GetPassLabel'
    begin object name="GetPassLabel" class=XInterface_Decompressed.GUILabel
        Caption="? ??? ?????? ????? ??."
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        bMultiLine=true
        WinTop=0.1250000
        WinHeight=0.5000000
        bBoundToParent=true
    end object
    Controls[4]=GetPassLabel
    WinTop=0.3750000
    WinHeight=0.2500000
}