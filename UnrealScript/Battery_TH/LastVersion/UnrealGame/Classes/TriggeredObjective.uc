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
    Log((string(self) $ " InitTriggerList event ") $ string(NewEvent));
    // End:0x98
    foreach AllActors(Class'Engine.Actor', A)
    {
        // End:0x97
        if(A.Event == NewEvent)
        {
            MyTriggerList[MyTriggerList.Length] = A;
            // End:0x80
            if(A.SelfTriggered())
            {                
                return;
            }
            InitTriggerList(A.Tag);            
            return;
        }        
    }    
    // End:0x105
    foreach AllActors(Class'Gameplay.ScriptedTrigger', S)
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
            // End:0x105
            break;
        }        
    }    
    //return;    
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
    J0x1D:

    // End:0x165 [Loop If]
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
        // End:0x15B
        if(ScriptedTrigger(MyTriggerList[i]) != none)
        {
            // End:0xAF
            if((i == (MyTriggerList.Length - 1)) || MyTriggerList[i + 1] == none)
            {
                return MyTriggerList[i];
            }
            // End:0x15B
            if(ScriptedTrigger(MyTriggerList[i + 1]) == none)
            {
                NewEvent = ScriptedTrigger(MyTriggerList[i]).NextNeededEvent();
                // End:0x15B
                if(NewEvent != MyTriggerList[i + 1].Event)
                {
                    MyTriggerList.Remove(i + 1, (MyTriggerList.Length - i) - 1);
                    Log("Init trigger for " $ string(ScriptedTrigger(MyTriggerList[i])));
                    InitTriggerList(NewEvent);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    return none;
    //return;    
}

function Trigger(Actor Other, Pawn Instigator)
{
    // End:0x39
    if(!bDisabled && UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        DisableObjective(Instigator);
    }
    //return;    
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
    // End:0xBF
    if(Triggers(MyTrigger) != none)
    {
        // End:0xBF
        if(B.Pawn.ReachedDestination(MyTrigger))
        {
            // End:0x78
            if(MyTrigger.bCollideActors)
            {
                MyTrigger.Touch(B.Pawn);
            }
            // End:0xBF
            if((B.Enemy != none) && B.EnemyVisible())
            {
                B.DoRangedAttackOn(B.Enemy);
                return true;
            }
        }
    }
    MoveTarget = MyTrigger.SpecialHandling(B.Pawn);
    // End:0xEF
    if(MoveTarget == none)
    {
        return false;
    }
    // End:0x15C
    if(B.actorReachable(MoveTarget))
    {
        B.MoveTarget = MoveTarget;
        B.GoalString = "Go to activate trigger " $ string(MyTrigger);
        B.SetAttractionState();
        return true;        
    }
    else
    {
        // End:0x292
        if(((Vehicle(B.Pawn) != none) && !B.Squad.NeverBail(B.Pawn)) && VSize(MoveTarget.Location - B.Pawn.Location) < float(1000))
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
    // End:0x2C4
    if((Vehicle(B.Pawn) != none) && VehiclePath != none)
    {
        return super.TellBotHowToDisable(B);
    }
    B.FindBestPathToward(MoveTarget, true, true);
    // End:0x2F0
    if(B.MoveTarget == none)
    {
        return false;
    }
    B.GoalString = "Follow path to " $ string(MyTrigger);
    B.SetAttractionState();
    return true;
    //return;    
}

function bool BotNearObjective(Bot B)
{
    // End:0x2F
    if((MyBaseVolume != none) && B.Pawn.IsInVolume(MyBaseVolume))
    {
        return true;
    }
    // End:0x3C
    if(MyTrigger == none)
    {
        return false;
    }
    return (VSize(MyTrigger.Location - B.Pawn.Location) < float(2000)) && B.LineOfSightTo(MyTrigger);
    //return;    
}

defaultproperties
{
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ObjectiveName="??? ??"
    ObjectiveDescription="???? ???? ??? ??"
    Objective_Info_Attacker="??? ??"
    Objective_Info_Defender="??? ??"
    bStatic=false
    bAlwaysRelevant=true
}