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

var() automated GUISectionBackground sb_Avail;
var() automated GUISectionBackground sb_Active;
var() automated GUIListBox lb_Avail;
var() automated GUIListBox lb_Active;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIList li_Active;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIList li_Avail;
var() automated GUIButton b_Add;
var() automated GUIButton b_AddAll;
var() automated GUIButton b_Remove;
var() automated GUIButton b_RemoveAll;
var() automated GUIButton b_MoveUp;
var() automated GUIButton b_MoveDown;
var() array<mapInfo> TrackedMaps;

function InitPanel()
{
    super.InitPanel();
    Group = Class'xVoting_Decompressed.VotingReplicationInfo'.default.MapID;
    //return;    
}

function LoggedOut()
{
    super.LoggedOut();
    li_Avail.Clear();
    li_Active.Clear();
    //return;    
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local int i;
    local array<string> Indexes;

    // End:0xD4
    if(Type ~= Group)
    {
        Log(((("MAPS HandleResponse Info '" $ Info) $ "'  Data '") $ Data) $ "'", 'MapVoteDebug');
        // End:0x77
        if(Info ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.AddID)
        {
            ReceiveNewMap(Data);
            return true;
        }
        // End:0xD2
        if(Info ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.UpdateID)
        {
            Split(Data, ",", Indexes);
            i = 0;
            J0xA5:

            // End:0xD2 [Loop If]
            if(i < Indexes.Length)
            {
                AddMapByIndex(int(Indexes[i]));
                i++;
                // [Loop Continue]
                goto J0xA5;
            }
        }
        return true;
    }
    return false;
    //return;    
}

function ReceiveNewMap(string Data)
{
    local int Index, pos;
    local string MapName;

    pos = InStr(Data, ",");
    // End:0x4B
    if(pos != -1)
    {
        Index = int(Left(Data, pos));
        MapName = Mid(Data, pos + 1);        
    }
    else
    {
        Log("HandleResponse received weird mapname:" @ Data);
        assert(false);
    }
    TrackMapInfo(StripMapName(MapName), "", Index);
    li_Avail.Add(MapName);
    //return;    
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
    //return;    
}

function int FindTrackingIndex(string MapURL)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < TrackedMaps.Length)
    {
        // End:0x37
        if(TrackedMaps[i].URL ~= MapURL)
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

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIPanel).InitComponent(InController, inOwner);
    li_Avail = lb_Avail.List;
    li_Active = lb_Active.List;
    // End:0xB3
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
    //return;    
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

    // End:0x94 [Loop If]
    if(i < PendingElements.Length)
    {
        li_Avail.RemoveElement(PendingElements[i],, true);
        li_Active.AddElement(PendingElements[i]);
        i++;
        // [Loop Continue]
        goto J0x44;
    }
    li_Avail.bNotify = true;
    li_Avail.ClearPendingElements();
    li_Avail.SetIndex(li_Avail.Index);
    return true;
    //return;    
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

    // End:0x94 [Loop If]
    if(i < PendingElements.Length)
    {
        li_Active.RemoveElement(PendingElements[i],, true);
        li_Avail.AddElement(PendingElements[i]);
        i++;
        // [Loop Continue]
        goto J0x44;
    }
    li_Active.bNotify = true;
    li_Active.ClearPendingElements();
    li_Active.SetIndex(li_Active.Index);
    return true;
    //return;    
}

function AddMapByIndex(int Index)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xB3 [Loop If]
    if(i < TrackedMaps.Length)
    {
        // End:0xA9
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveMapByIndex(int Index)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xB3 [Loop If]
    if(i < TrackedMaps.Length)
    {
        // End:0xA9
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SubmitChanges()
{
    local int i, idx;
    local string str;

    i = 0;
    J0x07:

    // End:0x80 [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    SendCommand((Group $ ":") $ str);
    super.SubmitChanges();
    //return;    
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
    // End:0x2E
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
        // End:0x6D
        case b_Add.Caption:
            return AddMap();
        // End:0xBA
        case b_AddAll.Caption:
            // End:0x95
            if(lb_Avail.ItemCount() == 0)
            {
                return true;
            }
            li_Active.LoadFrom(li_Avail);
            li_Avail.Clear();
            return true;
        // End:0xD2
        case b_Remove.Caption:
            return RemoveMap();
        // End:0x120
        case b_RemoveAll.Caption:
            // End:0xFA
            if(lb_Active.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.LoadFrom(li_Active, false);
            li_Active.Clear();
            return true;
        // End:0x1B1
        case b_MoveUp.Caption:
            // End:0x147
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = GetMapURL(li_Active, -1);
            // End:0x1AF
            if(Index > 0)
            {
                li_Active.Swap(Index, Index - 1);
                li_Active.SetIndex(Index - 1);
            }
            return true;
        // End:0x253
        case b_MoveDown.Caption:
            // End:0x1D8
            if(!li_Active.IsValid())
            {
                return true;
            }
            Index = li_Active.Index;
            str = GetMapURL(li_Active, -1);
            // End:0x251
            if(Index < (lb_Active.ItemCount() - 1))
            {
                li_Active.Swap(Index, Index + 1);
                li_Active.SetIndex(Index + 1);
            }
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function InternalCheckLinkedObj(GUIListBase List)
{
    // End:0x24
    if(List.IsValid())
    {
        List.EnableLinkedObjects();        
    }
    else
    {
        List.DisableLinkedObjects();
    }
    // End:0x55
    if(li_Avail.ItemCount > 0)
    {
        EnableComponent(b_AddAll);        
    }
    else
    {
        DisableComponent(b_AddAll);
    }
    // End:0x117
    if(li_Active.ItemCount > 0)
    {
        EnableComponent(b_RemoveAll);
        // End:0xFE
        if(li_Active.IsValid())
        {
            // End:0xB3
            if(li_Active.Index == 0)
            {
                DisableComponent(b_MoveUp);                
            }
            else
            {
                EnableComponent(b_MoveUp);
                // End:0xF0
                if(li_Active.Index == (li_Active.ItemCount - 1))
                {
                    DisableComponent(b_MoveDown);                    
                }
                else
                {
                    EnableComponent(b_MoveDown);
                }
            }            
        }
        else
        {
            DisableComponent(b_MoveUp);
            DisableComponent(b_MoveDown);
        }        
    }
    else
    {
        DisableComponent(b_RemoveAll);
        DisableComponent(b_MoveUp);
        DisableComponent(b_MoveDown);
    }
    //return;    
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
    //return;    
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
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'xVoting_Decompressed.MatchSetupMaps.InactiveBackground'
    begin object name="InactiveBackground" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="???? ?"
        BottomPadding=0.1100000
        WinTop=0.0300530
        WinLeft=0.0138800
        WinWidth=0.4831070
        WinHeight=0.9653130
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InactiveBackground.InternalPreDraw
    end object
    sb_Avail=InactiveBackground
    // Reference: GUISectionBackground'xVoting_Decompressed.MatchSetupMaps.ActiveBackground'
    begin object name="ActiveBackground" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="??? ?"
        BottomPadding=0.2150000
        WinTop=0.0300530
        WinLeft=0.5112430
        WinWidth=0.4741940
        WinHeight=0.9653130
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=ActiveBackground.InternalPreDraw
    end object
    sb_Active=ActiveBackground
    // Reference: GUIListBox'xVoting_Decompressed.MatchSetupMaps.InactiveList'
    begin object name="InactiveList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InactiveList.InternalOnCreateComponent
        WinTop=0.1380780
        WinLeft=0.1137940
        WinWidth=0.3803940
        WinHeight=0.6626710
        TabOrder=0
    end object
    lb_Avail=InactiveList
    // Reference: GUIListBox'xVoting_Decompressed.MatchSetupMaps.ActiveList'
    begin object name="ActiveList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=ActiveList.InternalOnCreateComponent
        WinTop=0.1080210
        WinLeft=0.6058610
        WinWidth=0.3683590
        WinHeight=0.6626710
        TabOrder=1
    end object
    lb_Active=ActiveList
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMaps.AddButton'
    begin object name="AddButton" class=XInterface.GUIButton
        Caption="??"
        Hint="? ???? ??? ?? ????."
        WinTop=0.9021980
        WinLeft=0.2637430
        WinWidth=0.2038070
        WinHeight=0.0791840
        TabOrder=6
        bRepeatClick=true
        OnClickSound=3
        OnClick=MatchSetupMaps.ModifyMapList
        OnKeyEvent=AddButton.InternalOnKeyEvent
    end object
    b_Add=AddButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMaps.AddAllButton'
    begin object name="AddAllButton" class=XInterface.GUIButton
        Caption="?? ???"
        Hint="? ???? ?? ?? ?? ????."
        WinTop=0.9021980
        WinLeft=0.0450060
        WinWidth=0.1902320
        WinHeight=0.0791840
        TabOrder=5
        OnClickSound=3
        OnClick=MatchSetupMaps.ModifyMapList
        OnKeyEvent=AddAllButton.InternalOnKeyEvent
    end object
    b_AddAll=AddAllButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMaps.RemoveButton'
    begin object name="RemoveButton" class=XInterface.GUIButton
        Caption="??"
        AutoSizePadding=(HorzPerc=0.5000000,VertPerc=0.0000000)
        Hint="??? ?? ? ????? ????."
        WinTop=0.9021980
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=10
        bRepeatClick=true
        OnClickSound=4
        OnClick=MatchSetupMaps.ModifyMapList
        OnKeyEvent=RemoveButton.InternalOnKeyEvent
    end object
    b_Remove=RemoveButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMaps.RemoveAllButton'
    begin object name="RemoveAllButton" class=XInterface.GUIButton
        Caption="?? ??"
        Hint="?????? ?? ?? ????."
        WinTop=0.9021980
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=11
        OnClickSound=4
        OnClick=MatchSetupMaps.ModifyMapList
        OnKeyEvent=RemoveAllButton.InternalOnKeyEvent
    end object
    b_RemoveAll=RemoveAllButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMaps.MoveUpButton'
    begin object name="MoveUpButton" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ?? ????? ?? ?? ????."
        WinTop=0.8153760
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=9
        bRepeatClick=true
        OnClickSound=3
        OnClick=MatchSetupMaps.ModifyMapList
        OnKeyEvent=MoveUpButton.InternalOnKeyEvent
    end object
    b_MoveUp=MoveUpButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMaps.MoveDownButton'
    begin object name="MoveDownButton" class=XInterface.GUIButton
        Caption="???"
        Hint="??? ?? ????? ?? ??? ????."
        WinTop=0.8153760
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0791840
        TabOrder=8
        bRepeatClick=true
        OnClickSound=4
        OnClick=MatchSetupMaps.ModifyMapList
        OnKeyEvent=MoveDownButton.InternalOnKeyEvent
    end object
    b_MoveDown=MoveDownButton
    OnLogOut=MatchSetupMaps.LoggedOut
    PanelCaption="????"
}