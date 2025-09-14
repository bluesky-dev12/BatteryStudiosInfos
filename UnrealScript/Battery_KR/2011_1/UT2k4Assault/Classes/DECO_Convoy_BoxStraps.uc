class DECO_Convoy_BoxStraps extends Decoration;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    LoopAnim('Wind', 1.0000000, 0.1000000);
    //return;    
}

defaultproperties
{
    bStatic=false
    bNoDelete=true
    RemoteRole=0
    Mesh=VertMesh'UT2k4Assault_Decompressed.Convoy_BoxStraps'
    AmbientGlow=48
    bMovable=false
    bCanBeDamaged=false
    bShouldBaseAtStartup=false
    bEdShouldSnap=true
}