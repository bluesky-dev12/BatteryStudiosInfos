/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIHorzScrollBar.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class GUIHorzScrollBar extends GUIScrollBarBase
    editinlinenew
    instanced;

function GripPressed(GUIComponent Sender, bool IsRepeat)
{
    // End:0x2d
    if(!IsRepeat)
    {
        GrabOffset = Controller.MouseX - MyGripButton.ActualLeft();
    }
}

function bool GripPreDraw(GUIComponent Sender)
{
    local float NewPerc;

    // End:0x1b
    if(MyGripButton.MenuState != 3)
    {
        return false;
    }
    NewPerc = FClamp(Controller.MouseX - GrabOffset - MyScrollZone.ActualLeft() / MyScrollZone.ActualWidth() - GripSize, 0.0, 1.0);
    UpdateGripPosition(NewPerc);
    return false;
}

function ZoneClick(float Delta)
{
    // End:0x37
    if(Controller.MouseX < MyGripButton.Bounds[0])
    {
        MoveGripBy(-BigStep);
    }
    // End:0x6a
    else
    {
        // End:0x6a
        if(Controller.MouseX > MyGripButton.Bounds[2])
        {
            MoveGripBy(BigStep);
        }
    }
    return;
}

defaultproperties
{
    Orientation=1
    MinGripPixels=12
    begin object name=HScrollZone class=GUIHorzScrollZone
        OnScrollZoneClick=ZoneClick
        OnClick=InternalOnClick
    object end
    // Reference: GUIHorzScrollZone'GUIHorzScrollBar.HScrollZone'
    MyScrollZone=HScrollZone
    begin object name=HRightBut class=GUIHorzScrollButton
        bIncreaseButton=true
        OnClick=IncreaseClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIHorzScrollButton'GUIHorzScrollBar.HRightBut'
    MyIncreaseButton=HRightBut
    begin object name=HLeftBut class=GUIHorzScrollButton
        OnClick=DecreaseClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIHorzScrollButton'GUIHorzScrollBar.HLeftBut'
    MyDecreaseButton=HLeftBut
    begin object name=HGrip class=GUIHorzGripButton
        OnMousePressed=GripPressed
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIHorzGripButton'GUIHorzScrollBar.HGrip'
    MyGripButton=HGrip
    WinWidth=0.03750
    bAcceptsInput=true
    OnPreDraw=GripPreDraw
}