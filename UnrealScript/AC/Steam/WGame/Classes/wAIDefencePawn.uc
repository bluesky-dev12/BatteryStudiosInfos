/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIDefencePawn.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:12
 *
 *******************************************************************************/
class wAIDefencePawn extends wAIPawn;

var float ReacheRadius;

simulated function PostBeginPlay()
{
    super(wPawn).PostBeginPlay();
    ReacheRadius = CollisionRadius * float(2);
    // End:0x38
    if(Level.NetMode == 1)
    {
        bIsNeedUpdateAnim = false;
    }
}

function PlayDyingAnimation(class<DamageType> DamageType, Vector HitLoc)
{
    local PlayerController PC;

    // End:0x0d
    if(Mesh == none)
    {
        return;
    }
    // End:0x46
    if(Level.NetMode != 1)
    {
        // End:0x46
        if(Level.GetIsNoGore() == false)
        {
            MakeGorePawn(iDiedCollisionPart);
        }
    }
    Velocity += TearOffMomentum;
    BaseEyeHeight = default.BaseEyeHeight;
    // End:0xbf
    if(OldController != none)
    {
        PC = PlayerController(OldController);
        // End:0xbc
        if(PC == none || PC.ViewTarget != self || Viewport(PC.Player) == none)
        {
            SetTwistLook(0, 0);
        }
    }
    // End:0xc7
    else
    {
        SetTwistLook(0, 0);
    }
    SetInvisibility(0.0);
    PlayDirectionalDeath(HitLoc);
    SetPhysics(2);
}

function AddDefaultInventory(optional bool bQuickslotChange);
function AddDefaultSkills(optional bool bQuickslotChange);
simulated function class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return class'xAlienPawnGidGroup'.default.BloodHitClass_Alpha;
}

simulated function SpawnGoreGiblet(int iIndex);
simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation);
function int SpawnSupplyItem()
{
    return 0;
}

simulated function FootStepping(int side)
{
    PlaySound(SoundFootsteps_3rd[0], 0, FootstepVolume,, 105.0,, true,,, false);
}

event PlayLandedSound(int SurfType)
{
    // End:0x6d
    if(Health > 0 && !bHidden && Level.TimeSeconds - SplashTime > 0.250)
    {
        PlayOwnedSound(SoundFootsteps_3rd[0], 0, FMin(1.0, -0.60 * Velocity.Z / JumpZ),, 95.0);
    }
}

event bool CheckUpdateAnimation()
{
    return !Level.NetMode == 1;
}

function bool deleOnReachedDestination(Vector Dir, Actor GoalActor)
{
    local float Size;

    Size = VSize(Dir);
    return Size < ReacheRadius;
}

defaultproperties
{
    FootstepVolume=1.0
    GibGroupClass=Class'XEffects.xAlienPawnGidGroup'
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_alpha.char_enemy_move_alpha'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_alpha.char_enemy_wail_alpha'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_alpha.char_enemy_death_alpha'
    bDoNotBackPathFinding=true
    bDoTorsoTwist=true
    TakeoffStillAnim=AR_Idle
    AirStillAnim=AR_Idle
    TakeoffAnims[0]=AR_Idle
    TakeoffAnims[1]=AR_Idle
    TakeoffAnims[2]=AR_Idle
    TakeoffAnims[3]=AR_Idle
    AirAnims[0]=AR_Idle
    AirAnims[1]=AR_Idle
    AirAnims[2]=AR_Idle
    AirAnims[3]=AR_Idle
    LandAnims[0]=AR_Idle
    LandAnims[1]=AR_Idle
    LandAnims[2]=AR_Idle
    LandAnims[3]=AR_Idle
    LandAnims[4]=AR_Idle
    CrouchAnims[0]=AR_Idle
    CrouchAnims[1]=AR_Idle
    CrouchAnims[2]=AR_Idle
    CrouchAnims[3]=AR_Idle
    OnReachedDestination=deleOnReachedDestination
    CollisionRadius=65.0
    CollisionHeight=60.0
    RotationRate=(Pitch=4096,Yaw=4000,Roll=3072)
}