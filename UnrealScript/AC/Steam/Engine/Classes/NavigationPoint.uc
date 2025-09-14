/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\NavigationPoint.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:59
 *	Functions:11
 *
 *******************************************************************************/
class NavigationPoint extends Actor
    dependson(ReachSpec)
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var transient bool bEndPoint;
var transient bool bTransientEndPoint;
var transient bool bHideEditorPaths;
var transient bool bCanReach;
var bool taken;
var() bool bBlocked;
var() bool bPropagatesSound;
var() bool bOneWayPath;
var() bool bNeverUseStrafing;
var() bool bAlwaysUseStrafing;
var const bool bForceNoStrafing;
var const bool bAutoBuilt;
var bool bSpecialMove;
var bool bNoAutoConnect;
var const bool bNotBased;
var const bool bPathsChanged;
var bool bDestinationOnly;
var bool bSourceOnly;
var bool bSpecialForced;
var bool bMustBeReachable;
var bool bBlockable;
var bool bFlyingPreferred;
var bool bMayCausePain;
var bool bReceivePlayerToucherDiedNotify;
var bool bAlreadyVisited;
var() bool bVehicleDestination;
var() bool bMakeSourceOnly;
var() bool bNoSuperSize;
var bool bForcedOnly;
var const array<ReachSpec> PathList;
var() name ProscribedPaths[4];
var() name ForcedPaths[4];
var int visitedWeight;
var const int bestPathWeight;
var const NavigationPoint nextNavigationPoint;
var const NavigationPoint nextOrdered;
var const NavigationPoint prevOrdered;
var const NavigationPoint previousPath;
var int cost;
var() int ExtraCost;
var transient int TransientCost;
var transient int FearCost;
var Pickup InventoryCache;
var float InventoryDist;
var const float LastDetourWeight;
var byte BaseVisible[2];
var float BaseDist[2];
var float Influence;
var Vector MaxPathSize;
var(DoNotModify) int VisID;
var(DoNotModify) int VisCount;
var(DoNotModify) array<NavigationPoint> VisPoints;
var(DoNotModify) bool HasGroundedLocation;
var(DoNotModify) Vector GroundedLocation;
var(DoNotModify) array<float> MaxCoverAngle;
var(SD) float AcquireTime;
var(SD) int AcquireTeam;
var(SD) bool HasVisEnemyAcquiredPoints;
var(SD) array<NavigationPoint> VisEnemyAcquiredPoints;

function PostBeginPlay()
{
    local int i;

    ExtraCost = Max(ExtraCost, 0);
    i = 0;
    J0x15:
    // End:0x89 [While If]
    if(i < PathList.Length)
    {
        MaxPathSize.X = FMax(MaxPathSize.X, float(PathList[i].CollisionRadius));
        MaxPathSize.Z = FMax(MaxPathSize.Z, float(PathList[i].CollisionHeight));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    MaxPathSize.Y = MaxPathSize.X;
    super.PostBeginPlay();
}

// Export UNavigationPoint::execSetBaseDistance(FFrame&, void* const)
native final function SetBaseDistance(int BaseNum);
function SetBaseVisibility(int BaseNum)
{
    local NavigationPoint N;

    BaseVisible[BaseNum] = 1;
    N = Level.NavigationPointList;
    J0x22:
    // End:0xe8 [While If]
    if(N != none)
    {
        // End:0xd1
        if(N.BaseVisible[BaseNum] == 0 && FastTrace(N.Location + float(88) - float(2) * N.CollisionHeight * vect(0.0, 0.0, 1.0), Location + float(88) - float(2) * N.CollisionHeight * vect(0.0, 0.0, 1.0)))
        {
            N.BaseVisible[BaseNum] = 1;
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
}

event int SpecialCost(Pawn Seeker, ReachSpec Path);
event bool Accept(Actor Incoming, Actor Source)
{
    taken = Incoming.SetLocation(Location);
    // End:0x4e
    if(taken)
    {
        Incoming.Velocity = vect(0.0, 0.0, 0.0);
        Incoming.SetRotation(Rotation);
    }
    Incoming.PlayTeleportEffect(true, false);
    TriggerEvent(Event, self, Pawn(Incoming));
    return taken;
}

event float DetourWeight(Pawn Other, float PathWeight);
event bool SuggestMovePreparation(Pawn Other)
{
    return false;
}

function bool ProceedWithMove(Pawn Other)
{
    return true;
}

function MoverOpened();
function MoverClosed();
function PlayerToucherDied(Pawn P);

defaultproperties
{
    bPropagatesSound=true
    bMayCausePain=true
    BaseDist[0]=1000000.0
    BaseDist[1]=1000000.0
    bStatic=true
    bHidden=true
    bNoDelete=true
    Texture=Texture'S_NavP'
    bCollideWhenPlacing=true
    SoundVolume=0
    CollisionRadius=40.0
    CollisionHeight=43.0
}