/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LiftCenter.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:4
 *
 *******************************************************************************/
class LiftCenter extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

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
        foreach DynamicActors(class'Trigger', RecommendedTrigger, LiftTrigger)
        {
            // End:0x28
            break;                        
        }
    }
    super.PostBeginPlay();
}

function Actor SpecialHandling(Pawn Other)
{
    // End:0x0d
    if(MyLift == none)
    {
        return self;
    }
    // End:0x4b
    if(!MyLift.IsInState('StandOpenTimed'))
    {
        // End:0x48
        if(MyLift.bClosed && RecommendedTrigger != none)
        {
            return RecommendedTrigger;
        }
    }
    // End:0x7c
    else
    {
        // End:0x7c
        if(MyLift.BumpType == 0 && !Other.IsPlayerPawn())
        {
            return none;
        }
    }
    return self;
}

function bool SuggestMovePreparation(Pawn Other)
{
    // End:0x1a
    if(Other.Base == MyLift)
    {
        return false;
    }
    SetLocation(MyLift.Location + LiftOffset);
    SetBase(MyLift);
    // End:0x7d
    if(MyLift.bInterpolating || !ProceedWithMove(Other))
    {
        Other.Controller.WaitForMover(MyLift);
        return true;
    }
    return false;
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
    // End:0x1ce
    else
    {
        // End:0x99
        if(Start != none && Start.KeyFrame != 255 && Other.ReachedDestination(Start))
        {
            // End:0x96
            if(MyLift.KeyNum == Start.KeyFrame)
            {
                return true;
            }
        }
        // End:0x1ce
        else
        {
            // End:0xff
            if(LiftExit(Other.Controller.MoveTarget) != none && Other.ReachedDestination(self))
            {
                return LiftExit(Other.Controller.MoveTarget).CanBeReachedFromLiftBy(Other);
            }
            // End:0x1ce
            else
            {
                Dir = Location - Other.Location;
                Dir.Z = 0.0;
                Dist2D = VSize(Dir);
                // End:0x1ce
                if(Location.Z - CollisionHeight < Other.Location.Z - Other.CollisionHeight + 35.0 && Location.Z - CollisionHeight > Other.Location.Z - Other.CollisionHeight - float(1200) && Dist2D < MaxDist2D)
                {
                    return true;
                }
            }
        }
    }
    // End:0x1fc
    if(MyLift.bClosed)
    {
        Other.SetMoveTarget(SpecialHandling(Other));
        return true;
    }
    return false;
}

defaultproperties
{
    MaxDist2D=400.0
    bNeverUseStrafing=true
    bForceNoStrafing=true
    bSpecialMove=true
    bNoAutoConnect=true
    ExtraCost=400
    bStatic=true
    RemoteRole=0
    Texture=Texture'S_LiftCenter'
}