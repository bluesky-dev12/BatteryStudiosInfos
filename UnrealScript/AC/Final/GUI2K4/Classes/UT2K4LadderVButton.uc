class UT2K4LadderVButton extends UT2K4LadderButton
    editinlinenew
    instanced;

function SetState(int rung)
{
    local string NewStyleName;

    // End:0x22
    if(MatchInfo == none)
    {
        Warn("MatchInfo == None");
        return;
    }
    // End:0xAA
    if(rung < MatchIndex)
    {
        // End:0x6C
        if(Graphic == none)
        {
            Graphic = Material(DynamicLoadObject("SinglePlayerThumbs.Grey", Class'Engine.Material', true));
        }
        MenuState = 4;
        NewStyleName = "LadderButton";
        // End:0xA7
        if(ProgresBar != none)
        {
            ProgresBar.Image = PBNormal;
        }        
    }
    else
    {
        // End:0xDB
        if(MyMapRecord.ScreenshotRef != "")
        {
            Graphic = Material(DynamicLoadObject(MyMapRecord.ScreenshotRef, Class'Engine.Material'));
        }
        MenuState = 0;
        // End:0x109
        if(rung == MatchIndex)
        {
            NewStyleName = "LadderButton";            
        }
        else
        {
            NewStyleName = "LadderButtonHi";
        }
        // End:0x13E
        if(ProgresBar != none)
        {
            ProgresBar.Image = PBActive;
        }
    }
    // End:0x16E
    if(MaterialSequence(Graphic) != none)
    {
        Graphic = MaterialSequence(Graphic).SequenceItems[0].Material;
    }
    // End:0x1E5
    if(!NewStyleName ~= StyleName)
    {
        StyleName = NewStyleName;
        // End:0x1B4
        if(Controller != none)
        {
            Style = Controller.GetStyle(StyleName, FontScale);
        }
        // End:0x1E5
        if(Style == none)
        {
            Log("UT2K4LadderButton.NewStyle IS None");
        }
    }
    //return;    
}

event SetVisibility(bool bIsVisible)
{
    super(GUIComponent).SetVisibility(bIsVisible);
    // End:0x2C
    if(ProgresBar != none)
    {
        ProgresBar.SetVisibility(bIsVisible);
    }
    //return;    
}

defaultproperties
{
    bClientBound=true
    StyleName="LadderButton"
    WinWidth=0.0902340
    WinHeight=0.1136720
}