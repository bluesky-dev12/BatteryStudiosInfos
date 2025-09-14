class UDamageReward extends UDamagePack;

var() float FadeTime;

function InitDrop(float RemainingCharge)
{
    FadeTime = RemainingCharge + Level.TimeSeconds;
    SetPhysics(2);
    GotoState('FallingPickup');
    bAlwaysRelevant = false;
    bDropped = true;
    bIgnoreEncroachers = false;
    bIgnoreVehicles = true;
    MaxDesireability *= (RemainingCharge / float(30));
    NetUpdateFrequency = RemainingCharge;
    bUpdateSimulatedPosition = true;
    bOnlyReplicateHidden = false;
    LifeSpan = RemainingCharge * float(2);
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x1F
        if(ValidTouch(Other))
        {
            AnnouncePickup(P);
            SetRespawn();
        }
        //return;        
    }

    function BeginState()
    {
        // End:0x22
        if(bDropped)
        {
            SetTimer(FadeTime - Level.TimeSeconds, false);
        }
        //return;        
    }
    stop;    
}

state FallingPickup
{
    function BeginState()
    {
        SetTimer(FadeTime - Level.TimeSeconds, false);
        //return;        
    }
    stop;    
}

defaultproperties
{
    RespawnTime=0.0000000
}