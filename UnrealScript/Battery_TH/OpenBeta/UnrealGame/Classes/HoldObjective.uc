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
    // Pos:0x000
    reliable if(((int(Role) == int(ROLE_Authority)) && bReplicateObjective) && bNetDirty)
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
    else
    {
        // End:0xEF
        foreach AllActors(Class'Engine.Mover', myMover, MoverTag)
        {
            // End:0x6D
            if(myMover.InitialState == 'TriggerControl')
            {
                bIsTriggerControl = true;
            }
            LinkedMover[LinkedMover.Length] = myMover;
            // End:0xEE
            if(myMover.Event == 'None')
            {
                Warn((string(myMover) @ "doesn't have it's Event set. It should trigger back the HoldObjective") @ string(self));
            }            
        }        
    }
    //return;    
}

function bool TellBotHowToDisable(Bot B)
{
    local Bot NextBot;

    // End:0xC2
    if((VSize(B.Pawn.Location - Location) < float(1000)) && B.LineOfSightTo(self))
    {
        NextBot = B.Squad.SquadMembers;
        J0x5B:

        // End:0xC2 [Loop If]
        if(NextBot != none)
        {
            // End:0xAB
            if(((NextBot != B) && NextBot.Pawn != none) && NextBot.Pawn.ReachedDestination(self))
            {
                return false;
            }
            NextBot = NextBot.NextSquadMember;
            // [Loop Continue]
            goto J0x5B;
        }
    }
    // End:0x14A
    if((((B.Enemy != none) && B.Skill > (float(4) * FRand())) && float(B.Pawn.Health) < (float(250) * FRand())) && B.Pawn.ReachedDestination(self))
    {
        B.bShieldSelf = true;
    }
    return super.TellBotHowToDisable(B);
    //return;    
}

event Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x40
    if((P != none) && IsRelevant(P, true))
    {
        AddNewTouchingPlayer(P.Controller);
    }
    //return;    
}

event UnTouch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x40
    if((P != none) && IsRelevant(P, true))
    {
        RemoveTouchingPlayer(P.Controller);
    }
    //return;    
}

function PlayerToucherDied(Pawn P)
{
    RemoveTouchingPlayer(P.GetKillerController());
    //return;    
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

    // End:0x8E [Loop If]
    if(i < LinkedMover.Length)
    {
        LinkedMover[i].Trigger(self, C.Pawn);
        i++;
        // [Loop Continue]
        goto J0x50;
    }
    // End:0xE9
    if(C != none)
    {
        i = 0;
        J0xA0:

        // End:0xE9 [Loop If]
        if(i < 4)
        {
            // End:0xDF
            if(C.GoalList[i] == self)
            {
                C.GoalList[i] = none;
                // [Explicit Break]
                goto J0xE9;
            }
            i++;
            // [Loop Continue]
            goto J0xA0;
        }
    }
    J0xE9:

    //return;    
}

function RemoveTouchingPlayer(Controller C)
{
    local int i, j;
    local float HoldTime;

    i = 0;
    J0x07:

    // End:0x11B [Loop If]
    if(i < TouchingPlayers.Length)
    {
        // End:0x111
        if(TouchingPlayers[i].C == C)
        {
            HoldTime = Level.TimeSeconds - TouchingPlayers[i].TouchTime;
            // End:0x8D
            if(!bIsTriggerControl && HoldTime > float(0))
            {
                AddScorer(C, HoldTime);
                TotalHeldTime += HoldTime;
            }
            LastPlayerTouching = C;
            DelayedDamageInstigatorController = C;
            TouchingPlayers.Remove(i, 1);
            // End:0xC9
            if(TouchingPlayers.Length == 0)
            {
                bIsHeld = false;
                CheckPlayCriticalAlarm();
            }
            j = 0;
            J0xD0:

            // End:0x10E [Loop If]
            if(j < LinkedMover.Length)
            {
                LinkedMover[j].UnTrigger(self, C.Pawn);
                j++;
                // [Loop Continue]
                goto J0xD0;
            }
            // [Explicit Break]
            goto J0x11B;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x11B:

    //return;    
}

function AwardAssaultScore(int Score)
{
    local int i;
    local float HoldTime, BestHeldTime;

    // End:0xC9
    if(TouchingPlayers.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0xC9 [Loop If]
        if(i < TouchingPlayers.Length)
        {
            // End:0xBF
            if(TouchingPlayers[i].C != none)
            {
                HoldTime = Level.TimeSeconds - TouchingPlayers[i].TouchTime;
                AddScorer(TouchingPlayers[i].C, HoldTime);
                TotalHeldTime += HoldTime;
                // End:0xBF
                if(HoldTime > BestHeldTime)
                {
                    BestHeldTime = HoldTime;
                    DisabledBy = TouchingPlayers[i].C.PlayerReplicationInfo;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    i = 0;
    J0xD0:

    // End:0x112 [Loop If]
    if(i < Scorers.Length)
    {
        Scorers[i].Pct = Scorers[i].Pct / TotalHeldTime;
        i++;
        // [Loop Continue]
        goto J0xD0;
    }
    ShareScore(Score, "Objective_Completed");
    //return;    
}

function Trigger(Actor Other, Pawn Instigator)
{
    local int i;
    local float BestTime;
    local Pawn RealInstigator;

    // End:0x0B
    if(bDisabled)
    {
        return;
    }
    // End:0x1E
    if(bBotOnlyObjective)
    {
        RealInstigator = none;        
    }
    else
    {
        // End:0xF7
        if(TouchingPlayers.Length > 0)
        {
            i = 0;
            J0x31:

            // End:0xF7 [Loop If]
            if(i < TouchingPlayers.Length)
            {
                // End:0xED
                if((BestTime == float(0)) || TouchingPlayers[i].TouchTime < BestTime)
                {
                    // End:0xD7
                    if(TouchingPlayers[i].C.Pawn != none)
                    {
                        BestTime = TouchingPlayers[i].TouchTime;
                        RealInstigator = TouchingPlayers[i].C.Pawn;
                        LastPlayerTouching = TouchingPlayers[i].C;
                        // [Explicit Continue]
                        goto J0xED;
                    }
                    DelayedDamageInstigatorController = TouchingPlayers[i].C;
                }
                J0xED:

                i++;
                // [Loop Continue]
                goto J0x31;
            }
        }
        // End:0x19C
        if(RealInstigator == none)
        {
            // End:0x145
            if((Instigator != none) && Instigator.Controller != none)
            {
                RealInstigator = Instigator;
                LastPlayerTouching = Instigator.Controller;                
            }
            else
            {
                // End:0x17D
                if((LastPlayerTouching != none) && LastPlayerTouching.Pawn != none)
                {
                    RealInstigator = LastPlayerTouching.Pawn;                    
                }
                else
                {
                    // End:0x19C
                    if(DelayedDamageInstigatorController != none)
                    {
                        RealInstigator = DelayedDamageInstigatorController.Pawn;
                    }
                }
            }
        }
    }
    DisableObjective(RealInstigator);
    //return;    
}

function CompleteObjective(Pawn Instigator)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(i < LinkedMover.Length)
    {
        LinkedMover[i].Trigger(self, Instigator);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Reset()
{
    LastPlayerTouching = none;
    Touchers.Length = 0;
    TouchingPlayers.Length = 0;
    TotalHeldTime = 0.0000000;
    bIsHeld = false;
    super(GameObjective).Reset();
    //return;    
}

simulated function float GetObjectiveProgress()
{
    local int i, BestMover;
    local float BestTime;

    // End:0xE2
    if(!bDisabled && LinkedMover.Length > 0)
    {
        i = 0;
        J0x20:

        // End:0x7D [Loop If]
        if(i < LinkedMover.Length)
        {
            // End:0x73
            if(LinkedMover[i].MoveTime > BestTime)
            {
                BestTime = LinkedMover[i].MoveTime;
                BestMover = i;
            }
            i++;
            // [Loop Continue]
            goto J0x20;
        }
        // End:0xCD
        if(int(LinkedMover[BestMover].KeyNum) >= int(LinkedMover[BestMover].PrevKeyNum))
        {
            return 1.0000000 - LinkedMover[BestMover].PhysAlpha;            
        }
        else
        {
            return LinkedMover[BestMover].PhysAlpha;
        }
    }
    return 0.0000000;
    //return;    
}

simulated function bool IsCritical()
{
    return (IsActive()) && bIsCritical || bIsHeld;
    //return;    
}

simulated function SetObjectiveOverlay(bool bShow)
{
    super(GameObjective).SetObjectiveOverlay(bShow);
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super(GameObjective).UpdatePrecacheMaterials();
    //return;    
}

defaultproperties
{
    bLocationFX=true
    ObjectiveName="?? ?????"
    ObjectiveDescription="????? ??? ????? ???? ?????"
    Objective_Info_Attacker="?? ?????"
    bReceivePlayerToucherDiedNotify=true
}