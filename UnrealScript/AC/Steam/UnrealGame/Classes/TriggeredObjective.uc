/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\TriggeredObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:5
 *
 *******************************************************************************/
class TriggeredObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var array<Actor> MyTriggerList;
var Actor MyTrigger;
var bool bInitialized;

function InitTriggerList(name NewEvent)
{
    local Actor A;
    local name NextEvent;
    local ScriptedTrigger S;

    bInitialized = true;
    Log(string(self) $ " InitTriggerList event " $ string(NewEvent));
    // End:0x98
    foreach AllActors(class'Actor', A)
    {
        // End:0x97
        if(A.Event == NewEvent)
        {
            MyTriggerList[MyTriggerList.Length] = A;
            // End:0x80
            if(A.SelfTriggered())
            {
                break;
                return;
            }
            InitTriggerList(A.Tag);
            break;
            return;
        }                
    }
    // End:0x105
    foreach AllActors(class'ScriptedTrigger', S)
    {
        // End:0x104
        if(S.TriggersEvent(NewEvent))
        {
            MyTriggerList[MyTriggerList.Length] = S;
            NextEvent = S.NextNeededEvent();
            // End:0x101
            if(NextEvent != NewEvent)
            {
                InitTriggerList(NextEvent);
            }
        }
        // End:0x105
        else
        {
            continue;
        }        
    }
}

function Actor FindTrigger()
{
    local int i;
    local name NewEvent;

    // End:0x16
    if(!bInitialized)
    {
        InitTriggerList(Tag);
    }
    i = 0;
    J0x1d:
    // End:0x165 [While If]
    if(i < MyTriggerList.Length)
    {
        // End:0x40
        if(MyTriggerList[i] == none)
        {
            return none;
        }
        // End:0x64
        if(MyTriggerList[i].SelfTriggered())
        {
            return MyTriggerList[i];
        }
        // End:0x15b
        if(ScriptedTrigger(MyTriggerList[i]) != none)
        {
            // End:0xaf
            if(i == MyTriggerList.Length - 1 || MyTriggerList[i + 1] == none)
            {
                return MyTriggerList[i];
            }
            // End:0x15b
            if(ScriptedTrigger(MyTriggerList[i + 1]) == none)
            {
                NewEvent = ScriptedTrigger(MyTriggerList[i]).NextNeededEvent();
                // End:0x15b
                if(NewEvent != MyTriggerList[i + 1].Event)
                {
                    MyTriggerList.Remove(i + 1, MyTriggerList.Length - i - 1);
                    Log("Init trigger for " $ string(ScriptedTrigger(MyTriggerList[i])));
                    InitTriggerList(NewEvent);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    return none;
}

function Trigger(Actor Other, Pawn Instigator)
{
    // End:0x39
    if(!bDisabled && UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        DisableObjective(Instigator);
    }
}

function bool TellBotHowToDisable(Bot B)
{
    local Actor MoveTarget;

    MyTrigger = FindTrigger();
    // End:0x19
    if(MyTrigger == none)
    {
        return false;
    }
    // End:0xbf
    if(Triggers(MyTrigger) != none)
    {
        // End:0xbf
        if(B.Pawn.ReachedDestination(MyTrigger))
        {
            // End:0x78
            if(MyTrigger.bCollideActors)
            {
                MyTrigger.Touch(B.Pawn);
            }
            // End:0xbf
            if(B.Enemy != none && B.EnemyVisible())
            {
                B.DoRangedAttackOn(B.Enemy);
                return true;
            }
        }
    }
    MoveTarget = MyTrigger.SpecialHandling(B.Pawn);
    // End:0xef
    if(MoveTarget == none)
    {
        return false;
    }
    // End:0x15c
    if(B.actorReachable(MoveTarget))
    {
        B.MoveTarget = MoveTarget;
        B.GoalString = "Go to activate trigger " $ string(MyTrigger);
        B.SetAttractionState();
        return true;
    }
    // End:0x292
    else
    {
        // End:0x292
        if(Vehicle(B.Pawn) != none && !B.Squad.NeverBail(B.Pawn) && VSize(MoveTarget.Location - B.Pawn.Location) < float(1000))
        {
            Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(6);
            Vehicle(B.Pawn).KDriverLeave(false);
            // End:0x292
            if(B.actorReachable(MoveTarget))
            {
                B.MoveTarget = MoveTarget;
                B.GoalString = "Go to activate trigger " $ string(MyTrigger);
                B.SetAttractionState();
                return true;
            }
        }
    }
    // End:0x2c4
    if(Vehicle(B.Pawn) != none && VehiclePath != none)
    {
        return super.TellBotHowToDisable(B);
    }
    B.FindBestPathToward(MoveTarget, true, true);
    // End:0x2f0
    if(B.MoveTarget == none)
    {
        return false;
    }
    B.GoalString = "Follow path to " $ string(MyTrigger);
    B.SetAttractionState();
    return true;
}

function bool BotNearObjective(Bot B)
{
    // End:0x2f
    if(MyBaseVolume != none && B.Pawn.IsInVolume(MyBaseVolume))
    {
        return true;
    }
    // End:0x3c
    if(MyTrigger == none)
    {
        return false;
    }
    return VSize(MyTrigger.Location - B.Pawn.Location) < float(2000) && B.LineOfSightTo(MyTrigger);
}

defaultproperties
{
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ObjectiveName="??? ??"
    ObjectiveDescription="???? ???? ??? ??"
    Objective_Info_Attacker="??? ??"
    bStatic=true
    bAlwaysRelevant=true
}