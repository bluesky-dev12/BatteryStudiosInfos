/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\WildcardBase.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class WildcardBase extends wPickUpBase;

var() class<TournamentPickUp> PickupClasses[8];
var() bool bSequential;
var int NumClasses;
var int CurrentClass;

simulated function PostBeginPlay()
{
    local int i;

    // End:0x71
    if(Role == 4)
    {
        NumClasses = 0;
        J0x17:
        // End:0x40 [While If]
        if(NumClasses < 8 && PickupClasses[NumClasses] != none)
        {
            ++ NumClasses;
            // This is an implied JumpToken; Continue!
            goto J0x17;
        }
        // End:0x53
        if(bSequential)
        {
            CurrentClass = 0;
        }
        // End:0x60
        else
        {
            CurrentClass = Rand(NumClasses);
        }
        PowerUp = PickupClasses[CurrentClass];
    }
    // End:0xc4
    if(Level.NetMode != 1)
    {
        i = 0;
        J0x91:
        // End:0xc4 [While If]
        if(i < NumClasses)
        {
            PickupClasses[i].static.StaticPrecache(Level);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x91;
        }
    }
    super.PostBeginPlay();
    SetLocation(Location + vect(0.0, 0.0, -1.0));
}

function TurnOn()
{
    // End:0x27
    if(bSequential)
    {
        CurrentClass = int(float(CurrentClass + 1) % float(NumClasses));
    }
    // End:0x34
    else
    {
        CurrentClass = Rand(NumClasses);
    }
    PowerUp = PickupClasses[CurrentClass];
    // End:0x6a
    if(myPickUp != none)
    {
        myPickUp = myPickUp.Transmogrify(PowerUp);
    }
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
    DrawScale=0.80
    CollisionRadius=60.0
    CollisionHeight=6.0
}