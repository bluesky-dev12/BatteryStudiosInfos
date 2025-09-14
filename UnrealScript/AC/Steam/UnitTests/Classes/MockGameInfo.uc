/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnitTests\Classes\MockGameInfo.uc
 * Package Imports:
 *	UnitTests
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class MockGameInfo extends GameInfo
    dependson(MockTrace)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() /*0x00000000-0x80000000*/ databinding editinlinenotify MockTrace MockTrace;

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    return N.Class == class'MockPlayerStart';
}

function bool IsSafeFromEnemySight(NavigationPoint N, byte Team)
{
    return MockTrace.IsSafeFromEnemySight(N, GetEveryEnemyList(Team), Team);
}

defaultproperties
{
    MockTrace=mMockTrace
}