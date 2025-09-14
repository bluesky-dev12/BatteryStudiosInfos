/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\WarpZoneInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:8
 *	States:1
 *
 *******************************************************************************/
class WarpZoneInfo extends ZoneInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    placeable;

var() string OtherSideURL;
var() name ThisTag;
var() bool bNoTeleFrag;
var const int iWarpZone;
var const Coords WarpCoords;
var transient WarpZoneInfo OtherSideActor;
var transient Object OtherSideLevel;
var() string Destinations[8];
var int numDestinations;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        OtherSideURL, ThisTag,
        OtherSideActor;

}

// Export UWarpZoneInfo::execWarp(FFrame&, void* const)
native(314) final function Warp(out Vector loc, out Vector Vel, out Rotator R);
// Export UWarpZoneInfo::execUnWarp(FFrame&, void* const)
native(315) final function UnWarp(out Vector loc, out Vector Vel, out Rotator R);
function PreBeginPlay()
{
    super.PreBeginPlay();
    Generate();
    numDestinations = 0;
    J0x13:
    // End:0x46 [While If]
    if(numDestinations < 8)
    {
        // End:0x3b
        if(Destinations[numDestinations] != "")
        {
            ++ numDestinations;
        }
        // End:0x43
        else
        {
            numDestinations = 8;
        }
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
    // End:0x6c
    if(numDestinations > 0 && OtherSideURL == "")
    {
        OtherSideURL = Destinations[0];
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local int nextPick;

    // End:0x0d
    if(numDestinations == 0)
    {
        return;
    }
    nextPick = 0;
    J0x14:
    // End:0x41 [While If]
    if(nextPick < 8 && Destinations[nextPick] != OtherSideURL)
    {
        ++ nextPick;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    ++ nextPick;
    // End:0x6f
    if(nextPick > 7 || Destinations[nextPick] == "")
    {
        nextPick = 0;
    }
    OtherSideURL = Destinations[nextPick];
    ForceGenerate();
}

simulated event Generate()
{
    // End:0x0d
    if(OtherSideLevel != none)
    {
        return;
    }
    ForceGenerate();
}

simulated event ForceGenerate()
{
    // End:0x21
    if(InStr(OtherSideURL, "/") >= 0)
    {
        OtherSideLevel = none;
        OtherSideActor = none;
    }
    // End:0x68
    else
    {
        OtherSideLevel = XLevel;
        // End:0x67
        foreach AllActors(class'WarpZoneInfo', OtherSideActor)
        {
            // End:0x66
            if(string(OtherSideActor.ThisTag) ~= OtherSideURL && OtherSideActor != self)
            {
            }
            // End:0x67
            else
            {
                continue;
            }            
        }
    }
}

simulated function ActorEntered(Actor Other)
{
    local Vector L;
    local Rotator R;
    local Controller P;

    // End:0x241
    if(!Other.bJustTeleported)
    {
        Generate();
        // End:0x241
        if(OtherSideActor != none)
        {
            Other.Disable('Touch');
            Other.Disable('UnTouch');
            L = Other.Location;
            // End:0x83
            if(Pawn(Other) != none)
            {
                R = Pawn(Other).GetViewRotation();
            }
            UnWarp(L, Other.Velocity, R);
            OtherSideActor.Warp(L, Other.Velocity, R);
            // End:0x1ff
            if(Other.IsA('Pawn'))
            {
                Pawn(Other).bWarping = bNoTeleFrag;
                // End:0x1f5
                if(Other.SetLocation(L))
                {
                    // End:0x174
                    if(Role == 4)
                    {
                        P = Level.ControllerList;
                        J0x129:
                        // End:0x174 [While If]
                        if(P != none)
                        {
                            // End:0x15d
                            if(P.Enemy == Other)
                            {
                                P.LineOfSightTo(Other);
                            }
                            P = P.nextController;
                            // This is an implied JumpToken; Continue!
                            goto J0x129;
                        }
                    }
                    R.Roll = 0;
                    Pawn(Other).SetViewRotation(R);
                    Pawn(Other).ClientSetLocation(L, R);
                    // End:0x1f2
                    if(Pawn(Other).Controller != none)
                    {
                        Pawn(Other).Controller.MoveTimer = -1.0;
                    }
                }
                // End:0x1fc
                else
                {
                    GotoState('DelayedWarp');
                }
            }
            // End:0x221
            else
            {
                Other.SetLocation(L);
                Other.SetRotation(R);
            }
            Other.Enable('Touch');
            Other.Enable('UnTouch');
        }
    }
}

event ActorLeaving(Actor Other)
{
    // End:0x2a
    if(Other.IsA('Pawn'))
    {
        Pawn(Other).bWarping = false;
    }
}

state DelayedWarp
{
    function Tick(float DeltaTime)
    {
        local Controller P;
        local bool bFound;

        P = Level.ControllerList;
        J0x14:
        // End:0x88 [While If]
        if(P != none)
        {
            // End:0x71
            if(P.Pawn.bWarping && P.Pawn.Region.Zone == self)
            {
                bFound = true;
                ActorEntered(P);
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
        // End:0x9a
        if(!bFound)
        {
            GotoState('None');
        }
    }

}
