class ShootTarget extends LookTarget;

var(ShootTargetSounds) Sound OnTargetSound;
var bool bEnabled;
var bool bTriggered;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0xBC
    if(Damage >= 0)
    {
        // End:0x5B
        if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Focus == self)
        {
            instigatedBy.Controller.StopFiring();
        }
        self.Trigger(self, instigatedBy);
        // End:0xBC
        if((AIController(instigatedBy.Controller) != none) && instigatedBy.Controller.Target == self)
        {
            instigatedBy.Controller.StopFiring();
        }
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x78
    if(Level.GetMatchMaker().BotTutorial)
    {
        // End:0x78
        if(!bTriggered)
        {
            PlaySound(OnTargetSound, 0, float(SoundVolume) / 255.0000000, false, SoundRadius, float(SoundPitch) / 64.0000000);
            TriggerEvent(Event, self, EventInstigator);
            bTriggered = true;
            SetCollision(false);
            bEnabled = false;
        }
    }
    //return;    
}

defaultproperties
{
    bNoDelete=false
    SoundVolume=228
}