/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2GetPassword.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:3
 *
 *******************************************************************************/
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
}

function HandleParameters(string URL, string Unused)
{
    RetryURL = URL;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local ExtendedConsole MyConsole;

    // End:0x148
    if(Sender == Controls[2] && Len(moEditBox(Controls[1]).GetText()) > 0)
    {
        MyConsole = ExtendedConsole(PlayerOwner().Player.Console);
        // End:0xfd
        if(MyConsole != none)
        {
            MyConsole.SavedPasswords.Length = MyConsole.SavedPasswords.Length + 1;
            MyConsole.SavedPasswords[MyConsole.SavedPasswords.Length - 1].Server = MyConsole.LastConnectedServer;
            MyConsole.SavedPasswords[MyConsole.SavedPasswords.Length - 1].Password = moEditBox(Controls[1]).GetText();
            MyConsole.SaveConfig();
        }
        PlayerOwner().ClientTravel(RetryURL $ "?password=" $ moEditBox(Controls[1]).GetText(), 0, false);
        Controller.CloseAll(false);
    }
    // End:0x181
    if(Sender == Controls[3])
    {
        Controller.ReplaceMenu("xinterface.UT2MainMenu");
    }
    return true;
}

defaultproperties
{
    bIgnoreEsc=true
    bAllowedAsLast=true
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.3750
    WinHeight=0.250
}