/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIListBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:47
 *	Functions:49
 *
 *******************************************************************************/
class GUIListBase extends GUIComponent
    dependson(GUIMultiColumnList)
    native
    editinlinenew
    abstract
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
var() noexport editinline GUIScrollBarBase MyScrollBar;
var() bool bAlwaysShowScrollbar;
var() bool bForceScrollBarPosition;
var() float ForcedScrollbarWinLeft;
var() float ForcedScrollbarWinTop;
var() float ForcedScrollbarWinWidth;
var() float ForcedScrollbarWinHeight;
var(Style) string SelectedStyleName;
var(Style) string SectionStyleName;
var(Style) string OutlineStyleName;
var(Style) noexport editinline GUIStyles SelectedStyle;
var(Style) noexport editinline GUIStyles SectionStyle;
var(Style) noexport editinline GUIStyles OutlineStyle;
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
var delegate<OnScrollBy> __OnScrollBy__Delegate;
var delegate<OnDrawItem> __OnDrawItem__Delegate;
var delegate<OnAdjustTop> __OnAdjustTop__Delegate;
var delegate<OnTrack> __OnTrack__Delegate;
var delegate<CheckLinkedObjects> __CheckLinkedObjects__Delegate;

delegate OnScrollBy(GUIComponent Sender);
delegate OnDrawItem(Canvas Canvas, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
delegate OnAdjustTop(GUIComponent Sender);
delegate OnTrack(GUIComponent Sender, int LastIndex);
delegate CheckLinkedObjects(GUIListBase List)
{
    // End:0x12
    if(IsValid())
    {
        EnableLinkedObjects();
    }
    // End:0x18
    else
    {
        DisableLinkedObjects();
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x48
    if(SectionStyleName != "" && SectionStyle == none)
    {
        SectionStyle = MyController.GetStyle(SectionStyleName, FontScale);
    }
    // End:0x80
    if(SelectedStyleName != "" && SelectedStyle == none)
    {
        SelectedStyle = MyController.GetStyle(SelectedStyleName, FontScale);
    }
    // End:0xb8
    if(OutlineStyleName != "" && OutlineStyle == none)
    {
        OutlineStyle = MyController.GetStyle(OutlineStyleName, FontScale);
    }
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
            // End:0x88
            else
            {
                MyScrollBar.WinLeft = ForcedScrollbarWinLeft;
                MyScrollBar.WinTop = ForcedScrollbarWinTop;
                MyScrollBar.WinWidth = ForcedScrollbarWinWidth;
                MyScrollBar.WinHeight = ForcedScrollbarWinHeight;
            }
        }
    }
}

function Sort();
function int SilentSetIndex(int NewIndex)
{
    local int i;

    bNotify = false;
    i = SetIndex(NewIndex);
    bNotify = true;
    return i;
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    return -1;
}

event int MultiCalculateIndex(optional bool bRequireValidIndex)
{
    return -1;
}

function int SetIndex(int NewIndex)
{
    // End:0x1e
    if(!IsValidIndex(NewIndex))
    {
        Index = -1;
    }
    // End:0x29
    else
    {
        Index = NewIndex;
    }
    // End:0xa3
    if(Index >= 0 && ItemsPerPage > 0)
    {
        // End:0x5e
        if(Index < Top)
        {
            SetTopItem(Index);
        }
        // End:0xa0
        else
        {
            // End:0x8c
            if(Index >= Top + ItemsPerPage)
            {
                SetTopItem(Index - ItemsPerPage + 1);
            }
            // End:0xa0
            else
            {
                // End:0xa0
                if(bNotify)
                {
                    CheckLinkedObjects(self);
                }
            }
        }
    }
    // End:0xcc
    else
    {
        // End:0xb7
        if(bNotify)
        {
            CheckLinkedObjects(self);
        }
        // End:0xcc
        if(Top >= ItemCount)
        {
            home();
        }
    }
    IndexChanged(self);
    return Index;
}

function IndexChanged(GUIComponent Sender)
{
    // End:0x18
    if(bNotify)
    {
        OnChange(Sender);
    }
    LastSelected = Index;
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
}

function Clear()
{
    Top = 0;
    ItemCount = 0;
    SetIndex(-1);
    MyScrollBar.AlignThumb();
}

function MakeVisible(float perc)
{
    SetTopItem(int(float(ItemCount - ItemsPerPage) * perc));
}

function SetTopItem(int Item)
{
    Top = Item;
    // End:0x33
    if(Top + ItemsPerPage >= ItemCount)
    {
        Top = ItemCount - ItemsPerPage;
    }
    // End:0x52
    if(Top < 0 || ItemsPerPage == 0)
    {
        Top = 0;
    }
    // End:0x66
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    OnAdjustTop(self);
    // End:0x8f
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
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
            J0x1d:
            // End:0x52 [While If]
            if(i < LinkedObjects.Length)
            {
                // End:0x48
                if(LinkedObjects[i] == NewObj)
                {
                    return i;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1d;
            }
        }
        i = LinkedObjects.Length;
        LinkedObjects[i] = NewObj;
        return i;
    }
    return -1;
}

function InitLinkObjects(array<export editinline GUIComponent> NewObj, optional bool bNoCheck)
{
    local int i;

    // End:0x4c
    if(!bNoCheck)
    {
        i = NewObj.Length - 1;
        J0x1a:
        // End:0x4c [While If]
        if(i >= 0)
        {
            // End:0x42
            if(NewObj[i] == none)
            {
                NewObj.Remove(i, 1);
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x1a;
        }
    }
    LinkedObjects = NewObj;
    // End:0x6b
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

function EnableLinkedObjects()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x43 [While If]
    if(i < LinkedObjects.Length)
    {
        // End:0x39
        if(LinkedObjects[i] != none)
        {
            EnableComponent(LinkedObjects[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function DisableLinkedObjects()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x43 [While If]
    if(i < LinkedObjects.Length)
    {
        // End:0x39
        if(LinkedObjects[i] != none)
        {
            DisableComponent(LinkedObjects[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool IsValid()
{
    // End:0x1e
    if(Index < 0 || Index >= ItemCount)
    {
        return false;
    }
    return true;
}

function bool IsValidIndex(int i)
{
    // End:0x1e
    if(i < 0 || i >= ItemCount)
    {
        return false;
    }
    return true;
}

event string AdditionalDebugString()
{
    return " SelectedItems:" @ string(SelectedItems.Length);
}

function string GetItemAtIndex(int idx)
{
    return "";
}

function array<string> GetPendingItems(optional bool bGuarantee)
{
    local int i;
    local array<string> items;

    // End:0xae
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        i = 0;
        J0x38:
        // End:0x84 [While If]
        if(i < SelectedItems.Length)
        {
            // End:0x7a
            if(IsValidIndex(SelectedItems[i]))
            {
                items[items.Length] = GetItemAtIndex(SelectedItems[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x38;
        }
        // End:0xae
        if(items.Length == 0 && IsValid())
        {
            items[0] = GetItemAtIndex(Index);
        }
    }
    return items;
}

function bool InternalOnKeyEvent(out byte key, out byte KeyState, float Delta)
{
    local int i;
    local Engine.Interactions.EInputKey iKey;

    // End:0x1a
    if(ItemsPerPage == 0 || ItemsPerPage == 0)
    {
        return false;
    }
    iKey = key;
    // End:0x4d
    if(KeyState == 3 && iKey == 236)
    {
        WheelUp();
        return true;
    }
    // End:0x75
    if(KeyState == 3 && iKey == 237)
    {
        WheelDown();
        return true;
    }
    // End:0x84
    if(KeyState != 1)
    {
        return false;
    }
    switch(iKey)
    {
        // End:0x9e
        case 38:
            // End:0x9b
            if(Up())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xc7
        case 40:
            // End:0xc4
            if(!Controller.ShiftPressed && Down())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xda
        case 37:
            // End:0xd7
            if(MoveLeft())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xed
        case 39:
            // End:0xea
            if(MoveRight())
            {
                return true;
            }
            // End:0x185
            break;
        // End:0xfa
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
                // End:0x180 [While If]
                if(i < ItemCount)
                {
                    SelectedItems[i] = i;
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x156;
                }
                return true;
        }
        // End:0xffff
        default:
            return false;
    }
}

function bool Up()
{
    return false;
}

function bool Down()
{
    return false;
}

function bool MoveRight()
{
    return false;
}

function bool MoveLeft()
{
    return false;
}

function WheelUp();
function WheelDown();
function PgUp();
function PgDn();
function home();
function End();
function InternalOnMousePressed(GUIComponent Sender, bool IsRepeat)
{
    local int i, j, k, NewIndex;
    local export editinline GUIMultiColumnList kMultiColumnList;

    // End:0x1a
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return;
    }
    // End:0x3a4
    if(!IsRepeat && ItemCount > 0)
    {
        kMultiColumnList = GUIMultiColumnList(Sender);
        // End:0x73
        if(kMultiColumnList != none && kMultiColumnList.NoVisibleCols > 1)
        {
            NewIndex = MultiCalculateIndex(true);
        }
        // End:0x80
        else
        {
            NewIndex = CalculateIndex(true);
        }
        bMousePress = true;
        bMouseRelease = false;
        // End:0xa1
        if(NewIndex == -1)
        {
            return;
        }
        LastPressX = int(Controller.MouseX);
        LastPressY = int(Controller.MouseY);
        // End:0x11b
        if(Controller.CtrlPressed && bMultiSelect && SelectedItems.Length == 0 && NewIndex != Index)
        {
            SelectedItems[SelectedItems.Length] = Index;
        }
        // End:0x26d
        if(Controller.ShiftPressed && IsMultiSelect())
        {
            // End:0x14e
            if(LastSelected == -1)
            {
                LastSelected = 0;
            }
            // End:0x1a7
            if(!Controller.CtrlPressed)
            {
                j = SelectedItems.Length - 1;
                J0x171:
                // End:0x1a7 [While If]
                if(j >= 0)
                {
                    // End:0x19d
                    if(SelectedItems[j] != Index)
                    {
                        SelectedItems.Remove(j, 1);
                    }
                    -- j;
                    // This is an implied JumpToken; Continue!
                    goto J0x171;
                }
            }
            j = Min(LastSelected, NewIndex);
            J0x1b9:
            // End:0x268 [While If]
            if(j <= Max(LastSelected, NewIndex))
            {
                k = 0;
                J0x1d6:
                // End:0x23d [While If]
                if(k < SelectedItems.Length)
                {
                    // End:0x1fe
                    if(j == SelectedItems[k])
                    {
                    }
                    // End:0x23d
                    else
                    {
                        // End:0x233
                        if(j < SelectedItems[k])
                        {
                            SelectedItems.Insert(k, 1);
                            SelectedItems[k] = j;
                        }
                        // End:0x23d
                        else
                        {
                            ++ k;
                            // This is an implied JumpToken; Continue!
                            goto J0x1d6;
                        }
                    }
                }
                // End:0x25e
                if(k == SelectedItems.Length)
                {
                    SelectedItems[k] = j;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x1b9;
            }
            return;
        }
        // End:0x28c
        else
        {
            LastSelected = NewIndex;
            // End:0x28c
            if(IsMultiSelect())
            {
                Index = NewIndex;
            }
        }
        i = 0;
        J0x293:
        // End:0x2c5 [While If]
        if(i < SelectedItems.Length)
        {
            // End:0x2bb
            if(SelectedItems[i] == NewIndex)
            {
            }
            // End:0x2c5
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x293;
            }
        }
        // End:0x2e3
        if(i < SelectedItems.Length)
        {
            MightRemove = i;
        }
        // End:0x3a4
        else
        {
            // End:0x37a
            if(Controller.CtrlPressed && bMultiSelect)
            {
                i = 0;
                J0x307:
                // End:0x356 [While If]
                if(i < SelectedItems.Length)
                {
                    // End:0x34c
                    if(NewIndex < SelectedItems[i])
                    {
                        SelectedItems.Insert(i, 1);
                        SelectedItems[i] = NewIndex;
                    }
                    // End:0x356
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x307;
                    }
                }
                // End:0x377
                if(i == SelectedItems.Length)
                {
                    SelectedItems[i] = NewIndex;
                }
            }
            // End:0x3a4
            else
            {
                // End:0x3a4
                if(SelectedItems.Length > 0 && MightRemove == -1)
                {
                    SelectedItems.Remove(0, SelectedItems.Length);
                }
            }
        }
    }
}

function InternalOnMouseRelease(GUIComponent Sender)
{
    // End:0x29
    if(MightRemove >= 0 && MightRemove < SelectedItems.Length)
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
}

function bool InternalOnBeginDrag(GUIComponent Sender)
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    // End:0x55
    if(Abs(float(LastPressX) - Controller.MouseX) < float(3) && Abs(float(LastPressY) - Controller.MouseY) < float(3))
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
}

function CheckDragSelect()
{
    local int i;

    i = CalculateIndex(true);
    // End:0x1a
    if(i < 0)
    {
        return;
    }
    SetIndex(i);
    SelectedItems[SelectedItems.Length] = i;
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    // End:0x33
    if(bDropSource && bMultiSelect && SelectedItems.Length > 0)
    {
        Controller.bIgnoreNextRelease = true;
    }
    return true;
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted);
function bool InternalOnDragDrop(GUIComponent Sender)
{
    return false;
}

function InternalOnDragOver(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x0d
    if(Controller == none)
    {
        return;
    }
    // End:0x84
    if(Controller.DropTarget == self)
    {
        NewIndex = CalculateIndex(true);
        // End:0x4a
        if(NewIndex == -1)
        {
            DropIndex = -1;
            return;
        }
        // End:0x79
        if(Controller.DropSource != self && SelectedItems.Length > 0)
        {
            SelectedItems.Remove(0, SelectedItems.Length);
        }
        DropIndex = NewIndex;
    }
}

function InternalOnDragEnter(GUIComponent Sender)
{
    SetOutlineAlpha(255);
}

function InternalOnDragLeave(GUIComponent Sender)
{
    SetOutlineAlpha(128);
    // End:0x1e
    if(DropIndex >= 0)
    {
        DropIndex = -1;
    }
}

event bool IsMultiSelect()
{
    // End:0x0d
    if(Controller == none)
    {
        return false;
    }
    return bDropSource && bMultiSelect && DropState != 1 && Controller.CtrlPressed || Controller.ShiftPressed && OnMultiSelect(self);
}

function SetOutlineAlpha(int NewAlpha)
{
    local int i;

    // End:0x0d
    if(OutlineStyle == none)
    {
        return;
    }
    i = 0;
    J0x14:
    // End:0x4b [While If]
    if(i < 5)
    {
        OutlineStyle.ImgColors[i].A = byte(NewAlpha);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
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
    OnRightClick=InternalOnRightClick
    OnMousePressed=InternalOnMousePressed
    OnMouseRelease=InternalOnMouseRelease
    OnKeyEvent=InternalOnKeyEvent
    OnBeginDrag=InternalOnBeginDrag
    OnEndDrag=InternalOnEndDrag
    OnDragDrop=InternalOnDragDrop
    OnDragEnter=InternalOnDragEnter
    OnDragLeave=InternalOnDragLeave
    OnDragOver=InternalOnDragOver
}