/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4IRC_Panel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:16
 *
 *******************************************************************************/
class UT2k4IRC_Panel extends GUIPanel
    config(User)
    editinlinenew
    instanced;

var export editinline UT2k4IRC_System tp_System;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Server;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Channel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Connect;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemServer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_JoinChannel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemChannel;
var export editinline GUIButton SizingButton;
var() globalconfig array<string> ServerHistory;
var() globalconfig array<string> ChannelHistory;
var localized string ConnectText;
var localized string DisconnectText;
var localized string LocalChannel;
var() noexport transient bool bDirty;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIComponent C;

    super.InitComponent(MyController, myOwner);
    C = MenuOwner;
    J0x1b:
    // End:0x60 [While If]
    if(C != none)
    {
        // End:0x49
        if(UT2k4IRC_System(C) != none)
        {
            tp_System = UT2k4IRC_System(C);
        }
        // End:0x60
        else
        {
            C = C.MenuOwner;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
    assert(tp_System != none);
    GetSizingButton();
    Log(string(ServerHistory.Length) $ " Servers " $ string(ChannelHistory.Length) $ " Channels", 'IRC');
    LoadServerHistory();
    LoadChannelHistory();
}

function LoadServerHistory()
{
    local int i;

    // End:0x21
    if(ServerHistory.Length == 0)
    {
        ResetConfig("ServerHistory");
    }
    co_Server.MyComboBox.List.Clear();
    i = 0;
    J0x49:
    // End:0x7d [While If]
    if(i < ServerHistory.Length)
    {
        co_Server.AddItem(ServerHistory[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
}

function LoadChannelHistory()
{
    local int i;

    // End:0x22
    if(ChannelHistory.Length == 0)
    {
        ResetConfig("ChannelHistory");
    }
    co_Channel.MyComboBox.List.Clear();
    co_Channel.AddItem(LocalChannel);
    i = 0;
    J0x5e:
    // End:0xab [While If]
    if(i < ChannelHistory.Length)
    {
        // End:0xa1
        if(Caps(ChannelHistory[i]) != Caps(LocalChannel))
        {
            co_Channel.AddItem(ChannelHistory[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
}

function GetSizingButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8d [While If]
    if(i < Components.Length)
    {
        // End:0x30
        if(GUIButton(Components[i]) == none)
        {
        }
        // End:0x83
        else
        {
            // End:0x83
            if(SizingButton == none || Len(GUIButton(Components[i]).Caption) > Len(SizingButton.Caption))
            {
                SizingButton = GUIButton(Components[i]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool PositionButtons(Canvas C)
{
    local float X, XL, YL;

    SizingButton.Style.TextSize(C, SizingButton.MenuState, SizingButton.Caption, XL, YL, SizingButton.FontScale);
    XL += float(14);
    X = b_Connect.ActualLeft();
    b_Connect.WinWidth = b_Connect.RelativeWidth(XL);
    b_JoinChannel.WinWidth = b_JoinChannel.RelativeWidth(XL);
    b_RemServer.WinLeft = b_RemServer.RelativeLeft(X + XL + XL * 0.10);
    b_RemServer.WinWidth = b_RemServer.RelativeWidth(XL);
    b_RemChannel.WinLeft = b_RemChannel.RelativeLeft(X + XL + XL * 0.10);
    b_RemChannel.WinWidth = b_RemChannel.RelativeWidth(XL);
    return false;
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x2a
    if(Sender == co_Server)
    {
        UpdateConnectionStatus(IsCurrentServer(co_Server.GetText()));
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string str;

    switch(Sender)
    {
        // End:0x8c
        case b_Connect:
            // End:0x39
            if(IsCurrentServer(co_Server.GetText()))
            {
                tp_System.Disconnect();
            }
            // End:0x89
            else
            {
                tp_System.Connect(co_Server.GetText());
                // End:0x89
                if(tp_System.IsConnected())
                {
                    str = co_Server.GetText();
                    AddServerToHistory(str);
                }
            }
            // End:0x130
            break;
        // End:0xed
        case b_JoinChannel:
            // End:0xaa
            if(!tp_System.IsConnected())
            {
                return false;
            }
            str = co_Channel.GetText();
            // End:0xea
            if(str != "")
            {
                tp_System.JoinChannel(str);
                AddChannelToHistory(str);
            }
            // End:0x130
            break;
        // End:0x10d
        case b_RemServer:
            RemoveServerFromHistory(co_Server.GetText());
            // End:0x130
            break;
        // End:0x12d
        case b_RemChannel:
            RemoveChannelFromHistory(co_Channel.GetText());
            // End:0x130
            break;
        // End:0xffff
        default:
            return true;
    }
}

function UpdateConnectionStatus(bool NowConnected)
{
    // End:0x20
    if(NowConnected)
    {
        b_Connect.Caption = DisconnectText;
    }
    // End:0x34
    else
    {
        b_Connect.Caption = ConnectText;
    }
}

function bool AddChannelToHistory(string NewChannelName, optional int Position)
{
    // End:0x0e
    if(NewChannelName == "")
    {
        return false;
    }
    // End:0x2e
    if(Left(NewChannelName, 1) != "#")
    {
        NewChannelName = "#" $ NewChannelName;
    }
    RemoveChannelFromHistory(NewChannelName);
    // End:0x62
    if(Position < 0 || Position >= ChannelHistory.Length)
    {
        Position = ChannelHistory.Length;
    }
    ChannelHistory.Insert(Position, 1);
    ChannelHistory[Position] = NewChannelName;
    co_Channel.MyComboBox.List.Insert(Position, NewChannelName);
    co_Channel.Find(NewChannelName);
    bDirty = true;
    return true;
}

function bool RemoveChannelFromHistory(string ChannelName)
{
    local int i;

    // End:0x20
    if(Left(ChannelName, 1) != "#")
    {
        ChannelName = "#" $ ChannelName;
    }
    i = FindChannelHistoryIndex(ChannelName);
    // End:0x6b
    if(i != -1)
    {
        ChannelHistory.Remove(i, 1);
        co_Channel.RemoveItem(i, 1);
        bDirty = true;
        return true;
    }
    return false;
}

function bool AddServerToHistory(string NewServerName, optional int Position)
{
    // End:0x0e
    if(NewServerName == "")
    {
        return false;
    }
    RemoveServerFromHistory(NewServerName);
    // End:0x42
    if(Position < 0 || Position >= ServerHistory.Length)
    {
        Position = ServerHistory.Length;
    }
    ServerHistory.Insert(Position, 1);
    ServerHistory[Position] = NewServerName;
    co_Server.MyComboBox.List.Insert(Position, NewServerName);
    co_Server.Find(NewServerName);
    bDirty = true;
    return true;
}

function bool RemoveServerFromHistory(string ServerName)
{
    local int i;

    // End:0x0e
    if(ServerName == "")
    {
        return false;
    }
    i = FindServerHistoryIndex(ServerName);
    // End:0x59
    if(i != -1)
    {
        ServerHistory.Remove(i, 1);
        co_Server.RemoveItem(i, 1);
        bDirty = true;
        return true;
    }
    return false;
}

function int FindServerHistoryIndex(string ServerName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3c [While If]
    if(i < ServerHistory.Length)
    {
        // End:0x32
        if(ServerHistory[i] ~= ServerName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindChannelHistoryIndex(string ChannelName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3c [While If]
    if(i < ChannelHistory.Length)
    {
        // End:0x32
        if(ChannelHistory[i] ~= ChannelName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool IsCurrentServer(string ServerAddress)
{
    // End:0x67
    if(tp_System == none || !tp_System.IsConnected() || tp_System.Link == none || tp_System.Link.ServerAddress == "" || ServerAddress == "")
    {
        return false;
    }
    return InStr(ServerAddress, tp_System.Link.ServerAddress) != -1;
}

event free()
{
    super(GUIMultiComponent).free();
    // End:0x12
    if(bDirty)
    {
        SaveConfig();
    }
}

defaultproperties
{
    begin object name=MyServerCombo class=moComboBox
        CaptionWidth=0.250
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1029670
        WinLeft=0.150
        WinWidth=0.40
        WinHeight=0.30
        RenderWeight=3.0
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: moComboBox'UT2k4IRC_Panel.MyServerCombo'
    co_Server=MyServerCombo
    begin object name=MyChannelCombo class=moComboBox
        CaptionWidth=0.250
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.50
        WinLeft=0.150
        WinWidth=0.40
        WinHeight=0.30
        RenderWeight=3.0
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moComboBox'UT2k4IRC_Panel.MyChannelCombo'
    co_Channel=MyChannelCombo
    begin object name=MyConnectButton class=GUIButton
        Caption="??"
        WinTop=0.10
        WinLeft=0.560
        WinWidth=0.20
        WinHeight=0.30
        RenderWeight=3.0
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4IRC_Panel.MyConnectButton'
    b_Connect=MyConnectButton
    begin object name=MyRemoveServerButton class=GUIButton
        Caption="??"
        WinTop=0.10
        WinLeft=0.770
        WinWidth=0.20
        WinHeight=0.30
        RenderWeight=3.0
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4IRC_Panel.MyRemoveServerButton'
    b_RemServer=MyRemoveServerButton
    begin object name=MyJoinChannelButton class=GUIButton
        Caption="??"
        WinTop=0.50
        WinLeft=0.560
        WinWidth=0.20
        WinHeight=0.30
        RenderWeight=3.0
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4IRC_Panel.MyJoinChannelButton'
    b_JoinChannel=MyJoinChannelButton
    begin object name=MyRemoveChannelButton class=GUIButton
        Caption="??"
        WinTop=0.50
        WinLeft=0.770
        WinWidth=0.20
        WinHeight=0.30
        RenderWeight=3.0
        TabOrder=5
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4IRC_Panel.MyRemoveChannelButton'
    b_RemChannel=MyRemoveChannelButton
    ServerHistory=// Object reference not set to an instance of an object.
    
    ConnectText="??"
    DisconnectText="?? ??"
    LocalChannel="#ut"
    OnPreDraw=PositionButtons
}