/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SVehicleTrigger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class SVehicleTrigger extends Triggers
    native
    notplaceable;

var() bool bEnabled;
var bool BACKUP_bEnabled;
var bool bMarkWithPath;
var NavigationPoint myMarker;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    BACKUP_bEnabled = bEnabled;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = !bEnabled;
}

function UsedBy(Pawn User)
{
    // End:0x0d
    if(!bEnabled)
    {
        return;
    }
    Vehicle(Owner).TryToDrive(User);
}

function Reset()
{
    super(Actor).Reset();
    bEnabled = BACKUP_bEnabled;
}

defaultproperties
{
    bEnabled=true
    bOnlyAffectPawns=true
    bHardAttach=true
    CollisionRadius=80.0
    CollisionHeight=400.0
    bCollideActors=true
}