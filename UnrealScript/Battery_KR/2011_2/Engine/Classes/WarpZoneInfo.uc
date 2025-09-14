class WarpZoneInfo extends ZoneInfo
    native
    placeable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        OtherSideActor, OtherSideURL, 
        ThisTag;
}

// Export UWarpZoneInfo::execWarp(FFrame&, void* const)
native(314) final function Warp(out Vector loc, out Vector Vel, out Rotator R)
{
    //native.loc;
    //native.Vel;
    //native.R;        
}

// Export UWarpZoneInfo::execUnWarp(FFrame&, void* const)
native(315) final function UnWarp(out Vector loc, out Vector Vel, out Rotator R)
{
    //native.loc;
    //native.Vel;
    //native.R;        
}

function PreBeginPlay()
{
    super.PreBeginPlay();
    Generate();
    numDestinations = 0;
    J0x13:

    // End:0x46 [Loop If]
    if(numDestinations < 8)
    {
        // End:0x3B
        if(Destinations[numDestinations] != "")
        {
            numDestinations++;            
        }
        else
        {
            numDestinations = 8;
        }
        // [Loop Continue]
        goto J0x13;
    }
    // End:0x6C
    if((numDestinations > 0) && OtherSideURL == "")
    {
        OtherSideURL = Destinations[0];
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local int nextPick;

    // End:0x0D
    if(numDestinations == 0)
    {
        return;
    }
    nextPick = 0;
    J0x14:

    // End:0x41 [Loop If]
    if((nextPick < 8) && Destinations[nextPick] != OtherSideURL)
    {
        nextPick++;
        // [Loop Continue]
        goto J0x14;
    }
    nextPick++;
    // End:0x6F
    if((nextPick > 7) || Destinations[nextPick] == "")
    {
        nextPick = 0;
    }
    OtherSideURL = Destinations[nextPick];
    ForceGenerate();
    //return;    
}

simulated event Generate()
{
    // End:0x0D
    if(OtherSideLevel != none)
    {
        return;
    }
    ForceGenerate();
    //return;    
}

simulated event ForceGenerate()
{
    // End:0x21
    if(InStr(OtherSideURL, "/") >= 0)
    {
        OtherSideLevel = none;
        OtherSideActor = none;        
    }
    else
    {
        OtherSideLevel = XLevel;
        // End:0x67
        foreach AllActors(Class'Engine_Decompressed.WarpZoneInfo', OtherSideActor)
        {
            // End:0x66
            if((string(OtherSideActor.ThisTag) ~= OtherSideURL) && OtherSideActor != self)
            {
                // End:0x67
                break;
            }            
        }        
    }
    //return;    
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
            // End:0x1FF
            if(Other.IsA('Pawn'))
            {
                Pawn(Other).bWarping = bNoTeleFrag;
                // End:0x1F5
                if(Other.SetLocation(L))
                {
                    // End:0x174
                    if(int(Role) == int(ROLE_Authority))
                    {
                        P = Level.ControllerList;
                        J0x129:

                        // End:0x174 [Loop If]
                        if(P != none)
                        {
                            // End:0x15D
                            if(P.Enemy == Other)
                            {
                                P.LineOfSightTo(Other);
                            }
                            P = P.nextController;
                            // [Loop Continue]
                            goto J0x129;
                        }
                    }
                    R.Roll = 0;
                    Pawn(Other).SetViewRotation(R);
                    Pawn(Other).ClientSetLocation(L, R);
                    // End:0x1F2
                    if(Pawn(Other).Controller != none)
                    {
                        Pawn(Other).Controller.MoveTimer = -1.0000000;
                    }                    
                }
                else
                {
                    GotoState('DelayedWarp');
                }                
            }
            else
            {
                Other.SetLocation(L);
                Other.SetRotation(R);
            }
            Other.Enable('Touch');
            Other.Enable('UnTouch');
        }
    }
    //return;    
}

event ActorLeaving(Actor Other)
{
    // End:0x2A
    if(Other.IsA('Pawn'))
    {
        Pawn(Other).bWarping = false;
    }
    //return;    
}

state DelayedWarp
{
    function Tick(float DeltaTime)
    {
        local Controller P;
        local bool bFound;

        P = Level.ControllerList;
        J0x14:

        // End:0x88 [Loop If]
        if(P != none)
        {
            // End:0x71
            if(P.Pawn.bWarping && P.Pawn.Region.Zone == self)
            {
                bFound = true;
                ActorEntered(P);
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x14;
        }
        // End:0x9A
        if(!bFound)
        {
            GotoState('None');
        }
        //return;        
    }
    stop;    
}
