class UT2k4IRC_Panel extends GUIPanel
    config(User)
    editinlinenew
    instanced;

var export editinline UT2k4IRC_System tp_System;
var() automated moComboBox co_Server;
var() automated moComboBox co_Channel;
var() automated GUIButton b_Connect;
var() automated GUIButton b_RemServer;
var() automated GUIButton b_JoinChannel;
var() automated GUIButton b_RemChannel;
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
    J0x1B:

    // End:0x60 [Loop If]
    if(C != none)
    {
        // End:0x49
        if(UT2k4IRC_System(C) != none)
        {
            tp_System = UT2k4IRC_System(C);
            // [Explicit Break]
            goto J0x60;
        }
        C = C.MenuOwner;
        // [Loop Continue]
        goto J0x1B;
    }
    J0x60:

    assert(tp_System != none);
    GetSizingButton();
    Log(((string(ServerHistory.Length) $ " Servers ") $ string(ChannelHistory.Length)) $ " Channels", 'IRC');
    LoadServerHistory();
    LoadChannelHistory();
    //return;    
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

    // End:0x7D [Loop If]
    if(i < ServerHistory.Length)
    {
        co_Server.AddItem(ServerHistory[i]);
        i++;
        // [Loop Continue]
        goto J0x49;
    }
    //return;    
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
    J0x5E:

    // End:0xAB [Loop If]
    if(i < ChannelHistory.Length)
    {
        // End:0xA1
        if(Caps(ChannelHistory[i]) != Caps(LocalChannel))
        {
            co_Channel.AddItem(ChannelHistory[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x5E;
    }
    //return;    
}

function GetSizingButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8D [Loop If]
    if(i < Components.Length)
    {
        // End:0x30
        if(GUIButton(Components[i]) == none)
        {
            // [Explicit Continue]
            goto J0x83;
        }
        // End:0x83
        if((SizingButton == none) || Len(GUIButton(Components[i]).Caption) > Len(SizingButton.Caption))
        {
            SizingButton = GUIButton(Components[i]);
        }
        J0x83:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool PositionButtons(Canvas C)
{
    local float X, XL, YL;

    SizingButton.Style.TextSize(C, SizingButton.MenuState, SizingButton.Caption, XL, YL, SizingButton.FontScale);
    XL += float(14);
    X = b_Connect.ActualLeft();
    b_Connect.WinWidth = b_Connect.RelativeWidth(XL);
    b_JoinChannel.WinWidth = b_JoinChannel.RelativeWidth(XL);
    b_RemServer.WinLeft = b_RemServer.RelativeLeft((X + XL) + (XL * 0.1000000));
    b_RemServer.WinWidth = b_RemServer.RelativeWidth(XL);
    b_RemChannel.WinLeft = b_RemChannel.RelativeLeft((X + XL) + (XL * 0.1000000));
    b_RemChannel.WinWidth = b_RemChannel.RelativeWidth(XL);
    return false;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x2A
    if(Sender == co_Server)
    {
        UpdateConnectionStatus(IsCurrentServer(co_Server.GetText()));
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string str;

    switch(Sender)
    {
        // End:0x8C
        case b_Connect:
            // End:0x39
            if(IsCurrentServer(co_Server.GetText()))
            {
                tp_System.Disconnect();                
            }
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
        // End:0xED
        case b_JoinChannel:
            // End:0xAA
            if(!tp_System.IsConnected())
            {
                return false;
            }
            str = co_Channel.GetText();
            // End:0xEA
            if(str != "")
            {
                tp_System.JoinChannel(str);
                AddChannelToHistory(str);
            }
            // End:0x130
            break;
        // End:0x10D
        case b_RemServer:
            RemoveServerFromHistory(co_Server.GetText());
            // End:0x130
            break;
        // End:0x12D
        case b_RemChannel:
            RemoveChannelFromHistory(co_Channel.GetText());
            // End:0x130
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function UpdateConnectionStatus(bool NowConnected)
{
    // End:0x20
    if(NowConnected)
    {
        b_Connect.Caption = DisconnectText;        
    }
    else
    {
        b_Connect.Caption = ConnectText;
    }
    //return;    
}

function bool AddChannelToHistory(string NewChannelName, optional int Position)
{
    // End:0x0E
    if(NewChannelName == "")
    {
        return false;
    }
    // End:0x2E
    if(Left(NewChannelName, 1) != "#")
    {
        NewChannelName = "#" $ NewChannelName;
    }
    RemoveChannelFromHistory(NewChannelName);
    // End:0x62
    if((Position < 0) || Position >= ChannelHistory.Length)
    {
        Position = ChannelHistory.Length;
    }
    ChannelHistory.Insert(Position, 1);
    ChannelHistory[Position] = NewChannelName;
    co_Channel.MyComboBox.List.Insert(Position, NewChannelName);
    co_Channel.Find(NewChannelName);
    bDirty = true;
    return true;
    //return;    
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
    // End:0x6B
    if(i != -1)
    {
        ChannelHistory.Remove(i, 1);
        co_Channel.RemoveItem(i, 1);
        bDirty = true;
        return true;
    }
    return false;
    //return;    
}

function bool AddServerToHistory(string NewServerName, optional int Position)
{
    // End:0x0E
    if(NewServerName == "")
    {
        return false;
    }
    RemoveServerFromHistory(NewServerName);
    // End:0x42
    if((Position < 0) || Position >= ServerHistory.Length)
    {
        Position = ServerHistory.Length;
    }
    ServerHistory.Insert(Position, 1);
    ServerHistory[Position] = NewServerName;
    co_Server.MyComboBox.List.Insert(Position, NewServerName);
    co_Server.Find(NewServerName);
    bDirty = true;
    return true;
    //return;    
}

function bool RemoveServerFromHistory(string ServerName)
{
    local int i;

    // End:0x0E
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
    //return;    
}

function int FindServerHistoryIndex(string ServerName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(i < ServerHistory.Length)
    {
        // End:0x32
        if(ServerHistory[i] ~= ServerName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int FindChannelHistoryIndex(string ChannelName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(i < ChannelHistory.Length)
    {
        // End:0x32
        if(ChannelHistory[i] ~= ChannelName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool IsCurrentServer(string ServerAddress)
{
    // End:0x67
    if(((((tp_System == none) || !tp_System.IsConnected()) || tp_System.Link == none) || tp_System.Link.ServerAddress == "") || ServerAddress == "")
    {
        return false;
    }
    return InStr(ServerAddress, tp_System.Link.ServerAddress) != -1;
    //return;    
}

event free()
{
    super(GUIMultiComponent).free();
    // End:0x12
    if(bDirty)
    {
        SaveConfig();
    }
    //return;    
}

defaultproperties
{
    // Reference: moComboBox'GUI2K4_Decompressed.UT2k4IRC_Panel.MyServerCombo'
    begin object name="MyServerCombo" class=XInterface.moComboBox
        CaptionWidth=0.2500000
        Caption="??"
        OnCreateComponent=MyServerCombo.InternalOnCreateComponent
        WinTop=0.1029670
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.3000000
        RenderWeight=3.0000000
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2k4IRC_Panel.InternalOnChange
    end object
    co_Server=MyServerCombo
    // Reference: moComboBox'GUI2K4_Decompressed.UT2k4IRC_Panel.MyChannelCombo'
    begin object name="MyChannelCombo" class=XInterface.moComboBox
        CaptionWidth=0.2500000
        Caption="??"
        OnCreateComponent=MyChannelCombo.InternalOnCreateComponent
        WinTop=0.5000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.3000000
        RenderWeight=3.0000000
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
    end object
    co_Channel=MyChannelCombo
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4IRC_Panel.MyConnectButton'
    begin object name="MyConnectButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.1000000
        WinLeft=0.5600000
        WinWidth=0.2000000
        WinHeight=0.3000000
        RenderWeight=3.0000000
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2k4IRC_Panel.InternalOnClick
        OnKeyEvent=MyConnectButton.InternalOnKeyEvent
    end object
    b_Connect=MyConnectButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4IRC_Panel.MyRemoveServerButton'
    begin object name="MyRemoveServerButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.1000000
        WinLeft=0.7700000
        WinWidth=0.2000000
        WinHeight=0.3000000
        RenderWeight=3.0000000
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2k4IRC_Panel.InternalOnClick
        OnKeyEvent=MyRemoveServerButton.InternalOnKeyEvent
    end object
    b_RemServer=MyRemoveServerButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4IRC_Panel.MyJoinChannelButton'
    begin object name="MyJoinChannelButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5000000
        WinLeft=0.5600000
        WinWidth=0.2000000
        WinHeight=0.3000000
        RenderWeight=3.0000000
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2k4IRC_Panel.InternalOnClick
        OnKeyEvent=MyJoinChannelButton.InternalOnKeyEvent
    end object
    b_JoinChannel=MyJoinChannelButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4IRC_Panel.MyRemoveChannelButton'
    begin object name="MyRemoveChannelButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5000000
        WinLeft=0.7700000
        WinWidth=0.2000000
        WinHeight=0.3000000
        RenderWeight=3.0000000
        TabOrder=5
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2k4IRC_Panel.InternalOnClick
        OnKeyEvent=MyRemoveChannelButton.InternalOnKeyEvent
    end object
    b_RemChannel=MyRemoveChannelButton
    ServerHistory[0]="irc.enterthegame.com"
    ServerHistory[1]="irc.utchat.com"
    ConnectText="??"
    DisconnectText="?? ??"
    LocalChannel="#ut"
    OnPreDraw=UT2k4IRC_Panel.PositionButtons
}