class wBeam_Nemesis extends wProjectile;

var Vector TargetPos[3];
var float beginTime;
var int TargetPosIndex;
var float ElapsedTime_BeamStarted;
var BtrTraceResult TrResult;
var Class<Emitter> mTracerClass;
var() editinline Emitter mTracer;

replication
{
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        TargetPos;
}

simulated function Destroyed()
{
    TrResult = none;
    super(Actor).Destroyed();
    //return;    
}

simulated function DoTrace(Vector Start, Vector End)
{
    local ResultData TrData;
    local array<float> arrResultDist;
    local array<ResultData> arrVictim;
    local ResultData SortTempResult;
    local float SortTempResultDist;
    local ResultData Victim;
    local int i, j;
    local array<bool> arrIsWallShot;
    local float DamageEff, DamageOuter;
    local int EffCnt;
    local Vector LastHitTrace, LastHitNormal;

    // End:0x1D
    if(TrResult == none)
    {
        TrResult = new Class'Engine.BtrTraceResult';        
    }
    else
    {
        TrResult.clearResultArray();
    }
    MultiTrace(TrResult, End, Start, true, true);
    // End:0x5A
    if(TrResult.TraceResultArray.Length == 0)
    {
        return;
    }
    arrResultDist.Insert(0, TrResult.TraceResultArray.Length);
    i = 0;
    J0x77:

    // End:0xBF [Loop If]
    if(i < arrResultDist.Length)
    {
        arrResultDist[i] = VSize(TrResult.TraceResultArray[i].HitLocation - Start);
        i++;
        // [Loop Continue]
        goto J0x77;
    }
    i = 0;
    J0xC6:

    // End:0x1BC [Loop If]
    if(i < (arrResultDist.Length - 1))
    {
        j = i + 1;
        J0xE7:

        // End:0x1B2 [Loop If]
        if(j < arrResultDist.Length)
        {
            // End:0x1A8
            if(arrResultDist[j] < arrResultDist[i])
            {
                SortTempResult = TrResult.TraceResultArray[j];
                TrResult.TraceResultArray[j] = TrResult.TraceResultArray[i];
                TrResult.TraceResultArray[i] = SortTempResult;
                SortTempResultDist = arrResultDist[j];
                arrResultDist[j] = arrResultDist[i];
                arrResultDist[i] = SortTempResultDist;
            }
            j++;
            // [Loop Continue]
            goto J0xE7;
        }
        i++;
        // [Loop Continue]
        goto J0xC6;
    }
    i = 0;
    J0x1C3:

    // End:0x275 [Loop If]
    if(i < TrResult.TraceResultArray.Length)
    {
        TrData = TrResult.TraceResultArray[i];
        // End:0x26B
        if((TrData.HitActor != none) && TrData.HitActor != Owner)
        {
            LastHitTrace = TrData.HitLocation;
            // End:0x248
            if(!TrData.HitActor.bWorldGeometry)
            {
                // [Explicit Continue]
                goto J0x26B;
            }
            EffCnt++;
            // End:0x26B
            if(!TrData.HitActor.IsPenetrate())
            {
                // [Explicit Break]
                goto J0x275;
            }
        }
        J0x26B:

        i++;
        // [Loop Continue]
        goto J0x1C3;
    }
    J0x275:

    // End:0x297
    if(LastHitTrace != vect(0.0000000, 0.0000000, 0.0000000))
    {
        UpdateBeamEffect(LastHitTrace);
    }
    //return;    
}

simulated function Vector GetTracerStart()
{
    local Vector X, Y, Z;

    // End:0x61
    if(Owner != none)
    {
        GetAxes(Owner.Rotation, X, Y, Z);
        return Owner.Location + ((0.5000000 * Owner.CollisionRadius) * (X + Y));        
    }
    else
    {
        GetAxes(Rotation, X, Y, Z);
        return Location + ((0.5000000 * CollisionRadius) * (X + Y));
    }
    //return;    
}

simulated function UpdateBeamEffect(Vector vLastHitLoc)
{
    local Vector SpawnLoc, SpawnDir, spawnVel;
    local float hitDist;

    // End:0x23
    if(self.mTracer == none)
    {
        mTracer = Spawn(self.mTracerClass);
    }
    SpawnLoc = GetTracerStart();
    mTracer.SetLocation(SpawnLoc);
    hitDist = VSize(vLastHitLoc - SpawnLoc) - float(700);
    SpawnDir = Normal(vLastHitLoc - SpawnLoc);
    // End:0x21E
    if(hitDist > 0.0000000)
    {
        spawnVel = SpawnDir * 20000.0000000;
        mTracer.Emitters[0].StartVelocityRange.X.Min = spawnVel.X;
        mTracer.Emitters[0].StartVelocityRange.X.Max = spawnVel.X;
        mTracer.Emitters[0].StartVelocityRange.Y.Min = spawnVel.Y;
        mTracer.Emitters[0].StartVelocityRange.Y.Max = spawnVel.Y;
        mTracer.Emitters[0].StartVelocityRange.Z.Min = spawnVel.Z;
        mTracer.Emitters[0].StartVelocityRange.Z.Max = spawnVel.Z;
        mTracer.Emitters[0].LifetimeRange.Min = hitDist / 20000.0000000;
        mTracer.Emitters[0].LifetimeRange.Max = mTracer.Emitters[0].LifetimeRange.Min;
        mTracer.SpawnParticle(1);
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    beginTime = Level.TimeSeconds;
    //return;    
}

simulated event Tick(float DeltaTime)
{
    local Vector CurrentPos, vDirection;
    local float fDirSize;

    super.Tick(DeltaTime);
    // End:0x71
    if(((TargetPos[0] == vect(0.0000000, 0.0000000, 0.0000000)) || TargetPos[1] == vect(0.0000000, 0.0000000, 0.0000000)) || TargetPos[2] == vect(0.0000000, 0.0000000, 0.0000000))
    {
        beginTime = Level.TimeSeconds;
        return;
    }
    ElapsedTime_BeamStarted += DeltaTime;
    vDirection = TargetPos[TargetPosIndex] - TargetPos[TargetPosIndex - 1];
    fDirSize = VSize(vDirection);
    // End:0x112
    if((ElapsedTime_BeamStarted * Speed) > fDirSize)
    {
        TargetPosIndex++;
        // End:0xD9
        if(TargetPosIndex > 2)
        {
            Destroy();
            return;
        }
        ElapsedTime_BeamStarted = 0.0000000;
        vDirection = TargetPos[TargetPosIndex] - TargetPos[TargetPosIndex - 1];
        fDirSize = VSize(vDirection);
    }
    vDirection = Normal(vDirection);
    CurrentPos = TargetPos[TargetPosIndex - 1] + ((vDirection * ElapsedTime_BeamStarted) * Speed);
    vDirection = CurrentPos - (GetTracerStart());
    vDirection = Normal(vDirection);
    DoTrace(GetTracerStart(), (GetTracerStart()) + (vDirection * 20000.0000000));
    // End:0x198
    if(int(Role) == int(ROLE_Authority))
    {
    }
    //return;    
}

defaultproperties
{
    TargetPosIndex=1
    mTracerClass=Class'XEffects.Warfare_Tracer'
    Speed=500.0000000
    LifeSpan=0.0000000
    bCanBeDamaged=false
}