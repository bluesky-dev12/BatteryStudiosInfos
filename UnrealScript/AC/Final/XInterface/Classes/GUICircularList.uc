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
    //return;    
}

function float CalculateOffset(float MouseX)
{
    local float X, X1, X2, width, xMod;

    local int i;

    X1 = ClientBounds[0];
    X2 = ClientBounds[2];
    // End:0x41
    if((MouseX < X1) || MouseX > X2)
    {
        return -1.0000000;
    }
    width = X2 - X1;
    // End:0xEC
    if(bCenterInBounds && (float(ItemsPerPage) * ItemWidth) < width)
    {
        xMod = (width - (float(ItemsPerPage) * ItemWidth)) / float(2);
        X1 += xMod;
        X2 -= xMod;
        // End:0xE6
        if((MouseX >= X1) && MouseX <= X2)
        {
            return (MouseX - X1) / ItemWidth;            
        }
        else
        {
            return -1.0000000;
        }
    }
    // End:0x1A6
    if(bFillBounds && (float(ItemsPerPage) * ItemWidth) < width)
    {
        xMod = (width - (float(ItemsPerPage) * ItemWidth)) / float(ItemsPerPage);
        i = 0;
        X = X1;
        J0x145:

        // End:0x1A0 [Loop If]
        if(X <= X2)
        {
            // End:0x183
            if((MouseX >= X) && MouseX <= (X + ItemWidth))
            {
                return float(i);
            }
            i++;
            X += (ItemWidth + xMod);
            // [Loop Continue]
            goto J0x145;
        }
        return -1.0000000;
    }
    return (MouseX - X1) / ItemWidth;
    //return;    
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, NewIndex;

    i = int(float(int(float(Top) + (CalculateOffset(Controller.MouseX)))) % float(ItemCount));
    // End:0x58
    if(bRequireValidIndex && !IsValidIndex(i))
    {
        i = -1;
    }
    NewIndex = Min(i, ItemCount - 1);
    return NewIndex;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x1A
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return false;
    }
    NewIndex = CalculateIndex(true);
    // End:0x3F
    if((NewIndex < 0) && bIgnoreBackClick)
    {
        return false;
    }
    // End:0x5E
    if(!bAllowSelectEmpty && !IsValidIndex(NewIndex))
    {
        return false;
    }
    SetIndex(NewIndex);
    return true;
    //return;    
}

function WheelUp()
{
    MoveLeft();
    //return;    
}

function WheelDown()
{
    MoveRight();
    //return;    
}

function bool MoveLeft()
{
    local int Last;

    // End:0x0E
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
    else
    {
        Index--;
    }
    // End:0x56
    if(Last == Top)
    {
        Top = Index;
    }
    OnChange(self);
    return true;
    //return;    
}

function bool MoveRight()
{
    local int Last;

    // End:0x0E
    if(ItemCount < 2)
    {
        return true;
    }
    Last = Index;
    Index++;
    // End:0x36
    if(Index == ItemCount)
    {
        Index = 0;
    }
    // End:0x79
    if(float(Last) == (float((Top + ItemsPerPage) - 1) % float(ItemCount)))
    {
        Top++;
        // End:0x79
        if(Top == ItemCount)
        {
            Top = 0;
        }
    }
    OnChange(self);
    return true;
    //return;    
}

function home()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(0);
    Top = 0;
    OnChange(self);
    //return;    
}

function End()
{
    // End:0x0E
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
    //return;    
}

function PgUp()
{
    local int moveCount, Last;

    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    moveCount = 0;
    J0x15:

    // End:0x79 [Loop If]
    if(moveCount < (ItemsPerPage - 1))
    {
        Last = Index;
        // End:0x4E
        if(Index == 0)
        {
            Index = ItemCount - 1;            
        }
        else
        {
            Index--;
        }
        // End:0x6F
        if(Last == Top)
        {
            Top = Index;
        }
        moveCount++;
        // [Loop Continue]
        goto J0x15;
    }
    OnChange(self);
    //return;    
}

function PgDown()
{
    local int moveCount, Last;

    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    moveCount = 0;
    J0x15:

    // End:0x9C [Loop If]
    if(moveCount < (ItemsPerPage - 1))
    {
        Last = Index;
        Index++;
        // End:0x4F
        if(Index == ItemCount)
        {
            Index = 0;
        }
        // End:0x92
        if(float(Last) == (float((Top + ItemsPerPage) - 1) % float(ItemCount)))
        {
            Top++;
            // End:0x92
            if(Top == ItemCount)
            {
                Top = 0;
            }
        }
        moveCount++;
        // [Loop Continue]
        goto J0x15;
    }
    OnChange(self);
    //return;    
}

function bool IsValid()
{
    return Index != -1;
    //return;    
}

function InternalOnMousePressed(GUIComponent Sender, bool IsRepeat)
{
    local int NewIndex, i, j, k;

    // End:0x1A
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return;
    }
    // End:0x2E0
    if(!IsRepeat && ItemCount > 0)
    {
        NewIndex = CalculateIndex(true);
        // End:0x5B
        if((NewIndex == -1) && bIgnoreBackClick)
        {
            return;
        }
        LastPressX = int(Controller.MouseX);
        LastPressY = int(Controller.MouseY);
        // End:0xA4
        if(NewIndex >= ItemCount)
        {
            NewIndex = ItemCount - 1;
        }
        // End:0xF2
        if(((Controller.CtrlPressed && bMultiSelect) && SelectedItems.Length == 0) && NewIndex != Index)
        {
            SelectedItems[SelectedItems.Length] = Index;
        }
        // End:0x20F
        if(Controller.ShiftPressed && IsMultiSelect())
        {
            // End:0x125
            if(LastSelected == -1)
            {
                LastSelected = 0;
            }
            // End:0x17E
            if(!Controller.CtrlPressed)
            {
                j = SelectedItems.Length - 1;
                J0x148:

                // End:0x17E [Loop If]
                if(j >= 0)
                {
                    // End:0x174
                    if(SelectedItems[j] != Index)
                    {
                        SelectedItems.Remove(j, 1);
                    }
                    j--;
                    // [Loop Continue]
                    goto J0x148;
                }
            }
            j = Min(LastSelected, NewIndex);
            J0x190:

            // End:0x20A [Loop If]
            if(j <= Max(LastSelected, NewIndex))
            {
                k = 0;
                J0x1AD:

                // End:0x1DF [Loop If]
                if(k < SelectedItems.Length)
                {
                    // End:0x1D5
                    if(SelectedItems[k] == j)
                    {
                        // [Explicit Break]
                        goto J0x1DF;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0x1AD;
                }
                J0x1DF:

                // End:0x200
                if(k == SelectedItems.Length)
                {
                    SelectedItems[k] = j;
                }
                j++;
                // [Loop Continue]
                goto J0x190;
            }
            return;            
        }
        else
        {
            LastSelected = NewIndex;
            // End:0x22E
            if(IsMultiSelect())
            {
                Index = NewIndex;
            }
        }
        i = 0;
        J0x235:

        // End:0x267 [Loop If]
        if(i < SelectedItems.Length)
        {
            // End:0x25D
            if(SelectedItems[i] == NewIndex)
            {
                // [Explicit Break]
                goto J0x267;
            }
            i++;
            // [Loop Continue]
            goto J0x235;
        }
        J0x267:

        // End:0x285
        if(i < SelectedItems.Length)
        {
            MightRemove = i;            
        }
        else
        {
            // End:0x2B6
            if(Controller.CtrlPressed && bMultiSelect)
            {
                SelectedItems[i] = NewIndex;                
            }
            else
            {
                // End:0x2E0
                if((SelectedItems.Length > 0) && MightRemove == -1)
                {
                    SelectedItems.Remove(0, SelectedItems.Length);
                }
            }
        }
    }
    //return;    
}

function CheckDragSelect()
{
    local int i;

    i = CalculateIndex(true);
    // End:0x25
    if((i < 0) && bIgnoreBackClick)
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
    //return;    
}

function InternalOnDragOver(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x93
    if(Controller.DropTarget == self)
    {
        NewIndex = CalculateIndex(true);
        // End:0x3D
        if((NewIndex == -1) && bIgnoreBackClick)
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
        if((Controller.DropSource != self) && SelectedItems.Length > 0)
        {
            SelectedItems.Remove(0, SelectedItems.Length);
        }
        DropIndex = NewIndex;
    }
    //return;    
}

defaultproperties
{
    bCenterInBounds=true
    bIgnoreBackClick=true
    bAllowSelectEmpty=true
    bWrapItems=true
    bRequiresStyle=true
    OnClick=GUICircularList.InternalOnClick
}