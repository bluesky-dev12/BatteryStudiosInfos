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
        foreach AllActors(Class'WGame_Decompressed.Intro_Crowd', C, Event)
        {
            i = Rand(Max);
            C.MultiSetup(FRand() * MaxDelay, Anims[i].SeqName, Anims[i].Rate, Anims[i].TweenTime, Anims[i].OffsetClamp);            
        }        
    }
    //return;    
}

defaultproperties
{
    bCollideActors=false
}