class wAirStrikeProj extends wProjectile;

var wWeaponBaseParams BaseParams_Bomb;
var Class<wWeaponRes_Base> ResParams_Bomb;
var int iCurrBombCnt;
var Rotator rMasterRot;
var Vector vInvFallingLine;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        iCurrBombCnt;
}

event Destroyed()
{
    Level.IsAirStriking = false;
    //return;    
}

function SpawnBomb()
{
    local float fSpawnRadius;
    local int iSpawnTheta;
    local Rotator rTemp;
    local Vector vBombDestPos, vBombSpawnPos;

    // End:0x45
    if(RandRange(0.0000000, 1.0000000) >= 0.7500000)
    {
        fSpawnRadius = RandRange(BaseParams.fExplRad_Inner, BaseParams.fExplRad_Outer);        
    }
    else
    {
        fSpawnRadius = RandRange(0.0000000, BaseParams.fExplRad_Inner);
    }
    iSpawnTheta = int(RandRange(0.0000000, 65535.0000000));
    rTemp.Yaw = iSpawnTheta;
    vBombDestPos = Location + (Vector(rTemp) * fSpawnRadius);
    vBombSpawnPos = vBombDestPos + QuatRotateVector(QuatFromRotator(float(-1) * rMasterRot), vInvFallingLine);
    SpawnProjectile(vBombSpawnPos, Rotator(vBombDestPos - vBombSpawnPos));
    IncreaseBombCnt();
    //return;    
}

function wProjectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local wProjectile P;

    P = Spawn(Class'WWeapons_Decompressed.wAirStrikeBomb',,, Start, Dir);
    // End:0x27
    if(P == none)
    {
        return none;
    }
    P.iWeaponID = BaseParams_Bomb.iWeaponID;
    P.InstigatorController = InstigatorController;
    return P;
    //return;    
}

function ForceBegin()
{
    super(Actor).ForceBegin();
    GotoState('Striking');
    //return;    
}

function IncreaseBombCnt()
{
    iCurrBombCnt++;
    // End:0x3A
    if(iCurrBombCnt == BaseParams_Bomb.iBulletCount)
    {
        Level.IsAirStriking = false;
        Disable('Timer');
        Destroy();
    }
    //return;    
}

simulated function wLoadOut(int iID)
{
    local wWeaponManager wMani;

    super.wLoadOut(iID);
    wMani = Level.WeaponMgr;
    BaseParams_Bomb = wMani.GetBaseParam(BaseParams.iBombWeaponID);
    ResParams_Bomb = wMani.GetRes(BaseParams_Bomb.szClass_Resource);
    rMasterRot = Rotator(Location - Instigator.Location);
    rMasterRot.Pitch = 0;
    rMasterRot.Roll = 0;
    // End:0xB1
    if(int(Role) == int(ROLE_Authority))
    {
        GotoState('Waiting');
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
    vInvFallingLine=(X=-1000.0000000,Y=0.0000000,Z=9000.0000000)
}