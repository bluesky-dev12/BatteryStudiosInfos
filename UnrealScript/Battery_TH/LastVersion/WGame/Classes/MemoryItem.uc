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
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Pawn == A)
    {
        Pawn = none;
    }
    //return;    
}

function AddKnownPosition(Vector V, float t)
{
    LastPosition = V;
    LastTime = t;
    //return;    
}

function Update()
{
    local float Angle;

    IsVisibleOld = IsVisible;
    // End:0x5A
    if(Owner.FastTrace(Pawn.Location + OffsetStandHeight, Owner.Pawn.Location + OffsetStandHeight))
    {
        IsVisible = true;        
    }
    else
    {
        // End:0xA7
        if(Owner.FastTrace(Pawn.Location + OffsetCrouchHeight, Owner.Pawn.Location + OffsetCrouchHeight))
        {
            IsVisible = true;            
        }
        else
        {
            IsVisible = false;
        }
    }
    InSightOld = InSight;
    // End:0x146
    if(IsVisible)
    {
        Angle = Normal(Pawn.Location - Owner.Pawn.Location) Dot Vector(Owner.Pawn.Rotation);
        // End:0x13B
        if(Angle > float(0))
        {
            InSight = Angle > Pawn.PeripheralVision;            
        }
        else
        {
            InSight = false;
        }        
    }
    else
    {
        InSight = false;
    }
    //return;    
}

function ClearReferences()
{
    Log("[MemoryItem::ClearRefenreces]");
    Pawn = none;
    PRI = none;
    //return;    
}

function SetOffsetStandHeight(float fHeight)
{
    OffsetStandHeight.Z = fHeight;
    //return;    
}

function SetOffsetCrouchHeight(float fHeight)
{
    OffsetCrouchHeight.Z = fHeight;
    //return;    
}

defaultproperties
{
    LastTime=-999.0000000
    LastTargetedTime=-999.0000000
    MaxPositions=10
    OffsetStandHeight=(X=0.0000000,Y=0.0000000,Z=144.0000000)
    OffsetCrouchHeight=(X=0.0000000,Y=0.0000000,Z=99.0000000)
}