/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wPickUpBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:5
 *
 *******************************************************************************/
class wPickUpBase extends Actor
    native
    abstract
    placeable;

var(PickUpBase) class<Pickup> PowerUp;
var(PickUpBase) float SpawnHeight;
var(PickUpBase) class<Emitter> SpiralEmitter;
var(PickUpBase) float ExtraPathCost;
var Pickup myPickUp;
var Emitter myEmitter;
var InventorySpot myMarker;
var(PickUpBase) bool bDelayedSpawn;
var StaticMesh NewStaticMesh;
var Vector NewPrePivot;
var float NewDrawScale;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0xc5
    if(PowerUp != none)
    {
        // End:0x98
        if(Level.NetMode != 3)
        {
            SpawnPickup();
            // End:0x98
            if(bDelayedSpawn && myPickUp != none)
            {
                // End:0x6a
                if(myPickUp.IsInState('Pickup'))
                {
                    myPickUp.GotoState('WaitingForMatch');
                }
                // End:0x98
                if(myPickUp.myMarker != none)
                {
                    myPickUp.myMarker.bSuperPickup = true;
                }
            }
        }
        // End:0xc5
        if(Level.NetMode != 1)
        {
            PowerUp.static.StaticPrecache(Level);
        }
    }
    // End:0x11a
    if(!bHidden && Level.NetMode != 1)
    {
        myEmitter = Spawn(SpiralEmitter,,, Location + vect(0.0, 0.0, 40.0));
        SetDrawScale(default.DrawScale);
    }
}

function bool CheckForErrors()
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    HitActor = Trace(HitLocation, HitNormal, Location - vect(0.0, 0.0, 10.0), Location, false);
    // End:0x4c
    if(HitActor == none)
    {
        Log(string(self) $ " FLOATING");
        return true;
    }
    return super.CheckForErrors();
}

function byte GetInventoryGroup()
{
    return 0;
}

function TurnOn();
function SpawnPickup()
{
    // End:0x0d
    if(PowerUp == none)
    {
        return;
    }
    myPickUp = Spawn(PowerUp,,, Location + SpawnHeight * vect(0.0, 0.0, 1.0), rot(0, 0, 0));
    // End:0x74
    if(myPickUp != none)
    {
        myPickUp.PickUpBase = self;
        myPickUp.Event = Event;
    }
    // End:0xcb
    if(myMarker != none)
    {
        myMarker.markedItem = myPickUp;
        myMarker.ExtraCost = int(ExtraPathCost);
        // End:0xc8
        if(myPickUp != none)
        {
            myPickUp.myMarker = myMarker;
        }
    }
    // End:0xe2
    else
    {
        Log("No marker for " $ string(self));
    }
}

defaultproperties
{
    SpawnHeight=50.0
    DrawType=2
    CullDistance=7000.0
    bStatic=true
    RemoteRole=0
    AmbientGlow=64
    CollisionRadius=35.0
    CollisionHeight=35.0
    bProjTarget=true
}