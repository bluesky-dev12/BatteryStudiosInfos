/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wAirStrikeProjPack.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *	States:3
 *
 *******************************************************************************/
class wAirStrikeProjPack extends wAirStrikeProj;

function IncreaseBombCnt()
{
    ++ iCurrBombCnt;
    // End:0x26
    if(iCurrBombCnt == BaseParams_Bomb.iBulletCount)
    {
        GotoState('Exiting');
    }
}

state Waiting
{
    event BeginState()
    {
        // End:0x1f
        if(BaseParams.fFuseTime == float(0))
        {
            Timer();
        }
        // End:0x31
        else
        {
            SetTimer(BaseParams.fFuseTime, false);
        }
        Level.IsAirStriking = true;
        Level.fAirStrikeFadeTime = 2.0;
        Level.AirStrikeTeamIndex = InstigatorController.GetTeamNum();
    }

    event Timer()
    {
        SpawnBomb();
        GotoState('Striking');
    }

}

state Striking
{
    event BeginState()
    {
        SetTimer(BaseParams_Bomb.fRateOfFire, true);
    }

    event Timer()
    {
        SpawnBomb();
    }

}

state Exiting
{
    event BeginState()
    {
        SetTimer(3.0, false);
    }

    event Timer()
    {
        Level.IsAirStriking = false;
        Destroy();
    }

}
