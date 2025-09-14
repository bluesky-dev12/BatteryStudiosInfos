class wSentryGunAttachment extends wGunAttachment;

var Vector v3TracerLocation;
var Emitter m_BeamEmitter;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        v3TracerLocation;
}

simulated event wLoadOut(int iID, int iAddPartsID)
{
    super.wLoadOut(iID, iAddPartsID);
    m_BeamEmitter = Spawn(Class'XEffects.Sentry_Gun_Beam', self);
    AttachToBone(m_BeamEmitter, 'Bone_Laser');
    //return;    
}

simulated event Destroyed()
{
    // End:0x29
    if(none != m_BeamEmitter)
    {
        DetachFromBone(m_BeamEmitter);
        m_BeamEmitter.Destroy();
        m_BeamEmitter = none;
    }
    super.Destroyed();
    //return;    
}

simulated function Vector GetTracerStart()
{
    local Vector v3Result;

    // End:0x12
    if(none != Owner)
    {
        return super.GetTracerStart();
    }
    return v3TracerLocation;
    //return;    
}

simulated function MakeMuzzleFlash()
{
    super.MakeMuzzleFlash();
    v3TracerLocation = mMuzFlash3rd.Location;
    //return;    
}

defaultproperties
{
    AttachmentBone="Bone_SentryG01_Weapon"
}