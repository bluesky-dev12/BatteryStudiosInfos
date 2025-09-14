class ScriptedSequence extends AIScript;

var(AIScript) export editinline array<export editinline ScriptedAction> Actions;
var Class<ScriptedController> ScriptControllerClass;

function PostBeginPlay()
{
    local int i;

    super(Actor).PostBeginPlay();
    i = 0;
    J0x0D:

    // End:0x4E [Loop If]
    if(i < Actions.Length)
    {
        // End:0x44
        if(Actions[i] != none)
        {
            Actions[i].PostBeginPlay(self);
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

event Reset()
{
    local int i;

    super(Actor).Reset();
    i = 0;
    J0x0D:

    // End:0x4D [Loop If]
    if(i < Actions.Length)
    {
        // End:0x43
        if(Actions[i] != none)
        {
            Actions[i].Reset();
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function SpawnControllerFor(Pawn P)
{
    super.SpawnControllerFor(P);
    TakeOver(P);
    //return;    
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
    //return;    
}

function TakeOver(Pawn P)
{
    local ScriptedController S;

    // End:0x35
    if(ScriptedController(P.Controller) != none)
    {
        S = ScriptedController(P.Controller);        
    }
    else
    {
        S = Spawn(ScriptControllerClass);
        S.PendingController = P.Controller;
        // End:0x8C
        if(S.PendingController != none)
        {
            S.PendingController.PendingStasis();
        }
    }
    S.MyScript = self;
    S.TakeControlOf(P);
    S.SetNewScript(self);
    //return;    
}

function bool ValidAction(int N)
{
    return true;
    //return;    
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

    // End:0x2E6 [Loop If]
    if(!bDone)
    {
        // End:0xF8
        if(C.ActionNum < Actions.Length)
        {
            // End:0x94
            if(ValidAction(C.ActionNum))
            {
                NewScript = Actions[C.ActionNum].GetScript(self);                
            }
            else
            {
                NewScript = none;
                Warn(((((GetItemName(string(self))) $ " action ") $ string(C.ActionNum)) @ Actions[C.ActionNum].GetActionString()) $ " NOT VALID!!!");
            }            
        }
        else
        {
            NewScript = none;
        }
        // End:0x11C
        if(NewScript == none)
        {
            C.CurrentAction = none;
            return;
        }
        // End:0x13D
        if(NewScript != self)
        {
            C.SetNewScript(NewScript);
            return;
        }
        // End:0x196
        if(Actions[C.ActionNum] == none)
        {
            Warn(((string(self) $ " no action ") $ string(C.ActionNum)) $ "!!!");
            C.CurrentAction = none;
            return;
        }
        bDone = Actions[C.ActionNum].InitActionFor(C);
        // End:0x23A
        if(bLoggingEnabled)
        {
            Log((((((GetItemName(string(C.Pawn))) $ " script ") $ (GetItemName(string(Tag)))) $ " action ") $ string(C.ActionNum)) @ Actions[C.ActionNum].GetActionString());
        }
        // End:0x2E3
        if(!bDone)
        {
            // End:0x2A2
            if(Actions[C.ActionNum] == none)
            {
                Warn(((string(self) $ " has no action ") $ string(C.ActionNum)) $ "!!!");
                C.CurrentAction = none;
                return;
            }
            Actions[C.ActionNum].ActionCompleted();
            Actions[C.ActionNum].ProceedToNextAction(C);
        }
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
}

defaultproperties
{
    ScriptControllerClass=Class'GamePlay_Decompressed.ScriptedController'
    bNavigate=true
    bCollideWhenPlacing=true
    CollisionRadius=50.0000000
    CollisionHeight=100.0000000
    bDirectional=true
}