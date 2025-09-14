/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wDefenceObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:9
 *
 *******************************************************************************/
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
    // Pos:0x00
    reliable if(Role == 4)
        Health;

}

function AddNewTouchingPlayer(Pawn P);
function RemoveTouchingPlayer(Pawn P);
simulated event PostBeginPlay()
{
    local wMatchMaker rMM;

    super(GameObjective).PostBeginPlay();
    rMM = Level.GetMatchMaker();
    // End:0x5b
    if(rMM != none && rMM.szGameClass != ApplyGameInfo)
    {
        bHidden = true;
        bCanActive = false;
        bActive = false;
    }
    // End:0x63
    else
    {
        bActive = true;
    }
    // End:0x9e
    if(Level.GetMatchMaker().bChangingHost == false)
    {
        Reset();
        Health = DamageCapacity;
        CurHealth = DamageCapacity;
    }
    OriginalMesh = StaticMesh;
    OldStaticMesh = StaticMesh;
    // End:0xcc
    if(DamageCapacity <= float(0))
    {
        DamageCapacity = 100.0;
    }
    fDecreaseRate = DamageCapacity / float(8);
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
    // End:0x2f
    else
    {
        bHidden = false;
    }
    SetCollision(true, bBlockActors);
    super.Reset();
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    PlaySound(DamageSound, 0,,, 5000.0);
    Health -= float(Damage);
    // End:0x37
    if(Health < float(0))
    {
        Health = 0.0;
    }
    // End:0x4f
    if(Health == float(0))
    {
        DisableObjective(Instigator);
    }
}

function DisableObjective(Pawn Instigator)
{
    // End:0x3d
    if(!bActive || bDisabled || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
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
    // End:0x8b
    else
    {
        SetCollision(false, bBlockActors);
        bHidden = true;
    }
}

simulated function float GetObjectiveProgress()
{
    local float fDeltaTime;

    // End:0x0f
    if(bDisabled)
    {
        return 0.0;
    }
    // End:0x66
    if(Health != CurHealth)
    {
        fDeltaTime = Level.TimeSeconds - fPrevTickTime;
        CurHealth -= fDeltaTime * fDecreaseRate;
        // End:0x66
        if(CurHealth < Health)
        {
            CurHealth = Health;
        }
    }
    fPrevTickTime = Level.TimeSeconds;
    return CurHealth / DamageCapacity;
}

simulated function PostNetReceive()
{
    super(GameObjective).PostNetReceive();
    // End:0x2e
    if(OldStaticMesh != StaticMesh)
    {
        KSetBlockKarma(false);
        KSetBlockKarma(true);
        OldStaticMesh = StaticMesh;
    }
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    // End:0x25
    if(DestroyedStaticMesh != none)
    {
        Level.AddPrecacheStaticMesh(DestroyedStaticMesh);
    }
}

defaultproperties
{
    DamageCapacity=100.0
    DamageSound=SoundGroup'Warfare_Sound_Defense_Mode.Object.bombing'
    ObjectiveName="Defence Objective"
    ApplyGameInfo="wMission.wDefenceGameInfo"
    DrawType=2
    bHidden=true
    Mesh=SkeletalMesh'WP_ETC_Flag.flag'
    bStaticLighting=true
    CollisionRadius=300.0
    bBlockActors=true
    bBlockKarma=true
    bEdShouldSnap=true
}