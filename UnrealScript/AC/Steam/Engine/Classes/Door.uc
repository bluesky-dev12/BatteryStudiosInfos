/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Door.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:6
 *
 *******************************************************************************/
class Door extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

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

    // End:0x9f
    if(DoorTrigger != 'None')
    {
        // End:0x28
        foreach AllActors(class'Actor', RecommendedTrigger, DoorTrigger)
        {
            // End:0x28
            break;                        
        }
        // End:0x9f
        if(RecommendedTrigger != none)
        {
            dist = Location - RecommendedTrigger.Location;
            // End:0x9f
            if(Abs(dist.Z) < RecommendedTrigger.CollisionHeight)
            {
                dist.Z = 0.0;
                // End:0x9f
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
}

function MoverOpened()
{
    bBlocked = !bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = bInitiallyClosed;
}

function MoverClosed()
{
    bBlocked = bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = !bInitiallyClosed;
}

function Actor SpecialHandling(Pawn Other)
{
    // End:0x0d
    if(MyDoor == none)
    {
        return self;
    }
    // End:0x3e
    if(MyDoor.BumpType == 0 && !Other.IsPlayerPawn())
    {
        return none;
    }
    // End:0x79
    if(bInitiallyClosed == bDoorOpen || MyDoor.bOpening || MyDoor.bDelaying)
    {
        return self;
    }
    // End:0xaf
    if(RecommendedTrigger != none)
    {
        // End:0xa9
        if(Trigger(RecommendedTrigger) != none)
        {
            return RecommendedTrigger.SpecialHandling(Other);
        }
        return RecommendedTrigger;
    }
    return self;
}

function bool ProceedWithMove(Pawn Other)
{
    // End:0x4d
    if(MyDoor.bDamageTriggered && Other.Controller.Focus == MyDoor)
    {
        Other.Controller.StopFiring();
    }
    // End:0x6e
    if(bDoorOpen || !MyDoor.bDamageTriggered)
    {
        return true;
    }
    Other.ShootSpecial(MyDoor);
    MyDoor.Trigger(Other, Other);
    Other.Controller.WaitForMover(MyDoor);
    return false;
}

event bool SuggestMovePreparation(Pawn Other)
{
    // End:0x0b
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
    // End:0xae
    if(MyDoor.bDamageTriggered)
    {
        Other.ShootSpecial(MyDoor);
        MyDoor.Trigger(Other, Other);
        Other.Controller.WaitForMover(MyDoor);
        return true;
    }
    return false;
}

defaultproperties
{
    bInitiallyClosed=true
    bSpecialMove=true
    ExtraCost=100
    RemoteRole=0
    Texture=Texture'S_Door'
}