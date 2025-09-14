/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4LadderVButton.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
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
    // End:0xaa
    if(rung < MatchIndex)
    {
        // End:0x6c
        if(Graphic == none)
        {
            Graphic = Material(DynamicLoadObject("SinglePlayerThumbs.Grey", class'Material', true));
        }
        MenuState = 4;
        NewStyleName = "LadderButton";
        // End:0xa7
        if(ProgresBar != none)
        {
            ProgresBar.Image = PBNormal;
        }
    }
    // End:0x13e
    else
    {
        // End:0xdb
        if(MyMapRecord.ScreenshotRef != "")
        {
            Graphic = Material(DynamicLoadObject(MyMapRecord.ScreenshotRef, class'Material'));
        }
        MenuState = 0;
        // End:0x109
        if(rung == MatchIndex)
        {
            NewStyleName = "LadderButton";
        }
        // End:0x11f
        else
        {
            NewStyleName = "LadderButtonHi";
        }
        // End:0x13e
        if(ProgresBar != none)
        {
            ProgresBar.Image = PBActive;
        }
    }
    // End:0x16e
    if(MaterialSequence(Graphic) != none)
    {
        Graphic = MaterialSequence(Graphic).SequenceItems[0].Material;
    }
    // End:0x1e5
    if(!NewStyleName ~= StyleName)
    {
        StyleName = NewStyleName;
        // End:0x1b4
        if(Controller != none)
        {
            Style = Controller.GetStyle(StyleName, FontScale);
        }
        // End:0x1e5
        if(Style == none)
        {
            Log("UT2K4LadderButton.NewStyle IS None");
        }
    }
}

event SetVisibility(bool bIsVisible)
{
    super(GUIComponent).SetVisibility(bIsVisible);
    // End:0x2c
    if(ProgresBar != none)
    {
        ProgresBar.SetVisibility(bIsVisible);
    }
}

defaultproperties
{
    bClientBound=true
    StyleName="LadderButton"
    WinWidth=0.0902340
    WinHeight=0.1136720
}