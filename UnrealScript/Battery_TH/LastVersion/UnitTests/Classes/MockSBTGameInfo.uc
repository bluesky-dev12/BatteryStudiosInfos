class MockSBTGameInfo extends wSBTGameInfo
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() automated MockTrace MockTrace;
var bool ResultNeedToRespawnSD;

function bool IsSafeFromEnemySight(NavigationPoint N, byte Team)
{
    return MockTrace.IsSafeFromEnemySight(N, GetEveryEnemyList(Team), Team);
    //return;    
}

function bool IsSDRespawnTime()
{
    return ResultNeedToRespawnSD;
    //return;    
}

defaultproperties
{
    // Reference: MockTrace'UnitTests_Decompressed.MockSBTGameInfo.mMockTrace'
    begin object name="mMockTrace" class=UnitTests_Decompressed.MockTrace
    end object
    MockTrace=mMockTrace
    ResultNeedToRespawnSD=true
}