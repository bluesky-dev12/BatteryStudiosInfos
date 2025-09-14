/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\JumpSpot.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:7
 *
 *******************************************************************************/
class JumpSpot extends JumpDest
    hidecategories(Lighting,LightColor,Karma,Force);

var() bool bOnlyTranslocator;
var bool bRealOnlyTranslocator;
var() bool bNeverImpactJump;
var() bool bNoLowGrav;
var() bool bForceAllowDoubleJumping;
var() bool bDodgeUp;
var() name TranslocTargetTag;
var() float TranslocZOffset;
var Actor TranslocTarget;
var Vector CachedSpeed[8];

function PostBeginPlay()
{
    super(NavigationPoint).PostBeginPlay();
    bRealOnlyTranslocator = bOnlyTranslocator;
}

function bool CanMakeJump(Pawn Other, float JumpHeight, float GroundSpeed, int Num, Actor Start, bool bForceCheck)
{
    local Vector V, S;

    // End:0x1b
    if(Other.Physics == 4)
    {
        return true;
    }
    // End:0x38
    if(bDodgeUp || JumpPad(Start) != none)
    {
        return true;
    }
    // End:0xa9
    if(!bForceCheck && PhysicsVolume.Gravity.Z >= CalculatedGravityZ[Num])
    {
        // End:0x84
        if(NeededJump[Num].Z < JumpHeight)
        {
            return true;
        }
        // End:0xa9
        if(PhysicsVolume.Gravity.Z == CalculatedGravityZ[Num])
        {
            return false;
        }
    }
    // End:0xcd
    if(bForceDoubleJump)
    {
        GroundSpeed = FMax(GroundSpeed, Other.default.GroundSpeed);
    }
    // End:0x11b
    if(CachedSpeed[Num].X <= JumpHeight && CachedSpeed[Num].Y <= GroundSpeed)
    {
        return CachedSpeed[Num].Z < JumpHeight;
    }
    S = Start.Location;
    S.Z = S.Z - Start.CollisionHeight + Other.CollisionHeight;
    V = SuggestFallVelocity(Location, S, 2.0 * JumpHeight, GroundSpeed);
    CachedSpeed[Num].X = JumpHeight;
    CachedSpeed[Num].Y = GroundSpeed;
    CachedSpeed[Num].Z = V.Z;
    return V.Z < JumpHeight;
}

function bool CanDoubleJump(Pawn Other)
{
    return bForceDoubleJump || Other.bCanDoubleJump || PhysicsVolume.Gravity.Z > PhysicsVolume.default.Gravity.Z;
}

function float EffectiveDoubleJump(ReachSpec Path)
{
    // End:0x82
    if(Path != none && Path.Start != none && Path.End != none && Path.Start.Location.Z >= Path.End.Location.Z + float(32))
    {
        return 1.90;
    }
    return 1.50;
}

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    local int Num;
    local Vector DodgeV;
    local float AllowedJumpZ, RealGroundSpeed;

    // End:0x16
    if(Vehicle(Other) != none)
    {
        return 10000000;
    }
    // End:0x32
    if(Other.Physics == 4)
    {
        return 100;
    }
    // End:0x50
    if(Other.Controller.bAllowedToTranslocate)
    {
        return 200;
    }
    // End:0x97
    if(bOnlyTranslocator || bNoLowGrav && PhysicsVolume.Gravity.Z > PhysicsVolume.default.Gravity.Z)
    {
        return 10000000;
    }
    Num = GetPathIndex(Path);
    // End:0xf1
    if(CanDoubleJump(Other))
    {
        // End:0xcd
        if(bDodgeUp || bForceAllowDoubleJumping)
        {
            return 100;
        }
        AllowedJumpZ = Other.JumpZ * EffectiveDoubleJump(Path);
    }
    // End:0x114
    else
    {
        // End:0x100
        if(bDodgeUp)
        {
            return 10000000;
        }
        AllowedJumpZ = Other.JumpZ;
    }
    // End:0x14c
    if(CanMakeJump(Other, AllowedJumpZ, Other.GroundSpeed, Num, Path.Start, false))
    {
        return 100;
    }
    // End:0x2af
    if(Path.Distance > 1000 && PhysicsVolume.Gravity.Z > PhysicsVolume.default.Gravity.Z && UnrealPawn(Other) != none)
    {
        // End:0x21b
        if(bForceDoubleJump)
        {
            RealGroundSpeed = Other.GroundSpeed;
            Other.GroundSpeed = Other.default.GroundSpeed;
            DodgeV = UnrealPawn(Other).BotDodge(vect(1.0, 0.0, 0.0));
            Other.GroundSpeed = RealGroundSpeed;
        }
        // End:0x242
        else
        {
            DodgeV = UnrealPawn(Other).BotDodge(vect(1.0, 0.0, 0.0));
        }
        // End:0x2af
        if(CanMakeJump(Other, DodgeV.Z + EffectiveDoubleJump(Other.Controller.CurrentPath) - float(1) * Other.JumpZ, DodgeV.X, Num, Path.Start, true))
        {
            return 100;
        }
    }
    // End:0x306
    if(!bNeverImpactJump && NeededJump[Num].Z <= float(1100) && bForceDoubleJump || Other.Controller.bAllowedToImpactJump)
    {
        return 3500;
    }
    return 10000000;
}

event bool SuggestMovePreparation(Pawn Other)
{
    local int Num;
    local Bot B;
    local float RealJumpZ, RealGroundSpeed;
    local Vector DodgeV, Dir;

    // End:0x16
    if(Other.Controller == none)
    {
        return false;
    }
    // End:0x205
    if(bDodgeUp)
    {
        B = Bot(Other.Controller);
        // End:0x45
        if(B == none)
        {
            return false;
        }
        DodgeV = UnrealPawn(Other).BotDodge(vect(1.0, 0.0, 0.0));
        UnrealPawn(Other).CurrentDir = 3;
        Other.bWantsToCrouch = false;
        B.MoveTarget = self;
        B.Destination = Location;
        B.bPlannedJump = true;
        // End:0x125
        if(Other.Anchor != none && Other.ReachedDestination(Other.Anchor))
        {
            Dir = Location - Other.Anchor.Location;
        }
        // End:0x140
        else
        {
            Dir = Location - Other.Location;
        }
        Dir.Z = 0.0;
        Dir = Normal(Dir);
        Other.Velocity = DodgeV.X * Dir;
        Other.Velocity.Z = DodgeV.Z;
        Other.Acceleration = Other.AccelRate * Dir;
        Other.SetPhysics(2);
        Other.DestinationOffset = CollisionRadius;
        B.bNotifyApex = true;
        B.bPendingDoubleJump = true;
        return false;
    }
    Num = GetPathIndex(Other.Controller.CurrentPath);
    // End:0x26f
    if(Other.MaxFallSpeed < float(Other.Controller.CurrentPath.MaxLandingVelocity) && TryTranslocator(Other))
    {
        return true;
    }
    // End:0x2b1
    if(bNoLowGrav && PhysicsVolume.Gravity.Z > PhysicsVolume.default.Gravity.Z)
    {
        return TryTranslocator(Other);
    }
    // End:0x31b
    if(!bOnlyTranslocator && CanMakeJump(Other, Other.JumpZ, Other.GroundSpeed, Num, Other.Controller.CurrentPath.Start, false))
    {
        DoJump(Other);
        return false;
    }
    B = Bot(Other.Controller);
    // End:0x341
    if(B == none)
    {
        return false;
    }
    // End:0x356
    if(bOnlyTranslocator)
    {
        return TryTranslocator(Other);
    }
    // End:0x4d6
    if(CanDoubleJump(Other) && bForceAllowDoubleJumping || CanMakeJump(Other, Other.JumpZ * EffectiveDoubleJump(Other.Controller.CurrentPath), Other.GroundSpeed, Num, Other.Controller.CurrentPath.Start, false))
    {
        RealJumpZ = Other.JumpZ;
        Other.JumpZ = Other.JumpZ * EffectiveDoubleJump(Other.Controller.CurrentPath);
        DoJump(Other);
        Other.JumpZ = RealJumpZ;
        Other.Velocity.Z = FClamp(Other.Velocity.Z - 0.50 * Other.JumpZ, 0.70 * Other.JumpZ, Other.JumpZ);
        B.bNotifyApex = true;
        B.bPendingDoubleJump = true;
        return false;
    }
    // End:0x7a1
    if(Other.Controller.CurrentPath.Distance > 1000 && PhysicsVolume.Gravity.Z > PhysicsVolume.default.Gravity.Z && UnrealPawn(Other) != none)
    {
        // End:0x5b7
        if(bForceDoubleJump)
        {
            RealGroundSpeed = Other.GroundSpeed;
            Other.GroundSpeed = Other.default.GroundSpeed;
            DodgeV = UnrealPawn(Other).BotDodge(vect(1.0, 0.0, 0.0));
            Other.GroundSpeed = RealGroundSpeed;
        }
        // End:0x5de
        else
        {
            DodgeV = UnrealPawn(Other).BotDodge(vect(1.0, 0.0, 0.0));
        }
        // End:0x7a1
        if(CanMakeJump(Other, DodgeV.Z + EffectiveDoubleJump(Other.Controller.CurrentPath) - float(1) * Other.JumpZ, DodgeV.X, Num, Other.Controller.CurrentPath.Start, true))
        {
            RealJumpZ = Other.JumpZ;
            RealGroundSpeed = Other.GroundSpeed;
            Other.GroundSpeed = DodgeV.X;
            Other.JumpZ = DodgeV.Z + EffectiveDoubleJump(Other.Controller.CurrentPath) - float(1) * RealJumpZ;
            UnrealPawn(Other).CurrentDir = 3;
            DoJump(Other);
            Other.GroundSpeed = RealGroundSpeed;
            Other.JumpZ = RealJumpZ;
            Other.Velocity.Z = FMax(0.70 * Other.JumpZ, Other.Velocity.Z - 0.50 * Other.JumpZ);
            B.bNotifyApex = true;
            B.bPendingDoubleJump = true;
            return false;
        }
    }
    // End:0x7b1
    if(TryTranslocator(Other))
    {
        return true;
    }
    // End:0x8a7
    if(!bNeverImpactJump && NeededJump[Num].Z < float(1100) && B.CanImpactJump())
    {
        Other.Acceleration = vect(0.0, 0.0, 0.0);
        B.bPreparingMove = true;
        B.ImpactTarget = self;
        B.Focus = none;
        B.FocalPoint = B.Location - vect(0.0, 0.0, 100.0);
        // End:0x896
        if(Other.Weapon.IsA('ShieldGun'))
        {
            B.ImpactJump();
        }
        // End:0x8a5
        else
        {
            B.SwitchToBestWeapon();
        }
        return true;
    }
    // End:0x9ab
    if(CanDoubleJump(Other))
    {
        RealJumpZ = Other.JumpZ;
        Other.JumpZ = Other.JumpZ * EffectiveDoubleJump(Other.Controller.CurrentPath);
        DoJump(Other);
        Other.JumpZ = RealJumpZ;
        Other.Velocity.Z = FClamp(Other.Velocity.Z - 0.50 * Other.JumpZ, 0.70 * Other.JumpZ, Other.JumpZ);
        B.bNotifyApex = true;
        B.bPendingDoubleJump = true;
        return false;
    }
    return false;
}

function bool TryTranslocator(Pawn Other)
{
    local Bot B;

    B = Bot(Other.Controller);
    B.TranslocationTarget = none;
    B.RealTranslocationTarget = none;
    // End:0x167
    if(B.CanUseTranslocator())
    {
        Other.Acceleration = vect(0.0, 0.0, 0.0);
        B.bPreparingMove = true;
        B.TranslocationTarget = self;
        B.RealTranslocationTarget = self;
        // End:0xeb
        if(TranslocTargetTag != 'None')
        {
            // End:0xcc
            if(TranslocTarget == none)
            {
                // End:0xcb
                foreach AllActors(class'Actor', TranslocTarget, TranslocTargetTag)
                {
                    // End:0xcb
                    break;                                        
                }
            }
            // End:0xeb
            if(TranslocTarget != none)
            {
                B.TranslocationTarget = TranslocTarget;
            }
        }
        B.ImpactTarget = self;
        B.Focus = self;
        // End:0x156
        if(Other.Weapon.IsA('Translauncher'))
        {
            Other.PendingWeapon = none;
            Other.Weapon.SetTimer(0.20, false);
        }
        // End:0x165
        else
        {
            B.SwitchToBestWeapon();
        }
        return true;
    }
    return false;
}

defaultproperties
{
    CachedSpeed[0]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
    CachedSpeed[1]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
    CachedSpeed[2]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
    CachedSpeed[3]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
    CachedSpeed[4]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
    CachedSpeed[5]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
    CachedSpeed[6]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
    CachedSpeed[7]=(X=1000000.0,Y=1000000.0,Z=1000000.0)
}