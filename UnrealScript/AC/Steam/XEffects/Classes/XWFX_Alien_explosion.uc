/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\XWFX_Alien_explosion.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class XWFX_Alien_explosion extends Emitter;

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

defaultproperties
{
    Emitters=// Object reference not set to an instance of an object.
    
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