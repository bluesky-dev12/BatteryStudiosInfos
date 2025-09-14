/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4InGameChat.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4InGameChat extends FloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Main;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox eb_Send;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_Chat;
var() int OldCMC;
var() editinline array<editinline byte> CloseKey;
var() databinding editinlinenotify Color TextColor[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local PlayerController PC;
    local ExtendedConsole MyConsole;

    super.InitComponent(MyController, myOwner);
    PC = PlayerOwner();
    TextColor[0] = class'SayMessagePlus'.default.RedTeamColor;
    TextColor[1] = class'SayMessagePlus'.default.BlueTeamColor;
    TextColor[2] = class'SayMessagePlus'.default.DrawColor;
    sb_Main.ManageComponent(lb_Chat);
    eb_Send.MyEditBox.__OnKeyEvent__Delegate = InternalOnKeyEvent;
    lb_Chat.MyScrollText.bNeverFocus = true;
    MyConsole = ExtendedConsole(PC.Player.Console);
    // End:0xd6
    if(MyConsole == none)
    {
        return;
    }
    MyConsole.__OnChat__Delegate = HandleChat;
    i = 0;
    J0xf1:
    // End:0x1d5 [While If]
    if(i < MyConsole.ChatMessages.Length)
    {
        // End:0x1cb
        if(!MyConsole.bTeamChatOnly || PC.PlayerReplicationInfo == none || PC.PlayerReplicationInfo.Team == none || MyConsole.ChatMessages[i].Team == PC.PlayerReplicationInfo.Team.TeamIndex)
        {
            HandleChat(MyConsole.ChatMessages[i].Message, MyConsole.ChatMessages[i].Team);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf1;
    }
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
    // End:0xb5 [While If]
    if(i < KeyNames.Length)
    {
        CloseKey[CloseKey.Length] = byte(PC.ConsoleCommand("KEYNUMBER" @ KeyNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    OldCMC = PC.myHUD.ConsoleMessageCount;
    PC.myHUD.ConsoleMessageCount = 0;
    lb_Chat.MyScrollText.End();
    FocusFirst(none);
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlayerOwner().myHUD.ConsoleMessageCount = OldCMC;
}

function HandleChat(string Msg, int TeamIndex)
{
    local int i;
    local string str;

    i = InStr(Msg, ":");
    // End:0x7b
    if(TeamIndex < 2 && i != -1)
    {
        str = MakeColorCode(TextColor[TeamIndex]) $ Left(Msg, i) $ MakeColorCode(TextColor[2]) $ ":" $ Mid(Msg, i + 1);
    }
    // End:0x96
    else
    {
        str = MakeColorCode(TextColor[2]) $ Msg;
    }
    lb_Chat.AddText(str);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local string Cmd;
    local int i;

    // End:0x59
    if(State == 1)
    {
        i = 0;
        J0x14:
        // End:0x59 [While If]
        if(i < CloseKey.Length)
        {
            // End:0x4f
            if(key == CloseKey[i])
            {
                Controller.CloseMenu(false);
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    // End:0x11d
    if(State == 3)
    {
        // End:0x11d
        if(key == 13)
        {
            Cmd = eb_Send.GetText();
            // End:0x98
            if(Cmd == "")
            {
                return true;
            }
            // End:0xb9
            if(Left(Cmd, 1) == "/")
            {
                Cmd = Mid(Cmd, 1);
            }
            // End:0xf7
            else
            {
                // End:0xe5
                if(Left(Cmd, 1) == ".")
                {
                    Cmd = "teamsay" @ Mid(Cmd, 1);
                }
                // End:0xf7
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
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x20
    if(NewComp != eb_Send)
    {
        NewComp.bNeverFocus = true;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
}

defaultproperties
{
    begin object name=sbMain class=AltSectionBackground
        bFillClient=true
        LeftPadding=0.0
        RightPadding=0.0
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4InGameChat.sbMain'
    sb_Main=sbMain
    begin object name=ebSend class=moEditBox
        CaptionWidth=0.10
        Caption="? ?: "
        OnCreateComponent=InternalOnCreateComponent
        Hint="????? ??? ?? ????? ?(.)? ????, ??? ?? ???(/)? ????."
        WinTop=0.9438550
        WinLeft=0.0995840
        WinWidth=0.8189090
        WinHeight=0.0354160
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moEditBox'UT2K4InGameChat.ebSend'
    eb_Send=ebSend
    begin object name=lbChat class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.00250
        EOLDelay=0.0
        Separator="?"
        OnCreateComponent=InternalOnCreateComponent
        FontScale=0
        WinTop=0.4416670
        WinHeight=0.5583330
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4InGameChat.lbChat'
    lb_Chat=lbChat
    WindowName="?-?? ??"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
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