/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_ServerListPageBuddy.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:12
 *
 *******************************************************************************/
class UT2k4Browser_ServerListPageBuddy extends UT2K4Browser_ServerListPageMS
    dependson(UT2K4Browser_ServerListPageMS)
    dependson(UT2k4Browser_BuddyList)
    dependson(UT2k4Browser_BuddyListBox)
    dependson(UT2k4Browser_RulesListBox)
    dependson(UT2k4Browser_PlayersListBox)
    config(User)
    editinlinenew
    instanced;

var() config float BuddySplitterPosition;
var() config array<string> Buddies;
var() config string BuddyListBoxClass;
var export editinline GUISplitter sp_Buddy;
var export editinline UT2k4Browser_BuddyListBox lb_Buddy;
var export editinline UT2k4Browser_BuddyList li_Buddy;
var localized string AddBuddyCaption;
var localized string AddBuddyLabel;
var localized string RemoveBuddyCaption;
var localized string BuddyNameCaption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(UT2k4Browser_ServerListPageBase).InitComponent(MyController, myOwner);
    lb_Buddy.SetAnchor(self);
    li_Buddy = UT2k4Browser_BuddyList(lb_Buddy.List);
    li_Buddy.__OnChange__Delegate = BuddyListChanged;
    li_Buddy.__OnRightClick__Delegate = InternalOnRightClick;
    lb_Buddy.TabOrder = 0;
    lb_Server.TabOrder = 1;
    lb_Rules.TabOrder = 2;
    lb_Players.TabOrder = 3;
    i = 0;
    J0xaa:
    // End:0xd3 [While If]
    if(i < Buddies.Length)
    {
        li_Buddy.AddedItem();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xaa;
    }
}

event Opened(GUIComponent Sender)
{
    super(UT2k4Browser_ServerListPageBase).Opened(Sender);
    Controller.__AddBuddy__Delegate = AddBuddy;
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x37
    if(bShow && bInit)
    {
        sp_Buddy.SplitterUpdatePositions();
        bInit = false;
    }
}

function Refresh()
{
    local int i;

    super.Refresh();
    i = 0;
    J0x0d:
    // End:0x41 [While If]
    if(i < Buddies.Length)
    {
        AddQueryTerm("buddy", Buddies[i], 0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    Browser.Uplink().StartQuery(0);
    SetFooterCaption(StartQueryString);
    KillTimer();
}

function BuddyListChanged(GUIComponent Sender);
function AddBuddy(optional string NewBuddy)
{
    // End:0x64
    if(Controller.OpenMenu(Controller.RequestDataMenu, AddBuddyLabel, BuddyNameCaption))
    {
        Controller.ActivePage.SetDataString(NewBuddy);
        Controller.ActivePage.__OnClose__Delegate = BuddyPageClosed;
    }
}

function BuddyPageClosed(bool bCancelled)
{
    local string S;

    // End:0x0b
    if(bCancelled)
    {
        return;
    }
    S = Controller.ActivePage.GetDataString();
    // End:0x70
    if(S != "")
    {
        // End:0x4c
        if(FindBuddyIndex(S) != -1)
        {
            return;
        }
        Buddies[Buddies.Length] = S;
        li_Buddy.AddedItem();
        SaveConfig();
    }
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x1ad
    if(GUISplitter(NewComp) != none)
    {
        // End:0x19a
        if(GUISplitter(Sender).Panels[0] != none)
        {
            // End:0x187
            if(UT2k4Browser_ServerListPageBuddy(Sender.MenuOwner) != none)
            {
                sp_Buddy = GUISplitter(NewComp);
                sp_Buddy.DefaultPanels[0] = "GUI2K4.UT2K4Browser_ServerListBox";
                sp_Buddy.DefaultPanels[1] = "XInterface.GUISplitter";
                sp_Buddy.WinTop = 0.0;
                sp_Buddy.WinLeft = 0.0;
                sp_Buddy.WinWidth = 1.0;
                sp_Buddy.WinHeight = 1.0;
                sp_Buddy.bNeverFocus = true;
                sp_Buddy.bAcceptsInput = true;
                sp_Buddy.RenderWeight = 0.0;
                sp_Buddy.__OnCreateComponent__Delegate = InternalOnCreateComponent;
                sp_Buddy.__OnLoadINI__Delegate = InternalOnLoadINI;
                sp_Buddy.__OnReleaseSplitter__Delegate = InternalReleaseSplitter;
                sp_Buddy.SplitOrientation = 0;
            }
            // End:0x197
            else
            {
                super(UT2k4Browser_ServerListPageBase).InternalOnCreateComponent(NewComp, Sender);
            }
        }
        // End:0x1aa
        else
        {
            super(UT2k4Browser_ServerListPageBase).InternalOnCreateComponent(NewComp, Sender);
        }
    }
    // End:0x1e0
    else
    {
        // End:0x1d0
        if(UT2k4Browser_BuddyListBox(NewComp) != none)
        {
            lb_Buddy = UT2k4Browser_BuddyListBox(NewComp);
        }
        // End:0x1e0
        else
        {
            super(UT2k4Browser_ServerListPageBase).InternalOnCreateComponent(NewComp, Sender);
        }
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x26
    if(Sender == sp_Buddy)
    {
        sp_Buddy.SplitPosition = BuddySplitterPosition;
    }
    // End:0x36
    else
    {
        super(UT2k4Browser_ServerListPageBase).InternalOnLoadINI(Sender, S);
    }
}

function InternalReleaseSplitter(GUIComponent Sender, float NewPos)
{
    // End:0x20
    if(Sender == sp_Buddy)
    {
        BuddySplitterPosition = NewPos;
        SaveConfig();
    }
    // End:0x30
    else
    {
        super(UT2k4Browser_ServerListPageBase).InternalReleaseSplitter(Sender, NewPos);
    }
}

function int FindBuddyIndex(string buddyName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3c [While If]
    if(i < Buddies.Length)
    {
        // End:0x32
        if(Buddies[i] ~= buddyName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function ContextSelect(GUIContextMenu Sender, int Index)
{
    // End:0x70
    if(!NotifyContextSelect(Sender, Index))
    {
        switch(Index)
        {
            // End:0x2d
            case 0:
                AddBuddy();
                // End:0x70
                break;
            // End:0x6d
            case 1:
                // End:0x6a
                if(li_Buddy.IsValid())
                {
                    Buddies.Remove(li_Buddy.Index, 1);
                    li_Buddy.RemovedCurrent();
                    SaveConfig();
                }
                // End:0x70
                break;
            // End:0xffff
            default:
            }
}

defaultproperties
{
    BuddySplitterPosition=0.5975820
    BuddyListBoxClass="GUI2K4.UT2K4Browser_BuddyListBox"
    AddBuddyCaption="?? ??"
    AddBuddyLabel="?? ??"
    RemoveBuddyCaption="?? ??"
    BuddyNameCaption="?? ??: "
    begin object name=HorzSplitter class=GUISplitter
        SplitOrientation=1
        DefaultPanels[0]="GUI2K4.UT2K4Browser_BuddyListBox"
        DefaultPanels[1]="XInterface.GUISplitter"
        OnReleaseSplitter=InternalReleaseSplitter
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        RenderWeight=1.0
        bBoundToParent=true
        bScaleToParent=true
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: GUISplitter'UT2k4Browser_ServerListPageBuddy.HorzSplitter'
    sp_Main=HorzSplitter
    MainSplitterPosition=0.1843260
    DetailSplitterPosition=0.3191350
    HeaderColumnSizes=// Object reference not set to an instance of an object.
    
    PanelCaption="?? ????"
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=ContextSelect
    object end
    // Reference: GUIContextMenu'UT2k4Browser_ServerListPageBuddy.RCMenu'
    ContextMenu=RCMenu
}