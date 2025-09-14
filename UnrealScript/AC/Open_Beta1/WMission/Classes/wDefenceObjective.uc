class wDefenceObjective extends wFlagObjectiveBase
    hidecategories(Lighting,LightColor,Karma,Force);

var() float DamageCapacity;
var float Health;
var float CurHealth;
var float fDecreaseRate;
var float fPrevTickTime;
var() StaticMesh DestroyedStaticMesh;
var StaticMesh OriginalMesh;
var StaticMesh OldStaticMesh;
var Sound DamageSound;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        Health;
}

function AddNewTouchingPlayer(Pawn P)
{
    //return;    
}

function RemoveTouchingPlayer(Pawn P)
{
    //return;    
}

simulated event PostBeginPlay()
{
    local wMatchMaker rMM;

    super(GameObjective).PostBeginPlay();
    rMM = Level.GetMatchMaker();
    // End:0x5B
    if((rMM != none) && rMM.szGameClass != ApplyGameInfo)
    {
        bHidden = true;
        bCanActive = false;
        bActive = false;        
    }
    else
    {
        bActive = true;
    }
    // End:0x9E
    if(Level.GetMatchMaker().bChangingHost == false)
    {
        Reset();
        Health = DamageCapacity;
        CurHealth = DamageCapacity;
    }
    OriginalMesh = StaticMesh;
    OldStaticMesh = StaticMesh;
    // End:0xCC
    if(DamageCapacity <= float(0))
    {
        DamageCapacity = 100.0000000;
    }
    fDecreaseRate = DamageCapacity / float(8);
    //return;    
}

function Reset()
{
    // End:0x27
    if(DestroyedStaticMesh != none)
    {
        KSetBlockKarma(false);
        SetStaticMesh(OriginalMesh);
        KSetBlockKarma(true);        
    }
    else
    {
        bHidden = false;
    }
    SetCollision(true, bBlockActors);
    super.Reset();
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    PlaySound(DamageSound, 0,,, 5000.0000000);
    Health -= float(Damage);
    // End:0x37
    if(Health < float(0))
    {
        Health = 0.0000000;
    }
    // End:0x4F
    if(Health == float(0))
    {
        DisableObjective(Instigator);
    }
    //return;    
}

function DisableObjective(Pawn Instigator)
{
    // End:0x3D
    if((!bActive || bDisabled) || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return;
    }
    super(GameObjective).DisableObjective(Instigator);
    // End:0x79
    if(DestroyedStaticMesh != none)
    {
        KSetBlockKarma(false);
        SetStaticMesh(DestroyedStaticMesh);
        SetCollision(true, bBlockActors);
        KSetBlockKarma(true);        
    }
    else
    {
        SetCollision(false, bBlockActors);
        bHidden = true;
    }
    //return;    
}

simulated function float GetObjectiveProgress()
{
    local float fDeltaTime;

    // End:0x0F
    if(bDisabled)
    {
        return 0.0000000;
    }
    // End:0x66
    if(Health != CurHealth)
    {
        fDeltaTime = Level.TimeSeconds - fPrevTickTime;
        CurHealth -= (fDeltaTime * fDecreaseRate);
        // End:0x66
        if(CurHealth < Health)
        {
            CurHealth = Health;
        }
    }
    fPrevTickTime = Level.TimeSeconds;
    return CurHealth / DamageCapacity;
    //return;    
}

simulated function PostNetReceive()
{
    super(GameObjective).PostNetReceive();
    // End:0x2E
    if(OldStaticMesh != StaticMesh)
    {
        KSetBlockKarma(false);
        KSetBlockKarma(true);
        OldStaticMesh = StaticMesh;
    }
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    // End:0x25
    if(DestroyedStaticMesh != none)
    {
        Level.AddPrecacheStaticMesh(DestroyedStaticMesh);
    }
    //return;    
}

defaultproperties
{
    DamageCapacity=100.0000000
    DamageSound=SoundGroup'Warfare_Sound_Defense_Mode.Object.bombing'
    ObjectiveName="Defence Objective"
    ApplyGameInfo="wMission.wDefenceGameInfo"
    DrawType=2
    bHidden=false
    Mesh=SkeletalMesh'WP_ETC_Flag.flag'
    bStaticLighting=true
    CollisionRadius=300.0000000
    bBlockActors=true
    bBlockKarma=true
    bEdShouldSnap=true
}