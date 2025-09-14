/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Teleporter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:8
 *
 *******************************************************************************/
class Teleporter extends SmallNavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

var() string URL;
var() name ProductRequired;
var() bool bChangesVelocity;
var() bool bChangesYaw;
var() bool bReversesX;
var() bool bReversesY;
var() bool bReversesZ;
var() bool bEnabled;
var() Vector TargetVelocity;
var Actor TriggerActor;
var Actor TriggerActor2;
var float LastFired;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        URL, bEnabled;

    // Pos:0x0d
    reliable if(bNetInitial && Role == 4)
        bChangesVelocity, bChangesYaw,
        bReversesX, bReversesY,
        bReversesZ, TargetVelocity;

}

function PostBeginPlay()
{
    local int i;

    // End:0x12
    if(URL ~= "")
    {
        SetCollision(false, false, false);
    }
    // End:0x23
    if(!bEnabled)
    {
        FindTriggerActor();
    }
    i = 0;
    J0x2a:
    // End:0xaa [While If]
    if(i < PathList.Length)
    {
        // End:0xa0
        if(Teleporter(PathList[i].End) != none)
        {
            PathList[i].bForced = true;
            PathList[i].reachFlags = PathList[i].reachFlags | 256;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    super(NavigationPoint).PostBeginPlay();
}

function FindTriggerActor()
{
    local Actor A;

    TriggerActor = none;
    TriggerActor2 = none;
    // End:0x5e
    foreach DynamicActors(class'Actor', A)
    {
        // End:0x5d
        if(A.Event == Tag)
        {
            // End:0x4f
            if(TriggerActor == none)
            {
                TriggerActor = A;
            }
            // End:0x5d
            else
            {
                TriggerActor2 = A;
                break;
                return;
            }
        }                
    }
}

simulated function bool Accept(Actor Incoming, Actor Source)
{
    local Rotator NewRot, OldRot;
    local float mag;
    local Vector oldDir;
    local Controller P;

    // End:0x0d
    if(Incoming == none)
    {
        return false;
    }
    Disable('Touch');
    NewRot = Incoming.Rotation;
    // End:0xa0
    if(bChangesYaw)
    {
        OldRot = Incoming.Rotation;
        NewRot.Yaw = Rotation.Yaw;
        // End:0xa0
        if(Source != none)
        {
            NewRot.Yaw += 32768 + Incoming.Rotation.Yaw - Source.Rotation.Yaw;
        }
    }
    // End:0x275
    if(Pawn(Incoming) != none)
    {
        // End:0x11f
        if(Role == 4)
        {
            P = Level.ControllerList;
            J0xd4:
            // End:0x11f [While If]
            if(P != none)
            {
                // End:0x108
                if(P.Enemy == Incoming)
                {
                    P.LineOfSightTo(Incoming);
                }
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0xd4;
            }
        }
        // End:0x163
        if(!Pawn(Incoming).SetLocation(Location))
        {
            Log(string(self) $ " Teleport failed for " $ string(Incoming));
            return false;
        }
        // End:0x1fc
        if(Role == 4 || Level.TimeSeconds - LastFired > 0.50)
        {
            NewRot.Roll = 0;
            Pawn(Incoming).SetRotation(NewRot);
            Pawn(Incoming).SetViewRotation(NewRot);
            Pawn(Incoming).ClientSetRotation(NewRot);
            LastFired = Level.TimeSeconds;
        }
        // End:0x261
        if(Pawn(Incoming).Controller != none)
        {
            Pawn(Incoming).Controller.MoveTimer = -1.0;
            Pawn(Incoming).Anchor = self;
            Pawn(Incoming).SetMoveTarget(self);
        }
        Incoming.PlayTeleportEffect(false, true);
    }
    // End:0x2ae
    else
    {
        // End:0x294
        if(!Incoming.SetLocation(Location))
        {
            Enable('Touch');
            return false;
        }
        // End:0x2ae
        if(bChangesYaw)
        {
            Incoming.SetRotation(NewRot);
        }
    }
    Enable('Touch');
    // End:0x2d5
    if(bChangesVelocity)
    {
        Incoming.Velocity = TargetVelocity;
    }
    // End:0x3d8
    else
    {
        // End:0x36f
        if(bChangesYaw)
        {
            // End:0x303
            if(Incoming.Physics == 1)
            {
                OldRot.Pitch = 0;
            }
            oldDir = vector(OldRot);
            mag = Incoming.Velocity Dot oldDir;
            Incoming.Velocity = Incoming.Velocity - mag * oldDir + mag * vector(Incoming.Rotation);
        }
        // End:0x392
        if(bReversesX)
        {
            Incoming.Velocity.X *= -1.0;
        }
        // End:0x3b5
        if(bReversesY)
        {
            Incoming.Velocity.Y *= -1.0;
        }
        // End:0x3d8
        if(bReversesZ)
        {
            Incoming.Velocity.Z *= -1.0;
        }
    }
    return true;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local Actor A;

    bEnabled = !bEnabled;
    // End:0x35
    if(bEnabled)
    {
        // End:0x34
        foreach TouchingActors(class'Actor', A)
        {
            PostTouch(A);                        
        }
    }
}

event Touch(Actor Other)
{
    // End:0x1a
    if(!bEnabled || Other == none)
    {
        return;
    }
    // End:0x68
    if(Other.bCanTeleport && Other.PreTeleport(self) == false)
    {
        PendingTouch = Other.PendingTouch;
        Other.PendingTouch = self;
    }
}

simulated function PostTouch(Actor Other)
{
    local Teleporter D, Dest;
    local int i;

    // End:0x95
    if(InStr(URL, "/") >= 0 || InStr(URL, "#") >= 0)
    {
        // End:0x92
        if(Role == 4 && Pawn(Other) != none && Pawn(Other).IsHumanControlled())
        {
            Level.Game.SendPlayer(PlayerController(Pawn(Other).Controller), URL);
        }
    }
    // End:0x179
    else
    {
        // End:0xf4
        foreach AllActors(class'Teleporter', D)
        {
            // End:0xf3
            if(string(D.Tag) ~= URL && D != self)
            {
                Dest[i] = D;
                ++ i;
                // End:0xf3
                if(i > 16)
                {
                }
                // End:0xf4
                else
                {
                }
                continue;
            }            
        }
        i = Rand(i);
        // End:0x179
        if(Dest[i] != none)
        {
            // End:0x138
            if(Other.IsA('Pawn'))
            {
                Other.PlayTeleportEffect(false, true);
            }
            Dest[i].Accept(Other, self);
            // End:0x179
            if(Pawn(Other) != none)
            {
                TriggerEvent(Event, self, Pawn(Other));
            }
        }
    }
}

function Actor SpecialHandling(Pawn Other)
{
    local Vector Dist2D;

    // End:0xf3
    if(bEnabled && Teleporter(Other.Controller.RouteCache[1]) != none && string(Other.Controller.RouteCache[1].Tag) ~= URL)
    {
        // End:0xf1
        if(Abs(Location.Z - Other.Location.Z) < CollisionHeight + Other.CollisionHeight)
        {
            Dist2D = Location - Other.Location;
            Dist2D.Z = 0.0;
            // End:0xf1
            if(VSize(Dist2D) < CollisionRadius + Other.CollisionRadius)
            {
                PostTouch(Other);
            }
        }
        return self;
    }
    // End:0x111
    if(TriggerActor == none)
    {
        FindTriggerActor();
        // End:0x111
        if(TriggerActor == none)
        {
            return none;
        }
    }
    // End:0x169
    if(TriggerActor2 != none && VSize(TriggerActor2.Location - Other.Location) < VSize(TriggerActor.Location - Other.Location))
    {
        return TriggerActor2;
    }
    return TriggerActor;
}

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    // End:0x35
    if(Teleporter(Path.Start) == none || Path.reachFlags & 32 == 0)
    {
        return 0;
    }
    // End:0x4b
    if(Vehicle(Other) != none)
    {
        return 10000000;
    }
    return 0;
}

defaultproperties
{
    bChangesYaw=true
    bEnabled=true
    bSpecialForced=true
    RemoteRole=2
    Texture=Texture'S_Teleport'
    SoundVolume=128
    bCollideActors=true
    bDirectional=true
}