class wAirStrikeProjPinpoint extends wAirStrikeProj;

event Destroyed()
{
    //return;    
}

function ForceBegin()
{
    super.ForceBegin();
    GotoState('Striking');
    //return;    
}

state Waiting
{
    event BeginState()
    {
        // End:0x1F
        if(BaseParams.fFuseTime == float(0))
        {
            Timer();            
        }
        else
        {
            SetTimer(BaseParams.fFuseTime, false);
        }
        Level.AirStrikeTeamIndex = InstigatorController.GetTeamNum();
        //return;        
    }

    event Timer()
    {
        SpawnBomb();
        GotoState('Striking');
        //return;        
    }
    stop;    
}

state Striking
{
    event BeginState()
    {
        SetTimer(BaseParams_Bomb.fRateOfFire, true);
        //return;        
    }

    event Timer()
    {
        SpawnBomb();
        //return;        
    }
    stop;    
}

defaultproperties
{
    vInvFallingLine=(X=0.0000000,Y=0.0000000,Z=9000.0000000)
}