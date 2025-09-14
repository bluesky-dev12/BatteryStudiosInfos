class FinalEffect extends PostProcessEffect
    native
    noexport;

struct native ColorPreset
{
    var Plane preBase;
    var Plane preBalance;
    var Plane preHighlight;
    var float preFinalAdd;
    var string preName;
};

struct native LevelColorPreset
{
    var Plane preBase;
    var Plane preBalance;
    var Plane preHighlight;
    var float preFinalAdd;
};

var Texture NoiseMap;
var const transient pointer FinalTarget;
var Plane CurrentBase;
var Plane CurrentBalance;
var Plane CurrentHighlight;
var float CurrentFinalAdd;
var byte PrevIndex;
var byte CurrentIndex;
var(a_Base) Plane Base;
var(b_Balance) Plane Balance;
var(c_Highlight) Plane Highlight;
var(d_FinalAdd) float FinalAdd;
var(e_Level) byte bySet;
var(e_Level) editconst string strMapName;
var array<ColorPreset> aPresets;
var array<LevelColorPreset> LevelPresets;
var bool bFadeEnd;
var bool bToBlackWhite;
var float fFadeTime;

event InitPresets()
{
    InitNewPresets();
    //return;    
}

function InitNewPresets()
{
    local ColorPreset tmPreset;
    local bool bEnd;

    bEnd = false;
    J0x08:

    // End:0xB8 [Loop If]
    if(bEnd == false)
    {
        switch(aPresets.Length)
        {
            // End:0x76
            case 0:
                tmPreset.preBase = default.Base;
                tmPreset.preBalance = default.Balance;
                tmPreset.preHighlight = default.Highlight;
                tmPreset.preFinalAdd = default.FinalAdd;
                tmPreset.preName = "Custom";
                // End:0x84
                break;
            // End:0xFFFF
            default:
                bEnd = true;
                // End:0x84
                break;
                break;
        }
        // End:0xB5
        if(bEnd == false)
        {
            aPresets.Length = aPresets.Length + 1;
            aPresets[aPresets.Length - 1] = tmPreset;
        }
        // [Loop Continue]
        goto J0x08;
    }
    //return;    
}

function FadeToBlackWhite(float inFadeTime)
{
    bFadeEnd = false;
    bToBlackWhite = true;
    fFadeTime = inFadeTime;
    //return;    
}

function FadeToColor(float inFadeTime)
{
    bFadeEnd = false;
    bToBlackWhite = false;
    fFadeTime = inFadeTime;
    //return;    
}

defaultproperties
{
    CurrentBase=(W=1.0000000,X=1.5000000,Y=1.5000000,Z=1.5000000)
    CurrentFinalAdd=-0.1500000
    Base=(W=0.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    strMapName="Default"
    bFadeEnd=true
    bToBlackWhite=true
    fFadeTime=7.0000000
    PriorityEffect=1
}