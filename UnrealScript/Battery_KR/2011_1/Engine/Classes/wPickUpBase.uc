class wPickUpBase extends Actor
    abstract
    native
    placeable;

var(PickUpBase) Class<Pickup> PowerUp;
var(PickUpBase) float SpawnHeight;
var(PickUpBase) Class<Emitter> SpiralEmitter;
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
    // End:0xC5
    if(PowerUp != none)
    {
        // End:0x98
        if(int(Level.NetMode) != int(NM_Client))
        {
            SpawnPickup();
            // End:0x98
            if(bDelayedSpawn && myPickUp != none)
            {
                // End:0x6A
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
        // End:0xC5
        if(int(Level.NetMode) != int(NM_DedicatedServer))
        {
            PowerUp.static.StaticPrecache(Level);
        }
    }
    // End:0x11A
    if(!bHidden && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        myEmitter = Spawn(SpiralEmitter,,, Location + vect(0.0000000, 0.0000000, 40.0000000));
        SetDrawScale(default.DrawScale);
    }
    //return;    
}

function bool CheckForErrors()
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    HitActor = Trace(HitLocation, HitNormal, Location - vect(0.0000000, 0.0000000, 10.0000000), Location, false);
    // End:0x4C
    if(HitActor == none)
    {
        Log(string(self) $ " FLOATING");
        return true;
    }
    return super.CheckForErrors();
    //return;    
}

function byte GetInventoryGroup()
{
    return 0;
    //return;    
}

function TurnOn()
{
    //return;    
}

function SpawnPickup()
{
    // End:0x0D
    if(PowerUp == none)
    {
        return;
    }
    myPickUp = Spawn(PowerUp,,, Location + (SpawnHeight * vect(0.0000000, 0.0000000, 1.0000000)), rot(0, 0, 0));
    // End:0x74
    if(myPickUp != none)
    {
        myPickUp.PickUpBase = self;
        myPickUp.Event = Event;
    }
    // End:0xCB
    if(myMarker != none)
    {
        myMarker.markedItem = myPickUp;
        myMarker.ExtraCost = int(ExtraPathCost);
        // End:0xC8
        if(myPickUp != none)
        {
            myPickUp.myMarker = myMarker;
        }        
    }
    else
    {
        Log("No marker for " $ string(self));
    }
    //return;    
}

defaultproperties
{
    SpawnHeight=50.0000000
    DrawType=2
    CullDistance=7000.0000000
    bStatic=true
    RemoteRole=0
    AmbientGlow=64
    CollisionRadius=35.0000000
    CollisionHeight=35.0000000
    bProjTarget=true
}