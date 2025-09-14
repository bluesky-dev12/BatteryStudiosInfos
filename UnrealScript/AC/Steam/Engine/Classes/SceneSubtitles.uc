/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SceneSubtitles.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class SceneSubtitles extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    placeable;

enum ESST_Mode
{
    ESST_SkipToNextLine
};

var() localized array<localized string> SubTitles;
var int CurrentIndex;

// Export USceneSubtitles::execProcessEvent(FFrame&, void* const)
native final function ProcessEvent(SceneSubtitles.ESST_Mode Mode);
function string GetSubTitles()
{
    // End:0x1b
    if(CurrentIndex >= SubTitles.Length)
    {
        CurrentIndex = -1;
    }
    // End:0x32
    if(CurrentIndex >= 0)
    {
        return SubTitles[CurrentIndex];
    }
    return "";
}

event Reset()
{
    super(Actor).Reset();
    CurrentIndex = -1;
}

defaultproperties
{
    CurrentIndex=-1
    bStatic=true
    bNoDelete=true
}