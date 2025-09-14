class Intro_Crowd extends wIntroPawn;

var(Crowd) export editinline array<export editinline Mesh> AvailableMeshes;
var name nextSeq;
var float nextRate;
var float nextTween;
var float nextOffset;

event PostBeginPlay()
{
    // End:0x21
    if(AvailableMeshes.Length > 0)
    {
        LinkMesh(AvailableMeshes[Rand(AvailableMeshes.Length)], false);
    }
    super.PostBeginPlay();
    //return;    
}

function MultiSetup(float Delay, name AnimSeq, float AnimRate, float AnimTween, float AnimOffsetClamp)
{
    nextSeq = AnimSeq;
    nextRate = AnimRate;
    nextTween = AnimTween;
    nextOffset = AnimOffsetClamp;
    // End:0x45
    if(Delay > float(0))
    {
        SetTimer(Delay, false);        
    }
    else
    {
        Timer();
    }
    //return;    
}

event Timer()
{
    LoopAnim(nextSeq, nextRate, nextTween);
    // End:0x2E
    if(nextOffset > float(0))
    {
        SetAnimFrame(FRand() * nextOffset);
    }
    //return;    
}

defaultproperties
{
    MeshNameString="intro_crowd.crowd_d1_a"
}