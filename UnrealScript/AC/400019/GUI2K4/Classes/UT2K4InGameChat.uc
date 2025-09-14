class UT2K4InGameChat extends FloatingWindow
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Main;
var() automated moEditBox eb_Send;
var() automated GUIScrollTextBox lb_Chat;
var() int OldCMC;
var() editinline array<editinline byte> CloseKey;
var() editinlinenotify Color TextColor[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local PlayerController PC;
    local ExtendedConsole MyConsole;

    super.InitComponent(MyController, myOwner);
    PC = PlayerOwner();
    TextColor[0] = Class'UnrealGame.SayMessagePlus'.default.RedTeamColor;
    TextColor[1] = Class'UnrealGame.SayMessagePlus'.default.BlueTeamColor;
    TextColor[2] = Class'UnrealGame.SayMessagePlus'.default.DrawColor;
    sb_Main.ManageComponent(lb_Chat);
    eb_Send.MyEditBox.__OnKeyEvent__Delegate = InternalOnKeyEvent;
    lb_Chat.MyScrollText.bNeverFocus = true;
    MyConsole = ExtendedConsole(PC.Player.Console);
    // End:0xD6
    if(MyConsole == none)
    {
        return;
    }
    MyConsole.__OnChat__Delegate = HandleChat;
    i = 0;
    J0xF1:

    // End:0x1D5 [Loop If]
    if(i < MyConsole.ChatMessages.Length)
    {
        // End:0x1CB
        if(((!MyConsole.bTeamChatOnly || PC.PlayerReplicationInfo == none) || PC.PlayerReplicationInfo.Team == none) || MyConsole.ChatMessages[i].Team == PC.PlayerReplicationInfo.Team.TeamIndex)
        {
            HandleChat(MyConsole.ChatMessages[i].Message, MyConsole.ChatMessages[i].Team);
        }
        i++;
        // [Loop Continue]
        goto J0xF1;
    }
    //return;    
}

event Opened(GUIComponent Sender)
{
    local int i;
    local string KeyName;
    local array<string> KeyNames;
    local PlayerController PC;

    super(PopupPageBase).Opened(Sender);
    PC = PlayerOwner();
    CloseKey.Remove(0, CloseKey.Length);
    KeyName = PC.ConsoleCommand("BINDINGTOKEY InGameChat");
    Split(KeyName, ",", KeyNames);
    i = 0;
    J0x65:

    // End:0xB5 [Loop If]
    if(i < KeyNames.Length)
    {
        CloseKey[CloseKey.Length] = byte(PC.ConsoleCommand("KEYNUMBER" @ KeyNames[i]));
        i++;
        // [Loop Continue]
        goto J0x65;
    }
    OldCMC = PC.myHUD.ConsoleMessageCount;
    PC.myHUD.ConsoleMessageCount = 0;
    lb_Chat.MyScrollText.End();
    FocusFirst(none);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlayerOwner().myHUD.ConsoleMessageCount = OldCMC;
    //return;    
}

function HandleChat(string Msg, int TeamIndex)
{
    local int i;
    local string str;

    i = InStr(Msg, ":");
    // End:0x7B
    if((TeamIndex < 2) && i != -1)
    {
        str = ((((MakeColorCode(TextColor[TeamIndex])) $ Left(Msg, i)) $ (MakeColorCode(TextColor[2]))) $ ":") $ Mid(Msg, i + 1);        
    }
    else
    {
        str = (MakeColorCode(TextColor[2])) $ Msg;
    }
    lb_Chat.AddText(str);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Cmd;
    local int i;

    // End:0x59
    if(int(State) == 1)
    {
        i = 0;
        J0x14:

        // End:0x59 [Loop If]
        if(i < CloseKey.Length)
        {
            // End:0x4F
            if(int(key) == int(CloseKey[i]))
            {
                Controller.CloseMenu(false);
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x14;
        }
    }
    // End:0x11D
    if(int(State) == 3)
    {
        // End:0x11D
        if(int(key) == 13)
        {
            Cmd = eb_Send.GetText();
            // End:0x98
            if(Cmd == "")
            {
                return true;
            }
            // End:0xB9
            if(Left(Cmd, 1) == "/")
            {
                Cmd = Mid(Cmd, 1);                
            }
            else
            {
                // End:0xE5
                if(Left(Cmd, 1) == ".")
                {
                    Cmd = "teamsay" @ Mid(Cmd, 1);                    
                }
                else
                {
                    Cmd = "say" @ Cmd;
                }
            }
            PlayerOwner().ConsoleCommand(Cmd);
            eb_Send.SetText("");
            return true;
        }
    }
    return eb_Send.MyEditBox.InternalOnKeyEvent(key, State, Delta);
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x20
    if(NewComp != eb_Send)
    {
        NewComp.bNeverFocus = true;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4InGameChat.sbMain'
    begin object name="sbMain" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        LeftPadding=0.0000000
        RightPadding=0.0000000
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        OnPreDraw=sbMain.InternalPreDraw
    end object
    sb_Main=sbMain
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4InGameChat.ebSend'
    begin object name="ebSend" class=XInterface.moEditBox
        CaptionWidth=0.1000000
        Caption="? ?: "
        OnCreateComponent=ebSend.InternalOnCreateComponent
        Hint="????? ??? ?? ????? ?(.)? ????, ??? ?? ???(/)? ????."
        WinTop=0.9438550
        WinLeft=0.0995840
        WinWidth=0.8189090
        WinHeight=0.0354160
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    end object
    eb_Send=ebSend
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4InGameChat.lbChat'
    begin object name="lbChat" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.0000000
        Separator="þ"
        OnCreateComponent=lbChat.InternalOnCreateComponent
        FontScale=0
        WinTop=0.4416670
        WinHeight=0.5583330
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    lb_Chat=lbChat
    WindowName="?-?? ??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1103130
    DefaultTop=0.0579160
    DefaultWidth=0.7796880
    DefaultHeight=0.8470830
    bPersistent=true
    bAllowedAsLast=true
    WinTop=0.0579160
    WinLeft=0.1103130
    WinWidth=0.7796880
    WinHeight=0.8470830
}