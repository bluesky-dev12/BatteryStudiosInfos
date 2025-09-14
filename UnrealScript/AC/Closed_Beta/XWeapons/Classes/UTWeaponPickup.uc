class UTWeaponPickup extends WeaponPickup;

var(WeaponPickup) Vector StandUp;
var(WeaponPickup) float LockerOffset;

simulated event ClientTrigger()
{
    bHidden = true;
    // End:0x4A
    if((EffectIsRelevant(Location, false)) && !Level.GetLocalPlayerController().BeyondViewDistance(Location, CullDistance))
    {
        Spawn(Class'XEffects.WeaponFadeEffect', self);
    }
    //return;    
}

function RespawnEffect()
{
    Spawn(Class'XEffects.PlayerSpawnEffect');
    //return;    
}

state FadeOut
{
    function Tick(float DeltaTime)
    {
        Disable('Tick');
        //return;        
    }

    function BeginState()
    {
        bHidden = true;
        LifeSpan = 1.0000000;
        bClientTrigger = !bClientTrigger;
        // End:0x41
        if(int(Level.NetMode) != int(NM_DedicatedServer))
        {
            ClientTrigger();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    StandUp=(X=0.0000000,Y=0.0000000,Z=0.7500000)
    LockerOffset=35.0000000
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}