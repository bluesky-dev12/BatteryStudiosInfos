/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIScrollBarBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:13
 *
 *******************************************************************************/
class GUIScrollBarBase extends GUIMultiComponent
    dependson(GUIMultiComponent)
    dependson(GUIScrollZoneBase)
    dependson(GUIScrollButtonBase)
    dependson(GUIGripButtonBase)
    dependson(GUIListBase)
    native
    editinlinenew
    instanced;

var() GUI.EOrientation Orientation;
var() int Step;
var float GripPos;
var float GripSize;
var float GrabOffset;
var() int MinGripPixels;
var export editinline GUIListBase MyList;
var() int BigStep;
var() int ItemCount;
var() int ItemsPerPage;
var int CurPos;
var bool bScrollStyle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollZoneBase MyScrollZone;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollButtonBase MyIncreaseButton;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollButtonBase MyDecreaseButton;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGripButtonBase MyGripButton;
var delegate<PositionChanged> __PositionChanged__Delegate;
var delegate<MoveGripBy> __MoveGripBy__Delegate;
var delegate<AlignThumb> __AlignThumb__Delegate;

delegate PositionChanged(int NewPos);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x69
    if(MyList != none)
    {
        Refocus(MyList);
        BigStep = MyList.ItemsPerPage * Step;
        ItemCount = MyList.ItemCount;
        CurPos = MyList.Top;
    }
    MyScrollZone.bNeverScale = true;
    MyIncreaseButton.bNeverScale = true;
    MyDecreaseButton.bNeverScale = true;
    MyGripButton.bNeverScale = true;
}

function SetList(GUIListBase List)
{
    MyList = List;
    Refocus(List);
    // End:0x60
    if(List != none)
    {
        BigStep = List.ItemsPerPage;
        ItemCount = List.ItemCount;
        CurPos = MyList.Top;
    }
    // End:0x75
    else
    {
        BigStep = 0;
        ItemCount = 0;
        CurPos = 0;
    }
}

function UpdateGripPosition(float NewPos)
{
    // End:0x33
    if(MyList != none)
    {
        MyList.MakeVisible(NewPos);
        ItemCount = MyList.ItemCount;
    }
    GripPos = NewPos;
    CurPos = int(float(ItemCount - ItemsPerPage) * GripPos);
    PositionChanged(CurPos);
}

delegate MoveGripBy(int items)
{
    local int NewItem;

    // End:0xaa
    if(MyList != none)
    {
        NewItem = MyList.Top + items;
        ItemCount = MyList.ItemCount;
        // End:0xaa
        if(MyList.ItemCount > 0)
        {
            // End:0x8c
            if(NewItem > ItemCount - ItemsPerPage)
            {
                NewItem = ItemCount - ItemsPerPage;
                NewItem += int(float(NewItem) % float(2));
            }
            MyList.SetTopItem(NewItem);
            AlignThumb();
        }
    }
    CurPos += items;
    // End:0xc8
    if(CurPos < 0)
    {
        CurPos = 0;
    }
    // End:0xf0
    if(CurPos > ItemCount - ItemsPerPage)
    {
        CurPos = ItemCount - ItemsPerPage;
    }
    // End:0x110
    if(MyList == none)
    {
        // End:0x110
        if(ItemCount > 0)
        {
            AlignThumb();
        }
    }
    PositionChanged(CurPos);
}

function bool DecreaseClick(GUIComponent Sender)
{
    WheelUp();
    return true;
}

function bool IncreaseClick(GUIComponent Sender)
{
    WheelDown();
    return true;
}

function WheelUp()
{
    // End:0x28
    if(!Controller.CtrlPressed)
    {
        MoveGripBy(-Step);
    }
    // End:0x39
    else
    {
        MoveGripBy(-BigStep);
    }
}

function WheelDown()
{
    // End:0x26
    if(!Controller.CtrlPressed)
    {
        MoveGripBy(Step);
    }
    // End:0x35
    else
    {
        MoveGripBy(BigStep);
    }
}

delegate AlignThumb()
{
    local float NewPos;

    // End:0x83
    if(MyList != none)
    {
        BigStep = MyList.ItemsPerPage * Step;
        // End:0x48
        if(MyList.ItemCount == 0)
        {
            NewPos = 0.0;
        }
        // End:0x80
        else
        {
            NewPos = float(MyList.Top) / float(MyList.ItemCount - MyList.ItemsPerPage);
        }
    }
    // End:0xb9
    else
    {
        // End:0x9c
        if(ItemCount == 0)
        {
            NewPos = 0.0;
        }
        // End:0xb9
        else
        {
            NewPos = float(CurPos) / float(ItemCount - ItemsPerPage);
        }
    }
    GripPos = FClamp(NewPos, 0.0, 1.0);
}

function Refocus(GUIComponent Who)
{
    local int i;

    // End:0x6b
    if(Who != none && Controls.Length > 0)
    {
        i = 0;
        J0x20:
        // End:0x6b [While If]
        if(i < Controls.Length)
        {
            Controls[i].FocusInstead = Who;
            Controls[i].bNeverFocus = true;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x20;
        }
    }
}

function bool GripPreDraw(GUIComponent Sender)
{
    return false;
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2a
    if(MyScrollZone != none)
    {
        MyScrollZone.SetFriendlyLabel(NewLabel);
    }
    // End:0x49
    if(MyIncreaseButton != none)
    {
        MyIncreaseButton.SetFriendlyLabel(NewLabel);
    }
    // End:0x68
    if(MyDecreaseButton != none)
    {
        MyDecreaseButton.SetFriendlyLabel(NewLabel);
    }
    // End:0x87
    if(MyGripButton != none)
    {
        MyGripButton.SetFriendlyLabel(NewLabel);
    }
}

defaultproperties
{
    Step=1
    PropagateVisibility=true
    bTabStop=true
}