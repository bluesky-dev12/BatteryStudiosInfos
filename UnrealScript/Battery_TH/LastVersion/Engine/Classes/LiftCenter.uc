class LiftCenter extends NavigationPoint
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() name LiftTag;
var Mover MyLift;
var() name LiftTrigger;
var Trigger RecommendedTrigger;
var float MaxDist2D;
var Vector LiftOffset;

function PostBeginPlay()
{
    // End:0x29
    if(LiftTrigger != 'None')
    {
        // End:0x28
        foreach DynamicActors(Class'Engine.Trigger', RecommendedTrigger, LiftTrigger)
        {
            // End:0x28
            break;            
        }        
    }
    super.PostBeginPlay();
    //return;    
}

function Actor SpecialHandling(Pawn Other)
{
    // End:0x0D
    if(MyLift == none)
    {
        return self;
    }
    // End:0x4B
    if(!MyLift.IsInState('StandOpenTimed'))
    {
        // End:0x48
        if(MyLift.bClosed && RecommendedTrigger != none)
        {
            return RecommendedTrigger;
        }        
    }
    else
    {
        // End:0x7C
        if((int(MyLift.BumpType) == int(0)) && !Other.IsPlayerPawn())
        {
            return none;
        }
    }
    return self;
    //return;    
}

function bool SuggestMovePreparation(Pawn Other)
{
    // End:0x1A
    if(Other.Base == MyLift)
    {
        return false;
    }
    SetLocation(MyLift.Location + LiftOffset);
    SetBase(MyLift);
    // End:0x7D
    if(MyLift.bInterpolating || !ProceedWithMove(Other))
    {
        Other.Controller.WaitForMover(MyLift);
        return true;
    }
    return false;
    //return;    
}

function bool ProceedWithMove(Pawn Other)
{
    local LiftExit Start;
    local float Dist2D;
    local Vector Dir;

    Start = LiftExit(Other.Anchor);
    // End:0x32
    if(Other.Controller == none)
    {
        return false;        
    }
    else
    {
        // End:0x99
        if(((Start != none) && int(Start.KeyFrame) != 255) && Other.ReachedDestination(Start))
        {
            // End:0x96
            if(int(MyLift.KeyNum) == int(Start.KeyFrame))
            {
                return true;
            }            
        }
        else
        {
            // End:0xFF
            if((LiftExit(Other.Controller.MoveTarget) != none) && Other.ReachedDestination(self))
            {
                return LiftExit(Other.Controller.MoveTarget).CanBeReachedFromLiftBy(Other);                
            }
            else
            {
                Dir = Location - Other.Location;
                Dir.Z = 0.0000000;
                Dist2D = VSize(Dir);
                // End:0x1CE
                if((((Location.Z - CollisionHeight) < ((Other.Location.Z - Other.CollisionHeight) + 35.0000000)) && (Location.Z - CollisionHeight) > ((Other.Location.Z - Other.CollisionHeight) - float(1200))) && Dist2D < MaxDist2D)
                {
                    return true;
                }
            }
        }
    }
    // End:0x1FC
    if(MyLift.bClosed)
    {
        Other.SetMoveTarget(SpecialHandling(Other));
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    MaxDist2D=400.0000000
    bNeverUseStrafing=true
    bForceNoStrafing=true
    bSpecialMove=true
    bNoAutoConnect=true
    ExtraCost=400
    bStatic=false
    RemoteRole=0
    Texture=Texture'Engine.S_LiftCenter'
}