class MatchSetupMutator extends MatchSetupPanelBase
    editinlinenew
    instanced;

struct MutatorInfo
{
    var string ClassName;
    var string FriendlyName;
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
var() array<MutatorInfo> TrackedMutators;

function InitPanel()
{
    super.InitPanel();
    Group = Class'xVoting_Decompressed.VotingReplicationInfo'.default.MutatorID;
    //return;    
}

function bool HandleResponse(string Type, string Info, string Data)
{
    local int i;
    local array<string> Indexes;

    // End:0xE6
    if(Type ~= Group)
    {
        Log(((("MUTATORS HandleResponse Info '" $ Info) $ "'  Data '") $ Data) $ "'", 'MapVoteDebug');
        // End:0x7B
        if(Info ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.AddID)
        {
            ReceiveNewMutator(Data);
            return true;
        }
        // End:0xE4
        if((Info ~= Class'xVoting_Decompressed.VotingReplicationInfo'.default.UpdateID) && Data != "")
        {
            Split(Data, ",", Indexes);
            i = 0;
            J0xB7:

            // End:0xE4 [Loop If]
            if(i < Indexes.Length)
            {
                AddMutatorByIndex(int(Indexes[i]));
                i++;
                // [Loop Continue]
                goto J0xB7;
            }
        }
        return true;
    }
    return false;
    //return;    
}

function ReceiveNewMutator(string Data)
{
    local int Index, pos;
    local string ClassName, FriendlyName;

    pos = InStr(Data, ",");
    // End:0x4B
    if(pos != -1)
    {
        Index = int(Left(Data, pos));
        Data = Mid(Data, pos + 1);        
    }
    else
    {
        Log("HandleResponse received weird mutator:" @ Data);
        assert(false);
    }
    // End:0xD8
    if(!Divide(Data, Chr(27), ClassName, FriendlyName))
    {
        Log("HandleResponse received invalid mutator string:" $ Data);
        assert(false);
    }
    TrackMutatorInfo(Index, ClassName, FriendlyName);
    li_Avail.Add(FriendlyName,, ClassName);
    //return;    
}

function TrackMutatorInfo(int Index, string ClassName, string FriendlyName)
{
    local int i;

    i = FindTrackingIndex(ClassName);
    // End:0x3C
    if(i == -1)
    {
        i = TrackedMutators.Length;
        TrackedMutators.Length = TrackedMutators.Length + 1;
    }
    TrackedMutators[i].Index = Index;
    TrackedMutators[i].ClassName = ClassName;
    TrackedMutators[i].FriendlyName = FriendlyName;
    //return;    
}

function int FindTrackingIndex(string ClassName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < TrackedMutators.Length)
    {
        // End:0x37
        if(TrackedMutators[i].ClassName ~= ClassName)
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

function LoggedOut()
{
    super.LoggedOut();
    li_Avail.Clear();
    li_Active.Clear();
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
        li_Avail.__OnDblClick__Delegate = ModifyMutatorList;
        li_Avail.AddLinkObject(b_Add, true);
        li_Avail.__CheckLinkedObjects__Delegate = InternalCheckLinkedObj;
        li_Avail.bInitializeList = false;
    }
    // End:0x12E
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
    //return;    
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

function AddMutatorByIndex(int Index)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xC6 [Loop If]
    if(i < TrackedMutators.Length)
    {
        // End:0xBC
        if(TrackedMutators[i].Index == Index)
        {
            li_Avail.RemoveExtra(TrackedMutators[i].ClassName);
            // End:0xAB
            if(li_Active.FindIndex(TrackedMutators[i].ClassName,, true) == -1)
            {
                li_Active.Add(TrackedMutators[i].FriendlyName,, TrackedMutators[i].ClassName);
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

    // End:0xC6 [Loop If]
    if(i < TrackedMutators.Length)
    {
        // End:0xBC
        if(TrackedMutators[i].Index == Index)
        {
            li_Active.RemoveExtra(TrackedMutators[i].ClassName);
            // End:0xAB
            if(li_Avail.FindIndex(TrackedMutators[i].ClassName,, true) == -1)
            {
                li_Avail.Add(TrackedMutators[i].FriendlyName,, TrackedMutators[i].ClassName);
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

singular function bool ModifyMutatorList(GUIComponent Sender)
{
    // End:0x17
    if(Sender == lb_Avail)
    {
        AddMutator();
        return true;
    }
    // End:0x2E
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
        // End:0x6D
        case b_Add.Caption:
            return AddMutator();
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
            return RemoveMutator();
        // End:0x11F
        case b_RemoveAll.Caption:
            // End:0xFA
            if(lb_Active.ItemCount() == 0)
            {
                return true;
            }
            li_Avail.LoadFrom(li_Active);
            li_Active.Clear();
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
    // End:0x82
    if(li_Active.ItemCount > 0)
    {
        EnableComponent(b_RemoveAll);        
    }
    else
    {
        DisableComponent(b_RemoveAll);
    }
    //return;    
}

function SubmitChanges()
{
    local int i, idx;
    local string str;

    // End:0xA4
    if(bDirty)
    {
        i = 0;
        J0x10:

        // End:0x89 [Loop If]
        if(i < li_Active.ItemCount)
        {
            idx = FindTrackingIndex(li_Active.GetExtraAtIndex(i));
            // End:0x7F
            if(idx != -1)
            {
                // End:0x6F
                if(str != "")
                {
                    str $= ",";
                }
                str $= string(idx);
            }
            i++;
            // [Loop Continue]
            goto J0x10;
        }
        SendCommand((Group $ ":") $ str);
    }
    super.SubmitChanges();
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'xVoting_Decompressed.MatchSetupMutator.InactiveBackground'
    begin object name="InactiveBackground" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="???? ????"
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
    // Reference: GUISectionBackground'xVoting_Decompressed.MatchSetupMutator.ActiveBackground'
    begin object name="ActiveBackground" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="??? ????"
        BottomPadding=0.1100000
        WinTop=0.0300530
        WinLeft=0.5112430
        WinWidth=0.4741940
        WinHeight=0.9653130
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=ActiveBackground.InternalPreDraw
    end object
    sb_Active=ActiveBackground
    // Reference: GUIListBox'xVoting_Decompressed.MatchSetupMutator.MutInactiveList'
    begin object name="MutInactiveList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=MutInactiveList.InternalOnCreateComponent
        WinTop=0.1380780
        WinLeft=0.1137940
        WinWidth=0.3803940
        WinHeight=0.6626710
        TabOrder=0
    end object
    lb_Avail=MutInactiveList
    // Reference: GUIListBox'xVoting_Decompressed.MatchSetupMutator.MutActiveList'
    begin object name="MutActiveList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=MutActiveList.InternalOnCreateComponent
        WinTop=0.1080210
        WinLeft=0.6058610
        WinWidth=0.3683590
        WinHeight=0.6626710
        TabOrder=1
    end object
    lb_Active=MutActiveList
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMutator.MutAddButton'
    begin object name="MutAddButton" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ?????? ???? ????."
        WinTop=0.9021980
        WinLeft=0.2637430
        WinWidth=0.2038070
        WinHeight=0.0791840
        TabOrder=6
        bRepeatClick=true
        OnClickSound=3
        OnClick=MatchSetupMutator.ModifyMutatorList
        OnKeyEvent=MutAddButton.InternalOnKeyEvent
    end object
    b_Add=MutAddButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMutator.MutAddAllButton'
    begin object name="MutAddAllButton" class=XInterface.GUIButton
        Caption="?? ??"
        Hint="?? ?????? ???? ????."
        WinTop=0.9021980
        WinLeft=0.0450060
        WinWidth=0.1902320
        WinHeight=0.0791840
        TabOrder=5
        OnClickSound=3
        OnClick=MatchSetupMutator.ModifyMutatorList
        OnKeyEvent=MutAddAllButton.InternalOnKeyEvent
    end object
    b_AddAll=MutAddAllButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMutator.MutRemoveButton'
    begin object name="MutRemoveButton" class=XInterface.GUIButton
        Caption="??"
        AutoSizePadding=(HorzPerc=0.5000000,VertPerc=0.0000000)
        Hint="??? ?????? ????? ????."
        WinTop=0.7996820
        WinLeft=0.5437470
        WinWidth=0.1915540
        WinHeight=0.0550680
        TabOrder=10
        bRepeatClick=true
        OnClickSound=4
        OnClick=MatchSetupMutator.ModifyMutatorList
        OnKeyEvent=MutRemoveButton.InternalOnKeyEvent
    end object
    b_Remove=MutRemoveButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupMutator.MutRemoveAllButton'
    begin object name="MutRemoveAllButton" class=XInterface.GUIButton
        Caption="?? ??"
        Hint="?? ?????? ????? ????."
        WinTop=0.7996820
        WinLeft=0.7725770
        WinWidth=0.1915540
        WinHeight=0.0550680
        TabOrder=11
        OnClickSound=4
        OnClick=MatchSetupMutator.ModifyMutatorList
        OnKeyEvent=MutRemoveAllButton.InternalOnKeyEvent
    end object
    b_RemoveAll=MutRemoveAllButton
    PanelCaption="????"
}