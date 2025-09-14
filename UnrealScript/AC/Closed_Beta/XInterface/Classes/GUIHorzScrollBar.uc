class GUIHorzScrollBar extends GUIScrollBarBase
    editinlinenew
    instanced;

function GripPressed(GUIComponent Sender, bool IsRepeat)
{
    // End:0x2D
    if(!IsRepeat)
    {
        GrabOffset = Controller.MouseX - MyGripButton.ActualLeft();
    }
    //return;    
}

function bool GripPreDraw(GUIComponent Sender)
{
    local float NewPerc;

    // End:0x1B
    if(int(MyGripButton.MenuState) != int(3))
    {
        return false;
    }
    NewPerc = FClamp(((Controller.MouseX - GrabOffset) - MyScrollZone.ActualLeft()) / (MyScrollZone.ActualWidth() - GripSize), 0.0000000, 1.0000000);
    UpdateGripPosition(NewPerc);
    return false;
    //return;    
}

function ZoneClick(float Delta)
{
    // End:0x37
    if(Controller.MouseX < MyGripButton.Bounds[0])
    {
        MoveGripBy(-BigStep);        
    }
    else
    {
        // End:0x6A
        if(Controller.MouseX > MyGripButton.Bounds[2])
        {
            MoveGripBy(BigStep);
        }
    }
    return;
    //return;    
}

defaultproperties
{
    Orientation=1
    MinGripPixels=12
    // Reference: GUIHorzScrollZone'XInterface_Decompressed.GUIHorzScrollBar.HScrollZone'
    begin object name="HScrollZone" class=XInterface_Decompressed.GUIHorzScrollZone
        OnScrollZoneClick=GUIHorzScrollBar.ZoneClick
        OnClick=HScrollZone.InternalOnClick
    end object
    MyScrollZone=HScrollZone
    // Reference: GUIHorzScrollButton'XInterface_Decompressed.GUIHorzScrollBar.HRightBut'
    begin object name="HRightBut" class=XInterface_Decompressed.GUIHorzScrollButton
        bIncreaseButton=true
        OnClick=GUIHorzScrollBar.IncreaseClick
        OnKeyEvent=HRightBut.InternalOnKeyEvent
    end object
    MyIncreaseButton=HRightBut
    // Reference: GUIHorzScrollButton'XInterface_Decompressed.GUIHorzScrollBar.HLeftBut'
    begin object name="HLeftBut" class=XInterface_Decompressed.GUIHorzScrollButton
        OnClick=GUIHorzScrollBar.DecreaseClick
        OnKeyEvent=HLeftBut.InternalOnKeyEvent
    end object
    MyDecreaseButton=HLeftBut
    // Reference: GUIHorzGripButton'XInterface_Decompressed.GUIHorzScrollBar.HGrip'
    begin object name="HGrip" class=XInterface_Decompressed.GUIHorzGripButton
        OnMousePressed=GUIHorzScrollBar.GripPressed
        OnKeyEvent=HGrip.InternalOnKeyEvent
    end object
    MyGripButton=HGrip
    WinWidth=0.0375000
    bAcceptsInput=true
    OnPreDraw=GUIHorzScrollBar.GripPreDraw
}