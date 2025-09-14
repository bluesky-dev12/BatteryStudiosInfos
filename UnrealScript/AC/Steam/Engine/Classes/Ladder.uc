/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Ladder.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class Ladder extends SmallNavigationPoint
    dependson(LadderVolume)
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

var LadderVolume MyLadder;
var Ladder LadderList;

event bool SuggestMovePreparation(Pawn Other)
{
    // End:0x0d
    if(MyLadder == none)
    {
        return false;
    }
    // End:0x3c
    if(!MyLadder.InUse(Other))
    {
        MyLadder.PendingClimber = Other;
        return false;
    }
    Other.Controller.bPreparingMove = true;
    Other.Acceleration = vect(0.0, 0.0, 0.0);
    return true;
}

defaultproperties
{
    bSpecialMove=true
    bNotBased=true
    Texture=Texture'S_Ladder'
    bDirectional=true
}