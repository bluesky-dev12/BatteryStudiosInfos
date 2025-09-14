/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\IonCannonKillVolume.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
class IonCannonKillVolume extends PhysicsVolume;

var() class<Pawn> TargetClass;
var() bool bAffectsFlyingPawns;
var() int CountdownTime;
var array<Pawn> Targets;
var int TimeRemaining;

event PawnEnteredVolume(Pawn Other)
{
    super.PawnEnteredVolume(Other);
    // End:0xf4
    if(Other != none && Other.Controller != none && ClassIsChildOf(Other.Class, TargetClass) && !Other.bCanFly || bAffectsFlyingPawns)
    {
        Targets[Targets.Length] = Other;
        // End:0xa2
        if(PainTimer == none)
        {
            TimeRemaining = CountdownTime;
            PainTimer = Spawn(class'VolumeTimer', self);
        }
        // End:0xb8
        else
        {
            TimeRemaining = Min(CountdownTime, Max(3, TimeRemaining));
        }
        // End:0xf4
        if(PlayerController(Other.Controller) != none)
        {
            PlayerController(Other.Controller).ReceiveLocalizedMessage(MessageClass, 0);
        }
    }
}

event PawnLeavingVolume(Pawn Other)
{
    super.PawnLeavingVolume(Other);
    RemoveTarget(Other);
}

function RemoveTarget(Pawn Other)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5c [While If]
    if(i < Targets.Length)
    {
        // End:0x52
        if(Targets[i] == none || Targets[i] == Other)
        {
            Targets.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x81
    if(Targets.Length == 0 && PainTimer != none)
    {
        PainTimer.Destroy();
    }
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
    // End:0x7284
    foreach TouchingActors(TargetClass, A)
    {
        P.Controller
        none
        )
        P.bCanFly && !bAffectsFlyingPawns;
        )
        RemoveTarget(P);        
        // This is an implied JumpToken;
        goto J0x142;
        // End:0xe9
        if(TimeRemaining > 1)
        {
            // End:0xe6
            if(PlayerController(P.Controller) != none)
            {
                PlayerController(P.Controller).ReceiveLocalizedMessage(MessageClass, 0);
                PlayerController(P.Controller).ReceiveLocalizedMessage(MessageClass, TimeRemaining - 1);
                // This is an implied JumpToken;
                goto J0x139;
                // End:0x10b
                if(TimeRemaining == 1)
                {
                }
            }
            SpawnEffects(P.Location);
            // This is an implied JumpToken;
            goto J0x139;
            // End:0x139
            if(TimeRemaining < 1)
            {
            }
            P.Died(none, class'DamTypeIonVolume', P.Location);
            bFound = true;
        }
        J0x139:                
    }
    // End:0x160
    if(bFound || TimeRemaining <= 1)
    {
        J0x142:
        -- TimeRemaining;
        return;
    }
}

function SpawnEffects(Vector EffectLoc);
function PlayGlobalSound(Sound S)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x5f [While If]
    if(C != none)
    {
        // End:0x48
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientPlaySound(S);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

defaultproperties
{
    TargetClass=Class'Engine.Pawn'
    CountdownTime=10
    TransientSoundVolume=1.0
    TransientSoundRadius=2000.0
    MessageClass=class'IonCannonKillWarning'
}