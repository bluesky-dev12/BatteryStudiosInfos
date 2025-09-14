/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchSetupMaps.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:13
 *	Functions:16
 *
 *******************************************************************************/
class MatchSetupMaps extends MatchSetupPanelBase
    editinlinenew
    instanced;

struct mapInfo
{
    var string FriendlyName;
    var string params;
    var string URL;
    var int Index;
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Avail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Active;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Avail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Active;
var() editconst noexport editinline GUIList li_Active;
var() editconst noexport editinline GUIList li_Avail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Add;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_AddAll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Remove;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemoveAll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MoveUp;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MoveDown;
var() array<mapInfo> TrackedMaps;

function InitPanel()
{
    super.InitPanel();
    Group = class'VotingReplicationInfo'.default.MapID;
}

function LoggedOut()
{
    super.LoggedOut();
    li_Avail.Clear();
    li_Active.Clear();
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local int i;
    local array<string> Indexes;

    // End:0xd4
    if(Type ~= Group)
    {
        Log("MAPS HandleResponse Info '" $ Info $ "'  Data '" $ Data $ "'", 'MapVoteDebug');
        // End:0x77
        if(Info ~= class'VotingReplicationInfo'.default.AddID)
        {
            ReceiveNewMap(Data);
            return true;
        }
        // End:0xd2
        if(Info ~= class'VotingReplicationInfo'.default.UpdateID)
        {
            Split(Data, ",", Indexes);
            i = 0;
            J0xa5:
            // End:0xd2 [While If]
            if(i < Indexes.Length)
            {
                AddMapByIndex(int(Indexes[i]));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xa5;
            }
        }
        return true;
    }
    return false;
}

function ReceiveNewMap(string Data)
{
    local int Index, pos;
    local string MapName;

    pos = InStr(Data, ",");
    // End:0x4b
    if(pos != -1)
    {
        Index = int(Left(Data, pos));
        MapName = Mid(Data, pos + 1);
    }
    // End:0x80
    else
    {
        Log("HandleResponse received weird mapname:" @ Data);
        assert(false);
    }
    TrackMapInfo(StripMapName(MapName), "", Index);
    li_Avail.Add(MapName);
}

function TrackMapInfo(string FriendlyName, string URL, int Index)
{
    local int i;

    i = FindTrackingIndex(FriendlyName $ URL);
    // End:0x43
    if(i == -1)
    {
        i = TrackedMaps.Length;
        TrackedMaps.Length = TrackedMaps.Length + 1;
    }
    TrackedMaps[i].FriendlyName = FriendlyName;
    TrackedMaps[i].params = URL;
    TrackedMaps[i].URL = FriendlyName $ URL;
    TrackedMaps[i].Index = Index;
}

function int FindTrackingIndex(string MapURL)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < TrackedMaps.Length)
    {
        // End:0x37
        if(TrackedMaps[i].URL ~= MapURL)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIPanel).InitComponent(InController, inOwner);
    li_Avail = lb_Avail.List;
    li_Active = lb_Active.List;
    // End:0xb3
    if(li_Avail != none)
    {
        li_Avail.bDropSource = true;
        li_Avail.bDropTarget = true;
        li_Avail.__OnDblClick__Delegate = ModifyMapList;
        li_Avail.AddLinkObject(b_Add, true);
        li_Avail.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
        li_Avail.bInitializeList = false;
    }
    // End:0x158
    if(li_Active != none)
    {
        li_Active.bDropSource = true;
        li_Active.bDropTarget = true;
        li_Active.__OnDblClick__Delegate = ModifyMapList;
        li_Active.AddLinkObject(b_Remove, true);
        li_Active.AddLinkObject(b_MoveUp, true);
        li_Active.AddLinkObject(b_MoveDown, true);
        li_Active.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
        li_Active.bInitializeList = false;
    }
    sb_Avail.ManageComponent(lb_Avail);
    sb_Active.ManageComponent(lb_Active);
}

function bool AddMap()
{
    local int i;
    local array<GUIListElem> PendingElements;

    // End:0x16
    if(!li_Avail.IsValid())
    {
        return false;
    }
    li_Avail.bNotify = false;
    PendingElements = li_Avail.GetPendingElements(true);
    i = 0;
    J0x44:
    // End:0x94 [While If]
    if(i < PendingElements.Length)
    {
        li_Avail.RemoveElement(PendingElements[i],, true);
        li_Active.AddElement(PendingElements[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    li_Avail.bNotify = true;
    li_Avail.ClearPendingElements();
    li_Avail.SetIndex(li_Avail.Index);
    return true;
}

function bool RemoveMap()
{
    local int i;
    local array<GUIListElem> PendingElements;

    // End:0x16
    if(!li_Active.IsValid())
    {
        return false;
    }
    li_Active.bNotify = false;
    PendingElements = li_Active.GetPendingElements(true);
    i = 0;
    J0x44:
    // End:0x94 [While If]
    if(i < PendingElements.Length)
    {
        li_Active.RemoveElement(PendingElements[i],, true);
        li_Avail.AddElement(PendingElements[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    li_Active.bNotify = true;
    li_Active.ClearPendingElements();
    li_Active.SetIndex(li_Active.Index);
    return true;
}

function AddMapByIndex(int Index)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xb3 [While If]
    if(i < TrackedMaps.Length)
    {
        // End:0xa9
        if(TrackedMaps[i].Index == Index)
        {
            li_Avail.RemoveItem(TrackedMaps[i].URL);
            // End:0x98
            if(li_Active.FindIndex(TrackedMaps[i].URL) == -1)
            {
                li_Active.Add(TrackedMaps[i].URL);
            }
            li_Avail.ClearPendingElements();
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveMapByIndex(int Index)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xb3 [While If]
    if(i < TrackedMaps.Length)
    {
        // End:0xa9
        if(TrackedMaps[i].Index == Index)
        {
            li_Active.RemoveItem(TrackedMaps[i].URL);
            // End:0x98
            if(li_Avail.FindIndex(TrackedMaps[i].URL) == -1)
            {
                li_Avail.Add(TrackedMaps[i].URL);
            }
            li_Active.ClearPendingElements();
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SubmitChanges()
{
    local int i, idx;
    local string str;

    i = 0;
    J0x07:
    // End:0x80 [While If]
    if(i < li_Active.ItemCount)
    {
        idx = FindTrackingIndex(li_Active.GetItemAtIndex(i));
        // End:0x76
        if(idx != -1)
        {
            // End:0x66
            if(str != "")
            {
                str $= ",";
            }
            str $= string(idx);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    SendCommand(Group $ ":" $ str);
    super.SubmitChanges();
}

singular function bool ModifyMapList(GUIComponent Sender)
{
    local int Index;
    local string str;

    // End:0x17
    if(Sender == lb_Avail)
    {
        AddMap();
        return true;
    }
    // End:0x2e
    if(Sender == lb_Active)
    {
        RemoveMap();
        return true;
    }
    // End:0x40
    if(GUIButton(Sender) == none)
    {
        return false;
    }
    switch(GUIButton(Sender).Caption)
    {
        // End:0x6d
        case b_Add.Caption:
            return AddMap();
        // End:0xba
        case b_AddAll.Caption:
            // End:0x95
            if(lb_Avail.ItemCount() == 0)
            {
                return true;
            }
            li_Active.LoadFrom(li_Avail);
            li_Avail.Clear();
            return true;
        // End:0xd2
        case b_Remove.Caption:
            return RemoveMap();
        // End:0x120
        case b_RemoveAll.Caption:
            // End:0xfa
            if(lb_Active.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.LoadFrom(li_Active, false);
            li_Active.Clear();
            return true;
        // End:0x1b1
        case b_MoveUp.Caption:
            // End:0x147
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = GetMapURL(li_Active, -1);
            // End:0x1af
            if(Index > 0)
            {
                li_Active.Swap(Index, Index - 1);
                li_Active.SetIndex(Index - 1);
            }
            return true;
        // End:0x253
        case b_MoveDown.Caption:
            // End:0x1d8
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = GetMapURL(li_Active, -1);
            // End:0x251
            if(Index < lb_Active.ItemCount() - 1)
            {
                li_Active.Swap(Index, Index + 1);
                li_Active.SetIndex(Index + 1);
            }
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function InternalCheckLinkedObj(GUIListBase List)
{
    // End:0x24
    if(List.IsValid())
    {
        List.EnableLinkedObjects();
    }
    // End:0x33
    else
    {
        List.DisableLinkedObjects();
    }
    // End:0x55
    if(li_Avail.ItemCount > 0)
    {
        EnableComponent(b_AddAll);
    }
    // End:0x60
    else
    {
        DisableComponent(b_AddAll);
    }
    // End:0x117
    if(li_Active.ItemCount > 0)
    {
        EnableComponent(b_RemoveAll);
        // End:0xfe
        if(li_Active.IsValid())
        {
            // End:0xb3
            if(li_Active.Index == 0)
            {
                DisableComponent(b_MoveUp);
            }
            // End:0xfb
            else
            {
                EnableComponent(b_MoveUp);
                // End:0xf0
                if(li_Active.Index == li_Active.ItemCount - 1)
                {
                    DisableComponent(b_MoveDown);
                }
                // End:0xfb
                else
                {
                    EnableComponent(b_MoveDown);
                }
            }
        }
        // End:0x114
        else
        {
            DisableComponent(b_MoveUp);
            DisableComponent(b_MoveDown);
        }
    }
    // End:0x138
    else
    {
        DisableComponent(b_RemoveAll);
        DisableComponent(b_MoveUp);
        DisableComponent(b_MoveDown);
    }
}

static function string StripMapName(string FullMapName)
{
    local int pos;

    pos = InStr(FullMapName, " ");
    // End:0x31
    if(pos != -1)
    {
        FullMapName = Left(FullMapName, pos);
    }
    pos = InStr(FullMapName, "?");
    // End:0x62
    if(pos != -1)
    {
        FullMapName = Left(FullMapName, pos);
    }
    return FullMapName;
}

static function string GetMapURL(GUIList List, int Index)
{
    local int pos;
    local string S;

    // End:0x23
    if(Index == -1)
    {
        Index = List.Index;
    }
    S = List.GetItemAtIndex(Index);
    pos = InStr(S, " ");
    // End:0x84
    if(pos != -1)
    {
        S = Left(S, pos) $ List.GetExtraAtIndex(Index);
    }
    return S;
}

defaultproperties
{
    begin object name=InactiveBackground class=GUISectionBackground
        bFillClient=true
        Caption="???? ?"
        BottomPadding=0.110
        WinTop=0.0300530
        WinLeft=0.013880
        WinWidth=0.4831070
        WinHeight=0.9653130
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'MatchSetupMaps.InactiveBackground'
    sb_Avail=InactiveBackground
    begin object name=ActiveBackground class=GUISectionBackground
        bFillClient=true
        Caption="??? ?"
        BottomPadding=0.2150
        WinTop=0.0300530
        WinLeft=0.5112430
        WinWidth=0.4741940
        WinHeight=0.9653130
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'MatchSetupMaps.ActiveBackground'
    sb_Active=ActiveBackground
    begin object name=InactiveList class=GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1380780
        WinLeft=0.1137940
        WinWidth=0.3803940
        WinHeight=0.6626710
        TabOrder=0
    object end
    // Reference: GUIListBox'MatchSetupMaps.InactiveList'
    lb_Avail=InactiveList
    begin object name=ActiveList class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1080210
        WinLeft=0.6058610
        WinWidth=0.3683590
        WinHeight=0.6626710
        TabOrder=1
    object end
    // Reference: GUIListBox'MatchSetupMaps.ActiveList'
    lb_Active=ActiveList
    begin object name=AddButton class=GUIButton
        Caption="??"
        Hint="? ???? ??? ?? ????."
        WinTop=0.9021980
        WinLeft=0.2637430
        WinWidth=0.2038070
        WinHeight=0.0791840
        TabOrder=6
        bRepeatClick=true
        OnClickSound=3
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMaps.AddButton'
    b_Add=AddButton
    begin object name=AddAllButton class=GUIButton
        Caption="?? ???"
        Hint="? ???? ?? ?? ?? ????."
        WinTop=0.9021980
        WinLeft=0.0450060
        WinWidth=0.1902320
        WinHeight=0.0791840
        TabOrder=5
        OnClickSound=3
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMaps.AddAllButton'
    b_AddAll=AddAllButton
    begin object name=RemoveButton class=GUIButton
        Caption="??"
        AutoSizePadding=(HorzPerc=0.50,VertPerc=0.0)
        Hint="??? ?? ? ????? ????."
        WinTop=0.9021980
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=10
        bRepeatClick=true
        OnClickSound=4
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMaps.RemoveButton'
    b_Remove=RemoveButton
    begin object name=RemoveAllButton class=GUIButton
        Caption="?? ??"
        Hint="?????? ?? ?? ????."
        WinTop=0.9021980
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=11
        OnClickSound=4
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMaps.RemoveAllButton'
    b_RemoveAll=RemoveAllButton
    begin object name=MoveUpButton class=GUIButton
        Caption="??"
        Hint="??? ?? ????? ?? ?? ????."
        WinTop=0.8153760
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=9
        bRepeatClick=true
        OnClickSound=3
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMaps.MoveUpButton'
    b_MoveUp=MoveUpButton
    begin object name=MoveDownButton class=GUIButton
        Caption="???"
        Hint="??? ?? ????? ?? ??? ????."
        WinTop=0.8153760
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=8
        bRepeatClick=true
        OnClickSound=4
        OnClick=ModifyMapList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMaps.MoveDownButton'
    b_MoveDown=MoveDownButton
    OnLogOut=LoggedOut
    PanelCaption="????"
}