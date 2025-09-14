class GUIVertScrollBar extends GUIScrollBarBase
    editinlinenew
    instanced;

function GripPressed(GUIComponent Sender, bool IsRepeat)
{
    // End:0x2D
    if(!IsRepeat)
    {
        GrabOffset = Controller.MouseY - MyGripButton.ActualTop();
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
    NewPerc = FClamp(((Controller.MouseY - GrabOffset) - MyScrollZone.ActualTop()) / (MyScrollZone.ActualHeight() - GripSize), 0.0000000, 1.0000000);
    UpdateGripPosition(NewPerc);
    return true;
    //return;    
}

function ZoneClick(float Delta)
{
    // End:0x37
    if(Controller.MouseY < MyGripButton.Bounds[1])
    {
        MoveGripBy(-BigStep);        
    }
    else
    {
        // End:0x6A
        if(Controller.MouseY > MyGripButton.Bounds[3])
        {
            MoveGripBy(BigStep);
        }
    }
    return;
    //return;    
}

defaultproperties
{
    MinGripPixels=12
    // Reference: GUIVertScrollZone'XInterface_Decompressed.GUIVertScrollBar.ScrollZone'
    begin object name="ScrollZone" class=XInterface_Decompressed.GUIVertScrollZone
        OnScrollZoneClick=GUIVertScrollBar.ZoneClick
        OnClick=ScrollZone.InternalOnClick
    end object
    MyScrollZone=ScrollZone
    // Reference: GUIVertScrollButton'XInterface_Decompressed.GUIVertScrollBar.DownBut'
    begin object name="DownBut" class=XInterface_Decompressed.GUIVertScrollButton
        bIncreaseButton=true
        OnClick=GUIVertScrollBar.IncreaseClick
        OnKeyEvent=DownBut.InternalOnKeyEvent
    end object
    MyIncreaseButton=DownBut
    // Reference: GUIVertScrollButton'XInterface_Decompressed.GUIVertScrollBar.UpBut'
    begin object name="UpBut" class=XInterface_Decompressed.GUIVertScrollButton
        OnClick=GUIVertScrollBar.DecreaseClick
        OnKeyEvent=UpBut.InternalOnKeyEvent
    end object
    MyDecreaseButton=UpBut
    // Reference: GUIVertGripButton'XInterface_Decompressed.GUIVertScrollBar.Grip'
    begin object name="Grip" class=XInterface_Decompressed.GUIVertGripButton
        OnMousePressed=GUIVertScrollBar.GripPressed
        OnKeyEvent=Grip.InternalOnKeyEvent
    end object
    MyGripButton=Grip
    WinWidth=0.0126016
    bAcceptsInput=true
    OnPreDraw=GUIVertScrollBar.GripPreDraw
}