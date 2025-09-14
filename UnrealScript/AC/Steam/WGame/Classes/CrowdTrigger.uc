/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\CrowdTrigger.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class CrowdTrigger extends Triggers;

struct AnimParams
{
    var() name SeqName;
    var() float Rate;
    var() float TweenTime;
    var() float OffsetClamp;
};

var(Crowd) export editinline array<export editinline AnimParams> Anims;
var(Crowd) export float MaxDelay;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local int i, Max;
    local Intro_Crowd C;

    Max = Anims.Length;
    // End:0x93
    if(Max > 0)
    {
        // End:0x92
        foreach AllActors(class'Intro_Crowd', C, Event)
        {
            i = Rand(Max);
            C.MultiSetup(FRand() * MaxDelay, Anims[i].SeqName, Anims[i].Rate, Anims[i].TweenTime, Anims[i].OffsetClamp);                        
        }
    }
}

defaultproperties
{
    bCollideActors=true
}