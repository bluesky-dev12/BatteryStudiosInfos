/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wFlameProj.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *	Functions:7
 *
 *******************************************************************************/
class wFlameProj extends wProjectile;

struct SuffInfo
{
    var Pawn kSuffer;
    var float fLastSuff;
};

var class<Emitter> classEmiFlame;
var Emitter emiFlame;
var float fDamageDelay;
var float fNextDamTime;
var float fTimeGrow;
var float fMinColRadius;
var float fMinColHeight;
var float fMaxColRadius;
var float fMaxColHeight;
var array<SuffInfo> arrSuffInfo;

simulated function wLoadOut(int iID)
{
    // End:0x20
    if(Instigator.HeadVolume.bWaterVolume)
    {
        Destroy();
        return;
    }
    super.wLoadOut(iID);
    SetSpeed(BaseParams.fProjSpeed);
    // End:0x74
    if(Level.NetMode != 1)
    {
        emiFlame = Spawn(class'EF_Bullet_M2B_Fire', self);
        emiFlame.SetBase(self);
    }
}

simulated function Destroyed()
{
    // End:0x1a
    if(emiFlame != none)
    {
        emiFlame.Kill();
    }
    super(Actor).Destroyed();
}

function SetSpeed(float fSpeed)
{
    Speed = fSpeed;
    Velocity = Speed * vector(Rotation);
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    super(Projectile).HitWall(HitNormal, Wall, HitMaterial);
    SetSpeed(0.0);
}

simulated function Explode(Vector HitLocation, Vector HitNormal);
simulated event Tick(float DeltaTime)
{
    local Pawn Victim;
    local int i;
    local float fLerpValue, fCurColRadius, fCurColHeight;

    super.Tick(DeltaTime);
    fLerpValue = TimerCounter / fTimeGrow;
    fLerpValue = float(Min(1, int(fLerpValue)));
    fCurColRadius = fMinColRadius + fMaxColRadius - fMinColRadius * fLerpValue;
    fCurColHeight = fMinColHeight + fMaxColHeight - fMinColHeight * fLerpValue;
    SetCollisionSize(fCurColRadius, fCurColHeight);
    // End:0x23f
    foreach TouchingActors(class'Pawn', Victim)
    {
        i = 0;
        J0x93:
        // End:0x17d [While If]
        if(i < arrSuffInfo.Length)
        {
            // End:0x173
            if(arrSuffInfo[i].kSuffer == Victim)
            {
                // End:0x170
                if(arrSuffInfo[i].fLastSuff + fDamageDelay <= Level.TimeSeconds)
                {
                    DamageLog(Victim, float(BaseParams.iDamage), 0.0);
                    Victim.TakeDamage(BaseParams.iDamage, Instigator, Victim.Location, vect(0.0, 0.0, 0.0), ResParams,, 8);
                    arrSuffInfo[i].fLastSuff = Level.TimeSeconds;
                }
                // End:0x173
                else
                {
                    // This is an implied JumpToken;
                    goto J0x17d;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x93;
        }
        J0x17d:
        // End:0x23e
        if(i == arrSuffInfo.Length)
        {
            arrSuffInfo.Insert(arrSuffInfo.Length, 1);
            arrSuffInfo[arrSuffInfo.Length - 1].kSuffer = Victim;
            DamageLog(Victim, float(BaseParams.iDamage), 0.0);
            Victim.TakeDamage(BaseParams.iDamage, Instigator, Victim.Location, vect(0.0, 0.0, 0.0), ResParams,, 8);
            arrSuffInfo[arrSuffInfo.Length - 1].fLastSuff = Level.TimeSeconds;
        }                
    }
}

simulated function PostNetBeginPlay()
{
    local PlayerController PC;

    super(Actor).PostNetBeginPlay();
    // End:0x21
    if(Level.NetMode == 1)
    {
        return;
    }
    // End:0x61
    if(Level.bDropDetail || Level.DetailMode == 0)
    {
        bDynamicLight = false;
        LightType = 0;
    }
    // End:0xfc
    else
    {
        PC = Level.GetLocalPlayerController();
        // End:0x9d
        if(Instigator != none && PC == Instigator.Controller)
        {
            return;
        }
        // End:0xfc
        if(PC == none || PC.ViewTarget == none || VSize(PC.ViewTarget.Location - Location) > float(3000))
        {
            bDynamicLight = false;
            LightType = 0;
        }
    }
}

defaultproperties
{
    fDamageDelay=0.50
    fTimeGrow=1.0
    fMinColRadius=10.0
    fMinColHeight=10.0
    fMaxColRadius=60.0
    fMaxColHeight=60.0
    MyDamageType=Class'Engine.wDamageFlameThrower'
    LightType=1
    LightEffect=21
    LightHue=30
    LightSaturation=150
    LightBrightness=255.0
    LightRadius=15.0
    CullDistance=7500.0
    AmbientGlow=96
}