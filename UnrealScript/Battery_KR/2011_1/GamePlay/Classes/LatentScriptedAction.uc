class LatentScriptedAction extends ScriptedAction
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.DrawText("Action " $ (GetActionString()), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function bool InitActionFor(ScriptedController C)
{
    C.CurrentAction = self;
    return true;
    //return;    
}

function bool CompleteWhenTriggered()
{
    return false;
    //return;    
}

function bool CompleteOnAnim(int Channel)
{
    return false;
    //return;    
}

function bool CompleteOnLIPSincAnim()
{
    return false;
    //return;    
}

function bool CompleteWhenTimer()
{
    return false;
    //return;    
}

function bool WaitForPlayer()
{
    return false;
    //return;    
}

function bool TickedAction()
{
    return false;
    //return;    
}

function bool StillTicking(ScriptedController C, float DeltaTime)
{
    return false;
    //return;    
}

function bool MoveToGoal()
{
    return false;
    //return;    
}

function bool TurnToGoal()
{
    return false;
    //return;    
}

function Actor GetMoveTargetFor(ScriptedController C)
{
    return C.SequenceScript.GetMoveTarget();
    //return;    
}

function float GetDistance()
{
    return 0.0000000;
    //return;    
}
