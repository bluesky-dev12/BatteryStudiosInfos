class wWeapon_SentryGun extends wGun;

function PostBeginPlay()
{
    local Emitter Emitter;

    super(Actor).PostBeginPlay();
    Emitter = Spawn(Class'XEffects.Sentry_Gun_Beam', self);
    AttachToBone(Emitter, 'Bone_Laser');
    //return;    
}

simulated function Destroyed()
{
    local Emitter Emitter;

    super.Destroyed();
    Emitter = Spawn(Class'XEffects.SentryGun_Destroy_Explo', self);
    AttachToBone(Emitter, 'Bone_CaseEjector01');
    //return;    
}

defaultproperties
{
    szWeaponAttachmentName="WWeapons.wSentryGunAttachment"
}