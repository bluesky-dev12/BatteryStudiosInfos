class wAIDefenceBot_Eta extends wAIDefenceBot;

function NotifyAddDefaultInventory()
{
    Pawn.SwitchWeapon(3);
    //return;    
}

simulated function StopPawnsAndControllers()
{
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

state SuicideExplode extends ProcessGoal
{
    function BeginState()
    {
        IsStopAction = true;
        //return;        
    }

    function EndState()
    {
        //return;        
    }

    function Tick(float dt)
    {
        //return;        
    }
Begin:

    StopPawnsAndControllers();
    stop;        
}

defaultproperties
{
    PawnClass=Class'WGame_Decompressed.wAIDefencePawn_Eta'
}