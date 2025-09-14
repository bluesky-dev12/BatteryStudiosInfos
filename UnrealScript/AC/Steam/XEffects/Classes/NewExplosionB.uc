/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\NewExplosionB.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class NewExplosionB extends Emitter;

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
    // End:0xa5
    if(dist > float(4000))
    {
        LightType = 0;
        bDynamicLight = false;
        // End:0xa2
        if(dist > float(7000))
        {
            Emitters[1].Disabled = true;
        }
    }
    // End:0xc2
    else
    {
        // End:0xc2
        if(Level.bDropDetail)
        {
            LightRadius = 7.0;
        }
    }
}

defaultproperties
{
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0
    LightRadius=9.0
    LightPeriod=32
    LightCone=128
    bNoDelete=true
    bDynamicLight=true
}