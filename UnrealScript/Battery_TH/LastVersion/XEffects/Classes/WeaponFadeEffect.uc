class WeaponFadeEffect extends Emitter;

simulated function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    // End:0x186
    if(Owner != none)
    {
        SetLocation(Owner.Location);
        SetRotation(Owner.Rotation);
        // End:0x186
        if(Owner.StaticMesh != none)
        {
            MeshEmitter(Emitters[0]).StaticMesh = Owner.StaticMesh;
            MeshEmitter(Emitters[1]).StaticMesh = Owner.StaticMesh;
            MeshEmitter(Emitters[0]).SizeScale[0].RelativeSize = Owner.DrawScale;
            MeshEmitter(Emitters[0]).SizeScale[1].RelativeSize = Owner.DrawScale;
            MeshEmitter(Emitters[1]).SizeScale[0].RelativeSize = 1.0200000 * Owner.DrawScale;
            MeshEmitter(Emitters[1]).SizeScale[1].RelativeSize = 1.2000000 * Owner.DrawScale;
            // End:0x186
            if(Owner.IsA('LinkGunPickup') || Owner.IsA('ONSAVRiLPickup'))
            {
                Emitters[1].Disabled = true;
            }
        }
    }
    //return;    
}

defaultproperties
{
    AutoDestroy=true
    bNoDelete=false
}