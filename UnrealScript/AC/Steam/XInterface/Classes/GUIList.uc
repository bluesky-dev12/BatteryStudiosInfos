/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:37
 *
 *******************************************************************************/
class GUIList extends GUIVertList
    dependson(GUIVertList)
    dependson(GUIScrollBarBase)
    native
    editinlinenew
    instanced;

var() GUI.eTextAlign TextAlign;
var() editconstarray editconst array<editconst GUIListElem> Elements;
var() editconstarray editconst array<editconst GUIListElem> SelectedElements;
var() Color OfficialColor;
var() Color Official2004Color;
var() Color BonusPackColor;
var delegate<CompareItem> __CompareItem__Delegate;

// Export UGUIList::execSortList(FFrame&, void* const)
native final function SortList();
function Sort()
{
    super(GUIListBase).Sort();
    SortList();
}

delegate int CompareItem(GUIListElem ElemA, GUIListElem ElemB)
{
    return StrCmp(ElemA.Item, ElemB.Item);
}

function Add(string NewItem, optional Object obj, optional string str, optional bool bSection)
{
    local int NewIndex;
    local GUIListElem E;

    // End:0x36
    if(!bAllowEmptyItems && NewItem == "" && obj == none && str == "")
    {
        return;
    }
    E.Item = NewItem;
    E.ExtraData = obj;
    E.ExtraStrData = str;
    E.bSection = bSection;
    // End:0xce
    if(bSorted && Elements.Length > 0)
    {
        J0x8f:
        // End:0xcb [While If]
        if(NewIndex < Elements.Length && CompareItem(Elements[NewIndex], E) < 0)
        {
            ++ NewIndex;
            // This is an implied JumpToken; Continue!
            goto J0x8f;
        }
    }
    // End:0xda
    else
    {
        NewIndex = Elements.Length;
    }
    Elements.Insert(NewIndex, 1);
    Elements[NewIndex] = E;
    ItemCount = Elements.Length;
    // End:0x124
    if(Elements.Length == 1 && bInitializeList)
    {
        SetIndex(0);
    }
    // End:0x138
    else
    {
        // End:0x138
        if(bNotify)
        {
            CheckLinkedObjects(self);
        }
    }
    // End:0x156
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function AddElement(GUIListElem NewElem)
{
    Add(NewElem.Item, NewElem.ExtraData, NewElem.ExtraStrData);
}

function Replace(int i, string NewItem, optional Object obj, optional string str, optional bool bNoSort)
{
    // End:0x28
    if(!IsValidIndex(i))
    {
        Add(NewItem, obj, str);
    }
    // End:0xc7
    else
    {
        // End:0x5e
        if(!bAllowEmptyItems && NewItem == "" && obj == none && str == "")
        {
            return;
        }
        Elements[i].Item = NewItem;
        Elements[i].ExtraData = obj;
        Elements[i].ExtraStrData = str;
        // End:0xbc
        if(bSorted && !bNoSort)
        {
            Sort();
        }
        SetIndex(Index);
    }
}

function Insert(int i, string NewItem, optional Object obj, optional string str, optional bool bNoSort, optional bool bSection)
{
    // End:0x2e
    if(!IsValidIndex(i))
    {
        Add(NewItem, obj, str, bSection);
    }
    // End:0x11b
    else
    {
        // End:0x64
        if(!bAllowEmptyItems && NewItem == "" && obj == none && str == "")
        {
            return;
        }
        Elements.Insert(i, 1);
        Elements[i].Item = NewItem;
        Elements[i].ExtraData = obj;
        Elements[i].ExtraStrData = str;
        Elements[i].bSection = bSection;
        ItemCount = Elements.Length;
        // End:0xf2
        if(bSorted && !bNoSort)
        {
            Sort();
        }
        SetIndex(Index);
        // End:0x11b
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
}

function InsertElement(int i, GUIListElem NewElem, optional bool bNoSort)
{
    Insert(i, NewElem.Item, NewElem.ExtraData, NewElem.ExtraStrData, bNoSort);
}

event Swap(int IndexA, int IndexB)
{
    local GUIListElem elem;

    // End:0x7a
    if(IsValidIndex(IndexA) && IsValidIndex(IndexB))
    {
        elem = Elements[IndexA];
        Elements[IndexA] = Elements[IndexB];
        Elements[IndexB] = elem;
        // End:0x66
        if(bSorted)
        {
            Sort();
        }
        // End:0x7a
        if(bNotify)
        {
            CheckLinkedObjects(self);
        }
    }
}

function LoadFrom(GUIList Source, optional bool bClearFirst)
{
    local string t1, t2;
    local Object t;
    local int i;

    // End:0x0f
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:
    // End:0x71 [While If]
    if(i < Source.Elements.Length)
    {
        Source.GetAtIndex(i, t1, t, t2);
        Add(t1, t, t2);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
}

function int Remove(int i, optional int Count, optional bool bNoSort)
{
    Count = Max(Count, 1);
    // End:0x24
    if(!IsValidIndex(i))
    {
        return Index;
    }
    Elements.Remove(i, Min(Count, Elements.Length - i));
    ItemCount = Elements.Length;
    // End:0x6b
    if(bSorted && !bNoSort)
    {
        Sort();
    }
    SetIndex(Index);
    // End:0x94
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return Index;
}

function int RemoveSilent(int i, optional int Count)
{
    bNotify = false;
    i = Remove(i, Count, true);
    bNotify = true;
    return i;
}

function int RemoveElement(GUIListElem elem, optional int Count, optional bool bNoSort)
{
    local int i;

    Count = Max(Count, 1);
    i = 0;
    J0x15:
    // End:0x69 [While If]
    if(i < Elements.Length)
    {
        // End:0x5f
        if(Elements[i] == elem)
        {
            Elements.Remove(i, Min(Count, Elements.Length - i));
        }
        // End:0x69
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x15;
        }
    }
    ItemCount = Elements.Length;
    // End:0x91
    if(bSorted && !bNoSort)
    {
        Sort();
    }
    SetIndex(Index);
    // End:0xba
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return Index;
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
    super(GUIListBase).Clear();
}

function string SelectedText()
{
    return Get();
}

function string Get(optional bool bGuarantee)
{
    // End:0x32
    if(!IsValid())
    {
        // End:0x2f
        if(bGuarantee && Elements.Length > 0)
        {
            return Elements[0].Item;
        }
        return "";
    }
    return Elements[Index].Item;
}

function Object GetObject()
{
    // End:0x0d
    if(!IsValid())
    {
        return none;
    }
    return Elements[Index].ExtraData;
}

function string GetExtra()
{
    // End:0x0e
    if(!IsValid())
    {
        return "";
    }
    return Elements[Index].ExtraStrData;
}

function bool IsSection()
{
    // End:0x0d
    if(!IsValid())
    {
        return false;
    }
    return Elements[Index].bSection;
}

function string GetItemAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Item;
}

function Object GetObjectAtIndex(int i)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return none;
    }
    return Elements[i].ExtraData;
}

function string GetExtraAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].ExtraStrData;
}

function GetAtIndex(int i, out string ItemStr, out Object ExtraObj, out string ExtraStr)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    ItemStr = Elements[i].Item;
    ExtraObj = Elements[i].ExtraData;
    ExtraStr = Elements[i].ExtraStrData;
}

function SetItemAtIndex(int i, string NewItem)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Item = NewItem;
    // End:0x3c
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

function SetObjectAtIndex(int i, Object NewObject)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].ExtraData = NewObject;
    // End:0x3c
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

function SetExtraAtIndex(int i, string NewExtra)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].ExtraStrData = NewExtra;
    // End:0x3c
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

function RemoveItem(string Item)
{
    local int i;

    // End:0x43 [While If]
    if(i < Elements.Length)
    {
        J0x00:
        // End:0x39
        if(Item ~= Elements[i].Item)
        {
            Elements.Remove(i, 1);
        }
        // End:0x40
        else
        {
            ++ i;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function RemoveObject(Object obj)
{
    local int i;

    // End:0x43 [While If]
    if(i < Elements.Length)
    {
        J0x00:
        // End:0x39
        if(obj == Elements[i].ExtraData)
        {
            Elements.Remove(i, 1);
        }
        // End:0x40
        else
        {
            ++ i;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function RemoveExtra(string str)
{
    local int i;

    // End:0x43 [While If]
    if(i < Elements.Length)
    {
        J0x00:
        // End:0x39
        if(str ~= Elements[i].ExtraStrData)
        {
            Elements.Remove(i, 1);
        }
        // End:0x40
        else
        {
            ++ i;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function string Find(string Text, optional bool bExact, optional bool bExtra)
{
    local int i;

    i = FindIndex(Text, bExact, bExtra);
    // End:0x48
    if(i != -1)
    {
        SetIndex(i);
        return Elements[i].Item;
    }
    return "";
}

function int FindExtra(string Text, optional bool bExact)
{
    return FindIndex(Text, bExact, true);
}

function int FindItemObject(Object obj)
{
    return FindIndex("",,, obj);
}

function int FindIndex(string Test, optional bool bExact, optional bool bExtra, optional Object TestObject)
{
    local int i;

    // End:0x4f
    if(TestObject != none)
    {
        i = 0;
        J0x12:
        // End:0x4c [While If]
        if(i < Elements.Length)
        {
            // End:0x42
            if(TestObject == Elements[i].ExtraData)
            {
                return i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    // End:0x151
    else
    {
        // End:0x151
        if(Test != "")
        {
            // End:0xdc
            if(bExtra)
            {
                i = 0;
                J0x6b:
                // End:0xd9 [While If]
                if(i < Elements.Length)
                {
                    // End:0xcf
                    if(bExact && Elements[i].ExtraStrData == Test || !bExact && Elements[i].ExtraStrData ~= Test)
                    {
                        return i;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x6b;
                }
            }
            // End:0x151
            else
            {
                i = 0;
                J0xe3:
                // End:0x151 [While If]
                if(i < Elements.Length)
                {
                    // End:0x147
                    if(bExact && Elements[i].Item == Test || !bExact && Elements[i].Item ~= Test)
                    {
                        return i;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xe3;
                }
            }
        }
    }
    return -1;
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
    local array<GUIListElem> NewItem;
    local int i;

    // End:0x138
    if(Controller.DropTarget == self)
    {
        // End:0x138
        if(Controller.DropSource != none && GUIList(Controller.DropSource) != none)
        {
            NewItem = GUIList(Controller.DropSource).GetPendingElements();
            // End:0xb1
            if(Controller.DropSource == self)
            {
                i = NewItem.Length - 1;
                J0x89:
                // End:0xb1 [While If]
                if(i >= 0)
                {
                    RemoveElement(NewItem[i],, true);
                    -- i;
                    // This is an implied JumpToken; Continue!
                    goto J0x89;
                }
            }
            // End:0xcc
            if(!IsValidIndex(DropIndex))
            {
                DropIndex = ItemCount;
            }
            i = NewItem.Length - 1;
            J0xdb:
            // End:0x12b [While If]
            if(i >= 0)
            {
                Insert(DropIndex, NewItem[i].Item, NewItem[i].ExtraData, NewItem[i].ExtraStrData);
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0xdb;
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

function array<GUIListElem> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xec
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        // End:0xe6
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:
            // End:0x90 [While If]
            if(i < SelectedItems.Length)
            {
                // End:0x86
                if(IsValidIndex(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = Elements[SelectedItems[i]];
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x44;
            }
            // End:0xe6
            if(SelectedElements.Length == 0 && IsValid())
            {
                SelectedElements.Length = SelectedElements.Length + 1;
                GetAtIndex(Index, SelectedElements[0].Item, SelectedElements[0].ExtraData, SelectedElements[0].ExtraStrData);
            }
        }
        return SelectedElements;
    }
}

defaultproperties
{
    TextAlign=1
}