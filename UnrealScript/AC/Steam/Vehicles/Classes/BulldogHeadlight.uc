/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Vehicles\Classes\BulldogHeadlight.uc
 * Package Imports:
 *	Vehicles
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BulldogHeadlight extends DynamicProjector;

function Tick(float Delta);

defaultproperties
{
    FrameBufferBlendingOp=3
    FOV=30
    MaxTraceDistance=2048
    bClipBSP=true
    bProjectOnUnlit=true
    bGradient=true
    bProjectOnAlpha=true
    bProjectOnParallelBSP=true
    bLightChanged=true
    DrawScale=0.650
    bHardAttach=true
}