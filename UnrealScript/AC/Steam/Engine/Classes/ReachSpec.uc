/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ReachSpec.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *
 *******************************************************************************/
class ReachSpec extends Object
    native;

var int Distance;
var const NavigationPoint Start;
var const NavigationPoint End;
var int CollisionRadius;
var int CollisionHeight;
var int reachFlags;
var int MaxLandingVelocity;
var byte bPruned;
var bool bForced;
