/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\IngameChat.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
class IngameChat extends UT2K3GUIPage
    editinlinenew
    instanced;

var ExtendedConsole MyConsole;
var export editinline GUIEditBox MyEditBox;
var bool bIgnoreChar;
var int OldCMC;
var byte CloseKey;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local string KeyName;

    super(GUIPage).InitComponent(MyController, myOwner);
    MyEditBox = GUIEditBox(Controls[2]);
    MyEditBox.__OnKeyEvent__Delegate = InternalOnKeyEvent;
    MyEditBox.__OnKeyType__Delegate = InternalOnKeyType;
    __OnClose__Delegate = MyOnClose;
    GUIScrollTextBox(Controls[1]).MyScrollText.bNeverFocus = true;
    KeyName = PlayerOwner().ConsoleCommand("BINDINGTOKEY InGameChat");
    // End:0xd6
    if(KeyName != "")
    {
        CloseKey = byte(PlayerOwner().ConsoleCommand("KEYNUMBER" @ KeyName));
    }
}

function Clear()
{
    local export editinline GUIScrollTextBox MyText;

    MyText = GUIScrollTextBox(Controls[1]);
    MyText.MyScrollText.SetContent("");
}

event HandleParameters(string Param1, string Param2)
{
    bIgnoreChar = true;
    MyEditBox.SetFocus(none);
    OldCMC = PlayerOwner().myHUD.ConsoleMessageCount;
    PlayerOwner().myHUD.ConsoleMessageCount = 0;
}

function MyOnClose(optional bool bCanceled)
{
    // End:0x22
    if(MyConsole != none)
    {
        MyConsole.ChatMenu = none;
        MyConsole = none;
    }
    PlayerOwner().myHUD.ConsoleMessageCount = OldCMC;
    OnClose(bCanceled);
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    // End:0x13
    if(bIgnoreChar)
    {
        bIgnoreChar = false;
        return true;
    }
    return MyEditBox.InternalOnKeyType(key, Unicode);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Cmd;

    // End:0x34
    if(key == CloseKey && State == 1)
    {
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x128
    if(key == 13 && State == 3)
    {
        // End:0x97
        if(Left(MyEditBox.TextStr, 1) == "/")
        {
            Cmd = Right(MyEditBox.TextStr, Len(MyEditBox.TextStr) - 1);
        }
        // End:0x102
        else
        {
            // End:0xe7
            if(Left(MyEditBox.TextStr, 1) == ".")
            {
                Cmd = "teamsay" @ Right(MyEditBox.TextStr, Len(MyEditBox.TextStr) - 1);
            }
            // End:0x102
            else
            {
                Cmd = "say" @ MyEditBox.TextStr;
            }
        }
        PlayerOwner().ConsoleCommand(Cmd);
        MyEditBox.TextStr = "";
        return true;
    }
    return MyEditBox.InternalOnKeyEvent(key, State, Delta);
}

defaultproperties
{
    bRequire640x480=true
    bPersistent=true
    bAllowedAsLast=true
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.10
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.80
}