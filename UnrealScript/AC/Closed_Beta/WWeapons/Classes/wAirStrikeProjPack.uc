class wAirStrikeProjPack extends wAirStrikeProj;

function IncreaseBombCnt()
{
    iCurrBombCnt++;
    // End:0x26
    if(iCurrBombCnt == BaseParams_Bomb.iBulletCount)
    {
        GotoState('Exiting');
    }
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
        Level.IsAirStriking = true;
        Level.fAirStrikeFadeTime = 2.0000000;
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

state Exiting
{
    event BeginState()
    {
        SetTimer(3.0000000, false);
        //return;        
    }

    event Timer()
    {
        Level.IsAirStriking = false;
        Destroy();
        //return;        
    }
    stop;    
}
