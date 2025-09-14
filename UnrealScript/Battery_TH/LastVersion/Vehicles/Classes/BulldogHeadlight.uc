class BulldogHeadlight extends DynamicProjector;

function Tick(float Delta)
{
    //return;    
}

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
    DrawScale=0.6500000
    bHardAttach=true
}