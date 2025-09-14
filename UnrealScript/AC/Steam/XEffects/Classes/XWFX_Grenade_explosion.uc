/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\XWFX_Grenade_explosion.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class XWFX_Grenade_explosion extends Emitter;

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
    LightHue=30
    LightSaturation=150
    LightBrightness=1000.0
    LightRadius=20.0
    LightPeriod=3
    LightCone=128
    bNoDelete=true
    bDynamicLight=true
    bAlwaysRelevant=true
}