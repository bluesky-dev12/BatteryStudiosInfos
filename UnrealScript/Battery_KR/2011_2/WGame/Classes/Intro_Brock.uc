class Intro_Brock extends wIntroPawn;

simulated function UpdatePrecacheMaterials()
{
    super(Actor).UpdatePrecacheMaterials();
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    //return;    
}

defaultproperties
{
    MeshNameString="intro_brock.Brock"
}