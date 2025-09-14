class GUIList extends GUIVertList
    native
    editinlinenew
    instanced;

var() GUI.eTextAlign TextAlign;
var() editconstarray editconst array<editconst GUIListElem> Elements;
var() editconstarray editconst array<editconst GUIListElem> SelectedElements;
var() Color OfficialColor;
var() Color Official2004Color;
var() Color BonusPackColor;
//var delegate<CompareItem> __CompareItem__Delegate;

// Export UGUIList::execSortList(FFrame&, void* const)
native final function SortList();

function Sort()
{
    super(GUIListBase).Sort();
    SortList();
    //return;    
}

delegate int CompareItem(GUIListElem ElemA, GUIListElem ElemB)
{
    return StrCmp(ElemA.Item, ElemB.Item);
    //return;    
}

function Add(string NewItem, optional Object obj, optional string str, optional bool bSection)
{
    local int NewIndex;
    local GUIListElem E;

    // End:0x36
    if(((!bAllowEmptyItems && NewItem == "") && obj == none) && str == "")
    {
        return;
    }
    E.Item = NewItem;
    E.ExtraData = obj;
    E.ExtraStrData = str;
    E.bSection = bSection;
    // End:0xCE
    if(bSorted && Elements.Length > 0)
    {
        J0x8F:

        // End:0xCB [Loop If]
        if((NewIndex < Elements.Length) && (CompareItem(Elements[NewIndex], E)) < 0)
        {
            NewIndex++;
            // [Loop Continue]
            goto J0x8F;
        }        
    }
    else
    {
        NewIndex = Elements.Length;
    }
    Elements.Insert(NewIndex, 1);
    Elements[NewIndex] = E;
    ItemCount = Elements.Length;
    // End:0x124
    if((Elements.Length == 1) && bInitializeList)
    {
        SetIndex(0);        
    }
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
    //return;    
}

function AddElement(GUIListElem NewElem)
{
    Add(NewElem.Item, NewElem.ExtraData, NewElem.ExtraStrData);
    //return;    
}

function Replace(int i, string NewItem, optional Object obj, optional string str, optional bool bNoSort)
{
    // End:0x28
    if(!IsValidIndex(i))
    {
        Add(NewItem, obj, str);        
    }
    else
    {
        // End:0x5E
        if(((!bAllowEmptyItems && NewItem == "") && obj == none) && str == "")
        {
            return;
        }
        Elements[i].Item = NewItem;
        Elements[i].ExtraData = obj;
        Elements[i].ExtraStrData = str;
        // End:0xBC
        if(bSorted && !bNoSort)
        {
            Sort();
        }
        SetIndex(Index);
    }
    //return;    
}

function Insert(int i, string NewItem, optional Object obj, optional string str, optional bool bNoSort, optional bool bSection)
{
    // End:0x2E
    if(!IsValidIndex(i))
    {
        Add(NewItem, obj, str, bSection);        
    }
    else
    {
        // End:0x64
        if(((!bAllowEmptyItems && NewItem == "") && obj == none) && str == "")
        {
            return;
        }
        Elements.Insert(i, 1);
        Elements[i].Item = NewItem;
        Elements[i].ExtraData = obj;
        Elements[i].ExtraStrData = str;
        Elements[i].bSection = bSection;
        ItemCount = Elements.Length;
        // End:0xF2
        if(bSorted && !bNoSort)
        {
            Sort();
        }
        SetIndex(Index);
        // End:0x11B
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    //return;    
}

function InsertElement(int i, GUIListElem NewElem, optional bool bNoSort)
{
    Insert(i, NewElem.Item, NewElem.ExtraData, NewElem.ExtraStrData, bNoSort);
    //return;    
}

event Swap(int IndexA, int IndexB)
{
    local GUIListElem elem;

    // End:0x7A
    if((IsValidIndex(IndexA)) && IsValidIndex(IndexB))
    {
        elem = Elements[IndexA];
        Elements[IndexA] = Elements[IndexB];
        Elements[IndexB] = elem;
        // End:0x66
        if(bSorted)
        {
            Sort();
        }
        // End:0x7A
        if(bNotify)
        {
            CheckLinkedObjects(self);
        }
    }
    //return;    
}

function LoadFrom(GUIList Source, optional bool bClearFirst)
{
    local string t1, t2;
    local Object t;
    local int i;

    // End:0x0F
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:

    // End:0x71 [Loop If]
    if(i < Source.Elements.Length)
    {
        Source.GetAtIndex(i, t1, t, t2);
        Add(t1, t, t2);
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    //return;    
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
    // End:0x6B
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
    //return;    
}

function int RemoveSilent(int i, optional int Count)
{
    bNotify = false;
    i = Remove(i, Count, true);
    bNotify = true;
    return i;
    //return;    
}

function int RemoveElement(GUIListElem elem, optional int Count, optional bool bNoSort)
{
    local int i;

    Count = Max(Count, 1);
    i = 0;
    J0x15:

    // End:0x69 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x5F
        if(Elements[i] == elem)
        {
            Elements.Remove(i, Min(Count, Elements.Length - i));
            // [Explicit Break]
            goto J0x69;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    J0x69:

    ItemCount = Elements.Length;
    // End:0x91
    if(bSorted && !bNoSort)
    {
        Sort();
    }
    SetIndex(Index);
    // End:0xBA
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return Index;
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
    super(GUIListBase).Clear();
    //return;    
}

function string SelectedText()
{
    return Get();
    //return;    
}

function string Get(optional bool bGuarantee)
{
    // End:0x32
    if(!IsValid())
    {
        // End:0x2F
        if(bGuarantee && Elements.Length > 0)
        {
            return Elements[0].Item;
        }
        return "";
    }
    return Elements[Index].Item;
    //return;    
}

function Object GetObject()
{
    // End:0x0D
    if(!IsValid())
    {
        return none;
    }
    return Elements[Index].ExtraData;
    //return;    
}

function string GetExtra()
{
    // End:0x0E
    if(!IsValid())
    {
        return "";
    }
    return Elements[Index].ExtraStrData;
    //return;    
}

function bool IsSection()
{
    // End:0x0D
    if(!IsValid())
    {
        return false;
    }
    return Elements[Index].bSection;
    //return;    
}

function string GetItemAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Item;
    //return;    
}

function Object GetObjectAtIndex(int i)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return none;
    }
    return Elements[i].ExtraData;
    //return;    
}

function string GetExtraAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].ExtraStrData;
    //return;    
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
    //return;    
}

function SetItemAtIndex(int i, string NewItem)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Item = NewItem;
    // End:0x3C
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function SetObjectAtIndex(int i, Object NewObject)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].ExtraData = NewObject;
    // End:0x3C
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function SetExtraAtIndex(int i, string NewExtra)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].ExtraStrData = NewExtra;
    // End:0x3C
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function RemoveItem(string Item)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x39
        if(Item ~= Elements[i].Item)
        {
            Elements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function RemoveObject(Object obj)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x39
        if(obj == Elements[i].ExtraData)
        {
            Elements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function RemoveExtra(string str)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x39
        if(str ~= Elements[i].ExtraStrData)
        {
            Elements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
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
    //return;    
}

function int FindExtra(string Text, optional bool bExact)
{
    return FindIndex(Text, bExact, true);
    //return;    
}

function int FindItemObject(Object obj)
{
    return FindIndex("",,, obj);
    //return;    
}

function int FindIndex(string test, optional bool bExact, optional bool bExtra, optional Object TestObject)
{
    local int i;

    // End:0x4F
    if(TestObject != none)
    {
        i = 0;
        J0x12:

        // End:0x4C [Loop If]
        if(i < Elements.Length)
        {
            // End:0x42
            if(TestObject == Elements[i].ExtraData)
            {
                return i;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }        
    }
    else
    {
        // End:0x151
        if(test != "")
        {
            // End:0xDC
            if(bExtra)
            {
                i = 0;
                J0x6B:

                // End:0xD9 [Loop If]
                if(i < Elements.Length)
                {
                    // End:0xCF
                    if((bExact && Elements[i].ExtraStrData == test) || !bExact && Elements[i].ExtraStrData ~= test)
                    {
                        return i;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x6B;
                }                
            }
            else
            {
                i = 0;
                J0xE3:

                // End:0x151 [Loop If]
                if(i < Elements.Length)
                {
                    // End:0x147
                    if((bExact && Elements[i].Item == test) || !bExact && Elements[i].Item ~= test)
                    {
                        return i;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0xE3;
                }
            }
        }
    }
    return -1;
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
    local array<GUIListElem> NewItem;
    local int i;

    // End:0x138
    if(Controller.DropTarget == self)
    {
        // End:0x138
        if((Controller.DropSource != none) && GUIList(Controller.DropSource) != none)
        {
            NewItem = GUIList(Controller.DropSource).GetPendingElements();
            // End:0xB1
            if(Controller.DropSource == self)
            {
                i = NewItem.Length - 1;
                J0x89:

                // End:0xB1 [Loop If]
                if(i >= 0)
                {
                    RemoveElement(NewItem[i],, true);
                    i--;
                    // [Loop Continue]
                    goto J0x89;
                }
            }
            // End:0xCC
            if(!IsValidIndex(DropIndex))
            {
                DropIndex = ItemCount;
            }
            i = NewItem.Length - 1;
            J0xDB:

            // End:0x12B [Loop If]
            if(i >= 0)
            {
                Insert(DropIndex, NewItem[i].Item, NewItem[i].ExtraData, NewItem[i].ExtraStrData);
                i--;
                // [Loop Continue]
                goto J0xDB;
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

function array<GUIListElem> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xEC
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        // End:0xE6
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:

            // End:0x90 [Loop If]
            if(i < SelectedItems.Length)
            {
                // End:0x86
                if(IsValidIndex(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = Elements[SelectedItems[i]];
                }
                i++;
                // [Loop Continue]
                goto J0x44;
            }
            // End:0xE6
            if((SelectedElements.Length == 0) && IsValid())
            {
                SelectedElements.Length = SelectedElements.Length + 1;
                GetAtIndex(Index, SelectedElements[0].Item, SelectedElements[0].ExtraData, SelectedElements[0].ExtraStrData);
            }
        }
        return SelectedElements;
    }
    //return;    
}

defaultproperties
{
    TextAlign=1
}