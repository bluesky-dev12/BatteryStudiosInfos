/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnitTests\Classes\MockSBTGameInfo.uc
 * Package Imports:
 *	UnitTests
 *	WMission
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class MockSBTGameInfo extends wSBTGameInfo
    dependson(MockTrace)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var() /*0x00000000-0x80000000*/ databinding editinlinenotify MockTrace MockTrace;
var bool ResultNeedToRespawnSD;

function bool IsSafeFromEnemySight(NavigationPoint N, byte Team)
{
    return MockTrace.IsSafeFromEnemySight(N, GetEveryEnemyList(Team), Team);
}

function bool IsSDRespawnTime()
{
    return ResultNeedToRespawnSD;
}

defaultproperties
{
    MockTrace=mMockTrace
    ResultNeedToRespawnSD=true
}