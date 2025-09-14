/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\MutLowGrav.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class MutLowGrav extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float GravityZ;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Level.DefaultGravity = GravityZ;
}

function bool MutatorIsAllowed()
{
    return true;
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local PhysicsVolume PV;
    local Vector XYDir;
    local float ZDiff, Time;
    local JumpPad j;

    PV = PhysicsVolume(Other);
    // End:0x88
    if(PV != none)
    {
        PV.Gravity.Z = FMax(PV.Gravity.Z, GravityZ);
        PV.BACKUP_Gravity = PV.Gravity;
        PV.bAlwaysRelevant = true;
        PV.RemoteRole = 1;
    }
    j = JumpPad(Other);
    // End:0x15d
    if(j != none)
    {
        XYDir = j.JumpTarget.Location - j.Location;
        ZDiff = XYDir.Z;
        Time = 2.50 * j.JumpZModifier * Sqrt(Abs(ZDiff / GravityZ));
        j.JumpVelocity = XYDir / Time;
        j.JumpVelocity.Z = ZDiff / Time - 0.50 * GravityZ * Time;
    }
    // End:0x1c0
    if(Vehicle(Other) != none && KarmaParams(Other.KParams) != none)
    {
        KarmaParams(Other.KParams).KActorGravScale *= class'PhysicsVolume'.default.Gravity.Z / GravityZ;
    }
    return true;
}

defaultproperties
{
    GravityZ=-300.0
    GroupName="Gravity"
    FriendlyName="?? ??"
    Description="??? ????"
}