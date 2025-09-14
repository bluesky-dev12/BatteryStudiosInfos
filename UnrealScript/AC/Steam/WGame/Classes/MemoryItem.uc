/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MemoryItem.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:5
 *
 *******************************************************************************/
class MemoryItem extends Object
    native;

var wAIBotBase Owner;
var float LastTime;
var Vector LastPosition;
var float LastTargetedTime;
var Pawn Pawn;
var PlayerReplicationInfo PRI;
var int MaxPositions;
var bool IsVisible;
var bool IsVisibleOld;
var bool InSight;
var bool InSightOld;
var Vector OffsetStandHeight;
var Vector OffsetCrouchHeight;

static function MemoryItem Create(wAIBotBase inOwner, Pawn P)
{
    local MemoryItem i;

    i = new default.Class;
    i.Owner = inOwner;
    i.Pawn = P;
    P.RegisterDestroyListener(i);
    return i;
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Pawn == A)
    {
        Pawn = none;
    }
}

function AddKnownPosition(Vector V, float t)
{
    LastPosition = V;
    LastTime = t;
}

function Update()
{
    local float Angle;

    IsVisibleOld = IsVisible;
    // End:0x5a
    if(Owner.FastTrace(Pawn.Location + OffsetStandHeight, Owner.Pawn.Location + OffsetStandHeight))
    {
        IsVisible = true;
    }
    // End:0xaf
    else
    {
        // End:0xa7
        if(Owner.FastTrace(Pawn.Location + OffsetCrouchHeight, Owner.Pawn.Location + OffsetCrouchHeight))
        {
            IsVisible = true;
        }
        // End:0xaf
        else
        {
            IsVisible = false;
        }
    }
    InSightOld = InSight;
    // End:0x13d
    if(IsVisible)
    {
        Angle = Normal(Pawn.Location - Owner.Pawn.Location) Dot vector(Owner.Pawn.Rotation);
        // End:0x132
        if(Angle > float(0))
        {
            InSight = Angle > 0.50;
        }
        // End:0x13a
        else
        {
            InSight = false;
        }
    }
    // End:0x145
    else
    {
        InSight = false;
    }
}

function ClearReferences()
{
    Log("[MemoryItem::ClearRefenreces]");
    Pawn = none;
    PRI = none;
}

defaultproperties
{
    LastTime=-999.0
    LastTargetedTime=-999.0
    MaxPositions=10
    OffsetStandHeight=(X=0.0,Y=0.0,Z=144.0)
    OffsetCrouchHeight=(X=0.0,Y=0.0,Z=99.0)
}