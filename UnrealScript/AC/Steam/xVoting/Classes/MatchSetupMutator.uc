/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchSetupMutator.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:11
 *	Functions:14
 *
 *******************************************************************************/
class MatchSetupMutator extends MatchSetupPanelBase
    editinlinenew
    instanced;

struct MutatorInfo
{
    var string ClassName;
    var string FriendlyName;
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
var() array<MutatorInfo> TrackedMutators;

function InitPanel()
{
    super.InitPanel();
    Group = class'VotingReplicationInfo'.default.MutatorID;
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local int i;
    local array<string> Indexes;

    // End:0xe6
    if(Type ~= Group)
    {
        Log("MUTATORS HandleResponse Info '" $ Info $ "'  Data '" $ Data $ "'", 'MapVoteDebug');
        // End:0x7b
        if(Info ~= class'VotingReplicationInfo'.default.AddID)
        {
            ReceiveNewMutator(Data);
            return true;
        }
        // End:0xe4
        if(Info ~= class'VotingReplicationInfo'.default.UpdateID && Data != "")
        {
            Split(Data, ",", Indexes);
            i = 0;
            J0xb7:
            // End:0xe4 [While If]
            if(i < Indexes.Length)
            {
                AddMutatorByIndex(int(Indexes[i]));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xb7;
            }
        }
        return true;
    }
    return false;
}

function ReceiveNewMutator(string Data)
{
    local int Index, pos;
    local string ClassName, FriendlyName;

    pos = InStr(Data, ",");
    // End:0x4b
    if(pos != -1)
    {
        Index = int(Left(Data, pos));
        Data = Mid(Data, pos + 1);
    }
    // End:0x80
    else
    {
        Log("HandleResponse received weird mutator:" @ Data);
        assert(false);
    }
    // End:0xd8
    if(!Divide(Data, Chr(27), ClassName, FriendlyName))
    {
        Log("HandleResponse received invalid mutator string:" $ Data);
        assert(false);
    }
    TrackMutatorInfo(Index, ClassName, FriendlyName);
    li_Avail.Add(FriendlyName,, ClassName);
}

function TrackMutatorInfo(int Index, string ClassName, string FriendlyName)
{
    local int i;

    i = FindTrackingIndex(ClassName);
    // End:0x3c
    if(i == -1)
    {
        i = TrackedMutators.Length;
        TrackedMutators.Length = TrackedMutators.Length + 1;
    }
    TrackedMutators[i].Index = Index;
    TrackedMutators[i].ClassName = ClassName;
    TrackedMutators[i].FriendlyName = FriendlyName;
}

function int FindTrackingIndex(string ClassName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < TrackedMutators.Length)
    {
        // End:0x37
        if(TrackedMutators[i].ClassName ~= ClassName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function LoggedOut()
{
    super.LoggedOut();
    li_Avail.Clear();
    li_Active.Clear();
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
        li_Avail.__OnDblClick__Delegate = ModifyMutatorList;
        li_Avail.AddLinkObject(b_Add, true);
        li_Avail.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
        li_Avail.bInitializeList = false;
    }
    // End:0x12e
    if(li_Active != none)
    {
        li_Active.bDropSource = true;
        li_Active.bDropTarget = true;
        li_Active.__OnDblClick__Delegate = ModifyMutatorList;
        li_Active.AddLinkObject(b_Remove, true);
        li_Active.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
        li_Active.bInitializeList = false;
    }
    sb_Avail.ManageComponent(lb_Avail);
    sb_Active.ManageComponent(lb_Active);
}

function bool AddMutator()
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

function bool RemoveMutator()
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

function AddMutatorByIndex(int Index)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xc6 [While If]
    if(i < TrackedMutators.Length)
    {
        // End:0xbc
        if(TrackedMutators[i].Index == Index)
        {
            li_Avail.RemoveExtra(TrackedMutators[i].ClassName);
            // End:0xab
            if(li_Active.FindIndex(TrackedMutators[i].ClassName,, true) == -1)
            {
                li_Active.Add(TrackedMutators[i].FriendlyName,, TrackedMutators[i].ClassName);
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
    // End:0xc6 [While If]
    if(i < TrackedMutators.Length)
    {
        // End:0xbc
        if(TrackedMutators[i].Index == Index)
        {
            li_Active.RemoveExtra(TrackedMutators[i].ClassName);
            // End:0xab
            if(li_Avail.FindIndex(TrackedMutators[i].ClassName,, true) == -1)
            {
                li_Avail.Add(TrackedMutators[i].FriendlyName,, TrackedMutators[i].ClassName);
            }
            li_Active.ClearPendingElements();
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

singular function bool ModifyMutatorList(GUIComponent Sender)
{
    // End:0x17
    if(Sender == lb_Avail)
    {
        AddMutator();
        return true;
    }
    // End:0x2e
    if(Sender == lb_Active)
    {
        RemoveMutator();
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
            return AddMutator();
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
            return RemoveMutator();
        // End:0x11f
        case b_RemoveAll.Caption:
            // End:0xfa
            if(lb_Active.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.LoadFrom(li_Active);
            li_Active.Clear();
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
    // End:0x82
    if(li_Active.ItemCount > 0)
    {
        EnableComponent(b_RemoveAll);
    }
    // End:0x8d
    else
    {
        DisableComponent(b_RemoveAll);
    }
}

function SubmitChanges()
{
    local int i, idx;
    local string str;

    // End:0xa4
    if(bDirty)
    {
        i = 0;
        J0x10:
        // End:0x89 [While If]
        if(i < li_Active.ItemCount)
        {
            idx = FindTrackingIndex(li_Active.GetExtraAtIndex(i));
            // End:0x7f
            if(idx != -1)
            {
                // End:0x6f
                if(str != "")
                {
                    str $= ",";
                }
                str $= string(idx);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
        SendCommand(Group $ ":" $ str);
    }
    super.SubmitChanges();
}

defaultproperties
{
    begin object name=InactiveBackground class=GUISectionBackground
        bFillClient=true
        Caption="???? ????"
        BottomPadding=0.110
        WinTop=0.0300530
        WinLeft=0.013880
        WinWidth=0.4831070
        WinHeight=0.9653130
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'MatchSetupMutator.InactiveBackground'
    sb_Avail=InactiveBackground
    begin object name=ActiveBackground class=GUISectionBackground
        bFillClient=true
        Caption="??? ????"
        BottomPadding=0.110
        WinTop=0.0300530
        WinLeft=0.5112430
        WinWidth=0.4741940
        WinHeight=0.9653130
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'MatchSetupMutator.ActiveBackground'
    sb_Active=ActiveBackground
    begin object name=MutInactiveList class=GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1380780
        WinLeft=0.1137940
        WinWidth=0.3803940
        WinHeight=0.6626710
        TabOrder=0
    object end
    // Reference: GUIListBox'MatchSetupMutator.MutInactiveList'
    lb_Avail=MutInactiveList
    begin object name=MutActiveList class=GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1080210
        WinLeft=0.6058610
        WinWidth=0.3683590
        WinHeight=0.6626710
        TabOrder=1
    object end
    // Reference: GUIListBox'MatchSetupMutator.MutActiveList'
    lb_Active=MutActiveList
    begin object name=MutAddButton class=GUIButton
        Caption="??"
        Hint="??? ?????? ???? ????."
        WinTop=0.9021980
        WinLeft=0.2637430
        WinWidth=0.2038070
        WinHeight=0.0791840
        TabOrder=6
        bRepeatClick=true
        OnClickSound=3
        OnClick=ModifyMutatorList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMutator.MutAddButton'
    b_Add=MutAddButton
    begin object name=MutAddAllButton class=GUIButton
        Caption="?? ??"
        Hint="?? ?????? ???? ????."
        WinTop=0.9021980
        WinLeft=0.0450060
        WinWidth=0.1902320
        WinHeight=0.0791840
        TabOrder=5
        OnClickSound=3
        OnClick=ModifyMutatorList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMutator.MutAddAllButton'
    b_AddAll=MutAddAllButton
    begin object name=MutRemoveButton class=GUIButton
        Caption="??"
        AutoSizePadding=(HorzPerc=0.50,VertPerc=0.0)
        Hint="??? ?????? ????? ????."
        WinTop=0.7996820
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0550680
        TabOrder=10
        bRepeatClick=true
        OnClickSound=4
        OnClick=ModifyMutatorList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMutator.MutRemoveButton'
    b_Remove=MutRemoveButton
    begin object name=MutRemoveAllButton class=GUIButton
        Caption="?? ??"
        Hint="?? ?????? ????? ????."
        WinTop=0.7996820
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0550680
        TabOrder=11
        OnClickSound=4
        OnClick=ModifyMutatorList
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupMutator.MutRemoveAllButton'
    b_RemoveAll=MutRemoveAllButton
    PanelCaption="????"
}