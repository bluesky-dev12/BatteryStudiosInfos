class Door extends NavigationPoint
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() name DoorTag;
var Mover MyDoor;
var() name DoorTrigger;
var Actor RecommendedTrigger;
var() bool bInitiallyClosed;
var() bool bBlockedWhenClosed;
var bool bDoorOpen;
var bool bTempNoCollide;

function PostBeginPlay()
{
    local Vector dist;

    // End:0x9F
    if(DoorTrigger != 'None')
    {
        // End:0x28
        foreach AllActors(Class'Engine.Actor', RecommendedTrigger, DoorTrigger)
        {
            // End:0x28
            break;            
        }        
        // End:0x9F
        if(RecommendedTrigger != none)
        {
            dist = Location - RecommendedTrigger.Location;
            // End:0x9F
            if(Abs(dist.Z) < RecommendedTrigger.CollisionHeight)
            {
                dist.Z = 0.0000000;
                // End:0x9F
                if(VSize(dist) < RecommendedTrigger.CollisionRadius)
                {
                    RecommendedTrigger = none;
                }
            }
        }
    }
    bBlocked = bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = !bInitiallyClosed;
    super.PostBeginPlay();
    //return;    
}

function MoverOpened()
{
    bBlocked = !bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = bInitiallyClosed;
    //return;    
}

function MoverClosed()
{
    bBlocked = bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = !bInitiallyClosed;
    //return;    
}

function Actor SpecialHandling(Pawn Other)
{
    // End:0x0D
    if(MyDoor == none)
    {
        return self;
    }
    // End:0x3E
    if((int(MyDoor.BumpType) == int(0)) && !Other.IsPlayerPawn())
    {
        return none;
    }
    // End:0x79
    if(bInitiallyClosed == ((bDoorOpen || MyDoor.bOpening) || MyDoor.bDelaying))
    {
        return self;
    }
    // End:0xAF
    if(RecommendedTrigger != none)
    {
        // End:0xA9
        if(Trigger(RecommendedTrigger) != none)
        {
            return RecommendedTrigger.SpecialHandling(Other);
        }
        return RecommendedTrigger;
    }
    return self;
    //return;    
}

function bool ProceedWithMove(Pawn Other)
{
    // End:0x4D
    if(MyDoor.bDamageTriggered && Other.Controller.Focus == MyDoor)
    {
        Other.Controller.StopFiring();
    }
    // End:0x6E
    if(bDoorOpen || !MyDoor.bDamageTriggered)
    {
        return true;
    }
    Other.ShootSpecial(MyDoor);
    MyDoor.Trigger(Other, Other);
    Other.Controller.WaitForMover(MyDoor);
    return false;
    //return;    
}

event bool SuggestMovePreparation(Pawn Other)
{
    // End:0x0B
    if(bDoorOpen)
    {
        return false;
    }
    // End:0x50
    if(MyDoor.bOpening || MyDoor.bDelaying)
    {
        Other.Controller.WaitForMover(MyDoor);
        return true;
    }
    // End:0xAE
    if(MyDoor.bDamageTriggered)
    {
        Other.ShootSpecial(MyDoor);
        MyDoor.Trigger(Other, Other);
        Other.Controller.WaitForMover(MyDoor);
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    bInitiallyClosed=true
    bSpecialMove=true
    ExtraCost=100
    RemoteRole=0
    Texture=Texture'Engine.S_Door'
}