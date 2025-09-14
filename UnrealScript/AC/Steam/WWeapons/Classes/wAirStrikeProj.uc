/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wAirStrikeProj.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *	States:2
 *
 *******************************************************************************/
class wAirStrikeProj extends wProjectile;

var wWeaponBaseParams BaseParams_Bomb;
var class<wWeaponRes_Base> ResParams_Bomb;
var int iCurrBombCnt;
var Rotator rMasterRot;
var Vector vInvFallingLine;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        iCurrBombCnt;

}

event Destroyed()
{
    Level.IsAirStriking = false;
}

function SpawnBomb()
{
    local float fSpawnRadius;
    local int iSpawnTheta;
    local Rotator rTemp;
    local Vector vBombDestPos, vBombSpawnPos;

    // End:0x45
    if(RandRange(0.0, 1.0) >= 0.750)
    {
        fSpawnRadius = RandRange(BaseParams.fExplRad_Inner, BaseParams.fExplRad_Outer);
    }
    // End:0x64
    else
    {
        fSpawnRadius = RandRange(0.0, BaseParams.fExplRad_Inner);
    }
    iSpawnTheta = int(RandRange(0.0, 65535.0));
    rTemp.Yaw = iSpawnTheta;
    vBombDestPos = Location + vector(rTemp) * fSpawnRadius;
    vBombSpawnPos = vBombDestPos + QuatRotateVector(QuatFromRotator(float(-1) * rMasterRot), vInvFallingLine);
    SpawnProjectile(vBombSpawnPos, rotator(vBombDestPos - vBombSpawnPos));
    IncreaseBombCnt();
}

function wProjectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local wProjectile P;

    P = Spawn(class'wAirStrikeBomb',,, Start, Dir);
    // End:0x27
    if(P == none)
    {
        return none;
    }
    P.iWeaponID = BaseParams_Bomb.iWeaponID;
    P.InstigatorController = InstigatorController;
    return P;
}

function ForceBegin()
{
    super(Actor).ForceBegin();
    GotoState('Striking');
}

function IncreaseBombCnt()
{
    ++ iCurrBombCnt;
    // End:0x29
    if(iCurrBombCnt == BaseParams_Bomb.iBulletCount)
    {
        Disable('Timer');
        Destroy();
    }
}

simulated function wLoadOut(int iID)
{
    local wWeaponManager wMani;

    super.wLoadOut(iID);
    wMani = Level.WeaponMgr;
    BaseParams_Bomb = wMani.GetBaseParam(BaseParams.iBombWeaponID);
    ResParams_Bomb = wMani.GetRes(BaseParams_Bomb.szClass_Resource);
    rMasterRot = rotator(Location - Instigator.Location);
    rMasterRot.Pitch = 0;
    rMasterRot.Roll = 0;
    // End:0xb1
    if(Role == 4)
    {
        GotoState('Waiting');
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
    vInvFallingLine=(X=-1000.0,Y=0.0,Z=9000.0)
}