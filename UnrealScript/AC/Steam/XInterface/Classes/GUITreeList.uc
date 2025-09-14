/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUITreeList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:64
 *
 *******************************************************************************/
class GUITreeList extends GUIVertList
    dependson(GUIVertList)
    native
    editinlinenew
    instanced;

var() GUI.eTextAlign TextAlign;
var() editconstarray editconst noexport array<editconst GUITreeNode> Elements;
var() editconstarray editconst noexport array<editconst GUITreeNode> SelectedElements;
var() const editconst noexport int VisibleCount;
var() const editconst float PrefixWidth;
var() const editconst float SelectedPrefixWidth;
var() bool bAllowParentSelection;
var() bool bAllowDuplicateCaption;
var() bool bGroupItems;
var delegate<CompareItem> __CompareItem__Delegate;

// Export UGUITreeList::execUpdateVisibleCount(FFrame&, void* const)
native final function UpdateVisibleCount();
// Export UGUITreeList::execSortList(FFrame&, void* const)
native final function SortList();
delegate int CompareItem(GUITreeNode ElemA, GUITreeNode ElemB)
{
    return StrCmp(ElemA.Caption, ElemB.Caption);
}

function int AddItem(string Caption, string Value, optional string ParentCaption, optional bool bEnabled, optional string ExtraInfo)
{
    local int i, idx;

    // End:0x2d
    if(!bAllowEmptyItems && Caption == "" && ParentCaption == "")
    {
        return -1;
    }
    // End:0x55
    if(!bAllowDuplicateCaption && FindIndex(Caption) != -1)
    {
        return -1;
    }
    // End:0x89
    if(ParentCaption == "")
    {
        idx = HardInsert(Elements.Length, Caption, Value, "", 0, true, ExtraInfo);
    }
    // End:0x165
    else
    {
        // End:0xf3
        if(bGroupItems)
        {
            i = FindIndex(ParentCaption, true);
            // End:0xc4
            if(i == -1)
            {
                i = FindIndex(ParentCaption);
            }
            // End:0xf0
            if(i == -1)
            {
                i = HardInsert(Elements.Length, ParentCaption, "", "", 0, true);
            }
        }
        // End:0x124
        else
        {
            // End:0x124
            if(ParentCaption != "")
            {
                i = HardInsert(Elements.Length, ParentCaption, Value, "", 0, true, ExtraInfo);
            }
        }
        idx = HardInsert(i + 1, Caption, Value, ParentCaption, Elements[i].Level + 1, bEnabled, ExtraInfo);
    }
    // End:0x186
    if(Elements.Length == 1 && bInitializeList)
    {
        SetIndex(0);
    }
    // End:0x19a
    else
    {
        // End:0x19a
        if(bNotify)
        {
            CheckLinkedObjects(self);
        }
    }
    UpdateVisibleCount();
    // End:0x1be
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return idx;
}

function int AddElement(GUITreeNode Node)
{
    return AddItem(Node.Caption, Node.Value, Node.ParentCaption, Node.bEnabled, Node.ExtraInfo);
}

function Replace(int i, string NewItem, string NewValue, optional string ParentCaption, optional bool bNoSort, optional string ExtraInfo)
{
    // End:0x28
    if(!IsValidIndex(i))
    {
        AddItem(NewItem, NewValue, ParentCaption);
    }
    // End:0xc8
    else
    {
        // End:0x5f
        if(!bAllowEmptyItems && NewItem == "" && NewValue == "" && ParentCaption == "")
        {
            return;
        }
        Elements[i].Caption = NewItem;
        Elements[i].Value = NewValue;
        Elements[i].ExtraInfo = ExtraInfo;
        // End:0xbd
        if(bSorted && !bNoSort)
        {
            Sort();
        }
        SetIndex(Index);
    }
}

function int InsertItem(int idx, string Caption, string Value, string ParentCaption, int Level, bool bEnabled, optional string ExtraInfo)
{
    local int ParentIndex, ChildIndex;

    // End:0x31
    if(!IsValidIndex(idx))
    {
        return AddItem(Caption, Value, ParentCaption, bEnabled, ExtraInfo);
    }
    // End:0x164
    if(bGroupItems)
    {
        ParentIndex = FindParentIndex(idx);
        // End:0x11e
        if(IsValidIndex(ParentIndex) && Elements[ParentIndex].Caption == ParentCaption)
        {
            ChildIndex = FindAvailableChildIndex(ParentIndex);
            // End:0xe2
            if(idx > ParentIndex && idx <= ChildIndex)
            {
                return HardInsert(idx, Caption, Value, ParentCaption, Elements[ParentIndex].Level + 1, bEnabled, ExtraInfo);
            }
            // End:0x11b
            else
            {
                return HardInsert(ChildIndex, Caption, Value, ParentCaption, Elements[ParentIndex].Level + 1, bEnabled, ExtraInfo);
            }
        }
        // End:0x161
        else
        {
            // End:0x161
            if(ParentCaption == "")
            {
                idx = FindNextAvailableRootIndex(idx);
                return HardInsert(idx, Caption, Value, ParentCaption, Level, true, ExtraInfo);
            }
        }
    }
    // End:0x1d4
    else
    {
        ParentIndex = FindNextAvailableRootIndex(idx);
        // End:0x1ab
        if(ParentCaption != "")
        {
            idx = HardInsert(idx, ParentCaption, Value, "", ++ Level, true, ExtraInfo);
        }
        return HardInsert(idx + 1, Caption, Value, ParentCaption, Level, true, ExtraInfo);
    }
    return AddItem(Caption, Value, ParentCaption, bEnabled);
}

protected function int HardInsert(int idx, string Caption, string Value, string ParentCaption, int Level, bool bEnabled, optional string ExtraInfo)
{
    Elements.Insert(idx, 1);
    Elements[idx].Caption = Caption;
    Elements[idx].Value = Value;
    Elements[idx].ParentCaption = ParentCaption;
    Elements[idx].ExtraInfo = ExtraInfo;
    Elements[idx].Level = Level;
    Elements[idx].bEnabled = bEnabled;
    ItemCount = Elements.Length;
    return idx;
}

function LoadFrom(GUITreeList Source, optional bool bClearFirst)
{
    local int i, Level;
    local byte bEnabled;
    local string Caption, Value, ParentCaption, ExtraInfo;

    // End:0x0f
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:
    // End:0xa2 [While If]
    if(i < Source.ItemCount)
    {
        // End:0x98
        if(Source.ValidSelectionAt(i))
        {
            Source.GetAtIndex(i, Caption, Value, ParentCaption, Level, bEnabled, ExtraInfo);
            AddItem(Caption, Value, ParentCaption, bool(bEnabled), ExtraInfo);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
}

function int RemoveSilent(string Caption)
{
    local int i;

    bNotify = false;
    i = RemoveItem(Caption);
    bNotify = true;
    return i;
}

function int RemoveItem(string Caption)
{
    local int i;

    i = FindIndex(Caption, true);
    // End:0x32
    if(i == -1)
    {
        i = FindIndex(Caption);
    }
    return RemoveItemAt(i);
}

function int RemoveItemAt(int idx, optional bool bNoSort, optional bool bSkipCleanup)
{
    local int Level, ParentIndex;

    // End:0x12a
    if(IsValidIndex(idx))
    {
        Level = Elements[idx].Level + 1;
        ParentIndex = FindParentIndex(idx);
        Elements.Remove(idx, 1);
        -- ItemCount;
        J0x4b:
        // End:0x93 [While If]
        if(idx < ItemCount && Elements[idx].Level == Level)
        {
            // End:0x90
            if(RemoveItemAt(idx, true, true) == -2)
            {
            }
            // End:0x93
            else
            {
                // This is an implied JumpToken; Continue!
                goto J0x4b;
            }
        }
        // End:0xd9
        if(!bAllowParentSelection && !bSkipCleanup && IsValidIndex(ParentIndex) && !HasChildren(ParentIndex))
        {
            RemoveItemAt(ParentIndex, true);
        }
        UpdateVisibleCount();
        // End:0xfb
        if(bSorted && !bNoSort)
        {
            Sort();
        }
        SetIndex(Index);
        // End:0x124
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
        return Index;
    }
    return -2;
}

function int RemoveElement(GUITreeNode Node, optional int Count, optional bool bNoSort)
{
    local int i;

    Count = Max(Count, 1);
    i = 0;
    J0x15:
    // End:0x59 [While If]
    if(i < Elements.Length)
    {
        // End:0x4f
        if(Elements[i] == Node)
        {
            return RemoveItemAt(i, bNoSort);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return -1;
}

function Clear()
{
    // End:0x0e
    if(Elements.Length == 0)
    {
        return;
    }
    Elements.Remove(0, Elements.Length);
    ItemCount = 0;
    UpdateVisibleCount();
    super(GUIListBase).Clear();
}

event bool Swap(int IndexA, int IndexB)
{
    local int ParentIndexA, ParentIndexB;

    ParentIndexA = FindParentIndex(IndexA);
    ParentIndexB = FindParentIndex(IndexB);
    // End:0x70
    if(bGroupItems)
    {
        // End:0x60
        if(IsValidIndex(ParentIndexA))
        {
            // End:0x5b
            if(IsValidIndex(ParentIndexB))
            {
                // End:0x58
                if(ParentIndexA != ParentIndexB)
                {
                    return false;
                }
            }
            // End:0x5d
            else
            {
                return false;
            }
        }
        // End:0x70
        else
        {
            // End:0x70
            if(IsValidIndex(ParentIndexB))
            {
                return false;
            }
        }
    }
    // End:0x1a8
    if(IsValidIndex(IndexA) && IsValidIndex(IndexB))
    {
        // End:0x196
        if(!bGroupItems)
        {
            // End:0x122
            if(IndexA > IndexB)
            {
                // End:0xc9
                if(Elements[IndexA].Level > 0)
                {
                    IndexA = ParentIndexA;
                }
                // End:0xea
                if(Elements[IndexB].Level > 0)
                {
                    IndexB = ParentIndexB;
                }
                // End:0x11f
                if(IndexA == IndexB)
                {
                    IndexA = FindNextAvailableRootIndex(IndexB - 1);
                    // End:0x11f
                    if(!IsValidIndex(IndexA))
                    {
                        return false;
                    }
                }
            }
            // End:0x196
            else
            {
                // End:0x143
                if(Elements[IndexA].Level > 0)
                {
                    IndexA = ParentIndexA;
                }
                // End:0x164
                if(Elements[IndexB].Level > 0)
                {
                    IndexB = ParentIndexB;
                }
                // End:0x184
                if(IndexA == IndexB)
                {
                    IndexB = FindAvailableChildIndex(IndexA);
                }
                // End:0x196
                if(!IsValidIndex(IndexB))
                {
                    return false;
                }
            }
        }
        HardSwap(IndexA, IndexB);
        return true;
    }
    return false;
}

protected function HardSwap(int IndexA, int IndexB)
{
    local array<int> chIdxA, chIdxB;
    local int i;
    local array<GUITreeNode> NodesA, NodesB;

    NodesA[NodesA.Length] = Elements[IndexA];
    NodesB[NodesB.Length] = Elements[IndexB];
    // End:0x8e
    if(HasChildren(IndexA))
    {
        chIdxA = GetChildIndexList(IndexA);
        i = 0;
        J0x56:
        // End:0x8e [While If]
        if(i < chIdxA.Length)
        {
            NodesA[NodesA.Length] = Elements[chIdxA[i]];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x56;
        }
    }
    // End:0xec
    if(HasChildren(IndexB))
    {
        chIdxB = GetChildIndexList(IndexB);
        i = 0;
        J0xb4:
        // End:0xec [While If]
        if(i < chIdxB.Length)
        {
            NodesB[NodesB.Length] = Elements[chIdxB[i]];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xb4;
        }
    }
    // End:0x1c0
    if(IndexA > IndexB)
    {
        Elements.Remove(IndexA, NodesA.Length);
        Elements.Insert(IndexA, NodesB.Length);
        i = 0;
        J0x124:
        // End:0x15c [While If]
        if(i < NodesB.Length)
        {
            Elements[IndexA + i] = NodesB[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x124;
        }
        Elements.Remove(IndexB, NodesB.Length);
        Elements.Insert(IndexB, NodesA.Length);
        i = 0;
        J0x185:
        // End:0x1bd [While If]
        if(i < NodesB.Length)
        {
            Elements[IndexB + i] = NodesA[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x185;
        }
    }
    // End:0x282
    else
    {
        Elements.Remove(IndexB, NodesB.Length);
        Elements.Insert(IndexB, NodesA.Length);
        i = 0;
        J0x1e9:
        // End:0x221 [While If]
        if(i < NodesA.Length)
        {
            Elements[IndexB + i] = NodesA[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1e9;
        }
        Elements.Remove(IndexA, NodesA.Length);
        Elements.Insert(IndexA, NodesB.Length);
        i = 0;
        J0x24a:
        // End:0x282 [While If]
        if(i < NodesB.Length)
        {
            Elements[IndexA + i] = NodesB[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x24a;
        }
    }
    // End:0x296
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    // End:0x2a5
    if(bSorted)
    {
        Sort();
    }
}

function string GetCaption()
{
    return GetCaptionAtIndex(Index);
}

function string GetParentCaption()
{
    return GetParentCaptionAtIndex(Index);
}

function string GetValue()
{
    return GetValueAtIndex(Index);
}

function int GetLevel()
{
    return GetLevelAtIndex(Index);
}

function string GetExtra()
{
    return GetExtraAtIndex(Index);
}

function string GetCaptionAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Caption;
}

function string GetParentCaptionAtIndex(int idx)
{
    // End:0x13
    if(!IsValidIndex(idx))
    {
        return "";
    }
    // End:0x3b
    if(Elements[idx].ParentCaption == "")
    {
        return Elements[idx].Caption;
    }
    return Elements[idx].ParentCaption;
}

function string GetValueAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Value;
}

function int GetLevelAtIndex(int i)
{
    // End:0x16
    if(!IsValidIndex(i))
    {
        return -1;
    }
    return Elements[i].Level;
}

function string GetExtraAtIndex(int idx)
{
    // End:0x13
    if(!IsValidIndex(idx))
    {
        return "";
    }
    return Elements[idx].ExtraInfo;
}

function bool GetElementAtIndex(int i, out GUITreeNode Node)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return false;
    }
    Node = Elements[i];
    return true;
}

function bool GetAtIndex(int i, out string Caption, out string Value, out string ParentCaption, out int Level, out byte bEnabled, out string ExtraInfo)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return false;
    }
    Caption = Elements[i].Caption;
    Value = Elements[i].Value;
    Level = Elements[i].Level;
    ParentCaption = Elements[i].ParentCaption;
    bEnabled = byte(Elements[i].bEnabled);
    ExtraInfo = Elements[i].ExtraInfo;
    return true;
}

function array<int> GetIndexList()
{
    local array<int> Indexes;
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < ItemCount)
    {
        // End:0x36
        if(ValidSelectionAt(i))
        {
            Indexes[Indexes.Length] = i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Indexes;
}

function array<int> GetChildIndexList(int idx, optional bool bNoRecurse)
{
    local array<int> Indexes;
    local int Level;

    // End:0x92
    if(IsValidIndex(idx))
    {
        Level = Elements[idx].Level + 1;
        J0x27:
        // End:0x92 [While If]
        if(++ idx < ItemCount)
        {
            // End:0x55
            if(Elements[idx].Level < Level)
            {
            }
            // End:0x92
            else
            {
                // End:0x7d
                if(bNoRecurse && Elements[idx].Level > Level)
                {
                }
                // End:0x92
                else
                {
                    Indexes[Indexes.Length] = idx;
                    // This is an implied JumpToken; Continue!
                    goto J0x27;
                }
            }
        }
    }
    return Indexes;
}

event bool ValidSelection()
{
    return ValidSelectionAt(Index);
}

event bool ValidSelectionAt(int idx)
{
    // End:0x12
    if(!IsValidIndex(idx))
    {
        return false;
    }
    return bAllowParentSelection || !HasChildren(idx);
}

event bool HasChildren(int ParentIndex)
{
    // End:0x12
    if(!IsValidIndex(ParentIndex))
    {
        return false;
    }
    // End:0x4a
    if(ParentIndex < ItemCount - 1)
    {
        return Elements[ParentIndex + 1].Level > Elements[ParentIndex].Level;
    }
    return false;
}

event bool IsExpanded(int ParentIndex)
{
    // End:0x12
    if(!HasChildren(ParentIndex))
    {
        return true;
    }
    return Elements[ParentIndex + 1].bEnabled;
}

function SetCaptionAtIndex(int i, string NewCaption)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Caption = NewCaption;
}

function SetValueAtIndex(int i, string NewValue)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Value = NewValue;
}

function SetLevelAtIndex(int i, int NewLevel)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Level = NewLevel;
}

function bool Expand(int idx, optional bool bRecursive)
{
    local int i;
    local array<int> Indexes;

    // End:0x12
    if(!IsValidIndex(idx))
    {
        return false;
    }
    Expand(FindParentIndex(idx));
    Indexes = GetChildIndexList(idx, !bRecursive);
    i = 0;
    J0x43:
    // End:0x76 [While If]
    if(i < Indexes.Length)
    {
        Elements[Indexes[i]].bEnabled = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    return true;
}

function bool Collapse(int idx)
{
    local int i;
    local array<int> Indexes;

    // End:0x12
    if(!IsValidIndex(idx))
    {
        return false;
    }
    Indexes = GetChildIndexList(idx);
    i = 0;
    J0x2a:
    // End:0x5d [While If]
    if(i < Indexes.Length)
    {
        Elements[Indexes[i]].bEnabled = false;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    return true;
}

function ToggleExpand(int idx, optional bool bRecursive)
{
    // End:0x12
    if(!IsValidIndex(idx))
    {
        return;
    }
    // End:0x2e
    if(IsExpanded(idx))
    {
        Collapse(idx);
    }
    // End:0x3f
    else
    {
        Expand(idx, bRecursive);
    }
}

function bool IsToggleClick(int idx)
{
    local float PrefixOffset, CaptionOffset;

    // End:0x12
    if(!IsValidIndex(idx))
    {
        return false;
    }
    // End:0x24
    if(!HasChildren(idx))
    {
        return false;
    }
    PrefixOffset = ClientBounds[0] + SelectedPrefixWidth * float(GetLevelAtIndex(idx));
    CaptionOffset = PrefixOffset + SelectedPrefixWidth;
    // End:0x8d
    if(Controller.MouseX >= PrefixOffset && Controller.MouseX <= CaptionOffset)
    {
        return true;
    }
    return false;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local bool bResult;

    bResult = super.InternalOnClick(Sender);
    // End:0x36
    if(bResult && IsToggleClick(Index))
    {
        ToggleExpand(Index);
    }
    return bResult;
}

function bool InternalDblClick(GUIComponent Sender)
{
    ToggleExpand(Index);
    return true;
}

function int FindIndex(string Caption, optional bool bExact)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x75 [While If]
    if(i < Elements.Length)
    {
        // End:0x6b
        if(bExact && Elements[i].Caption == Caption || !bExact && Elements[i].Caption ~= Caption)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindFullIndex(string Caption, string Value, string ParentCaption)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x79 [While If]
    if(i < Elements.Length)
    {
        // End:0x6f
        if(Elements[i].Caption == Caption && Elements[i].Value == Value && Elements[i].ParentCaption == ParentCaption)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindParentIndex(int ChildIndex)
{
    local int Level;

    // End:0x16
    if(!IsValidIndex(ChildIndex))
    {
        return -1;
    }
    // End:0x32
    if(Elements[ChildIndex].Level == 0)
    {
        return -1;
    }
    Level = Elements[ChildIndex].Level - 1;
    J0x4b:
    // End:0x77 [While If]
    if(-- ChildIndex >= 0 && Elements[ChildIndex].Level > Level)
    {
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    return ChildIndex;
}

function int FindNextAvailableRootIndex(int Target)
{
    // End:0x17
    if(!IsValidIndex(Target))
    {
        return Elements.Length;
    }
    // End:0x33
    if(Elements[Target].Level == 0)
    {
        return Target;
    }
    J0x33:
    // End:0x5b [While If]
    if(-- Target > 0 && Elements[Target].Level > 0)
    {
        // This is an implied JumpToken; Continue!
        goto J0x33;
    }
    return Target;
}

function int FindAvailableChildIndex(int ParentIndex)
{
    local int ParentLevel;

    // End:0x5d
    if(IsValidIndex(ParentIndex))
    {
        ParentLevel = Elements[ParentIndex].Level + 1;
        J0x27:
        // End:0x57 [While If]
        if(++ ParentIndex < ItemCount && Elements[ParentIndex].Level >= ParentLevel)
        {
            // This is an implied JumpToken; Continue!
            goto J0x27;
        }
        return ParentIndex;
    }
    return -1;
}

function int FindIndexByValue(string Value, optional bool bExact)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x75 [While If]
    if(i < Elements.Length)
    {
        // End:0x6b
        if(bExact && Elements[i].Value == Value || !bExact && Elements[i].Value ~= Value)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindElement(string Caption, string Value, int Level, optional bool bCaseSensitive)
{
    local int i;

    // End:0xfe
    if(bCaseSensitive)
    {
        i = 0;
        J0x10:
        // End:0xfe [While If]
        if(i < Elements.Length)
        {
            // End:0x7b
            if(Elements[i].Caption == Caption && Elements[i].Value == Value && Elements[i].Level == Level)
            {
                return i;
            }
            // End:0xf4
            else
            {
                i = 0;
                J0x82:
                // End:0xf4 [While If]
                if(i < Elements.Length)
                {
                    // End:0xea
                    if(Elements[i].Caption ~= Caption && Elements[i].Value ~= Value && Elements[i].Level == Level)
                    {
                        return i;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x82;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
    }
    return -1;
}

function int FindVisibleIndex(int idx, int Distance)
{
    local int Count, i, increment;

    // End:0x14
    if(Distance == 0)
    {
        return idx;
    }
    // End:0x34
    else
    {
        // End:0x2d
        if(Distance < 0)
        {
            increment = -1;
        }
        // End:0x34
        else
        {
            increment = 1;
        }
    }
    i = idx;
    J0x3f:
    // End:0x8f [While If]
    if(IsValidIndex(i))
    {
        // End:0x68
        if(Elements[i].bEnabled)
        {
            ++ Count;
        }
        // End:0x80
        if(float(Count) >= Abs(float(Distance)))
        {
        }
        // End:0x8f
        else
        {
            i += increment;
            // This is an implied JumpToken; Continue!
            goto J0x3f;
        }
    }
    return i;
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int row, NewIndex;

    row = int(Ceil(Controller.MouseY - ClientBounds[1] / ItemHeight));
    NewIndex = FindVisibleIndex(Top, row);
    return Min(NewIndex, ItemCount - 1);
}

function Sort()
{
    SortList();
}

function int SetIndex(int NewIndex)
{
    // End:0x37
    if(IsValidIndex(NewIndex) && !Elements[NewIndex].bEnabled)
    {
        Expand(NewIndex);
        UpdateVisibleCount();
    }
    return super(GUIListBase).SetIndex(NewIndex);
}

function SetTopItem(int Item)
{
    Top = Item;
    // End:0x20
    if(Top < 0)
    {
        Top = 0;
    }
    // End:0x55
    else
    {
        // End:0x55
        if(FindVisibleIndex(Top, ItemsPerPage) >= ItemCount)
        {
            Top = FindVisibleIndex(ItemCount - 1, -ItemsPerPage);
        }
    }
    // End:0x6a
    if(ItemCount <= 0)
    {
        Top = 0;
    }
    // End:0x80
    else
    {
        Top = Clamp(Top, 0, ItemCount - 1);
    }
    // End:0x94
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    OnAdjustTop(self);
    // End:0xbd
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function bool Up()
{
    local int NewIndex;

    // End:0x1b
    if(ItemCount < 2 || Index == 0)
    {
        return true;
    }
    NewIndex = Index;
    J0x26:
    // End:0x4e [While If]
    if(-- NewIndex >= 0 && !Elements[NewIndex].bEnabled)
    {
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
    SetIndex(Max(0, NewIndex));
    // End:0x7a
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function bool Down()
{
    local int NewIndex;

    // End:0x22
    if(ItemCount < 2 || Index == ItemCount - 1)
    {
        return true;
    }
    NewIndex = Index;
    J0x2d:
    // End:0x59 [While If]
    if(++ NewIndex < ItemCount && !Elements[NewIndex].bEnabled)
    {
        // This is an implied JumpToken; Continue!
        goto J0x2d;
    }
    SetIndex(Min(NewIndex, ItemCount - 1));
    // End:0x8c
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function End()
{
    local int NewIndex;

    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    NewIndex = FindVisibleIndex(ItemCount - 1, 1);
    // End:0x5a
    if(IsValidIndex(NewIndex))
    {
        SetIndex(NewIndex);
        // End:0x5a
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
}

function PgUp()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    UpdateVisibleCount();
    super.PgUp();
}

function PgDn()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    UpdateVisibleCount();
    super.PgDn();
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    local int i;

    // End:0x61
    if(bAccepted && Accepting != none)
    {
        GetPendingElements();
        // End:0x59
        if(Accepting != self)
        {
            i = 0;
            J0x2e:
            // End:0x59 [While If]
            if(i < SelectedElements.Length)
            {
                RemoveElement(SelectedElements[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2e;
            }
        }
        bRepeatClick = false;
    }
    // End:0x74
    if(Accepting == none)
    {
        bRepeatClick = true;
    }
    SetOutlineAlpha(255);
    // End:0x90
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    local array<GUITreeNode> NewItem;
    local export editinline GUITreeList SourceTree;
    local int i;

    // End:0x174
    if(Controller.DropTarget == self)
    {
        // End:0x174
        if(Controller.DropSource != none && GUITreeList(Controller.DropSource) != none)
        {
            SourceTree = GUITreeList(Controller.DropSource);
            NewItem = SourceTree.GetPendingElements();
            // End:0xbc
            if(Controller.DropSource == self)
            {
                i = NewItem.Length - 1;
                J0x94:
                // End:0xbc [While If]
                if(i >= 0)
                {
                    RemoveElement(NewItem[i],, true);
                    -- i;
                    // This is an implied JumpToken; Continue!
                    goto J0x94;
                }
            }
            // End:0xd7
            if(!IsValidIndex(DropIndex))
            {
                DropIndex = ItemCount;
            }
            i = NewItem.Length - 1;
            J0xe6:
            // End:0x167 [While If]
            if(i >= 0)
            {
                InsertItem(DropIndex, NewItem[i].Caption, NewItem[i].Value, NewItem[i].ParentCaption, NewItem[i].Level, NewItem[i].bEnabled, NewItem[i].ExtraInfo);
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0xe6;
            }
            SetIndex(DropIndex);
            return true;
        }
    }
    return false;
}

function ClearPendingElements()
{
    super(GUIListBase).ClearPendingElements();
    // End:0x1f
    if(SelectedItems.Length == 0)
    {
        SelectedElements.Remove(0, SelectedElements.Length);
    }
}

function array<GUITreeNode> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xf0
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        // End:0xea
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:
            // End:0xa6 [While If]
            if(i < SelectedItems.Length)
            {
                // End:0x9c
                if(IsValidIndex(SelectedItems[i]) && ValidSelectionAt(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = Elements[SelectedItems[i]];
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x44;
            }
            // End:0xea
            if(SelectedElements.Length == 0 && IsValid() && ValidSelection())
            {
                SelectedElements.Length = SelectedElements.Length + 1;
                GetElementAtIndex(Index, SelectedElements[0]);
            }
        }
        return SelectedElements;
    }
}

defaultproperties
{
    bAllowDuplicateCaption=true
    bGroupItems=true
}