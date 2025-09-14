class Shark extends Decoration;

simulated function PostBeginPlay()
{
    LoopAnim('Path');
    super(Actor).PostBeginPlay();
    //return;    
}

defaultproperties
{
    bStatic=false
    bNoDelete=true
    Mesh=SkeletalMesh'XEffects_Decompressed.SharkMesh'
    // Reference: FinalBlend'XEffects_Decompressed.Shark.SharkFB'
    begin object name="SharkFB" class=Engine.FinalBlend
        FrameBufferBlending=2
        AlphaRef=80
    end object
    Skins[0]=SharkFB
    bShouldBaseAtStartup=false
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}