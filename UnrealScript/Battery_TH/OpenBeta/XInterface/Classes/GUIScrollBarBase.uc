class GUIScrollBarBase extends GUIMultiComponent
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
var() automated GUIScrollZoneBase MyScrollZone;
var() automated GUIScrollButtonBase MyIncreaseButton;
var() automated GUIScrollButtonBase MyDecreaseButton;
var() automated GUIGripButtonBase MyGripButton;
//var delegate<PositionChanged> __PositionChanged__Delegate;
//var delegate<MoveGripBy> __MoveGripBy__Delegate;
//var delegate<AlignThumb> __AlignThumb__Delegate;

delegate PositionChanged(int NewPos)
{
    //return;    
}

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
    //return;    
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
    else
    {
        BigStep = 0;
        ItemCount = 0;
        CurPos = 0;
    }
    //return;    
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
    //return;    
}

delegate MoveGripBy(int items)
{
    local int NewItem;

    // End:0x6C
    if(MyList != none)
    {
        NewItem = MyList.Top + items;
        ItemCount = MyList.ItemCount;
        // End:0x6C
        if(MyList.ItemCount > 0)
        {
            MyList.SetTopItem(NewItem);
            AlignThumb();
        }
    }
    CurPos += items;
    // End:0x8A
    if(CurPos < 0)
    {
        CurPos = 0;
    }
    // End:0xB2
    if(CurPos > (ItemCount - ItemsPerPage))
    {
        CurPos = ItemCount - ItemsPerPage;
    }
    // End:0xD2
    if(MyList == none)
    {
        // End:0xD2
        if(ItemCount > 0)
        {
            AlignThumb();
        }
    }
    PositionChanged(CurPos);
    //return;    
}

function bool DecreaseClick(GUIComponent Sender)
{
    WheelUp();
    return true;
    //return;    
}

function bool IncreaseClick(GUIComponent Sender)
{
    WheelDown();
    return true;
    //return;    
}

function WheelUp()
{
    // End:0x28
    if(!Controller.CtrlPressed)
    {
        MoveGripBy(-Step);        
    }
    else
    {
        MoveGripBy(-BigStep);
    }
    //return;    
}

function WheelDown()
{
    // End:0x26
    if(!Controller.CtrlPressed)
    {
        MoveGripBy(Step);        
    }
    else
    {
        MoveGripBy(BigStep);
    }
    //return;    
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
            NewPos = 0.0000000;            
        }
        else
        {
            NewPos = float(MyList.Top) / float(MyList.ItemCount - MyList.ItemsPerPage);
        }        
    }
    else
    {
        // End:0x9C
        if(ItemCount == 0)
        {
            NewPos = 0.0000000;            
        }
        else
        {
            NewPos = float(CurPos) / float(ItemCount - ItemsPerPage);
        }
    }
    GripPos = FClamp(NewPos, 0.0000000, 1.0000000);
    //return;    
}

function Refocus(GUIComponent Who)
{
    local int i;

    // End:0x6B
    if((Who != none) && Controls.Length > 0)
    {
        i = 0;
        J0x20:

        // End:0x6B [Loop If]
        if(i < Controls.Length)
        {
            Controls[i].FocusInstead = Who;
            Controls[i].bNeverFocus = true;
            i++;
            // [Loop Continue]
            goto J0x20;
        }
    }
    //return;    
}

function bool GripPreDraw(GUIComponent Sender)
{
    return false;
    //return;    
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2A
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
    //return;    
}

defaultproperties
{
    Step=1
    PropagateVisibility=true
    bTabStop=false
}