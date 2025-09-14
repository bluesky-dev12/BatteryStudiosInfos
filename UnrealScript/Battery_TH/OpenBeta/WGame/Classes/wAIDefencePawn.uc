class wAIDefencePawn extends wAIPawn;

event int GetAllowableVisitWeight()
{
    // End:0x13
    if(Rand(2) == 1)
    {
        return 1000;        
    }
    else
    {
        return 0;
    }
    //return;    
}

function PlayDyingAnimation(Class<DamageType> DamageType, Vector HitLoc)
{
    local PlayerController PC;

    // End:0x0D
    if(Mesh == none)
    {
        return;
    }
    // End:0x46
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x46
        if(Level.GetIsNoGore() == false)
        {
            MakeGorePawn(iDiedCollisionPart);
        }
    }
    Velocity += TearOffMomentum;
    BaseEyeHeight = default.BaseEyeHeight;
    // End:0xBF
    if(OldController != none)
    {
        PC = PlayerController(OldController);
        // End:0xBC
        if(((PC == none) || PC.ViewTarget != self) || Viewport(PC.Player) == none)
        {
            SetTwistLook(0, 0);
        }        
    }
    else
    {
        SetTwistLook(0, 0);
    }
    SetInvisibility(0.0000000);
    PlayDirectionalDeath(HitLoc);
    // End:0xF2
    if(int(Physics) != int(14))
    {
        SetPhysics(2);
    }
    //return;    
}

defaultproperties
{
    sndScream=none
    sndDie=none
    bDoTorsoTwist=false
    CollisionRadius=65.0000000
    CollisionHeight=60.0000000
    RotationRate=(Pitch=4096,Yaw=4000,Roll=3072)
}