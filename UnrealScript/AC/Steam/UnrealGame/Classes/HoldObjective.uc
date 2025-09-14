/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\HoldObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *	Functions:15
 *
 *******************************************************************************/
class HoldObjective extends ProximityObjective
    hidecategories(Lighting,LightColor,Karma,Force);

struct TouchingPlayer
{
    var Controller C;
    var float TouchTime;
};

var() name MoverTag;
var array<Mover> LinkedMover;
var array<TouchingPlayer> TouchingPlayers;
var Controller LastPlayerTouching;
var array<Actor> Touchers;
var float TotalHeldTime;
var bool bIsHeld;
var bool bIsTriggerControl;
var() bool bLocationFX;
var Emitter LocationFX;

replication
{
    // Pos:0x00
    reliable if(Role == 4 && bReplicateObjective && bNetDirty)
        bIsHeld;

}

simulated function PostBeginPlay()
{
    local Mover myMover;

    super(GameObjective).PostBeginPlay();
    // End:0x38
    if(MoverTag == 'None')
    {
        Warn(string(self) @ "MoverTag not defined!!!");
    }
    // End:0xf0
    else
    {
        // End:0xef
        foreach AllActors(class'Mover', myMover, MoverTag)
        {
            // End:0x6d
            if(myMover.InitialState == 'TriggerControl')
            {
                bIsTriggerControl = true;
            }
            LinkedMover[LinkedMover.Length] = myMover;
            // End:0xee
            if(myMover.Event == 'None')
            {
                Warn(string(myMover) @ "doesn't have it's Event set. It should trigger back the HoldObjective" @ string(self));
            }                        
        }
    }
}

function bool TellBotHowToDisable(Bot B)
{
    local Bot NextBot;

    // End:0xc2
    if(VSize(B.Pawn.Location - Location) < float(1000) && B.LineOfSightTo(self))
    {
        NextBot = B.Squad.SquadMembers;
        J0x5b:
        // End:0xc2 [While If]
        if(NextBot != none)
        {
            // End:0xab
            if(NextBot != B && NextBot.Pawn != none && NextBot.Pawn.ReachedDestination(self))
            {
                return false;
            }
            NextBot = NextBot.NextSquadMember;
            // This is an implied JumpToken; Continue!
            goto J0x5b;
        }
    }
    // End:0x14a
    if(B.Enemy != none && B.Skill > float(4) * FRand() && float(B.Pawn.Health) < float(250) * FRand() && B.Pawn.ReachedDestination(self))
    {
        B.bShieldSelf = true;
    }
    return super.TellBotHowToDisable(B);
}

event Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x40
    if(P != none && IsRelevant(P, true))
    {
        AddNewTouchingPlayer(P.Controller);
    }
}

event UnTouch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x40
    if(P != none && IsRelevant(P, true))
    {
        RemoveTouchingPlayer(P.Controller);
    }
}

function PlayerToucherDied(Pawn P)
{
    RemoveTouchingPlayer(P.GetKillerController());
}

function AddNewTouchingPlayer(Controller C)
{
    local int i;
    local TouchingPlayer TP;

    TP.C = C;
    TP.TouchTime = Level.TimeSeconds;
    TouchingPlayers[TouchingPlayers.Length] = TP;
    bIsHeld = true;
    CheckPlayCriticalAlarm();
    i = 0;
    J0x50:
    // End:0x8e [While If]
    if(i < LinkedMover.Length)
    {
        LinkedMover[i].Trigger(self, C.Pawn);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    // End:0xe9
    if(C != none)
    {
        i = 0;
        J0xa0:
        // End:0xe9 [While If]
        if(i < 4)
        {
            // End:0xdf
            if(C.GoalList[i] == self)
            {
                C.GoalList[i] = none;
            }
            // End:0xe9
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xa0;
            }
        }
    }
}

function RemoveTouchingPlayer(Controller C)
{
    local int i, j;
    local float HoldTime;

    i = 0;
    J0x07:
    // End:0x11b [While If]
    if(i < TouchingPlayers.Length)
    {
        // End:0x111
        if(TouchingPlayers[i].C == C)
        {
            HoldTime = Level.TimeSeconds - TouchingPlayers[i].TouchTime;
            // End:0x8d
            if(!bIsTriggerControl && HoldTime > float(0))
            {
                AddScorer(C, HoldTime);
                TotalHeldTime += HoldTime;
            }
            LastPlayerTouching = C;
            DelayedDamageInstigatorController = C;
            TouchingPlayers.Remove(i, 1);
            // End:0xc9
            if(TouchingPlayers.Length == 0)
            {
                bIsHeld = false;
                CheckPlayCriticalAlarm();
            }
            j = 0;
            J0xd0:
            // End:0x10e [While If]
            if(j < LinkedMover.Length)
            {
                LinkedMover[j].UnTrigger(self, C.Pawn);
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0xd0;
            }
        }
        // End:0x11b
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function AwardAssaultScore(int Score)
{
    local int i;
    local float HoldTime, BestHeldTime;

    // End:0xc9
    if(TouchingPlayers.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0xc9 [While If]
        if(i < TouchingPlayers.Length)
        {
            // End:0xbf
            if(TouchingPlayers[i].C != none)
            {
                HoldTime = Level.TimeSeconds - TouchingPlayers[i].TouchTime;
                AddScorer(TouchingPlayers[i].C, HoldTime);
                TotalHeldTime += HoldTime;
                // End:0xbf
                if(HoldTime > BestHeldTime)
                {
                    BestHeldTime = HoldTime;
                    DisabledBy = TouchingPlayers[i].C.PlayerReplicationInfo;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    i = 0;
    J0xd0:
    // End:0x112 [While If]
    if(i < Scorers.Length)
    {
        Scorers[i].Pct = Scorers[i].Pct / TotalHeldTime;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd0;
    }
    ShareScore(Score, "Objective_Completed");
}

function Trigger(Actor Other, Pawn Instigator)
{
    local int i;
    local float BestTime;
    local Pawn RealInstigator;

    // End:0x0b
    if(bDisabled)
    {
        return;
    }
    // End:0x1e
    if(bBotOnlyObjective)
    {
        RealInstigator = none;
    }
    // End:0x19c
    else
    {
        // End:0xf7
        if(TouchingPlayers.Length > 0)
        {
            i = 0;
            J0x31:
            // End:0xf7 [While If]
            if(i < TouchingPlayers.Length)
            {
                // End:0xed
                if(BestTime == float(0) || TouchingPlayers[i].TouchTime < BestTime)
                {
                    // End:0xd7
                    if(TouchingPlayers[i].C.Pawn != none)
                    {
                        BestTime = TouchingPlayers[i].TouchTime;
                        RealInstigator = TouchingPlayers[i].C.Pawn;
                        LastPlayerTouching = TouchingPlayers[i].C;
                    }
                    // End:0xed
                    else
                    {
                        DelayedDamageInstigatorController = TouchingPlayers[i].C;
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x31;
            }
        }
        // End:0x19c
        if(RealInstigator == none)
        {
            // End:0x145
            if(Instigator != none && Instigator.Controller != none)
            {
                RealInstigator = Instigator;
                LastPlayerTouching = Instigator.Controller;
            }
            // End:0x19c
            else
            {
                // End:0x17d
                if(LastPlayerTouching != none && LastPlayerTouching.Pawn != none)
                {
                    RealInstigator = LastPlayerTouching.Pawn;
                }
                // End:0x19c
                else
                {
                    // End:0x19c
                    if(DelayedDamageInstigatorController != none)
                    {
                        RealInstigator = DelayedDamageInstigatorController.Pawn;
                    }
                }
            }
        }
    }
    DisableObjective(RealInstigator);
}

function CompleteObjective(Pawn Instigator)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3c [While If]
    if(i < LinkedMover.Length)
    {
        LinkedMover[i].Trigger(self, Instigator);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Reset()
{
    LastPlayerTouching = none;
    Touchers.Length = 0;
    TouchingPlayers.Length = 0;
    TotalHeldTime = 0.0;
    bIsHeld = false;
    super(GameObjective).Reset();
}

simulated function float GetObjectiveProgress()
{
    local int i, BestMover;
    local float BestTime;

    // End:0xe2
    if(!bDisabled && LinkedMover.Length > 0)
    {
        i = 0;
        J0x20:
        // End:0x7d [While If]
        if(i < LinkedMover.Length)
        {
            // End:0x73
            if(LinkedMover[i].MoveTime > BestTime)
            {
                BestTime = LinkedMover[i].MoveTime;
                BestMover = i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x20;
        }
        // End:0xcd
        if(LinkedMover[BestMover].KeyNum >= LinkedMover[BestMover].PrevKeyNum)
        {
            return 1.0 - LinkedMover[BestMover].PhysAlpha;
        }
        // End:0xe2
        else
        {
            return LinkedMover[BestMover].PhysAlpha;
        }
    }
    return 0.0;
}

simulated function bool IsCritical()
{
    return IsActive() && bIsCritical || bIsHeld;
}

simulated function SetObjectiveOverlay(bool bShow)
{
    super(GameObjective).SetObjectiveOverlay(bShow);
}

simulated function UpdatePrecacheMaterials()
{
    super(GameObjective).UpdatePrecacheMaterials();
}

defaultproperties
{
    bLocationFX=true
    ObjectiveName="?? ?????"
    ObjectiveDescription="????? ??? ????? ???? ?????"
    Objective_Info_Attacker="?? ?????"
    bReceivePlayerToucherDiedNotify=true
}