/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\InstagibMutator.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class InstagibMutator extends MutZoomInstagib
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    hidedropdown;

var float GravityZ;
var bool bLowGrav;

function PostBeginPlay()
{
    // End:0x1b
    if(InstagibCTF(Level.Game) == none)
    {
        return;
    }
    // End:0x8e
    if(InstagibCTF(Level.Game).bZoomInstagib)
    {
        WeaponName = 'ZoomSuperShockRifle';
        WeaponString = "xWeapons.ZoomSuperShockRifle";
        DefaultWeaponName = "xWeapons.ZoomSuperShockRifle";
    }
    bAllowTranslocator = InstagibCTF(Level.Game).bAllowTrans;
    bAllowBoost = InstagibCTF(Level.Game).bAllowBoost;
    // End:0x112
    if(InstagibCTF(Level.Game).bLowGrav)
    {
        bLowGrav = true;
        Level.DefaultGravity = GravityZ;
    }
    super(MutInstaGib).PostBeginPlay();
}

function bool MutatorIsAllowed()
{
    return true;
}

function bool AlwaysKeep(Actor Other)
{
    // End:0x20
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
}

function GetServerDetails(out ServerResponseLine ServerState);
static function FillPlayInfo(PlayInfo PlayInfo);
static event string GetDescriptionText(string PropName)
{
    return "";
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local PhysicsVolume PV;
    local Vector XYDir;
    local float ZDiff, Time;
    local JumpPad j;

    // End:0x1ac
    if(bLowGrav)
    {
        PV = PhysicsVolume(Other);
        // End:0x74
        if(PV != none)
        {
            PV.Gravity.Z = FMax(PV.Gravity.Z, GravityZ);
            PV.bAlwaysRelevant = true;
            PV.RemoteRole = 1;
        }
        j = JumpPad(Other);
        // End:0x149
        if(j != none)
        {
            XYDir = j.JumpTarget.Location - j.Location;
            ZDiff = XYDir.Z;
            Time = 2.50 * j.JumpZModifier * Sqrt(Abs(ZDiff / GravityZ));
            j.JumpVelocity = XYDir / Time;
            j.JumpVelocity.Z = ZDiff / Time - 0.50 * GravityZ * Time;
        }
        // End:0x1ac
        if(Vehicle(Other) != none && KarmaParams(Other.KParams) != none)
        {
            KarmaParams(Other.KParams).KActorGravScale *= class'PhysicsVolume'.default.Gravity.Z / GravityZ;
        }
    }
    return super(MutInstaGib).CheckReplacement(Other, bSuperRelevant);
}

defaultproperties
{
    GravityZ=-300.0
    WeaponName=SuperShockRifle
    WeaponString="xWeapons.SuperShockRifle"
    DefaultWeaponName="xWeapons.SuperShockRifle"
}