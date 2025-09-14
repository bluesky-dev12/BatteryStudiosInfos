class MockGameInfo extends GameInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() automated MockTrace MockTrace;

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    return N.Class == Class'UnitTests_Decompressed.MockPlayerStart';
    //return;    
}

function bool IsSafeFromEnemySight(NavigationPoint N, byte Team)
{
    return MockTrace.IsSafeFromEnemySight(N, GetEveryEnemyList(Team), Team);
    //return;    
}

defaultproperties
{
    // Reference: MockTrace'UnitTests_Decompressed.MockGameInfo.mMockTrace'
    begin object name="mMockTrace" class=UnitTests_Decompressed.MockTrace
    end object
    MockTrace=mMockTrace
}