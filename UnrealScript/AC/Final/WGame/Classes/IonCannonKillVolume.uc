class IonCannonKillVolume extends PhysicsVolume;

var() Class<Pawn> TargetClass;
var() bool bAffectsFlyingPawns;
var() int CountdownTime;
var array<Pawn> Targets;
var int TimeRemaining;

event bool PawnEnteredVolume(Pawn Other)
{
    // End:0x13
    if(false == super.PawnEnteredVolume(Other))
    {
        return false;
    }
    // End:0xFC
    if((((Other != none) && Other.Controller != none) && ClassIsChildOf(Other.Class, TargetClass)) && !Other.bCanFly || bAffectsFlyingPawns)
    {
        Targets[Targets.Length] = Other;
        // End:0xAA
        if(PainTimer == none)
        {
            TimeRemaining = CountdownTime;
            PainTimer = Spawn(Class'Engine.VolumeTimer', self);            
        }
        else
        {
            TimeRemaining = Min(CountdownTime, Max(3, TimeRemaining));
        }
        // End:0xFC
        if(PlayerController(Other.Controller) != none)
        {
            PlayerController(Other.Controller).ReceiveLocalizedMessage(MessageClass, 0);
        }
    }
    return true;
    //return;    
}

event PawnLeavingVolume(Pawn Other)
{
    super.PawnLeavingVolume(Other);
    RemoveTarget(Other);
    //return;    
}

function RemoveTarget(Pawn Other)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5C [Loop If]
    if(i < Targets.Length)
    {
        // End:0x52
        if((Targets[i] == none) || Targets[i] == Other)
        {
            Targets.Remove(i, 1);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x81
    if((Targets.Length == 0) && PainTimer != none)
    {
        PainTimer.Destroy();
    }
    //return;    
}

function TimerPop(VolumeTimer t)
{
    local Actor A;
    local Pawn P;
    local bool bFound;

    // End:0x11
    if(t != PainTimer)
    {
        return;
    }
    // End:0x142
    foreach TouchingActors(TargetClass, A)
    {
        P = Pawn(A);
        // End:0x75
        if((P.Controller == none) || P.bCanFly && !bAffectsFlyingPawns)
        {
            RemoveTarget(P);
            continue;            
        }
        // End:0xE9
        if(TimeRemaining > 1)
        {
            // End:0xE6
            if(PlayerController(P.Controller) != none)
            {
                PlayerController(P.Controller).ReceiveLocalizedMessage(MessageClass, 0);
                PlayerController(P.Controller).ReceiveLocalizedMessage(MessageClass, TimeRemaining - 1);
            }            
        }
        else
        {
            // End:0x10B
            if(TimeRemaining == 1)
            {
                SpawnEffects(P.Location);                
            }
            else
            {
                // End:0x139
                if(TimeRemaining < 1)
                {
                    P.Died(none, Class'WGame_Decompressed.DamTypeIonVolume', P.Location);
                }
            }
        }
        bFound = true;        
    }    
    // End:0x160
    if(bFound || TimeRemaining <= 1)
    {
        TimeRemaining--;
    }
    //return;    
}

function SpawnEffects(Vector EffectLoc)
{
    //return;    
}

function PlayGlobalSound(Sound S)
{
    local Controller C;

    //return;    
}

defaultproperties
{
    TargetClass=Class'Engine.Pawn'
    CountdownTime=10
    TransientSoundVolume=1.0000000
    TransientSoundRadius=2000.0000000
    MessageClass=Class'WGame_Decompressed.IonCannonKillWarning'
}