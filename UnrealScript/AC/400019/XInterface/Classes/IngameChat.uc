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
    // End:0xD6
    if(KeyName != "")
    {
        CloseKey = byte(PlayerOwner().ConsoleCommand("KEYNUMBER" @ KeyName));
    }
    //return;    
}

function Clear()
{
    local export editinline GUIScrollTextBox MyText;

    MyText = GUIScrollTextBox(Controls[1]);
    MyText.MyScrollText.SetContent("");
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    bIgnoreChar = true;
    MyEditBox.SetFocus(none);
    OldCMC = PlayerOwner().myHUD.ConsoleMessageCount;
    PlayerOwner().myHUD.ConsoleMessageCount = 0;
    //return;    
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
    //return;    
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
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Cmd;

    // End:0x34
    if((int(key) == int(CloseKey)) && int(State) == 1)
    {
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x128
    if((int(key) == 13) && int(State) == 3)
    {
        // End:0x97
        if(Left(MyEditBox.TextStr, 1) == "/")
        {
            Cmd = Right(MyEditBox.TextStr, Len(MyEditBox.TextStr) - 1);            
        }
        else
        {
            // End:0xE7
            if(Left(MyEditBox.TextStr, 1) == ".")
            {
                Cmd = "teamsay" @ Right(MyEditBox.TextStr, Len(MyEditBox.TextStr) - 1);                
            }
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
    //return;    
}

defaultproperties
{
    bRequire640x480=false
    bPersistent=true
    bAllowedAsLast=true
    // Reference: GUIImage'XInterface_Decompressed.IngameChat.ChatBackground'
    begin object name="ChatBackground" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    Controls[0]=ChatBackground
    // Reference: GUIScrollTextBox'XInterface_Decompressed.IngameChat.chatText'
    begin object name="chatText" class=XInterface_Decompressed.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.0000000
        OnCreateComponent=chatText.InternalOnCreateComponent
        WinTop=0.0200000
        WinLeft=0.0300000
        WinWidth=0.9400000
        WinHeight=0.8800000
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    Controls[1]=chatText
    // Reference: GUIEditBox'XInterface_Decompressed.IngameChat.ChatEdit'
    begin object name="ChatEdit" class=XInterface_Decompressed.GUIEditBox
        StyleName="SquareButton"
        WinTop=0.9400000
        bBoundToParent=true
        bScaleToParent=true
        OnActivate=ChatEdit.InternalActivate
        OnDeActivate=ChatEdit.InternalDeactivate
        OnKeyType=ChatEdit.InternalOnKeyType
        OnKeyEvent=ChatEdit.InternalOnKeyEvent
    end object
    Controls[2]=ChatEdit
    WinTop=0.1000000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.8000000
}