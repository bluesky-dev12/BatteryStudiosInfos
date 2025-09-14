class SceneSubtitles extends Info
    native
    placeable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ESST_Mode
{
    ESST_SkipToNextLine             // 0
};

var() localized array<localized string> SubTitles;
var int CurrentIndex;

// Export USceneSubtitles::execProcessEvent(FFrame&, void* const)
native final function ProcessEvent(SceneSubtitles.ESST_Mode Mode)
{
    //native.Mode;        
}

function string GetSubTitles()
{
    // End:0x1B
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
    //return;    
}

event Reset()
{
    super(Actor).Reset();
    CurrentIndex = -1;
    //return;    
}

defaultproperties
{
    CurrentIndex=-1
    bStatic=true
    bNoDelete=true
}