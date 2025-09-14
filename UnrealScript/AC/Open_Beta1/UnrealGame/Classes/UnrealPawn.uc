class UnrealPawn extends Pawn
    abstract;

var() bool bNoDefaultInventory;
var bool bAcceptAllInventory;
var(AI) bool bIsSquadLeader;
var bool bSoakDebug;
var bool bKeepTaunting;
var bool bPlayOwnFootsteps;
var byte LoadOut;
var byte SelectedEquipment[16];
var() string RequiredEquipment[16];
var string OptionalEquipment[16];
var float AttackSuitability;
var float LastFootStepTime;
var Actor.EDoubleClickDir CurrentDir;
var Vector GameObjOffset;
var Rotator GameObjRot;
var(AI) name SquadName;
var string VoiceType;
var bool bPlayerShadows;
var bool bBlobShadow;
var int Spree;
var int iCheckBreath;

function DropFlag(optional string sReason)
{
    // End:0x23
    if((PlayerReplicationInfo == none) || PlayerReplicationInfo.HasFlag == none)
    {
        return;
    }
    PlayerReplicationInfo.HasFlag.Drop(Velocity * 0.5000000, sReason);
    //return;    
}

simulated function bool FindValidTaunt(out name Sequence)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < TauntAnims.Length)
    {
        // End:0x2E
        if(Sequence == TauntAnims[i])
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function gibbedBy(Actor Other)
{
    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0xC3
    if(Pawn(Other) != none)
    {
        // End:0x9D
        if((Pawn(Other).Weapon != none) && Pawn(Other).Weapon.IsA('Translauncher'))
        {
            Died(Pawn(Other).Controller, Pawn(Other).Weapon.GetDamageType(), Location);            
        }
        else
        {
            Died(Pawn(Other).Controller, Class'Engine.DamTypeTelefragged', Location);
        }        
    }
    else
    {
        Died(none, Class'Engine.Gibbed', Location);
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string t;
    local float XL;

    // End:0x22
    if(!bSoakDebug)
    {
        super.DisplayDebug(Canvas, YL, YPos);
        return;
    }
    Canvas.Style = 1;
    Canvas.StrLen("TEST", XL, YL);
    YPos = YPos + (float(8) * YL);
    Canvas.SetPos(4.0000000, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), 0);
    t = GetDebugName();
    // End:0xD9
    if(bDeleteMe)
    {
        t = t $ " DELETED (bDeleteMe == true)";
    }
    Canvas.DrawText(t, false);
    YPos += (float(3) * YL);
    Canvas.SetPos(4.0000000, YPos);
    // End:0x17B
    if(Controller == none)
    {
        Canvas.SetDrawColor(byte(255), 0, 0);
        Canvas.DrawText("NO CONTROLLER");
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);        
    }
    else
    {
        Controller.DisplayDebug(Canvas, YL, YPos);
    }
    YPos += (float(2) * YL);
    Canvas.SetPos(4.0000000, YPos);
    Canvas.SetDrawColor(0, byte(255), byte(255));
    Canvas.DrawText((((("Anchor " $ string(Anchor)) $ " Serpentine Dist ") $ string(SerpentineDist)) $ " Time ") $ string(SerpentineTime));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    t = (((((("Floor " $ string(Floor)) $ " DesiredSpeed ") $ string(DesiredSpeed)) $ " Crouched ") $ string(bIsCrouched)) $ " Try to uncrouch ") $ string(UncrouchTime);
    // End:0x2F9
    if((OnLadder != none) || int(Physics) == int(11))
    {
        t = (t $ " on ladder ") $ string(OnLadder);
    }
    Canvas.DrawText(t);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function Vector BotDodge(Vector Dir)
{
    local Vector Vel;

    Vel = GroundSpeed * Dir;
    Vel.Z = JumpZ;
    return Vel;
    //return;    
}

function HoldFlag(Actor FlagActor)
{
    // End:0x33
    if(GameObject(FlagActor) != none)
    {
        HoldGameObject(GameObject(FlagActor), GameObject(FlagActor).GameObjBone);
    }
    //return;    
}

function HoldGameObject(GameObject gameObj, name GameObjBone)
{
    // End:0x5A
    if(GameObjBone == 'None')
    {
        gameObj.SetPhysics(5);
        gameObj.SetLocation(Location);
        gameObj.SetBase(self);
        gameObj.SetRelativeLocation(vect(0.0000000, 0.0000000, 0.0000000));        
    }
    else
    {
        AttachToBone(gameObj, GameObjBone);
        gameObj.SetRelativeRotation(GameObjRot + gameObj.GameObjRot);
        gameObj.SetRelativeLocation(GameObjOffset + gameObj.GameObjOffset);
    }
    //return;    
}

function EndJump()
{
    //return;    
}

simulated function ShouldUnCrouch()
{
    //return;    
}

simulated event SetAnimAction(name NewAction)
{
    AnimAction = NewAction;
    PlayAnim(AnimAction);
    //return;    
}

function string GetDebugName()
{
    // End:0x5B
    if(((Bot(Controller) != none) && Bot(Controller).bSoaking) && Level.Pauser != none)
    {
        return (GetHumanReadableName()) @ Bot(Controller).SoakString;
    }
    // End:0x75
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;
    }
    return GetItemName(string(self));
    //return;    
}

function name GetWeaponBoneFor(Inventory i)
{
    return 'weapon_bone';
    //return;    
}

function CheckBob(float DeltaTime, Vector Y)
{
    local float OldBobTime;
    local int M, N;
    local float fStaminaRatio;

    OldBobTime = bobtime;
    super.CheckBob(DeltaTime, Y);
    // End:0x6A
    if(((int(Physics) != int(1)) || VSize(Velocity) < float(10)) || (PlayerController(Controller) != none) && PlayerController(Controller).bBehindView)
    {
        return;
    }
    M = int((0.5000000 * 3.1415927) + ((8.0000000 * OldBobTime) / 3.1415927));
    N = int((0.5000000 * 3.1415927) + ((8.0000000 * bobtime) / 3.1415927));
    fStaminaRatio = PlayerController(Controller).fSprintTime / wMyParam.Stm_MaxTime;
    // End:0x13A
    if((((M != N) && !bIsCrouched) && !bIsProned) && !bIsAiming)
    {
        FootStepping(0);
        // End:0x137
        if(fStaminaRatio < 0.2500000)
        {
            PlayBreathSounds();
        }        
    }
    else
    {
        // End:0x1C8
        if(((((!bWeaponBob && bPlayOwnFootsteps) && !bIsCrouched) && !bIsProned) && !bIsAiming) && (Level.TimeSeconds - LastFootStepTime) > 0.3500000)
        {
            LastFootStepTime = Level.TimeSeconds;
            FootStepping(0);
            // End:0x1C8
            if(fStaminaRatio < 0.2500000)
            {
                PlayBreathSounds();
            }
        }
    }
    //return;    
}

simulated function PlayBreathSounds()
{
    // End:0x25
    if((iCheckBreath > 3) && Rand(3) > 1)
    {
        PlayBreathSound();
        iCheckBreath = 0;
    }
    PlayEquipHitSound();
    iCheckBreath++;
    //return;    
}

function bool IsInLoadout(Class<Inventory> InventoryClass)
{
    local int i;
    local string invstring;

    // End:0x0B
    if(bAcceptAllInventory)
    {
        return true;
    }
    invstring = string(InventoryClass);
    i = 0;
    J0x1F:

    // End:0x64 [Loop If]
    if(i < 16)
    {
        // End:0x45
        if(RequiredEquipment[i] ~= invstring)
        {
            return true;
            // [Explicit Continue]
            goto J0x5A;
        }
        // End:0x5A
        if(RequiredEquipment[i] == "")
        {
            // [Explicit Break]
            goto J0x64;
        }
        J0x5A:

        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    J0x64:

    i = 0;
    J0x6B:

    // End:0xB0 [Loop If]
    if(i < 16)
    {
        // End:0x91
        if(OptionalEquipment[i] ~= invstring)
        {
            return true;
            // [Explicit Continue]
            goto J0xA6;
        }
        // End:0xA6
        if(OptionalEquipment[i] == "")
        {
            // [Explicit Break]
            goto J0xB0;
        }
        J0xA6:

        i++;
        // [Loop Continue]
        goto J0x6B;
    }
    J0xB0:

    return false;
    //return;    
}

function AddDefaultInventoryDOA(optional bool bQuickslotChange)
{
    // End:0x1F
    if(Inventory != none)
    {
        Inventory.OwnerEvent('LoadOut');
    }
    //return;    
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    // End:0x1F
    if(Inventory != none)
    {
        Inventory.OwnerEvent('LoadOut');
    }
    //return;    
}

function Inventory CustomCreateInventory(string WeaponClassName)
{
    local Inventory Inv;

    // End:0x42
    if(IsLocallyControlled())
    {
        // End:0x26
        if(WeaponClassName != "")
        {
            Inv = CreateInventory(WeaponClassName);
        }
        Level.Game.AddGameSpecificInventory(self);        
    }
    else
    {
        Level.Game.AddGameSpecificInventory(self);
        // End:0x78
        if(WeaponClassName != "")
        {
            Inv = CreateInventory(WeaponClassName);
        }
    }
    // End:0x97
    if(Inventory != none)
    {
        Inventory.OwnerEvent('LoadOut');
    }
    Controller.ClientSwitchToBestWeapon();
    return Inv;
    //return;    
}

function Inventory CreateInventory(string InventoryClassName)
{
    local Inventory Inv;
    local Class<Inventory> InventoryClass;

    Log("[UnrealPawn::CreateInventory] InventoryClassName" $ InventoryClassName);
    InventoryClass = Level.Game.BaseMutator.GetInventoryClass(InventoryClassName);
    // End:0xD2
    if(InventoryClass != none)
    {
        Inv = Spawn(InventoryClass);
        // End:0xD0
        if(Inv != none)
        {
            Inv.InventoryClassName = InventoryClassName;
            Inv.GiveTo(self);
            // End:0xCA
            if(Inv != none)
            {
                Inv.PickupFunction(self);
            }
            return Inv;
        }
        return none;
    }
    return none;
    //return;    
}

function bool PerformDodge(Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross)
{
    //return;    
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
    local Vector X, Y, Z;

    // End:0x28
    if((bIsCrouched || bWantsToCrouch) || int(Physics) != int(1))
    {
        return false;
    }
    GetAxes(Rotation, X, Y, Z);
    // End:0x7F
    if(int(DoubleClickMove) == int(3))
    {
        Velocity = ((1.5000000 * GroundSpeed) * X) + ((Velocity Dot Y) * Y);        
    }
    else
    {
        // End:0xC0
        if(int(DoubleClickMove) == int(4))
        {
            Velocity = ((-1.5000000 * GroundSpeed) * X) + ((Velocity Dot Y) * Y);            
        }
        else
        {
            // End:0x101
            if(int(DoubleClickMove) == int(1))
            {
                Velocity = ((1.5000000 * GroundSpeed) * Y) + ((Velocity Dot X) * X);                
            }
            else
            {
                // End:0x13F
                if(int(DoubleClickMove) == int(2))
                {
                    Velocity = ((-1.5000000 * GroundSpeed) * Y) + ((Velocity Dot X) * X);
                }
            }
        }
    }
    Velocity.Z = 210.0000000;
    CurrentDir = DoubleClickMove;
    SetPhysics(2);
    return true;
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

simulated function PostNetBeginPlay()
{
    local SquadAI S;
    local RosterEntry R;

    super.PostNetBeginPlay();
    // End:0x11C
    if((int(Role) == int(ROLE_Authority)) && Level.bStartup)
    {
        // End:0xE9
        if(UnrealMPGameInfo(Level.Game) == none)
        {
            // End:0xE6
            if(Bot(Controller) != none)
            {
                // End:0x6C
                foreach DynamicActors(Class'UnrealGame_Decompressed.SquadAI', S, SquadName)
                {
                    // End:0x6C
                    break;                    
                }                
                // End:0x86
                if(S == none)
                {
                    S = Spawn(Class'UnrealGame_Decompressed.SquadAI');
                }
                S.Tag = SquadName;
                // End:0xCD
                if(bIsSquadLeader || S.SquadLeader == none)
                {
                    S.SetLeader(Controller);
                }
                S.AddBot(Bot(Controller));
            }            
        }
        else
        {
            R = GetPlacedRoster();
            UnrealMPGameInfo(Level.Game).InitPlacedBot(Controller, R);
        }
    }
    //return;    
}

function RosterEntry GetPlacedRoster()
{
    return none;
    //return;    
}

function SetMovementPhysics()
{
    // End:0x12
    if(int(Physics) == int(2))
    {
        return;
    }
    // End:0x2C
    if(PhysicsVolume.bWaterVolume)
    {
        SetPhysics(3);        
    }
    else
    {
        SetPhysics(1);
    }
    //return;    
}

function TakeDrowningDamage()
{
    TakeDamage(5, none, (Location + (CollisionHeight * vect(0.0000000, 0.0000000, 0.5000000))) + ((0.7000000 * CollisionRadius) * Vector(Controller.Rotation)), vect(0.0000000, 0.0000000, 0.0000000), Class'Gameplay.Drowned');
    //return;    
}

function int GetSpree()
{
    return Spree;
    //return;    
}

function IncrementSpree()
{
    Spree++;
    //return;    
}

simulated function PlayFootStep(int side)
{
    MakeNoise(0.2000000);
    // End:0x70
    if((((int(Role) == int(ROLE_SimulatedProxy)) || PlayerController(Controller) == none) || PlayerController(Controller).bBehindView) || Level.GetLocalPlayerController() != PlayerController(Controller))
    {
        FootStepping(side);
        return;
    }
    //return;    
}

simulated function ChunkUp(Rotator HitRotation, float ChunkPerterbation)
{
    // End:0x57
    if((int(Level.NetMode) != int(NM_Client)) && Controller != none)
    {
        // End:0x4B
        if(Controller.bIsPlayer)
        {
            Controller.PawnDied(self);            
        }
        else
        {
            Controller.Destroy();
        }
    }
    bTearOff = true;
    HitDamageType = Class'Engine.Gibbed';
    // End:0xA5
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
    {
        GotoState('TimingOut');
    }
    // End:0xC0
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0xD7
    if(Class'Engine.GameInfo'.static.UseLowGore())
    {
        Destroy();
        return;
    }
    SpawnGibs(HitRotation, ChunkPerterbation);
    // End:0x103
    if(int(Level.NetMode) != int(NM_ListenServer))
    {
        Destroy();
    }
    //return;    
}

simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation)
{
    //return;    
}

state TimingOut
{
    ignores BeginState, TakeDamage;

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }

    function BeginState()
    {
        SetPhysics(0);
        SetCollision(false, false, false);
        LifeSpan = 1.0000000;
        // End:0x52
        if(Controller != none)
        {
            // End:0x46
            if(Controller.bIsPlayer)
            {
                Controller.PawnDied(self);                
            }
            else
            {
                Controller.Destroy();
            }
        }
        //return;        
    }
    stop;    
}

state Dying
{
    ignores BeginState, BaseChange, Landed;

    function Landed(Vector HitNormal)
    {
        // End:0x1B
        if(int(Level.NetMode) == int(NM_DedicatedServer))
        {
            return;
        }
        // End:0x32
        if(Shadow != none)
        {
            Shadow.Destroy();
        }
        //return;        
    }

    singular function BaseChange()
    {
        super.BaseChange();
        //return;        
    }

    function BeginState()
    {
        local int i;

        SetCollision(true, false, false);
        // End:0x38
        if(bTearOff && int(Level.NetMode) == int(NM_DedicatedServer))
        {
            LifeSpan = 1.0000000;            
        }
        else
        {
            SetTimer(2.0000000, false);
        }
        // End:0x56
        if(int(Physics) != int(14))
        {
            SetPhysics(2);
        }
        bInvulnerableBody = true;
        // End:0x9A
        if(Controller != none)
        {
            // End:0x8E
            if(Controller.bIsPlayer)
            {
                Controller.PawnDied(self);                
            }
            else
            {
                Controller.Destroy();
            }
        }
        i = 0;
        J0xA1:

        // End:0xE1 [Loop If]
        if(i < Attached.Length)
        {
            // End:0xD7
            if(Attached[i] != none)
            {
                Attached[i].PawnBaseDied();
            }
            i++;
            // [Loop Continue]
            goto J0xA1;
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bAcceptAllInventory=true
    bPlayOwnFootsteps=true
    LoadOut=255
    AttackSuitability=0.5000000
    SquadName="Squad"
    bPlayerShadows=true
    bCanCrouch=true
    bCanSwim=true
    bCanClimbLadders=true
    bCanStrafe=true
    bCanPickupInventory=true
    bMuffledHearing=true
    SightRadius=12000.0000000
    MeleeRange=20.0000000
    GroundSpeed=600.0000000
    AirSpeed=600.0000000
    AirControl=0.3500000
    BaseEyeHeight=60.0000000
    EyeHeight=60.0000000
    CrouchHeight=39.0000000
    UnderWaterTime=20.0000000
    ControllerClass=Class'UnrealGame_Decompressed.Bot'
    LightHue=40
    LightSaturation=128
    LightBrightness=70.0000000
    LightRadius=6.0000000
    bStasis=false
    AmbientGlow=40
    bUseCylinderCollision=true
    Buoyancy=99.0000000
    RotationRate=(Pitch=0,Yaw=20000,Roll=2048)
    ForceType=1
    ForceRadius=100.0000000
    ForceScale=2.5000000
}