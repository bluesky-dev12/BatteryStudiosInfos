/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ScriptedSequence.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class ScriptedSequence extends AIScript
    dependson(Action_PLAYANIM);

var(AIScript) export editinline array<export editinline ScriptedAction> Actions;
var class<ScriptedController> ScriptControllerClass;

function PostBeginPlay()
{
    local int i;

    super(Actor).PostBeginPlay();
    i = 0;
    J0x0d:
    // End:0x4e [While If]
    if(i < Actions.Length)
    {
        // End:0x44
        if(Actions[i] != none)
        {
            Actions[i].PostBeginPlay(self);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

event Reset()
{
    local int i;

    super(Actor).Reset();
    i = 0;
    J0x0d:
    // End:0x4d [While If]
    if(i < Actions.Length)
    {
        // End:0x43
        if(Actions[i] != none)
        {
            Actions[i].Reset();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function SpawnControllerFor(Pawn P)
{
    super.SpawnControllerFor(P);
    TakeOver(P);
}

function bool CheckForErrors()
{
    // End:0x27
    if(Actions.Length > 0)
    {
        Log(string(self) $ " has no Actions!");
        return true;
    }
    return super(Actor).CheckForErrors();
}

function TakeOver(Pawn P)
{
    local ScriptedController S;

    // End:0x35
    if(ScriptedController(P.Controller) != none)
    {
        S = ScriptedController(P.Controller);
    }
    // End:0x8c
    else
    {
        S = Spawn(ScriptControllerClass);
        S.PendingController = P.Controller;
        // End:0x8c
        if(S.PendingController != none)
        {
            S.PendingController.PendingStasis();
        }
    }
    S.MyScript = self;
    S.TakeControlOf(P);
    S.SetNewScript(self);
}

function bool ValidAction(int N)
{
    return true;
}

function SetActions(ScriptedController C)
{
    local ScriptedSequence NewScript;
    local bool bDone;

    // End:0x31
    if(C.CurrentAnimation != none)
    {
        C.CurrentAnimation.SetCurrentAnimationFor(C);
    }
    J0x31:
    // End:0x2e6 [While If]
    if(!bDone)
    {
        // End:0xf8
        if(C.ActionNum < Actions.Length)
        {
            // End:0x94
            if(ValidAction(C.ActionNum))
            {
                NewScript = Actions[C.ActionNum].GetScript(self);
            }
            // End:0xf5
            else
            {
                NewScript = none;
                Warn(GetItemName(string(self)) $ " action " $ string(C.ActionNum) @ Actions[C.ActionNum].GetActionString() $ " NOT VALID!!!");
            }
        }
        // End:0xff
        else
        {
            NewScript = none;
        }
        // End:0x11c
        if(NewScript == none)
        {
            C.CurrentAction = none;
            return;
        }
        // End:0x13d
        if(NewScript != self)
        {
            C.SetNewScript(NewScript);
            return;
        }
        // End:0x196
        if(Actions[C.ActionNum] == none)
        {
            Warn(string(self) $ " no action " $ string(C.ActionNum) $ "!!!");
            C.CurrentAction = none;
            return;
        }
        bDone = Actions[C.ActionNum].InitActionFor(C);
        // End:0x23a
        if(bLoggingEnabled)
        {
            Log(GetItemName(string(C.Pawn)) $ " script " $ GetItemName(string(Tag)) $ " action " $ string(C.ActionNum) @ Actions[C.ActionNum].GetActionString());
        }
        // End:0x2e3
        if(!bDone)
        {
            // End:0x2a2
            if(Actions[C.ActionNum] == none)
            {
                Warn(string(self) $ " has no action " $ string(C.ActionNum) $ "!!!");
                C.CurrentAction = none;
                return;
            }
            Actions[C.ActionNum].ActionCompleted();
            Actions[C.ActionNum].ProceedToNextAction(C);
        }
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
}

defaultproperties
{
    ScriptControllerClass=class'ScriptedController'
    bNavigate=true
    bCollideWhenPlacing=true
    CollisionRadius=50.0
    CollisionHeight=100.0
    bDirectional=true
}