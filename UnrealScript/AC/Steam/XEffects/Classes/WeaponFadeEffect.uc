/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\WeaponFadeEffect.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
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
            MeshEmitter(Emitters[1]).SizeScale[0].RelativeSize = 1.020 * Owner.DrawScale;
            MeshEmitter(Emitters[1]).SizeScale[1].RelativeSize = 1.20 * Owner.DrawScale;
            // End:0x186
            if(Owner.IsA('LinkGunPickup') || Owner.IsA('ONSAVRiLPickup'))
            {
                Emitters[1].Disabled = true;
            }
        }
    }
}

defaultproperties
{
    AutoDestroy=true
    bNoDelete=true
}