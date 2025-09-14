class NewExplosionB extends Emitter;

simulated function PostBeginPlay()
{
    local PlayerController PC;
    local float dist;

    PC = Level.GetLocalPlayerController();
    // End:0x37
    if(PC.ViewTarget == none)
    {
        dist = 10000.0000000;        
    }
    else
    {
        dist = VSize(PC.ViewTarget.Location - Location);
    }
    // End:0xA5
    if(dist > float(4000))
    {
        LightType = 0;
        bDynamicLight = false;
        // End:0xA2
        if(dist > float(7000))
        {
            Emitters[1].Disabled = true;
        }        
    }
    else
    {
        // End:0xC2
        if(Level.bDropDetail)
        {
            LightRadius = 7.0000000;
        }
    }
    //return;    
}

defaultproperties
{
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0000000
    LightRadius=9.0000000
    LightPeriod=32
    LightCone=128
    bNoDelete=false
    bDynamicLight=true
}