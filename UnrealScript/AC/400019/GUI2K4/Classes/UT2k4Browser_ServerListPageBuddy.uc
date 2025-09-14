class UT2k4Browser_ServerListPageBuddy extends UT2K4Browser_ServerListPageMS
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
    J0xAA:

    // End:0xD3 [Loop If]
    if(i < Buddies.Length)
    {
        li_Buddy.AddedItem();
        i++;
        // [Loop Continue]
        goto J0xAA;
    }
    //return;    
}

event Opened(GUIComponent Sender)
{
    super(UT2k4Browser_ServerListPageBase).Opened(Sender);
    Controller.__AddBuddy__Delegate = AddBuddy;
    //return;    
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
    //return;    
}

function Refresh()
{
    local int i;

    super.Refresh();
    i = 0;
    J0x0D:

    // End:0x41 [Loop If]
    if(i < Buddies.Length)
    {
        AddQueryTerm("buddy", Buddies[i], 0);
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    Browser.Uplink().StartQuery(0);
    SetFooterCaption(StartQueryString);
    KillTimer();
    //return;    
}

function BuddyListChanged(GUIComponent Sender)
{
    //return;    
}

function AddBuddy(optional string NewBuddy)
{
    // End:0x64
    if(Controller.OpenMenu(Controller.RequestDataMenu, AddBuddyLabel, BuddyNameCaption))
    {
        Controller.ActivePage.SetDataString(NewBuddy);
        Controller.ActivePage.__OnClose__Delegate = BuddyPageClosed;
    }
    //return;    
}

function BuddyPageClosed(bool bCancelled)
{
    local string S;

    // End:0x0B
    if(bCancelled)
    {
        return;
    }
    S = Controller.ActivePage.GetDataString();
    // End:0x70
    if(S != "")
    {
        // End:0x4C
        if((FindBuddyIndex(S)) != -1)
        {
            return;
        }
        Buddies[Buddies.Length] = S;
        li_Buddy.AddedItem();
        SaveConfig();
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x1AD
    if(GUISplitter(NewComp) != none)
    {
        // End:0x19A
        if(GUISplitter(Sender).Panels[0] != none)
        {
            // End:0x187
            if(UT2k4Browser_ServerListPageBuddy(Sender.MenuOwner) != none)
            {
                sp_Buddy = GUISplitter(NewComp);
                sp_Buddy.DefaultPanels[0] = "GUI2K4.UT2K4Browser_ServerListBox";
                sp_Buddy.DefaultPanels[1] = "XInterface.GUISplitter";
                sp_Buddy.WinTop = 0.0000000;
                sp_Buddy.WinLeft = 0.0000000;
                sp_Buddy.WinWidth = 1.0000000;
                sp_Buddy.WinHeight = 1.0000000;
                sp_Buddy.bNeverFocus = true;
                sp_Buddy.bAcceptsInput = true;
                sp_Buddy.RenderWeight = 0.0000000;
                sp_Buddy.__OnCreateComponent__Delegate = InternalOnCreateComponent;
                sp_Buddy.__OnLoadINI__Delegate = InternalOnLoadINI;
                sp_Buddy.__OnReleaseSplitter__Delegate = InternalReleaseSplitter;
                sp_Buddy.SplitOrientation = 0;                
            }
            else
            {
                super(UT2k4Browser_ServerListPageBase).InternalOnCreateComponent(NewComp, Sender);
            }            
        }
        else
        {
            super(UT2k4Browser_ServerListPageBase).InternalOnCreateComponent(NewComp, Sender);
        }        
    }
    else
    {
        // End:0x1D0
        if(UT2k4Browser_BuddyListBox(NewComp) != none)
        {
            lb_Buddy = UT2k4Browser_BuddyListBox(NewComp);            
        }
        else
        {
            super(UT2k4Browser_ServerListPageBase).InternalOnCreateComponent(NewComp, Sender);
        }
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x26
    if(Sender == sp_Buddy)
    {
        sp_Buddy.SplitPosition = BuddySplitterPosition;        
    }
    else
    {
        super(UT2k4Browser_ServerListPageBase).InternalOnLoadINI(Sender, S);
    }
    //return;    
}

function InternalReleaseSplitter(GUIComponent Sender, float NewPos)
{
    // End:0x20
    if(Sender == sp_Buddy)
    {
        BuddySplitterPosition = NewPos;
        SaveConfig();        
    }
    else
    {
        super(UT2k4Browser_ServerListPageBase).InternalReleaseSplitter(Sender, NewPos);
    }
    //return;    
}

function int FindBuddyIndex(string buddyName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(i < Buddies.Length)
    {
        // End:0x32
        if(Buddies[i] ~= buddyName)
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

function ContextSelect(GUIContextMenu Sender, int Index)
{
    // End:0x70
    if(!NotifyContextSelect(Sender, Index))
    {
        switch(Index)
        {
            // End:0x2D
            case 0:
                AddBuddy();
                // End:0x70
                break;
            // End:0x6D
            case 1:
                // End:0x6A
                if(li_Buddy.IsValid())
                {
                    Buddies.Remove(li_Buddy.Index, 1);
                    li_Buddy.RemovedCurrent();
                    SaveConfig();
                }
                // End:0x70
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
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
    // Reference: GUISplitter'GUI2K4_Decompressed.UT2k4Browser_ServerListPageBuddy.HorzSplitter'
    begin object name="HorzSplitter" class=XInterface.GUISplitter
        SplitOrientation=1
        DefaultPanels[0]="GUI2K4.UT2K4Browser_BuddyListBox"
        DefaultPanels[1]="XInterface.GUISplitter"
        OnReleaseSplitter=UT2k4Browser_ServerListPageBuddy.InternalReleaseSplitter
        OnCreateComponent=UT2k4Browser_ServerListPageBuddy.InternalOnCreateComponent
        IniOption="@Internal"
        RenderWeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        OnLoadINI=UT2k4Browser_ServerListPageBuddy.InternalOnLoadINI
    end object
    sp_Main=HorzSplitter
    MainSplitterPosition=0.1843260
    DetailSplitterPosition=0.3191350
    HeaderColumnSizes[0]=(ColumnSizes=ColumnSizes[0]=0.0965620
    ColumnSizes[1]=0.4934710
    ColumnSizes[2]=0.2069440
    ColumnSizes[3]=0.1025350
    ColumnSizes[4]=0.1500000)
    HeaderColumnSizes[1]=(ColumnSizes=ColumnSizes[0]=0.4981440
    ColumnSizes[1]=0.5000000)
    HeaderColumnSizes[2]=(ColumnSizes=ColumnSizes[0]=0.4734280
    ColumnSizes[1]=0.1856650
    ColumnSizes[2]=0.2268240
    ColumnSizes[3]=0.2200000)
    PanelCaption="?? ????"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2k4Browser_ServerListPageBuddy.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=UT2k4Browser_ServerListPageBuddy.ContextSelect
    end object
    ContextMenu=RCMenu
}