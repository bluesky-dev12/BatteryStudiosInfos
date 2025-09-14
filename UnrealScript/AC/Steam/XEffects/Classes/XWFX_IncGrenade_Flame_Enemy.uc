/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\XWFX_IncGrenade_Flame_Enemy.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class XWFX_IncGrenade_Flame_Enemy extends Emitter;

simulated function PostBeginPlay()
{
    local PlayerController PC;
    local float dist;

    PC = Level.GetLocalPlayerController();
    // End:0x37
    if(PC.ViewTarget == none)
    {
        dist = 10000.0;
    }
    // End:0x5d
    else
    {
        dist = VSize(PC.ViewTarget.Location - Location);
    }
    // End:0xa6
    if(dist > float(4000))
    {
        LightType = 0;
        bDynamicLight = false;
        // End:0xa3
        if(dist > float(7000))
        {
            Emitters[4].Disabled = true;
        }
    }
    // End:0xc3
    else
    {
        // End:0xc3
        if(Level.bDropDetail)
        {
            LightRadius = 0.0;
        }
    }
}

simulated event Tick(float DeltaTime)
{
    local int i;

    CheckLifeSpanReplicated();
    // End:0x83
    if(LifeSpan != 0.0 && fFadeOutTime != 0.0)
    {
        // End:0x83
        if(LifeSpan <= fFadeOutTime && bChecked == false)
        {
            i = 0;
            J0x4a:
            // End:0x7b [While If]
            if(i < Emitters.Length)
            {
                Emitters[i].RespawnDeadParticles = false;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x4a;
            }
            bChecked = true;
        }
    }
}

defaultproperties
{
    Emitters=// Object reference not set to an instance of an object.
    
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=30
    LightSaturation=150
    LightBrightness=400.0
    LightRadius=16.0
    LightPeriod=3
    LightCone=128
    bNoDelete=true
    bDynamicLight=true
    bAlwaysRelevant=true
    LifeSpan=1.0
}