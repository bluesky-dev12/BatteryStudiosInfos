/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ShootTarget.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class ShootTarget extends LookTarget;

var(ShootTargetSounds) Sound OnTargetSound;
var bool bEnabled;
var bool bTriggered;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0xbc
    if(Damage >= 0)
    {
        // End:0x5b
        if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Focus == self)
        {
            instigatedBy.Controller.StopFiring();
        }
        self.Trigger(self, instigatedBy);
        // End:0xbc
        if(AIController(instigatedBy.Controller) != none && instigatedBy.Controller.Target == self)
        {
            instigatedBy.Controller.StopFiring();
        }
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x78
    if(Level.GetMatchMaker().BotTutorial)
    {
        // End:0x78
        if(!bTriggered)
        {
            PlaySound(OnTargetSound, 0, float(SoundVolume) / 255.0, false, SoundRadius, float(SoundPitch) / 64.0);
            TriggerEvent(Event, self, EventInstigator);
            bTriggered = true;
            SetCollision(false);
            bEnabled = false;
        }
    }
}

defaultproperties
{
    bNoDelete=true
    SoundVolume=228
}