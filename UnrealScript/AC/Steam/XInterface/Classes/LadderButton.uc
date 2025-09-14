/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\LadderButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class LadderButton extends GUIGFXButton
    editinlinenew
    instanced;

var MatchInfo MatchInfo;
var int MatchIndex;
var int LadderIndex;

function SetState(int rung)
{
    local string NewStyleName;

    // End:0x0d
    if(MatchInfo == none)
    {
        return;
    }
    // End:0x7d
    if(rung < MatchIndex)
    {
        Graphic = Material(DynamicLoadObject("SinglePlayerThumbs." $ MatchInfo.LevelName $ "_G", class'Material', true));
        MenuState = 4;
        NewStyleName = "LadderButton";
    }
    // End:0xfd
    else
    {
        Graphic = Material(DynamicLoadObject("SinglePlayerThumbs." $ MatchInfo.LevelName, class'Material', true));
        MenuState = 0;
        // End:0xe7
        if(rung == MatchIndex)
        {
            NewStyleName = "LadderButton";
        }
        // End:0xfd
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
}

defaultproperties
{
    Position=2
    bClientBound=true
    StyleName="LadderButton"
}