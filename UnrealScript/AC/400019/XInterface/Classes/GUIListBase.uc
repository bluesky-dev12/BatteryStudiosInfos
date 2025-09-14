class GUIListBase extends GUIComponent
    abstract
    native
    editinlinenew
    instanced;

var() bool bSorted;
var() bool bHotTrack;
var() bool bHotTrackSound;
var() bool bHotTrackStrictMode;
var() bool bHotTrackOnInactive;
var() bool bDrawSelectionBorder;
var() bool bVisibleWhenEmpty;
var() bool bNotify;
var() bool bInitializeList;
var() bool bMultiSelect;
var() bool bAllowEmptyItems;
var() /*0x00000000-0x00000008*/ noexport editinline GUIScrollBarBase MyScrollBar;
var() bool bAlwaysShowScrollbar;
var() bool bForceScrollBarPosition;
var() float ForcedScrollbarWinLeft;
var() float ForcedScrollbarWinTop;
var() float ForcedScrollbarWinWidth;
var() float ForcedScrollbarWinHeight;
var(Style) string SelectedStyleName;
var(Style) string SectionStyleName;
var(Style) string OutlineStyleName;
var(Style) /*0x00000000-0x00000008*/ noexport editinline GUIStyles SelectedStyle;
var(Style) /*0x00000000-0x00000008*/ noexport editinline GUIStyles SectionStyle;
var(Style) /*0x00000000-0x00000008*/ noexport editinline GUIStyles OutlineStyle;
var() GUI.eTextAlign SectionJustification;
var() Material SelectedImage;
var() Color SelectedBKColor;
var() editconst noexport int Top;
var() editconst noexport int Index;
var() const editconst noexport int ItemsPerPage;
var() editconst noexport float ItemHeight;
var() editconst noexport float ItemWidth;
var() editconst noexport int ItemCount;
var() editconst noexport array<editconst int> SelectedItems;
var() editconst noexport int LastSelected;
var() editconst noexport int LastPressX;
var() editconst noexport int LastPressY;
var() editconst noexport int DropIndex;
var() editconst noexport int MightRemove;
var() editconstarray noexport array<export editinline GUIComponent> LinkedObjects;
var bool bMousePress;
var bool bMouseRelease;
//var delegate<OnScrollBy> __OnScrollBy__Delegate;
//var delegate<OnDrawItem> __OnDrawItem__Delegate;
//var delegate<OnAdjustTop> __OnAdjustTop__Delegate;
//var delegate<OnTrack> __OnTrack__Delegate;
//var delegate<CheckLinkedObjects> __CheckLinkedObjects__Delegate;

delegate OnScrollBy(GUIComponent Sender)
{
    //return;    
}

delegate OnDrawItem(Canvas Canvas, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    //return;    
}

delegate OnAdjustTop(GUIComponent Sender)
{
    //return;    
}

delegate OnTrack(GUIComponent Sender, int LastIndex)
{
    //return;    
}

delegate CheckLinkedObjects(GUIListBase List)
{
    // End:0x12
    if(IsValid())
    {
        EnableLinkedObjects();        
    }
    else
    {
        DisableLinkedObjects();
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x48
    if((SectionStyleName != "") && SectionStyle == none)
    {
        SectionStyle = MyController.GetStyle(SectionStyleName, FontScale);
    }
    // End:0x80
    if((SelectedStyleName != "") && SelectedStyle == none)
    {
        SelectedStyle = MyController.GetStyle(SelectedStyleName, FontScale);
    }
    // End:0xB8
    if((OutlineStyleName != "") && OutlineStyle == none)
    {
        OutlineStyle = MyController.GetStyle(OutlineStyleName, FontScale);
    }
    //return;    
}

event UpdateScrollbarForcedPosition()
{
    // End:0x88
    if(bForceScrollBarPosition)
    {
        // End:0x88
        if(MyScrollBar != none)
        {
            // End:0x38
            if(MyScrollBar.bUseAWinPos)
            {
                MyScrollBar.ApplyAWinPos();                
            }
            else
            {
                MyScrollBar.WinLeft = ForcedScrollbarWinLeft;
                MyScrollBar.WinTop = ForcedScrollbarWinTop;
                MyScrollBar.WinWidth = ForcedScrollbarWinWidth;
                MyScrollBar.WinHeight = ForcedScrollbarWinHeight;
            }
        }
    }
    //return;    
}

function Sort()
{
    //return;    
}

function int SilentSetIndex(int NewIndex)
{
    local int i;

    bNotify = false;
    i = SetIndex(NewIndex);
    bNotify = true;
    return i;
    //return;    
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    return -1;
    //return;    
}

event int MultiCalculateIndex(optional bool bRequireValidIndex)
{
    return -1;
    //return;    
}

function int SetIndex(int NewIndex)
{
    // End:0x1E
    if(!IsValidIndex(NewIndex))
    {
        Index = -1;        
    }
    else
    {
        Index = NewIndex;
    }
    // End:0xA3
    if((Index >= 0) && ItemsPerPage > 0)
    {
        // End:0x5E
        if(Index < Top)
        {
            SetTopItem(Index);            
        }
        else
        {
            // End:0x8C
            if(Index >= (Top + ItemsPerPage))
            {
                SetTopItem((Index - ItemsPerPage) + 1);                
            }
            else
            {
                // End:0xA0
                if(bNotify)
                {
                    CheckLinkedObjects(self);
                }
            }
        }        
    }
    else
    {
        // End:0xB7
        if(bNotify)
        {
            CheckLinkedObjects(self);
        }
        // End:0xCC
        if(Top >= ItemCount)
        {
            home();
        }
    }
    IndexChanged(self);
    return Index;
    //return;    
}

function IndexChanged(GUIComponent Sender)
{
    // End:0x18
    if(bNotify)
    {
        OnChange(Sender);
    }
    LastSelected = Index;
    //return;    
}

function ClearPendingElements()
{
    // End:0x13
    if(bRepeatClick)
    {
        bRepeatClick = false;
        return;
    }
    SelectedItems.Remove(0, SelectedItems.Length);
    DropIndex = -1;
    //return;    
}

function Clear()
{
    Top = 0;
    ItemCount = 0;
    SetIndex(-1);
    MyScrollBar.AlignThumb();
    //return;    
}

function MakeVisible(float perc)
{
    SetTopItem(int(float(ItemCount - ItemsPerPage) * perc));
    //return;    
}

function SetTopItem(int Item)
{
    Top = Item;
    // End:0x33
    if((Top + ItemsPerPage) >= ItemCount)
    {
        Top = ItemCount - ItemsPerPage;
    }
    // End:0x52
    if((Top < 0) || ItemsPerPage == 0)
    {
        Top = 0;
    }
    // End:0x66
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    OnAdjustTop(self);
    // End:0x8F
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function int AddLinkObject(GUIComponent NewObj, optional bool bNoCheck)
{
    local int i;

    // End:0x75
    if(NewObj != none)
    {
        // End:0x52
        if(!bNoCheck)
        {
            i = 0;
            J0x1D:

            // End:0x52 [Loop If]
            if(i < LinkedObjects.Length)
            {
                // End:0x48
                if(LinkedObjects[i] == NewObj)
                {
                    return i;
                }
                i++;
                // [Loop Continue]
                goto J0x1D;
            }
        }
        i = LinkedObjects.Length;
        LinkedObjects[i] = NewObj;
        return i;
    }
    return -1;
    //return;    
}

function InitLinkObjects(array<export editinline GUIComponent> NewObj, optional bool bNoCheck)
{
    local int i;

    // End:0x4C
    if(!bNoCheck)
    {
        i = NewObj.Length - 1;
        J0x1A:

        // End:0x4C [Loop If]
        if(i >= 0)
        {
            // End:0x42
            if(NewObj[i] == none)
            {
                NewObj.Remove(i, 1);
            }
            i--;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    LinkedObjects = NewObj;
    // End:0x6B
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function EnableLinkedObjects()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x43 [Loop If]
    if(i < LinkedObjects.Length)
    {
        // End:0x39
        if(LinkedObjects[i] != none)
        {
            EnableComponent(LinkedObjects[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DisableLinkedObjects()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x43 [Loop If]
    if(i < LinkedObjects.Length)
    {
        // End:0x39
        if(LinkedObjects[i] != none)
        {
            DisableComponent(LinkedObjects[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool IsValid()
{
    // End:0x1E
    if((Index < 0) || Index >= ItemCount)
    {
        return false;
    }
    return true;
    //return;    
}

function bool IsValidIndex(int i)
{
    // End:0x1E
    if((i < 0) || i >= ItemCount)
    {
        return false;
    }
    return true;
    //return;    
}

event string AdditionalDebugString()
{
    return " SelectedItems:" @ string(SelectedItems.Length);
    //return;    
}

function string GetItemAtIndex(int idx)
{
    return "";
    //return;    
}

function array<string> GetPendingItems(optional bool bGuarantee)
{
    local int i;
    local array<string> items;

    // End:0xAE
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        i = 0;
        J0x38:

        // End:0x84 [Loop If]
        if(i < SelectedItems.Length)
        {
            // End:0x7A
            if(IsValidIndex(SelectedItems[i]))
            {
                items[items.Length] = GetItemAtIndex(SelectedItems[i]);
            }
            i++;
            // [Loop Continue]
            goto J0x38;
        }
        // End:0xAE
        if((items.Length == 0) && IsValid())
        {
            items[0] = GetItemAtIndex(Index);
        }
    }
    return items;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte KeyState, float Delta)
{
    local int i;
    local Interactions.EInputKey iKey;

    // End:0x1A
    if((ItemsPerPage == 0) || ItemsPerPage == 0)
    {
        return false;
    }
    iKey = key;
    // End:0x4D
    if((int(KeyState) == 3) && int(iKey) == int(236))
    {
        WheelUp();
        return true;
    }
    // End:0x75
    if((int(KeyState) == 3) && int(iKey) == int(237))
    {
        WheelDown();
        return true;
    }
    // End:0x84
    if(int(KeyState) != 1)
    {
        return false;
    }
    switch(iKey)
    {
        // End:0x9E
        case 38:
            // End:0x9B
            if(Up())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xC7
        case 40:
            // End:0xC4
            if(!Controller.ShiftPressed && Down())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xDA
        case 37:
            // End:0xD7
            if(MoveLeft())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xED
        case 39:
            // End:0xEA
            if(MoveRight())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xFA
        case 36:
            home();
            return true;
        // End:0x107
        case 35:
            End();
            return true;
        // End:0x114
        case 33:
            PgUp();
            return true;
        // End:0x121
        case 34:
            PgDn();
            return true;
        // End:0x182
        case 65:
            // End:0x182
            if(Controller.CtrlPressed && bMultiSelect)
            {
                SelectedItems.Length = ItemCount;
                i = 0;
                J0x156:

                // End:0x180 [Loop If]
                if(i < ItemCount)
                {
                    SelectedItems[i] = i;
                    i++;
                    // [Loop Continue]
                    goto J0x156;
                }
                return true;
            }
        // End:0xFFFF
        default:
            break;
    }
    return false;
    //return;    
}

function bool Up()
{
    return false;
    //return;    
}

function bool Down()
{
    return false;
    //return;    
}

function bool MoveRight()
{
    return false;
    //return;    
}

function bool MoveLeft()
{
    return false;
    //return;    
}

function WheelUp()
{
    //return;    
}

function WheelDown()
{
    //return;    
}

function PgUp()
{
    //return;    
}

function PgDn()
{
    //return;    
}

function home()
{
    //return;    
}

function End()
{
    //return;    
}

function InternalOnMousePressed(GUIComponent Sender, bool IsRepeat)
{
    local int i, j, k, NewIndex;
    local export editinline GUIMultiColumnList kMultiColumnList;

    // End:0x1A
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return;
    }
    // End:0x3A4
    if(!IsRepeat && ItemCount > 0)
    {
        kMultiColumnList = GUIMultiColumnList(Sender);
        // End:0x73
        if((kMultiColumnList != none) && kMultiColumnList.NoVisibleCols > 1)
        {
            NewIndex = MultiCalculateIndex(true);            
        }
        else
        {
            NewIndex = CalculateIndex(true);
        }
        bMousePress = true;
        bMouseRelease = false;
        // End:0xA1
        if(NewIndex == -1)
        {
            return;
        }
        LastPressX = int(Controller.MouseX);
        LastPressY = int(Controller.MouseY);
        // End:0x11B
        if(((Controller.CtrlPressed && bMultiSelect) && SelectedItems.Length == 0) && NewIndex != Index)
        {
            SelectedItems[SelectedItems.Length] = Index;
        }
        // End:0x26D
        if(Controller.ShiftPressed && IsMultiSelect())
        {
            // End:0x14E
            if(LastSelected == -1)
            {
                LastSelected = 0;
            }
            // End:0x1A7
            if(!Controller.CtrlPressed)
            {
                j = SelectedItems.Length - 1;
                J0x171:

                // End:0x1A7 [Loop If]
                if(j >= 0)
                {
                    // End:0x19D
                    if(SelectedItems[j] != Index)
                    {
                        SelectedItems.Remove(j, 1);
                    }
                    j--;
                    // [Loop Continue]
                    goto J0x171;
                }
            }
            j = Min(LastSelected, NewIndex);
            J0x1B9:

            // End:0x268 [Loop If]
            if(j <= Max(LastSelected, NewIndex))
            {
                k = 0;
                J0x1D6:

                // End:0x23D [Loop If]
                if(k < SelectedItems.Length)
                {
                    // End:0x1FE
                    if(j == SelectedItems[k])
                    {
                        // [Explicit Break]
                        goto J0x23D;
                    }
                    // End:0x233
                    if(j < SelectedItems[k])
                    {
                        SelectedItems.Insert(k, 1);
                        SelectedItems[k] = j;
                        // [Explicit Break]
                        goto J0x23D;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0x1D6;
                }
                J0x23D:

                // End:0x25E
                if(k == SelectedItems.Length)
                {
                    SelectedItems[k] = j;
                }
                j++;
                // [Loop Continue]
                goto J0x1B9;
            }
            return;            
        }
        else
        {
            LastSelected = NewIndex;
            // End:0x28C
            if(IsMultiSelect())
            {
                Index = NewIndex;
            }
        }
        i = 0;
        J0x293:

        // End:0x2C5 [Loop If]
        if(i < SelectedItems.Length)
        {
            // End:0x2BB
            if(SelectedItems[i] == NewIndex)
            {
                // [Explicit Break]
                goto J0x2C5;
            }
            i++;
            // [Loop Continue]
            goto J0x293;
        }
        J0x2C5:

        // End:0x2E3
        if(i < SelectedItems.Length)
        {
            MightRemove = i;            
        }
        else
        {
            // End:0x37A
            if(Controller.CtrlPressed && bMultiSelect)
            {
                i = 0;
                J0x307:

                // End:0x356 [Loop If]
                if(i < SelectedItems.Length)
                {
                    // End:0x34C
                    if(NewIndex < SelectedItems[i])
                    {
                        SelectedItems.Insert(i, 1);
                        SelectedItems[i] = NewIndex;
                        // [Explicit Break]
                        goto J0x356;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x307;
                }
                J0x356:

                // End:0x377
                if(i == SelectedItems.Length)
                {
                    SelectedItems[i] = NewIndex;
                }                
            }
            else
            {
                // End:0x3A4
                if((SelectedItems.Length > 0) && MightRemove == -1)
                {
                    SelectedItems.Remove(0, SelectedItems.Length);
                }
            }
        }
    }
    //return;    
}

function InternalOnMouseRelease(GUIComponent Sender)
{
    // End:0x29
    if((MightRemove >= 0) && MightRemove < SelectedItems.Length)
    {
        SelectedItems.Remove(MightRemove, 1);
    }
    MightRemove = -1;
    // End:0x45
    if(!IsMultiSelect())
    {
        ClearPendingElements();
    }
    bMousePress = false;
    bMouseRelease = true;
    //return;    
}

function bool InternalOnBeginDrag(GUIComponent Sender)
{
    // End:0x0D
    if(Controller == none)
    {
        return false;
    }
    // End:0x55
    if((Abs(float(LastPressX) - Controller.MouseX) < float(3)) && Abs(float(LastPressY) - Controller.MouseY) < float(3))
    {
        return false;
    }
    MightRemove = -1;
    // End:0x72
    if(SelectedItems.Length == 0)
    {
        CheckDragSelect();
    }
    UpdateOffset(ClientBounds[0], ClientBounds[1], ClientBounds[2], ClientBounds[3]);
    SetOutlineAlpha(128);
    return true;
    //return;    
}

function CheckDragSelect()
{
    local int i;

    i = CalculateIndex(true);
    // End:0x1A
    if(i < 0)
    {
        return;
    }
    SetIndex(i);
    SelectedItems[SelectedItems.Length] = i;
    //return;    
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    // End:0x33
    if((bDropSource && bMultiSelect) && SelectedItems.Length > 0)
    {
        Controller.bIgnoreNextRelease = true;
    }
    return true;
    //return;    
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    //return;    
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    return false;
    //return;    
}

function InternalOnDragOver(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x0D
    if(Controller == none)
    {
        return;
    }
    // End:0x84
    if(Controller.DropTarget == self)
    {
        NewIndex = CalculateIndex(true);
        // End:0x4A
        if(NewIndex == -1)
        {
            DropIndex = -1;
            return;
        }
        // End:0x79
        if((Controller.DropSource != self) && SelectedItems.Length > 0)
        {
            SelectedItems.Remove(0, SelectedItems.Length);
        }
        DropIndex = NewIndex;
    }
    //return;    
}

function InternalOnDragEnter(GUIComponent Sender)
{
    SetOutlineAlpha(255);
    //return;    
}

function InternalOnDragLeave(GUIComponent Sender)
{
    SetOutlineAlpha(128);
    // End:0x1E
    if(DropIndex >= 0)
    {
        DropIndex = -1;
    }
    //return;    
}

event bool IsMultiSelect()
{
    // End:0x0D
    if(Controller == none)
    {
        return false;
    }
    return (((bDropSource && bMultiSelect) && int(DropState) != int(1)) && Controller.CtrlPressed || Controller.ShiftPressed) && OnMultiSelect(self);
    //return;    
}

function SetOutlineAlpha(int NewAlpha)
{
    local int i;

    // End:0x0D
    if(OutlineStyle == none)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0x4B [Loop If]
    if(i < 5)
    {
        OutlineStyle.ImgColors[i].A = byte(NewAlpha);
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

defaultproperties
{
    bDrawSelectionBorder=true
    bNotify=true
    bInitializeList=true
    bMultiSelect=true
    SelectedStyleName="ListSelection"
    SectionStyleName="ListSection"
    OutlineStyleName="ItemOutline"
    SelectedBKColor=(R=255,G=255,B=200,A=255)
    Index=-1
    LastSelected=-1
    DropIndex=-1
    MightRemove=-1
    FontScale=0
    StyleName="NoBackground"
    bTabStop=true
    bAcceptsInput=true
    OnRightClick=GUIListBase.InternalOnRightClick
    OnMousePressed=GUIListBase.InternalOnMousePressed
    OnMouseRelease=GUIListBase.InternalOnMouseRelease
    OnKeyEvent=GUIListBase.InternalOnKeyEvent
    OnBeginDrag=GUIListBase.InternalOnBeginDrag
    OnEndDrag=GUIListBase.InternalOnEndDrag
    OnDragDrop=GUIListBase.InternalOnDragDrop
    OnDragEnter=GUIListBase.InternalOnDragEnter
    OnDragLeave=GUIListBase.InternalOnDragLeave
    OnDragOver=GUIListBase.InternalOnDragOver
}