/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealPawn.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:31
 *	States:2
 *
 *******************************************************************************/
class UnrealPawn extends Pawn
    dependson(UnrealMPGameInfo)
    dependson(GameObject)
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
var Engine.Actor.EDoubleClickDir CurrentDir;
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
    if(PlayerReplicationInfo == none || PlayerReplicationInfo.HasFlag == none)
    {
        return;
    }
    PlayerReplicationInfo.HasFlag.Drop(Velocity * 0.50, sReason);
}

simulated function bool FindValidTaunt(out name Sequence)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < TauntAnims.Length)
    {
        // End:0x2e
        if(Sequence == TauntAnims[i])
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function gibbedBy(Actor Other)
{
    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0xc3
    if(Pawn(Other) != none)
    {
        // End:0x9d
        if(Pawn(Other).Weapon != none && Pawn(Other).Weapon.IsA('Translauncher'))
        {
            Died(Pawn(Other).Controller, Pawn(Other).Weapon.GetDamageType(), Location);
        }
        // End:0xc0
        else
        {
            Died(Pawn(Other).Controller, class'DamTypeTelefragged', Location);
        }
    }
    // End:0xd4
    else
    {
        Died(none, class'Gibbed', Location);
    }
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
    YPos = YPos + float(8) * YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), 0);
    t = GetDebugName();
    // End:0xd9
    if(bDeleteMe)
    {
        t = t $ " DELETED (bDeleteMe == true)";
    }
    Canvas.DrawText(t, false);
    YPos += float(3) * YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x17b
    if(Controller == none)
    {
        Canvas.SetDrawColor(byte(255), 0, 0);
        Canvas.DrawText("NO CONTROLLER");
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
    }
    // End:0x199
    else
    {
        Controller.DisplayDebug(Canvas, YL, YPos);
    }
    YPos += float(2) * YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.SetDrawColor(0, byte(255), byte(255));
    Canvas.DrawText("Anchor " $ string(Anchor) $ " Serpentine Dist " $ string(SerpentineDist) $ " Time " $ string(SerpentineTime));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    t = "Floor " $ string(Floor) $ " DesiredSpeed " $ string(DesiredSpeed) $ " Crouched " $ string(bIsCrouched) $ " Try to uncrouch " $ string(UncrouchTime);
    // End:0x2f9
    if(OnLadder != none || Physics == 11)
    {
        t = t $ " on ladder " $ string(OnLadder);
    }
    Canvas.DrawText(t);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

function Vector BotDodge(Vector Dir)
{
    local Vector Vel;

    Vel = GroundSpeed * Dir;
    Vel.Z = JumpZ;
    return Vel;
}

function HoldFlag(Actor FlagActor)
{
    // End:0x33
    if(GameObject(FlagActor) != none)
    {
        HoldGameObject(GameObject(FlagActor), GameObject(FlagActor).GameObjBone);
    }
}

function HoldGameObject(GameObject gameObj, name GameObjBone)
{
    // End:0x5a
    if(GameObjBone == 'None')
    {
        gameObj.SetPhysics(5);
        gameObj.SetLocation(Location);
        gameObj.SetBase(self);
        gameObj.SetRelativeLocation(vect(0.0, 0.0, 0.0));
    }
    // End:0xb3
    else
    {
        AttachToBone(gameObj, GameObjBone);
        gameObj.SetRelativeRotation(GameObjRot + gameObj.GameObjRot);
        gameObj.SetRelativeLocation(GameObjOffset + gameObj.GameObjOffset);
    }
}

function EndJump();
simulated function ShouldUnCrouch();
simulated event SetAnimAction(name NewAction)
{
    AnimAction = NewAction;
    PlayAnim(AnimAction);
}

function string GetDebugName()
{
    // End:0x5b
    if(Bot(Controller) != none && Bot(Controller).bSoaking && Level.Pauser != none)
    {
        return GetHumanReadableName() @ Bot(Controller).SoakString;
    }
    // End:0x75
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;
    }
    return GetItemName(string(self));
}

function name GetWeaponBoneFor(Inventory i)
{
    return 'weapon_bone';
}

function CheckBob(float DeltaTime, Vector Y)
{
    local float OldBobTime;
    local int M, N;
    local float fStaminaRatio;

    OldBobTime = bobtime;
    super.CheckBob(DeltaTime, Y);
    // End:0x6a
    if(Physics != 1 || VSize(Velocity) < float(10) || PlayerController(Controller) != none && PlayerController(Controller).bBehindView)
    {
        return;
    }
    M = int(0.50 * 3.1415930 + 8.0 * OldBobTime / 3.1415930);
    N = int(0.50 * 3.1415930 + 8.0 * bobtime / 3.1415930);
    fStaminaRatio = PlayerController(Controller).fSprintTime / wMyParam.Stm_MaxTime;
    // End:0x13a
    if(M != N && !bIsCrouched && !bIsProned && !bIsAiming)
    {
        FootStepping(0);
        // End:0x137
        if(fStaminaRatio < 0.250)
        {
            PlayBreathSounds();
        }
    }
    // End:0x1c8
    else
    {
        // End:0x1c8
        if(!bWeaponBob && bPlayOwnFootsteps && !bIsCrouched && !bIsProned && !bIsAiming && Level.TimeSeconds - LastFootStepTime > 0.350)
        {
            LastFootStepTime = Level.TimeSeconds;
            FootStepping(0);
            // End:0x1c8
            if(fStaminaRatio < 0.250)
            {
                PlayBreathSounds();
            }
        }
    }
}

simulated function PlayBreathSounds()
{
    // End:0x25
    if(iCheckBreath > 3 && Rand(3) > 1)
    {
        PlayBreathSound();
        iCheckBreath = 0;
    }
    PlayEquipHitSound();
    ++ iCheckBreath;
}

function bool IsInLoadout(class<Inventory> InventoryClass)
{
    local int i;
    local string invstring;

    // End:0x0b
    if(bAcceptAllInventory)
    {
        return true;
    }
    invstring = string(InventoryClass);
    i = 0;
    J0x1f:
    // End:0x64 [While If]
    if(i < 16)
    {
        // End:0x45
        if(RequiredEquipment[i] ~= invstring)
        {
            return true;
        }
        // End:0x5a
        else
        {
            // End:0x5a
            if(RequiredEquipment[i] == "")
            {
            }
            // End:0x64
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1f;
        }
    }
    i = 0;
    J0x6b:
    // End:0xb0 [While If]
    if(i < 16)
    {
        // End:0x91
        if(OptionalEquipment[i] ~= invstring)
        {
            return true;
        }
        // End:0xa6
        else
        {
            // End:0xa6
            if(OptionalEquipment[i] == "")
            {
            }
            // End:0xb0
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6b;
        }
    }
    return false;
}

function AddDefaultInventoryDOA(optional bool bQuickslotChange)
{
    // End:0x1f
    if(Inventory != none)
    {
        Inventory.OwnerEvent('LoadOut');
    }
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    // End:0x1f
    if(Inventory != none)
    {
        Inventory.OwnerEvent('LoadOut');
    }
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
    // End:0x78
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
}

function Inventory CreateInventory(string InventoryClassName)
{
    local Inventory Inv;
    local class<Inventory> InventoryClass;

    Log("[UnrealPawn::CreateInventory] InventoryClassName" $ InventoryClassName);
    InventoryClass = Level.Game.BaseMutator.GetInventoryClass(InventoryClassName);
    // End:0xd2
    if(InventoryClass != none)
    {
        Inv = Spawn(InventoryClass);
        // End:0xd0
        if(Inv != none)
        {
            Inv.InventoryClassName = InventoryClassName;
            Inv.GiveTo(self);
            // End:0xca
            if(Inv != none)
            {
                Inv.PickupFunction(self);
            }
            return Inv;
        }
        return none;
    }
    return none;
}

function bool PerformDodge(Engine.Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross);
function bool Dodge(Engine.Actor.EDoubleClickDir DoubleClickMove)
{
    local Vector X, Y, Z;

    // End:0x28
    if(bIsCrouched || bWantsToCrouch || Physics != 1)
    {
        return false;
    }
    GetAxes(Rotation, X, Y, Z);
    // End:0x7f
    if(DoubleClickMove == 3)
    {
        Velocity = 1.50 * GroundSpeed * X + Velocity Dot Y * Y;
    }
    // End:0x13f
    else
    {
        // End:0xc0
        if(DoubleClickMove == 4)
        {
            Velocity = -1.50 * GroundSpeed * X + Velocity Dot Y * Y;
        }
        // End:0x13f
        else
        {
            // End:0x101
            if(DoubleClickMove == 1)
            {
                Velocity = 1.50 * GroundSpeed * Y + Velocity Dot X * X;
            }
            // End:0x13f
            else
            {
                // End:0x13f
                if(DoubleClickMove == 2)
                {
                    Velocity = -1.50 * GroundSpeed * Y + Velocity Dot X * X;
                }
            }
        }
    }
    Velocity.Z = 210.0;
    CurrentDir = DoubleClickMove;
    SetPhysics(2);
    return true;
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
    local SquadAI S;
    local RosterEntry R;

    super.PostNetBeginPlay();
    // End:0x11c
    if(Role == 4 && Level.bStartup)
    {
        // End:0xe9
        if(UnrealMPGameInfo(Level.Game) == none)
        {
            // End:0xe6
            if(Bot(Controller) != none)
            {
                // End:0x6c
                foreach DynamicActors(class'SquadAI', S, SquadName)
                {
                    // End:0x6c
                    break;                                        
                }
                // End:0x86
                if(S == none)
                {
                    S = Spawn(class'SquadAI');
                }
                S.Tag = SquadName;
                // End:0xcd
                if(bIsSquadLeader || S.SquadLeader == none)
                {
                    S.SetLeader(Controller);
                }
                S.AddBot(Bot(Controller));
            }
        }
        // End:0x11c
        else
        {
            R = GetPlacedRoster();
            UnrealMPGameInfo(Level.Game).InitPlacedBot(Controller, R);
        }
    }
}

function RosterEntry GetPlacedRoster()
{
    return none;
}

function SetMovementPhysics()
{
    // End:0x12
    if(Physics == 2)
    {
        return;
    }
    // End:0x2c
    if(PhysicsVolume.bWaterVolume)
    {
        SetPhysics(3);
    }
    // End:0x31
    else
    {
        SetPhysics(1);
    }
}

function TakeDrowningDamage()
{
    TakeDamage(5, none, Location + CollisionHeight * vect(0.0, 0.0, 0.50) + 0.70 * CollisionRadius * vector(Controller.Rotation), vect(0.0, 0.0, 0.0), class'Drowned');
}

function int GetSpree()
{
    return Spree;
}

function IncrementSpree()
{
    ++ Spree;
}

simulated function PlayFootStep(int side)
{
    MakeNoise(0.20);
    // End:0x70
    if(Role == 2 || PlayerController(Controller) == none || PlayerController(Controller).bBehindView || Level.GetLocalPlayerController() != PlayerController(Controller))
    {
        FootStepping(side);
        return;
    }
}

simulated function ChunkUp(Rotator HitRotation, float ChunkPerterbation)
{
    // End:0x57
    if(Level.NetMode != 3 && Controller != none)
    {
        // End:0x4b
        if(Controller.bIsPlayer)
        {
            Controller.PawnDied(self);
        }
        // End:0x57
        else
        {
            Controller.Destroy();
        }
    }
    bTearOff = true;
    HitDamageType = class'Gibbed';
    // End:0xa5
    if(Level.NetMode == 1 || Level.NetMode == 2)
    {
        GotoState('TimingOut');
    }
    // End:0xc0
    if(Level.NetMode == 1)
    {
        return;
    }
    // End:0xd7
    if(class'GameInfo'.static.UseLowGore())
    {
        Destroy();
        return;
    }
    SpawnGibs(HitRotation, ChunkPerterbation);
    // End:0x103
    if(Level.NetMode != 2)
    {
        Destroy();
    }
}

simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation);

state TimingOut
{
    ignores BreathTimer;

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
    function BeginState()
    {
        SetPhysics(0);
        SetCollision(false, false, false);
        LifeSpan = 1.0;
        // End:0x52
        if(Controller != none)
        {
            // End:0x46
            if(Controller.bIsPlayer)
            {
                Controller.PawnDied(self);
            }
            // End:0x52
            else
            {
                Controller.Destroy();
            }
        }
    }

}

state Dying
{
    ignores BreathTimer;

    function Landed(Vector HitNormal)
    {
        // End:0x1b
        if(Level.NetMode == 1)
        {
            return;
        }
        // End:0x32
        if(Shadow != none)
        {
            Shadow.Destroy();
        }
    }

    singular function BaseChange()
    {
        super.BaseChange();
    }

    function BeginState()
    {
        local int i;

        SetCollision(true, false, false);
        // End:0x38
        if(bTearOff && Level.NetMode == 1)
        {
            LifeSpan = 1.0;
        }
        // End:0x41
        else
        {
            SetTimer(2.0, false);
        }
        // End:0x56
        if(Physics != 14)
        {
            SetPhysics(2);
        }
        bInvulnerableBody = true;
        // End:0x9a
        if(Controller != none)
        {
            // End:0x8e
            if(Controller.bIsPlayer)
            {
                Controller.PawnDied(self);
            }
            // End:0x9a
            else
            {
                Controller.Destroy();
            }
        }
        i = 0;
        J0xa1:
        // End:0xe1 [While If]
        if(i < Attached.Length)
        {
            // End:0xd7
            if(Attached[i] != none)
            {
                Attached[i].PawnBaseDied();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xa1;
        }
    }

}

defaultproperties
{
    bAcceptAllInventory=true
    bPlayOwnFootsteps=true
    LoadOut=255
    AttackSuitability=0.50
    SquadName=Squad
    bPlayerShadows=true
    bCanCrouch=true
    bCanSwim=true
    bCanClimbLadders=true
    bCanStrafe=true
    bCanPickupInventory=true
    bMuffledHearing=true
    SightRadius=12000.0
    MeleeRange=20.0
    GroundSpeed=600.0
    AirSpeed=600.0
    AirControl=0.350
    BaseEyeHeight=60.0
    EyeHeight=60.0
    CrouchHeight=39.0
    UnderWaterTime=20.0
    ControllerClass=class'Bot'
    LightHue=40
    LightSaturation=128
    LightBrightness=70.0
    LightRadius=6.0
    bStasis=true
    AmbientGlow=40
    bUseCylinderCollision=true
    Buoyancy=99.0
    RotationRate=(Pitch=0,Yaw=20000,Roll=2048)
    ForceType=1
    ForceRadius=100.0
    ForceScale=2.50
}