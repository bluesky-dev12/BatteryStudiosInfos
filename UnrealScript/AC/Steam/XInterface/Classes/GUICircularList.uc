/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUICircularList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:16
 *
 *******************************************************************************/
class GUICircularList extends GUIListBase
    native
    editinlinenew
    instanced;

var() bool bCenterInBounds;
var() bool bFillBounds;
var() bool bIgnoreBackClick;
var() bool bAllowSelectEmpty;
var() int FixedItemsPerPage;
var() bool bWrapItems;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x21
    if(bFillBounds)
    {
        bCenterInBounds = false;
    }
    // End:0x44
    if(!bAllowSelectEmpty && ItemCount == 0)
    {
        Index = -1;
    }
}

function float CalculateOffset(float MouseX)
{
    local float X, X1, X2, width, xMod;

    local int i;

    X1 = ClientBounds[0];
    X2 = ClientBounds[2];
    // End:0x41
    if(MouseX < X1 || MouseX > X2)
    {
        return -1.0;
    }
    width = X2 - X1;
    // End:0xec
    if(bCenterInBounds && float(ItemsPerPage) * ItemWidth < width)
    {
        xMod = width - float(ItemsPerPage) * ItemWidth / float(2);
        X1 += xMod;
        X2 -= xMod;
        // End:0xe6
        if(MouseX >= X1 && MouseX <= X2)
        {
            return MouseX - X1 / ItemWidth;
        }
        // End:0xec
        else
        {
            return -1.0;
        }
    }
    // End:0x1a6
    if(bFillBounds && float(ItemsPerPage) * ItemWidth < width)
    {
        xMod = width - float(ItemsPerPage) * ItemWidth / float(ItemsPerPage);
        i = 0;
        X = X1;
        J0x145:
        // End:0x1a0 [While If]
        if(X <= X2)
        {
            // End:0x183
            if(MouseX >= X && MouseX <= X + ItemWidth)
            {
                return float(i);
            }
            ++ i;
            X += ItemWidth + xMod;
            // This is an implied JumpToken; Continue!
            goto J0x145;
        }
        return -1.0;
    }
    return MouseX - X1 / ItemWidth;
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, NewIndex;

    i = int(float(int(float(Top) + CalculateOffset(Controller.MouseX))) % float(ItemCount));
    // End:0x58
    if(bRequireValidIndex && !IsValidIndex(i))
    {
        i = -1;
    }
    NewIndex = Min(i, ItemCount - 1);
    return NewIndex;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x1a
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return false;
    }
    NewIndex = CalculateIndex(true);
    // End:0x3f
    if(NewIndex < 0 && bIgnoreBackClick)
    {
        return false;
    }
    // End:0x5e
    if(!bAllowSelectEmpty && !IsValidIndex(NewIndex))
    {
        return false;
    }
    SetIndex(NewIndex);
    return true;
}

function WheelUp()
{
    MoveLeft();
}

function WheelDown()
{
    MoveRight();
}

function bool MoveLeft()
{
    local int Last;

    // End:0x0e
    if(ItemCount < 2)
    {
        return true;
    }
    Last = Index;
    // End:0x35
    if(Index == 0)
    {
        Index = ItemCount - 1;
    }
    // End:0x3c
    else
    {
        -- Index;
    }
    // End:0x56
    if(Last == Top)
    {
        Top = Index;
    }
    OnChange(self);
    return true;
}

function bool MoveRight()
{
    local int Last;

    // End:0x0e
    if(ItemCount < 2)
    {
        return true;
    }
    Last = Index;
    ++ Index;
    // End:0x36
    if(Index == ItemCount)
    {
        Index = 0;
    }
    // End:0x79
    if(float(Last) == float(Top + ItemsPerPage - 1) % float(ItemCount))
    {
        ++ Top;
        // End:0x79
        if(Top == ItemCount)
        {
            Top = 0;
        }
    }
    OnChange(self);
    return true;
}

function home()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(0);
    Top = 0;
    OnChange(self);
}

function End()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    Top = ItemCount - ItemsPerPage;
    // End:0x32
    if(Top < 0)
    {
        Top = 0;
    }
    SetIndex(ItemCount - 1);
}

function PgUp()
{
    local int moveCount, Last;

    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    moveCount = 0;
    J0x15:
    // End:0x79 [While If]
    if(moveCount < ItemsPerPage - 1)
    {
        Last = Index;
        // End:0x4e
        if(Index == 0)
        {
            Index = ItemCount - 1;
        }
        // End:0x55
        else
        {
            -- Index;
        }
        // End:0x6f
        if(Last == Top)
        {
            Top = Index;
        }
        ++ moveCount;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    OnChange(self);
}

function PgDown()
{
    local int moveCount, Last;

    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    moveCount = 0;
    J0x15:
    // End:0x9c [While If]
    if(moveCount < ItemsPerPage - 1)
    {
        Last = Index;
        ++ Index;
        // End:0x4f
        if(Index == ItemCount)
        {
            Index = 0;
        }
        // End:0x92
        if(float(Last) == float(Top + ItemsPerPage - 1) % float(ItemCount))
        {
            ++ Top;
            // End:0x92
            if(Top == ItemCount)
            {
                Top = 0;
            }
        }
        ++ moveCount;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    OnChange(self);
}

function bool IsValid()
{
    return Index != -1;
}

function InternalOnMousePressed(GUIComponent Sender, bool IsRepeat)
{
    local int NewIndex, i, j, k;

    // End:0x1a
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return;
    }
    // End:0x2e0
    if(!IsRepeat && ItemCount > 0)
    {
        NewIndex = CalculateIndex(true);
        // End:0x5b
        if(NewIndex == -1 && bIgnoreBackClick)
        {
            return;
        }
        LastPressX = int(Controller.MouseX);
        LastPressY = int(Controller.MouseY);
        // End:0xa4
        if(NewIndex >= ItemCount)
        {
            NewIndex = ItemCount - 1;
        }
        // End:0xf2
        if(Controller.CtrlPressed && bMultiSelect && SelectedItems.Length == 0 && NewIndex != Index)
        {
            SelectedItems[SelectedItems.Length] = Index;
        }
        // End:0x20f
        if(Controller.ShiftPressed && IsMultiSelect())
        {
            // End:0x125
            if(LastSelected == -1)
            {
                LastSelected = 0;
            }
            // End:0x17e
            if(!Controller.CtrlPressed)
            {
                j = SelectedItems.Length - 1;
                J0x148:
                // End:0x17e [While If]
                if(j >= 0)
                {
                    // End:0x174
                    if(SelectedItems[j] != Index)
                    {
                        SelectedItems.Remove(j, 1);
                    }
                    -- j;
                    // This is an implied JumpToken; Continue!
                    goto J0x148;
                }
            }
            j = Min(LastSelected, NewIndex);
            J0x190:
            // End:0x20a [While If]
            if(j <= Max(LastSelected, NewIndex))
            {
                k = 0;
                J0x1ad:
                // End:0x1df [While If]
                if(k < SelectedItems.Length)
                {
                    // End:0x1d5
                    if(SelectedItems[k] == j)
                    {
                    }
                    // End:0x1df
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0x1ad;
                    }
                }
                // End:0x200
                if(k == SelectedItems.Length)
                {
                    SelectedItems[k] = j;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x190;
            }
            return;
        }
        // End:0x22e
        else
        {
            LastSelected = NewIndex;
            // End:0x22e
            if(IsMultiSelect())
            {
                Index = NewIndex;
            }
        }
        i = 0;
        J0x235:
        // End:0x267 [While If]
        if(i < SelectedItems.Length)
        {
            // End:0x25d
            if(SelectedItems[i] == NewIndex)
            {
            }
            // End:0x267
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x235;
            }
        }
        // End:0x285
        if(i < SelectedItems.Length)
        {
            MightRemove = i;
        }
        // End:0x2e0
        else
        {
            // End:0x2b6
            if(Controller.CtrlPressed && bMultiSelect)
            {
                SelectedItems[i] = NewIndex;
            }
            // End:0x2e0
            else
            {
                // End:0x2e0
                if(SelectedItems.Length > 0 && MightRemove == -1)
                {
                    SelectedItems.Remove(0, SelectedItems.Length);
                }
            }
        }
    }
}

function CheckDragSelect()
{
    local int i;

    i = CalculateIndex(true);
    // End:0x25
    if(i < 0 && bIgnoreBackClick)
    {
        return;
    }
    // End:0x42
    if(i >= ItemCount)
    {
        i = ItemCount - 1;
    }
    SetIndex(i);
    SelectedItems[SelectedItems.Length] = i;
}

function InternalOnDragOver(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x93
    if(Controller.DropTarget == self)
    {
        NewIndex = CalculateIndex(true);
        // End:0x3d
        if(NewIndex == -1 && bIgnoreBackClick)
        {
            return;
        }
        // End:0x59
        if(NewIndex >= ItemCount)
        {
            DropIndex = -1;
            return;
        }
        // End:0x88
        if(Controller.DropSource != self && SelectedItems.Length > 0)
        {
            SelectedItems.Remove(0, SelectedItems.Length);
        }
        DropIndex = NewIndex;
    }
}

defaultproperties
{
    bCenterInBounds=true
    bIgnoreBackClick=true
    bAllowSelectEmpty=true
    bWrapItems=true
    bRequiresStyle=true
    OnClick=InternalOnClick
}