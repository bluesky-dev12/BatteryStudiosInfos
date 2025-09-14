/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIVertScrollBar.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class GUIVertScrollBar extends GUIScrollBarBase
    editinlinenew
    instanced;

function GripPressed(GUIComponent Sender, bool IsRepeat)
{
    // End:0x2d
    if(!IsRepeat)
    {
        GrabOffset = Controller.MouseY - MyGripButton.ActualTop();
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
    NewPerc = FClamp(Controller.MouseY - GrabOffset - MyScrollZone.ActualTop() / MyScrollZone.ActualHeight() - GripSize, 0.0, 1.0);
    UpdateGripPosition(NewPerc);
    return true;
}

function ZoneClick(float Delta)
{
    // End:0x37
    if(Controller.MouseY < MyGripButton.Bounds[1])
    {
        MoveGripBy(-BigStep);
    }
    // End:0x6a
    else
    {
        // End:0x6a
        if(Controller.MouseY > MyGripButton.Bounds[3])
        {
            MoveGripBy(BigStep);
        }
    }
    return;
}

defaultproperties
{
    MinGripPixels=12
    begin object name=ScrollZone class=GUIVertScrollZone
        OnScrollZoneClick=ZoneClick
        OnClick=InternalOnClick
    object end
    // Reference: GUIVertScrollZone'GUIVertScrollBar.ScrollZone'
    MyScrollZone=ScrollZone
    begin object name=DownBut class=GUIVertScrollButton
        bIncreaseButton=true
        OnClick=IncreaseClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIVertScrollButton'GUIVertScrollBar.DownBut'
    MyIncreaseButton=DownBut
    begin object name=UpBut class=GUIVertScrollButton
        OnClick=DecreaseClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIVertScrollButton'GUIVertScrollBar.UpBut'
    MyDecreaseButton=UpBut
    begin object name=Grip class=GUIVertGripButton
        OnMousePressed=GripPressed
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIVertGripButton'GUIVertScrollBar.Grip'
    MyGripButton=Grip
    WinWidth=0.0126020
    bAcceptsInput=true
    OnPreDraw=GripPreDraw
}