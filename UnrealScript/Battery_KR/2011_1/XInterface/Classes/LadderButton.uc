class LadderButton extends GUIGFXButton
    editinlinenew
    instanced;

var MatchInfo MatchInfo;
var int MatchIndex;
var int LadderIndex;

function SetState(int rung)
{
    local string NewStyleName;

    // End:0x0D
    if(MatchInfo == none)
    {
        return;
    }
    // End:0x7D
    if(rung < MatchIndex)
    {
        Graphic = Material(DynamicLoadObject(("SinglePlayerThumbs." $ MatchInfo.LevelName) $ "_G", Class'Engine.Material', true));
        MenuState = 4;
        NewStyleName = "LadderButton";        
    }
    else
    {
        Graphic = Material(DynamicLoadObject("SinglePlayerThumbs." $ MatchInfo.LevelName, Class'Engine.Material', true));
        MenuState = 0;
        // End:0xE7
        if(rung == MatchIndex)
        {
            NewStyleName = "LadderButton";            
        }
        else
        {
            NewStyleName = "LadderButtonHi";
        }
    }
    // End:0x157
    if(!NewStyleName ~= StyleName)
    {
        StyleName = NewStyleName;
        Style = Controller.GetStyle(StyleName, FontScale);
        // End:0x157
        if(Style == none)
        {
            Log("NewStyle IS None");
        }
    }
    //return;    
}

defaultproperties
{
    Position=2
    bClientBound=true
    StyleName="LadderButton"
}