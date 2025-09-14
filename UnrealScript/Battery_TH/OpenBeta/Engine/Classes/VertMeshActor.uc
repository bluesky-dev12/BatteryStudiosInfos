class VertMeshActor extends Actor
    native
    placeable;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    LoopAnim('None', 1.0000000, 0.1000000);
    //return;    
}

defaultproperties
{
    DrawType=2
    bUseDynamicLights=true
    bNoDelete=true
    bWorldGeometry=true
    bAcceptsProjectors=false
    RemoteRole=0
    bShadowCast=true
    bStaticLighting=true
    bMovable=false
    CollisionRadius=1.0000000
    CollisionHeight=1.0000000
    bBlockZeroExtentTraces=false
    bBlockNonZeroExtentTraces=false
    bEdShouldSnap=true
}