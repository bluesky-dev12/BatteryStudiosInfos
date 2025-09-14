/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_IRC.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:16
 *
 *******************************************************************************/
class UT2k4Browser_IRC extends UT2K4Browser_Page
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl c_Channel;
var export editinline UT2k4IRC_System tp_System;
var() config string SystemPageClass;
var() config string PublicChannelClass;
var() config string PrivateChannelClass;
var localized string SystemLabel;
var localized string ChooseNewNickText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    c_Channel.__OnChange__Delegate = TabChange;
    tp_System = UT2k4IRC_System(c_Channel.AddTab(SystemLabel, SystemPageClass,,, true));
    tp_System.__OnDisconnect__Delegate = IRCDisconnected;
    tp_System.__NewChannelSelected__Delegate = SetCurrentChannel;
}

function IRCDisconnected()
{
    local int i;

    i = c_Channel.TabStack.Length - 1;
    J0x18:
    // End:0x95 [While If]
    if(i >= 0)
    {
        // End:0x8b
        if(c_Channel.TabStack[i] != none && c_Channel.TabStack[i].MyPanel != tp_System)
        {
            c_Channel.RemoveTab("", c_Channel.TabStack[i]);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIMultiComponent).Closed(Sender, bCancelled);
    tp_System.IRCClosed();
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x3c
    if(bInit && bShow)
    {
        tp_System.SetCurrentChannel(-1);
        bInit = false;
    }
}

function TabChange(GUIComponent Sender)
{
    local int i;
    local export editinline GUITabButton TabButton;

    TabButton = GUITabButton(Sender);
    // End:0x33
    if(TabButton == none || !Controller.bCurMenuInitialized)
    {
        return;
    }
    i = tp_System.FindPublicChannelIndex(TabButton.Caption, true);
    UpdateCurrentChannel(i);
}

function SetCurrentChannel(int Index)
{
    local export editinline GUITabButton But;
    local int i;

    // End:0x26
    if(Index == -1)
    {
        But = tp_System.MyButton;
    }
    // End:0x98
    else
    {
        i = c_Channel.TabIndex(tp_System.Channels[Index].ChannelName);
        // End:0x98
        if(i >= 0 && i < c_Channel.TabStack.Length)
        {
            But = c_Channel.TabStack[i];
        }
    }
    c_Channel.ActivateTab(But, true);
}

function UpdateCurrentChannel(int Index)
{
    CheckSpectateButton(tp_System.ValidChannelIndex(Index));
    tp_System.UpdateCurrentChannel(Index);
}

function SetCloseCaption(optional string NewName)
{
    // End:0x36
    if(NewName != "")
    {
        SetSpectateCaption(Repl(class'UT2k4IRC_System'.default.LeavePrivateText, "%ChanName%", NewName));
    }
    // End:0x4a
    else
    {
        SetSpectateCaption(class'UT2k4IRC_System'.default.CloseWindowCaption);
    }
    RefreshFooter(none, string(!bCommonButtonWidth));
}

function UT2k4IRC_Channel AddChannel(string ChannelName, optional bool bPrivate)
{
    return UT2k4IRC_Channel(c_Channel.AddTab(ChannelName, Eval(bPrivate, PrivateChannelClass, PublicChannelClass)));
}

function bool RemoveChannel(string ChannelName)
{
    // End:0x1f
    if(ChannelName ~= SystemLabel || ChannelName == "")
    {
        return false;
    }
    c_Channel.RemoveTab(ChannelName);
    return true;
}

function JoinClicked()
{
    // End:0x1a
    if(tp_System != none)
    {
        tp_System.ChangeCurrentNick();
    }
}

function SpectateClicked()
{
    // End:0x1a
    if(tp_System != none)
    {
        tp_System.PartCurrentChannel();
    }
}

function RefreshClicked()
{
    // End:0x1a
    if(tp_System != none)
    {
        tp_System.Disconnect();
    }
}

function bool IsRefreshAvailable(out string ButtonCaption)
{
    return tp_System != none && tp_System.DisconnectAvailable(ButtonCaption);
    return false;
}

function bool IsSpectateAvailable(out string ButtonCaption)
{
    return tp_System != none && tp_System.LeaveAvailable(ButtonCaption);
}

function bool IsJoinAvailable(out string ButtonCaption)
{
    return tp_System != none && tp_System.SetNickAvailable(ButtonCaption);
    return true;
}

defaultproperties
{
    begin object name=ChannelTabControl class=GUITabControl
        bDockPanels=true
        TabHeight=0.040
        bAcceptsInput=true
        OnActivate=InternalOnActivate
    object end
    // Reference: GUITabControl'UT2k4Browser_IRC.ChannelTabControl'
    c_Channel=ChannelTabControl
    SystemPageClass="GUI2K4.UT2K4IRC_System"
    PublicChannelClass="GUI2K4.UT2K4IRC_Channel"
    PrivateChannelClass="GUI2K4.UT2K4IRC_Private"
    SystemLabel="???"
    bCommonButtonWidth=true
    PanelCaption="UT2004 ??? ?? ?????"
}