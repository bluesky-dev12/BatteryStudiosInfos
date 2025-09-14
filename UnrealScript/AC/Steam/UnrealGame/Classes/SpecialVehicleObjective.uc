/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\SpecialVehicleObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class SpecialVehicleObjective extends RoadPathNode
    hidecategories(Lighting,LightColor,Karma,Force);

var() array< class<Vehicle> > AccessibleVehicleClasses;
var() name AssociatedActorTag;
var() float MaxDist;
var Actor AssociatedActor;
var bool bEnabled;
var SpecialVehicleObjective NextSpecialVehicleObjective;
var Pawn TeamOwner[4];

function PostBeginPlay()
{
    local UnrealMPGameInfo G;

    super(NavigationPoint).PostBeginPlay();
    // End:0x1f
    foreach AllActors(class'Actor', AssociatedActor, AssociatedActorTag)
    {
        // End:0x1f
        break;                
    }
    G = UnrealMPGameInfo(Level.Game);
    // End:0x68
    if(G != none)
    {
        NextSpecialVehicleObjective = G.SpecialVehicleObjectives;
        G.SpecialVehicleObjectives = self;
    }
}

function bool IsAccessibleTo(Pawn BotPawn)
{
    local int i;

    // End:0x3f
    if(!bEnabled || MaxDist > float(0) && VSize(BotPawn.Location - Location) > MaxDist)
    {
        return false;
    }
    i = 0;
    J0x46:
    // End:0x81 [While If]
    if(i < AccessibleVehicleClasses.Length)
    {
        // End:0x77
        if(ClassIsChildOf(BotPawn.Class, AccessibleVehicleClasses[i]))
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    return false;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = false;
}

function UnTrigger(Actor Other, Pawn EventInstigator)
{
    // End:0x13
    if(AssociatedActor != none)
    {
        bEnabled = true;
    }
}

function Reset()
{
    bEnabled = false;
}

defaultproperties
{
    bNotBased=true
}