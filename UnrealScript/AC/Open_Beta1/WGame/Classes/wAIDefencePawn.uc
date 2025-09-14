class wAIDefencePawn extends wAIPawn;

var float ReacheRadius;

simulated function PostBeginPlay()
{
    super(wPawn).PostBeginPlay();
    ReacheRadius = CollisionRadius * float(2);
    // End:0x38
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        bIsNeedUpdateAnim = false;
    }
    //return;    
}

function PlayDyingAnimation(Class<DamageType> DamageType, Vector HitLoc)
{
    local PlayerController PC;

    // End:0x0D
    if(Mesh == none)
    {
        return;
    }
    // End:0x46
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x46
        if(Level.GetIsNoGore() == false)
        {
            MakeGorePawn(iDiedCollisionPart);
        }
    }
    Velocity += TearOffMomentum;
    BaseEyeHeight = default.BaseEyeHeight;
    // End:0xBF
    if(OldController != none)
    {
        PC = PlayerController(OldController);
        // End:0xBC
        if(((PC == none) || PC.ViewTarget != self) || Viewport(PC.Player) == none)
        {
            SetTwistLook(0, 0);
        }        
    }
    else
    {
        SetTwistLook(0, 0);
    }
    SetInvisibility(0.0000000);
    PlayDirectionalDeath(HitLoc);
    SetPhysics(2);
    //return;    
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    //return;    
}

function AddDefaultSkills(optional bool bQuickslotChange)
{
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Alpha;
    //return;    
}

simulated function SpawnGoreGiblet(int iIndex)
{
    //return;    
}

simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation)
{
    //return;    
}

function int SpawnSupplyItem()
{
    return 0;
    //return;    
}

simulated function FootStepping(int side)
{
    PlaySound(SoundFootsteps_3rd[0], 0, FootstepVolume,, 105.0000000,, true,,, false);
    //return;    
}

event PlayLandedSound(int SurfType)
{
    // End:0x6D
    if(((Health > 0) && !bHidden) && (Level.TimeSeconds - SplashTime) > 0.2500000)
    {
        PlayOwnedSound(SoundFootsteps_3rd[0], 0, FMin(1.0000000, (-0.6000000 * Velocity.Z) / JumpZ),, 95.0000000);
    }
    //return;    
}

event bool CheckUpdateAnimation()
{
    return !int(Level.NetMode) == int(NM_DedicatedServer);
    //return;    
}

function bool deleOnReachedDestination(Vector Dir, Actor GoalActor)
{
    local float Size;

    Size = VSize(Dir);
    return Size < ReacheRadius;
    //return;    
}

defaultproperties
{
    FootstepVolume=1.0000000
    GibGroupClass=Class'XEffects.xAlienPawnGidGroup'
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_alpha.char_enemy_move_alpha'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_alpha.char_enemy_wail_alpha'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_alpha.char_enemy_death_alpha'
    bDoNotBackPathFinding=true
    bDoTorsoTwist=false
    TakeoffStillAnim="AR_Idle"
    AirStillAnim="AR_Idle"
    TakeoffAnims[0]="AR_Idle"
    TakeoffAnims[1]="AR_Idle"
    TakeoffAnims[2]="AR_Idle"
    TakeoffAnims[3]="AR_Idle"
    AirAnims[0]="AR_Idle"
    AirAnims[1]="AR_Idle"
    AirAnims[2]="AR_Idle"
    AirAnims[3]="AR_Idle"
    LandAnims[0]="AR_Idle"
    LandAnims[1]="AR_Idle"
    LandAnims[2]="AR_Idle"
    LandAnims[3]="AR_Idle"
    LandAnims[4]="AR_Idle"
    CrouchAnims[0]="AR_Idle"
    CrouchAnims[1]="AR_Idle"
    CrouchAnims[2]="AR_Idle"
    CrouchAnims[3]="AR_Idle"
    OnReachedDestination=wAIDefencePawn.deleOnReachedDestination
    CollisionRadius=65.0000000
    CollisionHeight=60.0000000
    RotationRate=(Pitch=4096,Yaw=4000,Roll=3072)
}