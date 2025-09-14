class SpecialVehicleObjective extends RoadPathNode
    hidecategories(Lighting,LightColor,Karma,Force);

var() array< Class<Vehicle> > AccessibleVehicleClasses;
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
    // End:0x1F
    foreach AllActors(Class'Engine.Actor', AssociatedActor, AssociatedActorTag)
    {
        // End:0x1F
        break;        
    }    
    G = UnrealMPGameInfo(Level.Game);
    // End:0x68
    if(G != none)
    {
        NextSpecialVehicleObjective = G.SpecialVehicleObjectives;
        G.SpecialVehicleObjectives = self;
    }
    //return;    
}

function bool IsAccessibleTo(Pawn BotPawn)
{
    local int i;

    // End:0x3F
    if(!bEnabled || (MaxDist > float(0)) && VSize(BotPawn.Location - Location) > MaxDist)
    {
        return false;
    }
    i = 0;
    J0x46:

    // End:0x81 [Loop If]
    if(i < AccessibleVehicleClasses.Length)
    {
        // End:0x77
        if(ClassIsChildOf(BotPawn.Class, AccessibleVehicleClasses[i]))
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x46;
    }
    return false;
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = false;
    //return;    
}

function UnTrigger(Actor Other, Pawn EventInstigator)
{
    // End:0x13
    if(AssociatedActor != none)
    {
        bEnabled = true;
    }
    //return;    
}

function Reset()
{
    bEnabled = false;
    //return;    
}

defaultproperties
{
    bNotBased=true
}