class GibSentryBody extends Gib
    notplaceable;

function PostBeginPlay()
{
    bCollideWorld = true;
    //return;    
}

simulated function SetTeam(string strSTMeshName)
{
    local StaticMesh NewMesh;

    NewMesh = StaticMesh(DynamicLoadObject("Char_SentryGun_Gore_Static.SentryG01.SentryG01_GoreBody_St", Class'Engine.StaticMesh'));
    SetStaticMesh(NewMesh);
    //return;    
}

defaultproperties
{
    TrailClass=Class'XEffects_Decompressed.BloodJet'
    DampenFactor=0.5000000
    HitSounds=""
    GibBloodClass=none
    DrawType=8
    CollisionRadius=10.0000000
    CollisionHeight=10.0000000
    bCollideWorld=false
    Mass=3000.0000000
}