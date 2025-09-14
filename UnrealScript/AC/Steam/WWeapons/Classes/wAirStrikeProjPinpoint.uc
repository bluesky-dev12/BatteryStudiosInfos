/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wAirStrikeProjPinpoint.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *	States:2
 *
 *******************************************************************************/
class wAirStrikeProjPinpoint extends wAirStrikeProj;

event Destroyed();
function ForceBegin()
{
    super.ForceBegin();
    GotoState('Striking');
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

defaultproperties
{
    vInvFallingLine=(X=0.0,Y=0.0,Z=9000.0)
}