/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FinalEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:19
 *	Functions:4
 *
 *******************************************************************************/
class FinalEffect extends PostProcessEffect
    dependson(PostProcessEffect)
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
}

function InitNewPresets()
{
    local ColorPreset tmPreset;
    local bool bEnd;

    bEnd = false;
    J0x08:
    // End:0xb8 [While If]
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
            // End:0xffff
            default:
                bEnd = true;
                // End:0x84 Break;
                break;
        }
        // End:0xb5
        if(bEnd == false)
        {
            aPresets.Length = aPresets.Length + 1;
            aPresets[aPresets.Length - 1] = tmPreset;
        }
        // This is an implied JumpToken; Continue!
        goto J0x08;
    }
}

function FadeToBlackWhite(float inFadeTime)
{
    bFadeEnd = false;
    bToBlackWhite = true;
    fFadeTime = inFadeTime;
}

function FadeToColor(float inFadeTime)
{
    bFadeEnd = false;
    bToBlackWhite = false;
    fFadeTime = inFadeTime;
}

defaultproperties
{
    CurrentBase=(X=0.0,Y=3368904000000000.0,Z=0.0,W=0.0)
    CurrentFinalAdd=-0.150
    Base=(X=0.0,Y=2251800000000000.0,Z=0.0,W=0.0)
    strMapName="Default"
    bFadeEnd=true
    bToBlackWhite=true
    fFadeTime=7.0
    PriorityEffect=1
}