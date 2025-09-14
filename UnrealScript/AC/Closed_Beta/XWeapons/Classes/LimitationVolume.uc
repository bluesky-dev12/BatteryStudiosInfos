class LimitationVolume extends Volume;

var(Limits) bool bLimitTransDisc;
var(Limits) bool bLimitProjectiles;
var(Limits) Class<Actor> LimitEffectClass;

event Touch(Actor Other)
{
    // End:0x6E
    if(bLimitProjectiles && wProjectile(Other) != none)
    {
        // End:0x4C
        if(LimitEffectClass != none)
        {
            Spawn(LimitEffectClass,,, Other.Location, Other.Rotation);
        }
        wProjectile(Other).bNoFX = true;
        Other.Destroy();
    }
    //return;    
}
