class ShootTarget extends LookTarget;

var bool bEnabled;
var bool bTriggered;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
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
    // End:0x4C
    if(Level.GetMatchMaker().BotTutorial)
    {
        // End:0x4C
        if(!bTriggered)
        {
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
}