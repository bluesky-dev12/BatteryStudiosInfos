/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Intro_Crowd.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
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
    // End:0x4b
    else
    {
        Timer();
    }
}

event Timer()
{
    LoopAnim(nextSeq, nextRate, nextTween);
    // End:0x2e
    if(nextOffset > float(0))
    {
        SetAnimFrame(FRand() * nextOffset);
    }
}

defaultproperties
{
    MeshNameString="intro_crowd.crowd_d1_a"
}