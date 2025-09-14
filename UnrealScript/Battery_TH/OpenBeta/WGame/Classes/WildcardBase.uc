class WildcardBase extends wPickUpBase;

var() Class<TournamentPickUp> PickupClasses[8];
var() bool bSequential;
var int NumClasses;
var int CurrentClass;

simulated function PostBeginPlay()
{
    local int i;

    // End:0x71
    if(int(Role) == int(ROLE_Authority))
    {
        NumClasses = 0;
        J0x17:

        // End:0x40 [Loop If]
        if((NumClasses < 8) && PickupClasses[NumClasses] != none)
        {
            NumClasses++;
            // [Loop Continue]
            goto J0x17;
        }
        // End:0x53
        if(bSequential)
        {
            CurrentClass = 0;            
        }
        else
        {
            CurrentClass = Rand(NumClasses);
        }
        PowerUp = PickupClasses[CurrentClass];
    }
    // End:0xC4
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        i = 0;
        J0x91:

        // End:0xC4 [Loop If]
        if(i < NumClasses)
        {
            PickupClasses[i].static.StaticPrecache(Level);
            i++;
            // [Loop Continue]
            goto J0x91;
        }
    }
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0000000, 0.0000000, -1.0000000));
    //return;    
}

function TurnOn()
{
    // End:0x27
    if(bSequential)
    {
        CurrentClass = int(float(CurrentClass + 1) % float(NumClasses));        
    }
    else
    {
        CurrentClass = Rand(NumClasses);
    }
    PowerUp = PickupClasses[CurrentClass];
    // End:0x6A
    if(myPickUp != none)
    {
        myPickUp = myPickUp.Transmogrify(PowerUp);
    }
    //return;    
}

defaultproperties
{
    PickupClasses[0]=Class'XPickups.HealthPack'
    PickupClasses[1]=Class'XPickups.SuperShieldPack'
    PickupClasses[2]=Class'XPickups.SuperHealthPack'
    PickupClasses[3]=Class'XPickups.UDamagePack'
    SpiralEmitter=Class'XEffects.Spiral'
    bDelayedSpawn=true
    DrawType=8
    Texture=none
    DrawScale=0.8000000
    CollisionRadius=60.0000000
    CollisionHeight=6.0000000
}