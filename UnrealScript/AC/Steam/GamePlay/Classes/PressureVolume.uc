/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\PressureVolume.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:4
 *
 *******************************************************************************/
class PressureVolume extends PhysicsVolume;

var() float KillTime;
var() float StartFlashScale;
var() Vector StartFlashFog;
var() float EndFlashScale;
var() Vector EndFlashFog;
var float DieFOV;
var float DieDrawScale;
var float TimePassed;
var bool bTriggered;
var bool bScreamed;

function Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller P;

    Instigator = EventInstigator;
    // End:0x105
    if(Instigator.Controller != none && Instigator.Controller.IsA('Bot'))
    {
        P = Level.ControllerList;
        J0x52:
        // End:0x105 [While If]
        if(P != none)
        {
            // End:0xee
            if(P.Pawn != none && P.Pawn.PhysicsVolume == self && P.Pawn.Health > 0)
            {
                Instigator.Controller.Target = P.Pawn;
                Instigator.Controller.GotoState('VictoryDance');
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x52;
        }
    }
    TimePassed = 0.0;
    bTriggered = true;
    bScreamed = false;
    Disable('Trigger');
    Enable('Tick');
}

function Tick(float DeltaTime)
{
    local float ratio, curScale;
    local Vector curFog;
    local PlayerController PC;
    local Controller P, Killer;
    local bool bActive;

    // End:0x14
    if(!bTriggered)
    {
        Disable('Tick');
        return;
    }
    TimePassed += DeltaTime;
    ratio = TimePassed / KillTime;
    // End:0x4c
    if(ratio > 1.0)
    {
        ratio = 1.0;
    }
    P = Level.ControllerList;
    J0x60:
    // End:0x2ae [While If]
    if(P != none)
    {
        // End:0x297
        if(P.Pawn.PhysicsVolume == self && P.Pawn.Health > 0 && !P.Pawn.IsA('Spectator'))
        {
            bActive = true;
            P.Pawn.SetDrawScale(1.0 + DieDrawScale - float(1) * ratio);
            // End:0x164
            if(!bScreamed && P.bIsPlayer && ratio > 0.20 && FRand() < float(2) * DeltaTime)
            {
                bScreamed = true;
                P.Pawn.PlayDyingSound();
            }
            PC = PlayerController(P);
            // End:0x21c
            if(PC != none)
            {
                curScale = EndFlashScale - StartFlashScale * ratio + StartFlashScale;
                curFog = EndFlashFog - StartFlashFog * ratio + StartFlashFog;
                PC.ClientFlash(curScale, float(1000) * curFog);
                PC.SetFOVAngle(DieFOV - PC.default.FovAngle * ratio + PC.default.FovAngle);
            }
            // End:0x297
            if(ratio == 1.0)
            {
                // End:0x24a
                if(Instigator != none)
                {
                    Killer = Instigator.Controller;
                }
                P.Pawn.Died(Killer, class'Depressurized', P.Pawn.Location);
                MakeNormal(P.Pawn);
            }
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x60;
    }
    // End:0x2e0
    if(!bActive && TimePassed >= KillTime)
    {
        Disable('Tick');
        Enable('Trigger');
        bTriggered = false;
    }
}

function MakeNormal(Pawn P)
{
    local PlayerController PC;

    P.SetDrawScale(P.default.DrawScale);
    PC = PlayerController(P.Controller);
    // End:0x5e
    if(PC != none)
    {
        PC.SetFOVAngle(PC.default.FovAngle);
    }
}

event PawnLeavingVolume(Pawn Other)
{
    MakeNormal(Other);
    super.PawnLeavingVolume(Other);
}

defaultproperties
{
    DieFOV=150.0
    DamageType=class'Depressurized'
}