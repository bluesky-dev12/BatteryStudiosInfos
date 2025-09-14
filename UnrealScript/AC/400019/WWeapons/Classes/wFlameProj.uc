class wFlameProj extends wProjectile;

struct SuffInfo
{
    var Pawn kSuffer;
    var float fLastSuff;
};

var Class<Emitter> classEmiFlame;
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
    wLoadEmitter();
    //return;    
}

simulated function wLoadEmitter()
{
    local Coords cor;
    local Rotator rRot;

    SetSpeed(BaseParams.fProjSpeed);
    // End:0x49
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        emiFlame = Spawn(Class'XEffects.EF_Bullet_M2B_Fire', self);
        emiFlame.SetBase(self);
    }
    //return;    
}

simulated function Destroyed()
{
    // End:0x1A
    if(emiFlame != none)
    {
        emiFlame.Kill();
    }
    super(Actor).Destroyed();
    //return;    
}

function SetSpeed(float fSpeed)
{
    Speed = fSpeed;
    Velocity = Speed * Vector(Rotation);
    //return;    
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    super(Projectile).HitWall(HitNormal, Wall, HitMaterial);
    SetSpeed(0.0000000);
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    //return;    
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    VictimSearch();
    //return;    
}

simulated function VictimSearch()
{
    local Pawn Victim;
    local int i;
    local float fLerpValue, fCurColRadius, fCurColHeight;

    fLerpValue = TimerCounter / fTimeGrow;
    fLerpValue = float(Min(1, int(fLerpValue)));
    fCurColRadius = fMinColRadius + ((fMaxColRadius - fMinColRadius) * fLerpValue);
    fCurColHeight = fMinColHeight + ((fMaxColHeight - fMinColHeight) * fLerpValue);
    SetCollisionSize(fCurColRadius, fCurColHeight);
    // End:0x234
    foreach TouchingActors(Class'Engine.Pawn', Victim)
    {
        i = 0;
        J0x88:

        // End:0x172 [Loop If]
        if(i < arrSuffInfo.Length)
        {
            // End:0x168
            if(arrSuffInfo[i].kSuffer == Victim)
            {
                // End:0x165
                if((arrSuffInfo[i].fLastSuff + fDamageDelay) <= Level.TimeSeconds)
                {
                    DamageLog(Victim, float(BaseParams.iDamage), 0.0000000);
                    Victim.TakeDamage(BaseParams.iDamage, Instigator, Victim.Location, vect(0.0000000, 0.0000000, 0.0000000), ResParams,, int(8));
                    arrSuffInfo[i].fLastSuff = Level.TimeSeconds;
                    // [Explicit Continue]
                    goto J0x168;
                }
                // [Explicit Break]
                goto J0x172;
            }
            J0x168:

            i++;
            // [Loop Continue]
            goto J0x88;
        }
        J0x172:

        // End:0x233
        if(i == arrSuffInfo.Length)
        {
            arrSuffInfo.Insert(arrSuffInfo.Length, 1);
            arrSuffInfo[arrSuffInfo.Length - 1].kSuffer = Victim;
            DamageLog(Victim, float(BaseParams.iDamage), 0.0000000);
            Victim.TakeDamage(BaseParams.iDamage, Instigator, Victim.Location, vect(0.0000000, 0.0000000, 0.0000000), ResParams,, int(8));
            arrSuffInfo[arrSuffInfo.Length - 1].fLastSuff = Level.TimeSeconds;
        }        
    }    
    //return;    
}

simulated function PostNetBeginPlay()
{
    local PlayerController PC;

    super(Actor).PostNetBeginPlay();
    // End:0x21
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x61
    if(Level.bDropDetail || int(Level.DetailMode) == int(0))
    {
        bDynamicLight = false;
        LightType = 0;        
    }
    else
    {
        PC = Level.GetLocalPlayerController();
        // End:0x9D
        if((Instigator != none) && PC == Instigator.Controller)
        {
            return;
        }
        // End:0xFC
        if(((PC == none) || PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(3000))
        {
            bDynamicLight = false;
            LightType = 0;
        }
    }
    //return;    
}

defaultproperties
{
    fDamageDelay=0.5000000
    fTimeGrow=1.0000000
    fMinColRadius=10.0000000
    fMinColHeight=10.0000000
    fMaxColRadius=60.0000000
    fMaxColHeight=60.0000000
    MyDamageType=Class'Engine.wDamageFlameThrower'
    LightType=1
    LightEffect=21
    LightHue=30
    LightSaturation=150
    LightBrightness=255.0000000
    LightRadius=15.0000000
    CullDistance=7500.0000000
    AmbientGlow=96
}