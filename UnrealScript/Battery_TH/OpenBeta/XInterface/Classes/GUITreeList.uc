class GUITreeList extends GUIVertList
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
//var delegate<CompareItem> __CompareItem__Delegate;

// Export UGUITreeList::execUpdateVisibleCount(FFrame&, void* const)
native final function UpdateVisibleCount();

// Export UGUITreeList::execSortList(FFrame&, void* const)
native final function SortList();

delegate int CompareItem(GUITreeNode ElemA, GUITreeNode ElemB)
{
    return StrCmp(ElemA.Caption, ElemB.Caption);
    //return;    
}

function int AddItem(string Caption, string Value, optional string ParentCaption, optional bool bEnabled, optional string ExtraInfo)
{
    local int i, idx;

    // End:0x2D
    if((!bAllowEmptyItems && Caption == "") && ParentCaption == "")
    {
        return -1;
    }
    // End:0x55
    if(!bAllowDuplicateCaption && (FindIndex(Caption)) != -1)
    {
        return -1;
    }
    // End:0x89
    if(ParentCaption == "")
    {
        idx = HardInsert(Elements.Length, Caption, Value, "", 0, true, ExtraInfo);        
    }
    else
    {
        // End:0xF3
        if(bGroupItems)
        {
            i = FindIndex(ParentCaption, true);
            // End:0xC4
            if(i == -1)
            {
                i = FindIndex(ParentCaption);
            }
            // End:0xF0
            if(i == -1)
            {
                i = HardInsert(Elements.Length, ParentCaption, "", "", 0, true);
            }            
        }
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
    if((Elements.Length == 1) && bInitializeList)
    {
        SetIndex(0);        
    }
    else
    {
        // End:0x19A
        if(bNotify)
        {
            CheckLinkedObjects(self);
        }
    }
    UpdateVisibleCount();
    // End:0x1BE
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return idx;
    //return;    
}

function int AddElement(GUITreeNode Node)
{
    return AddItem(Node.Caption, Node.Value, Node.ParentCaption, Node.bEnabled, Node.ExtraInfo);
    //return;    
}

function Replace(int i, string NewItem, string NewValue, optional string ParentCaption, optional bool bNoSort, optional string ExtraInfo)
{
    // End:0x28
    if(!IsValidIndex(i))
    {
        AddItem(NewItem, NewValue, ParentCaption);        
    }
    else
    {
        // End:0x5F
        if(((!bAllowEmptyItems && NewItem == "") && NewValue == "") && ParentCaption == "")
        {
            return;
        }
        Elements[i].Caption = NewItem;
        Elements[i].Value = NewValue;
        Elements[i].ExtraInfo = ExtraInfo;
        // End:0xBD
        if(bSorted && !bNoSort)
        {
            Sort();
        }
        SetIndex(Index);
    }
    //return;    
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
        // End:0x11E
        if((IsValidIndex(ParentIndex)) && Elements[ParentIndex].Caption == ParentCaption)
        {
            ChildIndex = FindAvailableChildIndex(ParentIndex);
            // End:0xE2
            if((idx > ParentIndex) && idx <= ChildIndex)
            {
                return HardInsert(idx, Caption, Value, ParentCaption, Elements[ParentIndex].Level + 1, bEnabled, ExtraInfo);                
            }
            else
            {
                return HardInsert(ChildIndex, Caption, Value, ParentCaption, Elements[ParentIndex].Level + 1, bEnabled, ExtraInfo);
            }            
        }
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
    else
    {
        ParentIndex = FindNextAvailableRootIndex(idx);
        // End:0x1AB
        if(ParentCaption != "")
        {
            idx = HardInsert(idx, ParentCaption, Value, "", Level++, true, ExtraInfo);
        }
        return HardInsert(idx + 1, Caption, Value, ParentCaption, Level, true, ExtraInfo);
    }
    return AddItem(Caption, Value, ParentCaption, bEnabled);
    //return;    
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
    //return;    
}

function LoadFrom(GUITreeList Source, optional bool bClearFirst)
{
    local int i, Level;
    local byte bEnabled;
    local string Caption, Value, ParentCaption, ExtraInfo;

    // End:0x0F
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:

    // End:0xA2 [Loop If]
    if(i < Source.ItemCount)
    {
        // End:0x98
        if(Source.ValidSelectionAt(i))
        {
            Source.GetAtIndex(i, Caption, Value, ParentCaption, Level, bEnabled, ExtraInfo);
            AddItem(Caption, Value, ParentCaption, bool(bEnabled), ExtraInfo);
        }
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    //return;    
}

function int RemoveSilent(string Caption)
{
    local int i;

    bNotify = false;
    i = RemoveItem(Caption);
    bNotify = true;
    return i;
    //return;    
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
    //return;    
}

function int RemoveItemAt(int idx, optional bool bNoSort, optional bool bSkipCleanup)
{
    local int Level, ParentIndex;

    // End:0x12A
    if(IsValidIndex(idx))
    {
        Level = Elements[idx].Level + 1;
        ParentIndex = FindParentIndex(idx);
        Elements.Remove(idx, 1);
        ItemCount--;
        J0x4B:

        // End:0x93 [Loop If]
        if((idx < ItemCount) && Elements[idx].Level == Level)
        {
            // End:0x90
            if((RemoveItemAt(idx, true, true)) == -2)
            {
                // [Explicit Break]
                goto J0x93;
            }
            // [Loop Continue]
            goto J0x4B;
        }
        J0x93:

        // End:0xD9
        if(((!bAllowParentSelection && !bSkipCleanup) && IsValidIndex(ParentIndex)) && !HasChildren(ParentIndex))
        {
            RemoveItemAt(ParentIndex, true);
        }
        UpdateVisibleCount();
        // End:0xFB
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
    //return;    
}

function int RemoveElement(GUITreeNode Node, optional int Count, optional bool bNoSort)
{
    local int i;

    Count = Max(Count, 1);
    i = 0;
    J0x15:

    // End:0x59 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x4F
        if(Elements[i] == Node)
        {
            return RemoveItemAt(i, bNoSort);
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return -1;
    //return;    
}

function Clear()
{
    // End:0x0E
    if(Elements.Length == 0)
    {
        return;
    }
    Elements.Remove(0, Elements.Length);
    ItemCount = 0;
    UpdateVisibleCount();
    super(GUIListBase).Clear();
    //return;    
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
            // End:0x5B
            if(IsValidIndex(ParentIndexB))
            {
                // End:0x58
                if(ParentIndexA != ParentIndexB)
                {
                    return false;
                }                
            }
            else
            {
                return false;
            }            
        }
        else
        {
            // End:0x70
            if(IsValidIndex(ParentIndexB))
            {
                return false;
            }
        }
    }
    // End:0x1A8
    if((IsValidIndex(IndexA)) && IsValidIndex(IndexB))
    {
        // End:0x196
        if(!bGroupItems)
        {
            // End:0x122
            if(IndexA > IndexB)
            {
                // End:0xC9
                if(Elements[IndexA].Level > 0)
                {
                    IndexA = ParentIndexA;
                }
                // End:0xEA
                if(Elements[IndexB].Level > 0)
                {
                    IndexB = ParentIndexB;
                }
                // End:0x11F
                if(IndexA == IndexB)
                {
                    IndexA = FindNextAvailableRootIndex(IndexB - 1);
                    // End:0x11F
                    if(!IsValidIndex(IndexA))
                    {
                        return false;
                    }
                }                
            }
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
    //return;    
}

protected function HardSwap(int IndexA, int IndexB)
{
    local array<int> chIdxA, chIdxB;
    local int i;
    local array<GUITreeNode> NodesA, NodesB;

    NodesA[NodesA.Length] = Elements[IndexA];
    NodesB[NodesB.Length] = Elements[IndexB];
    // End:0x8E
    if(HasChildren(IndexA))
    {
        chIdxA = GetChildIndexList(IndexA);
        i = 0;
        J0x56:

        // End:0x8E [Loop If]
        if(i < chIdxA.Length)
        {
            NodesA[NodesA.Length] = Elements[chIdxA[i]];
            i++;
            // [Loop Continue]
            goto J0x56;
        }
    }
    // End:0xEC
    if(HasChildren(IndexB))
    {
        chIdxB = GetChildIndexList(IndexB);
        i = 0;
        J0xB4:

        // End:0xEC [Loop If]
        if(i < chIdxB.Length)
        {
            NodesB[NodesB.Length] = Elements[chIdxB[i]];
            i++;
            // [Loop Continue]
            goto J0xB4;
        }
    }
    // End:0x1C0
    if(IndexA > IndexB)
    {
        Elements.Remove(IndexA, NodesA.Length);
        Elements.Insert(IndexA, NodesB.Length);
        i = 0;
        J0x124:

        // End:0x15C [Loop If]
        if(i < NodesB.Length)
        {
            Elements[IndexA + i] = NodesB[i];
            i++;
            // [Loop Continue]
            goto J0x124;
        }
        Elements.Remove(IndexB, NodesB.Length);
        Elements.Insert(IndexB, NodesA.Length);
        i = 0;
        J0x185:

        // End:0x1BD [Loop If]
        if(i < NodesB.Length)
        {
            Elements[IndexB + i] = NodesA[i];
            i++;
            // [Loop Continue]
            goto J0x185;
        }        
    }
    else
    {
        Elements.Remove(IndexB, NodesB.Length);
        Elements.Insert(IndexB, NodesA.Length);
        i = 0;
        J0x1E9:

        // End:0x221 [Loop If]
        if(i < NodesA.Length)
        {
            Elements[IndexB + i] = NodesA[i];
            i++;
            // [Loop Continue]
            goto J0x1E9;
        }
        Elements.Remove(IndexA, NodesA.Length);
        Elements.Insert(IndexA, NodesB.Length);
        i = 0;
        J0x24A:

        // End:0x282 [Loop If]
        if(i < NodesB.Length)
        {
            Elements[IndexA + i] = NodesB[i];
            i++;
            // [Loop Continue]
            goto J0x24A;
        }
    }
    // End:0x296
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    // End:0x2A5
    if(bSorted)
    {
        Sort();
    }
    //return;    
}

function string GetCaption()
{
    return GetCaptionAtIndex(Index);
    //return;    
}

function string GetParentCaption()
{
    return GetParentCaptionAtIndex(Index);
    //return;    
}

function string GetValue()
{
    return GetValueAtIndex(Index);
    //return;    
}

function int GetLevel()
{
    return GetLevelAtIndex(Index);
    //return;    
}

function string GetExtra()
{
    return GetExtraAtIndex(Index);
    //return;    
}

function string GetCaptionAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Caption;
    //return;    
}

function string GetParentCaptionAtIndex(int idx)
{
    // End:0x13
    if(!IsValidIndex(idx))
    {
        return "";
    }
    // End:0x3B
    if(Elements[idx].ParentCaption == "")
    {
        return Elements[idx].Caption;
    }
    return Elements[idx].ParentCaption;
    //return;    
}

function string GetValueAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Value;
    //return;    
}

function int GetLevelAtIndex(int i)
{
    // End:0x16
    if(!IsValidIndex(i))
    {
        return -1;
    }
    return Elements[i].Level;
    //return;    
}

function string GetExtraAtIndex(int idx)
{
    // End:0x13
    if(!IsValidIndex(idx))
    {
        return "";
    }
    return Elements[idx].ExtraInfo;
    //return;    
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
    //return;    
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
    //return;    
}

function array<int> GetIndexList()
{
    local array<int> Indexes;
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < ItemCount)
    {
        // End:0x36
        if(ValidSelectionAt(i))
        {
            Indexes[Indexes.Length] = i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Indexes;
    //return;    
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

        // End:0x92 [Loop If]
        if(++idx < ItemCount)
        {
            // End:0x55
            if(Elements[idx].Level < Level)
            {
                // [Explicit Break]
                goto J0x92;
            }
            // End:0x7D
            if(bNoRecurse && Elements[idx].Level > Level)
            {
                // [Explicit Break]
                goto J0x92;
            }
            Indexes[Indexes.Length] = idx;
            // [Loop Continue]
            goto J0x27;
        }
    }
    J0x92:

    return Indexes;
    //return;    
}

event bool ValidSelection()
{
    return ValidSelectionAt(Index);
    //return;    
}

event bool ValidSelectionAt(int idx)
{
    // End:0x12
    if(!IsValidIndex(idx))
    {
        return false;
    }
    return bAllowParentSelection || !HasChildren(idx);
    //return;    
}

event bool HasChildren(int ParentIndex)
{
    // End:0x12
    if(!IsValidIndex(ParentIndex))
    {
        return false;
    }
    // End:0x4A
    if(ParentIndex < (ItemCount - 1))
    {
        return Elements[ParentIndex + 1].Level > Elements[ParentIndex].Level;
    }
    return false;
    //return;    
}

event bool IsExpanded(int ParentIndex)
{
    // End:0x12
    if(!HasChildren(ParentIndex))
    {
        return true;
    }
    return Elements[ParentIndex + 1].bEnabled;
    //return;    
}

function SetCaptionAtIndex(int i, string NewCaption)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Caption = NewCaption;
    //return;    
}

function SetValueAtIndex(int i, string NewValue)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Value = NewValue;
    //return;    
}

function SetLevelAtIndex(int i, int NewLevel)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Level = NewLevel;
    //return;    
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

    // End:0x76 [Loop If]
    if(i < Indexes.Length)
    {
        Elements[Indexes[i]].bEnabled = true;
        i++;
        // [Loop Continue]
        goto J0x43;
    }
    return true;
    //return;    
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
    J0x2A:

    // End:0x5D [Loop If]
    if(i < Indexes.Length)
    {
        Elements[Indexes[i]].bEnabled = false;
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    return true;
    //return;    
}

function ToggleExpand(int idx, optional bool bRecursive)
{
    // End:0x12
    if(!IsValidIndex(idx))
    {
        return;
    }
    // End:0x2E
    if(IsExpanded(idx))
    {
        Collapse(idx);        
    }
    else
    {
        Expand(idx, bRecursive);
    }
    //return;    
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
    PrefixOffset = ClientBounds[0] + (SelectedPrefixWidth * float(GetLevelAtIndex(idx)));
    CaptionOffset = PrefixOffset + SelectedPrefixWidth;
    // End:0x8D
    if((Controller.MouseX >= PrefixOffset) && Controller.MouseX <= CaptionOffset)
    {
        return true;
    }
    return false;
    //return;    
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
    //return;    
}

function bool InternalDblClick(GUIComponent Sender)
{
    ToggleExpand(Index);
    return true;
    //return;    
}

function int FindIndex(string Caption, optional bool bExact)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x75 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x6B
        if((bExact && Elements[i].Caption == Caption) || !bExact && Elements[i].Caption ~= Caption)
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

function int FindFullIndex(string Caption, string Value, string ParentCaption)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x79 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x6F
        if(((Elements[i].Caption == Caption) && Elements[i].Value == Value) && Elements[i].ParentCaption == ParentCaption)
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
    J0x4B:

    // End:0x77 [Loop If]
    if((--ChildIndex >= 0) && Elements[ChildIndex].Level > Level)
    {
        // [Loop Continue]
        goto J0x4B;
    }
    return ChildIndex;
    //return;    
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

    // End:0x5B [Loop If]
    if((--Target > 0) && Elements[Target].Level > 0)
    {
        // [Loop Continue]
        goto J0x33;
    }
    return Target;
    //return;    
}

function int FindAvailableChildIndex(int ParentIndex)
{
    local int ParentLevel;

    // End:0x5D
    if(IsValidIndex(ParentIndex))
    {
        ParentLevel = Elements[ParentIndex].Level + 1;
        J0x27:

        // End:0x57 [Loop If]
        if((++ParentIndex < ItemCount) && Elements[ParentIndex].Level >= ParentLevel)
        {
            // [Loop Continue]
            goto J0x27;
        }
        return ParentIndex;
    }
    return -1;
    //return;    
}

function int FindIndexByValue(string Value, optional bool bExact)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x75 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x6B
        if((bExact && Elements[i].Value == Value) || !bExact && Elements[i].Value ~= Value)
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

function int FindElement(string Caption, string Value, int Level, optional bool bCaseSensitive)
{
    local int i;

    // End:0xFE
    if(bCaseSensitive)
    {
        i = 0;
        J0x10:

        // End:0xFE [Loop If]
        if(i < Elements.Length)
        {
            // End:0x7B
            if(((Elements[i].Caption == Caption) && Elements[i].Value == Value) && Elements[i].Level == Level)
            {
                return i;
                // [Explicit Continue]
                goto J0xF4;
            }
            i = 0;
            J0x82:

            // End:0xF4 [Loop If]
            if(i < Elements.Length)
            {
                // End:0xEA
                if(((Elements[i].Caption ~= Caption) && Elements[i].Value ~= Value) && Elements[i].Level == Level)
                {
                    return i;
                }
                i++;
                // [Loop Continue]
                goto J0x82;
            }
            J0xF4:

            i++;
            // [Loop Continue]
            goto J0x10;
        }
    }
    return -1;
    //return;    
}

function int FindVisibleIndex(int idx, int Distance)
{
    local int Count, i, increment;

    // End:0x14
    if(Distance == 0)
    {
        return idx;        
    }
    else
    {
        // End:0x2D
        if(Distance < 0)
        {
            increment = -1;            
        }
        else
        {
            increment = 1;
        }
    }
    i = idx;
    J0x3F:

    // End:0x8F [Loop If]
    if(IsValidIndex(i))
    {
        // End:0x68
        if(Elements[i].bEnabled)
        {
            Count++;
        }
        // End:0x80
        if(float(Count) >= Abs(float(Distance)))
        {
            // [Explicit Break]
            goto J0x8F;
        }
        i += increment;
        // [Loop Continue]
        goto J0x3F;
    }
    J0x8F:

    return i;
    //return;    
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int row, NewIndex;

    row = int(Ceil((Controller.MouseY - ClientBounds[1]) / ItemHeight));
    NewIndex = FindVisibleIndex(Top, row);
    return Min(NewIndex, ItemCount - 1);
    //return;    
}

function Sort()
{
    SortList();
    //return;    
}

function int SetIndex(int NewIndex)
{
    // End:0x37
    if((IsValidIndex(NewIndex)) && !Elements[NewIndex].bEnabled)
    {
        Expand(NewIndex);
        UpdateVisibleCount();
    }
    return super(GUIListBase).SetIndex(NewIndex);
    //return;    
}

function SetTopItem(int Item)
{
    Top = Item;
    // End:0x20
    if(Top < 0)
    {
        Top = 0;        
    }
    else
    {
        // End:0x55
        if((FindVisibleIndex(Top, ItemsPerPage)) >= ItemCount)
        {
            Top = FindVisibleIndex(ItemCount - 1, -ItemsPerPage);
        }
    }
    // End:0x6A
    if(ItemCount <= 0)
    {
        Top = 0;        
    }
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
    // End:0xBD
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function bool Up()
{
    local int NewIndex;

    // End:0x1B
    if((ItemCount < 2) || Index == 0)
    {
        return true;
    }
    NewIndex = Index;
    J0x26:

    // End:0x4E [Loop If]
    if((--NewIndex >= 0) && !Elements[NewIndex].bEnabled)
    {
        // [Loop Continue]
        goto J0x26;
    }
    SetIndex(Max(0, NewIndex));
    // End:0x7A
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
    //return;    
}

function bool Down()
{
    local int NewIndex;

    // End:0x22
    if((ItemCount < 2) || Index == (ItemCount - 1))
    {
        return true;
    }
    NewIndex = Index;
    J0x2D:

    // End:0x59 [Loop If]
    if((++NewIndex < ItemCount) && !Elements[NewIndex].bEnabled)
    {
        // [Loop Continue]
        goto J0x2D;
    }
    SetIndex(Min(NewIndex, ItemCount - 1));
    // End:0x8C
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
    //return;    
}

function End()
{
    local int NewIndex;

    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    NewIndex = FindVisibleIndex(ItemCount - 1, 1);
    // End:0x5A
    if(IsValidIndex(NewIndex))
    {
        SetIndex(NewIndex);
        // End:0x5A
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    //return;    
}

function PgUp()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    UpdateVisibleCount();
    super.PgUp();
    //return;    
}

function PgDn()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    UpdateVisibleCount();
    super.PgDn();
    //return;    
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
            J0x2E:

            // End:0x59 [Loop If]
            if(i < SelectedElements.Length)
            {
                RemoveElement(SelectedElements[i]);
                i++;
                // [Loop Continue]
                goto J0x2E;
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
    //return;    
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
        if((Controller.DropSource != none) && GUITreeList(Controller.DropSource) != none)
        {
            SourceTree = GUITreeList(Controller.DropSource);
            NewItem = SourceTree.GetPendingElements();
            // End:0xBC
            if(Controller.DropSource == self)
            {
                i = NewItem.Length - 1;
                J0x94:

                // End:0xBC [Loop If]
                if(i >= 0)
                {
                    RemoveElement(NewItem[i],, true);
                    i--;
                    // [Loop Continue]
                    goto J0x94;
                }
            }
            // End:0xD7
            if(!IsValidIndex(DropIndex))
            {
                DropIndex = ItemCount;
            }
            i = NewItem.Length - 1;
            J0xE6:

            // End:0x167 [Loop If]
            if(i >= 0)
            {
                InsertItem(DropIndex, NewItem[i].Caption, NewItem[i].Value, NewItem[i].ParentCaption, NewItem[i].Level, NewItem[i].bEnabled, NewItem[i].ExtraInfo);
                i--;
                // [Loop Continue]
                goto J0xE6;
            }
            SetIndex(DropIndex);
            return true;
        }
    }
    return false;
    //return;    
}

function ClearPendingElements()
{
    super(GUIListBase).ClearPendingElements();
    // End:0x1F
    if(SelectedItems.Length == 0)
    {
        SelectedElements.Remove(0, SelectedElements.Length);
    }
    //return;    
}

function array<GUITreeNode> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xF0
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        // End:0xEA
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:

            // End:0xA6 [Loop If]
            if(i < SelectedItems.Length)
            {
                // End:0x9C
                if((IsValidIndex(SelectedItems[i])) && ValidSelectionAt(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = Elements[SelectedItems[i]];
                }
                i++;
                // [Loop Continue]
                goto J0x44;
            }
            // End:0xEA
            if(((SelectedElements.Length == 0) && IsValid()) && ValidSelection())
            {
                SelectedElements.Length = SelectedElements.Length + 1;
                GetElementAtIndex(Index, SelectedElements[0]);
            }
        }
        return SelectedElements;
    }
    //return;    
}

defaultproperties
{
    bAllowDuplicateCaption=true
    bGroupItems=true
}