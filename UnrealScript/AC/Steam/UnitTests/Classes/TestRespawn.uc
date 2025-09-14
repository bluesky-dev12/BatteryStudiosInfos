/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnitTests\Classes\TestRespawn.uc
 * Package Imports:
 *	UnitTests
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:24
 *
 *******************************************************************************/
class TestRespawn extends UnitTest;

var GameInfo Game;
var PlayerReplicationInfo PriTeam0;
var PlayerReplicationInfo PriTeam1;
var TeamInfo Team0;
var TeamInfo Team1;

function string RunUnitTest(int SW)
{
    switch(SW)
    {
        // End:0x12
        case 0:
            return TestRespawn_PreConditionNoPawnCheck();
        // End:0x1d
        case 1:
            return TestRespawn_PreConditionNoPlayerStartCheck();
        // End:0x29
        case 2:
            return TestRespawn_SpawnedGameInfoCanIterateMockPawns();
        // End:0x35
        case 3:
            return TestRespawn_CanSpawnMockPlayerStart();
        // End:0x41
        case 4:
            return IsAnyPawnWithinRadius_CheckWithIn();
        // End:0x4d
        case 5:
            return IsRespawnPointFailedRecently_Test();
        // End:0x59
        case 6:
            return GetEveryAllyList_GetEveryEnemyList_CheckCount();
        // End:0x65
        case 7:
            return SortNavigationPoints_ClearCandidateDists();
        // End:0x71
        case 8:
            return SortNavigationPoints_TestCorrectSort();
        // End:0x7d
        case 9:
            return InitializeEveryPlayerStarts_CheckCall();
        // End:0x89
        case 10:
            return GetRespawnPointsSortedByClosenessTo_Test();
        // End:0x95
        case 11:
            return InitializeEveryPlayerStarts_CheckMultipleCallSafety();
        // End:0xa1
        case 12:
            return FindPlayerStart_SD_FindSpotEvenIfAllFailedRecently();
        // End:0xad
        case 13:
            return FindPlayerStart_SD_FindNotRecenltyFailedSpotsIfAvailable();
        // End:0xb9
        case 14:
            return IsSafeFromEnemySight_MockVersion_DefaultTraceResult();
        // End:0xc5
        case 15:
            return IsSafeFromEnemySight_MockVersion_AddTrace();
        // End:0xd1
        case 16:
            return GetSafetestRespawnPoint_TestVisibility();
        // End:0xdd
        case 17:
            return GetSafetestRespawnPoint_TestSDAttackTeamChange();
        // End:0xe9
        case 18:
            return FindPlayerStart_TestSBT_SDRespawnAfterPrimaryTeamChange();
        // End:0xf5
        case 19:
            return GetRespawnPointRatingEnemy_CheckDisableDistance();
        // End:0x101
        case 20:
            return FindPlayerStart_SBTNonSdAfterPrimaryTeamChange();
        // End:0xffff
        default:
            return "";
    }
}

function FixtureSetup()
{
    Game = Spawn(class'GameInfo');
    Team0 = Spawn(class'TeamInfo');
    Team0.TeamIndex = 0;
    Team1 = Spawn(class'TeamInfo');
    Team1.TeamIndex = 1;
    PriTeam0 = Spawn(class'PlayerReplicationInfo');
    PriTeam0.Team = Team0;
    PriTeam1 = Spawn(class'PlayerReplicationInfo');
    PriTeam1.Team = Team1;
}

function FixtureTearOff()
{
    PriTeam0.Destroy();
    PriTeam1.Destroy();
    Team0.Destroy();
    Team1.Destroy();
    Game.Destroy();
}

function string TestRespawn_PreConditionNoPawnCheck()
{
    local Pawn P;
    local int Count;

    // End:0x18
    foreach DynamicActors(class'Pawn', P)
    {
        ++ Count;                
    }
    return Check(Count == 0, "TestRespawn_PreConditionNoPawnCheck");
}

function string TestRespawn_PreConditionNoPlayerStartCheck()
{
    local PlayerStart P;
    local int Count;

    // End:0x18
    foreach DynamicActors(class'PlayerStart', P)
    {
        ++ Count;                
    }
    return Check(Count == 0, "TestRespawn_PreConditionNoPlayerStartCheck");
}

function string TestRespawn_SpawnedGameInfoCanIterateMockPawns()
{
    local MockPawn P, IP;
    local int Count;

    P = Spawn(class'MockPawn');
    // End:0x2f
    foreach Game.DynamicActors(class'MockPawn', IP)
    {
        ++ Count;                
    }
    P.Destroy();
    return Check(Count == 1, "TestRespawn_SpawnedGameInfoCanIterateMockPawns");
}

function string TestRespawn_CanSpawnMockPlayerStart()
{
    local PlayerStart S;
    local bool Result;

    S = Spawn(class'MockPlayerStart', none, 'None', vect(10.0, 0.0, 0.0));
    Result = S != none;
    S.Destroy();
    return Check(Result, "TestRespawn_CanSpawnMockPlayerStart");
}

function string IsAnyPawnWithinRadius_CheckWithIn()
{
    local MockPawn P;
    local PlayerStart S, s2;
    local bool result1, result2;

    P = MockPawn(EQ(Spawn(class'MockPawn', none, 'None', vect(0.0, 0.0, 0.0))));
    S = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(10.0, 0.0, 0.0))));
    s2 = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(100.0, 0.0, 0.0))));
    result1 = Game.IsAnyPawnWithinRadius(S);
    result2 = Game.IsAnyPawnWithinRadius(s2);
    DQ();
    return Check(result1 && !result2, "IsWithinAnyPawnRadius_CheckWithIn result1=" $ string(result1) $ " result2=" $ string(result2));
}

function string IsRespawnPointFailedRecently_Test()
{
    local PlayerStart S;
    local bool result1, result2;

    S = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(10.0, 0.0, 0.0))));
    S.LastSpawnFailTime = -1.0;
    result1 = Game.IsRespawnPointFailedRecently(S);
    S.LastSpawnFailTime = Level.TimeSeconds - Game.SC.default.RespawnFailDuration / 2.0;
    result2 = Game.IsRespawnPointFailedRecently(S);
    DQ();
    return Check(!result1 && result2, "IsRespawnPointFailedRecently_Test result1=" $ string(result1) $ " result2=" $ string(result2));
}

function string GetEveryAllyList_GetEveryEnemyList_CheckCount()
{
    local MockPawn p0, P1, P2;
    local array<Pawn> arr0, arr1;
    local array<Actor> arrEnemy0, arrEnemy1;

    p0 = MockPawn(EQ(Spawn(class'MockPawn')));
    p0.PlayerReplicationInfo = PriTeam0;
    P1 = MockPawn(EQ(Spawn(class'MockPawn')));
    P1.PlayerReplicationInfo = PriTeam1;
    P2 = MockPawn(EQ(Spawn(class'MockPawn')));
    P2.PlayerReplicationInfo = PriTeam0;
    arr0 = Game.GetEveryAllyList(0);
    arr1 = Game.GetEveryAllyList(1);
    arrEnemy0 = Game.GetEveryEnemyList(0);
    arrEnemy1 = Game.GetEveryEnemyList(1);
    DQ();
    return Check(arr0.Length == 2 && arr1.Length == 1 && arrEnemy0.Length == 1 && arrEnemy1.Length == 2, "GetEveryAllyList_GetEveryEnemyList_CheckCount arr0=" $ string(arr0.Length) $ " arr1=" $ string(arr1.Length) $ "arrEnemy0=" $ string(arrEnemy0.Length) $ "arrEnemy1=" $ string(arrEnemy1.Length));
}

function string SortNavigationPoints_ClearCandidateDists()
{
    local array<MockPlayerStart> Arr;
    local array<float> arrDists;
    local bool Result, result2;

    Arr[0] = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 20.0, 0.0))));
    Arr[1] = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 10.0, 0.0))));
    Game.SortNavigationPoints(Arr[0], Arr, arrDists);
    Result = Arr.Length == 2 && arrDists.Length == 2;
    Game.SortNavigationPoints(Arr[1], Arr, arrDists);
    result2 = Arr.Length == 2 && arrDists.Length == 2;
    DQ();
    return Check(Result && result2, "SortNavigationPoints_ClearCandidateDists, result=" $ string(Result) $ ", result2=" $ string(result2));
}

function string SortNavigationPoints_TestCorrectSort()
{
    local array<MockPlayerStart> Arr;
    local array<float> arrDists;
    local bool Result, result2;

    Arr[0] = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 20.0, 0.0))));
    Arr[1] = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 10.0, 0.0))));
    Arr[2] = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 40.0, 0.0))));
    Arr[3] = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 30.0, 0.0))));
    Game.SortNavigationPoints(Arr[1], Arr, arrDists);
    Result = Arr[0].Location.Y == float(10) && Arr[1].Location.Y == float(20) && Arr[2].Location.Y == float(30) && Arr[3].Location.Y == float(40);
    Game.SortNavigationPoints(Arr[3], Arr, arrDists);
    result2 = Arr[0].Location.Y == float(40) && Arr[1].Location.Y == float(30) && Arr[2].Location.Y == float(20) && Arr[3].Location.Y == float(10);
    DQ();
    return Check(Result && result2, "SortNavigationPoints_TestCorrectSort, result=" $ string(Result) $ ", result2=" $ string(result2));
}

function string InitializeEveryPlayerStarts_CheckCall()
{
    local GameInfo G;
    local Actor s0, s1, s2;
    local bool Result;

    s0 = EQ(Spawn(class'MockPlayerStart'));
    s1 = EQ(Spawn(class'MockPlayerStart'));
    s2 = EQ(Spawn(class'MockPlayerStart_SD'));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    Result = G.EveryPlayerStarts.Length == 2 && G.EverySDPlayerStarts.Length == 1;
    DQ();
    return Check(Result, "InitializeEveryPlayerStarts_CheckCall");
}

function string InitializeEveryPlayerStarts_CheckMultipleCallSafety()
{
    local GameInfo G;
    local Actor s0, s1;
    local bool result0, result1;

    s0 = EQ(Spawn(class'MockPlayerStart'));
    s1 = EQ(Spawn(class'MockPlayerStart_SD'));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    result0 = G.EveryPlayerStarts.Length == 1 && G.EverySDPlayerStarts.Length == 1;
    G.InitializeEveryPlayerStarts();
    G.InitializeEveryPlayerStarts();
    result1 = G.EveryPlayerStarts.Length == 1 && G.EverySDPlayerStarts.Length == 1;
    DQ();
    return Check(result0 && result1, "InitializeEveryPlayerStarts_CheckMultipleCallSafety");
}

function string GetRespawnPointsSortedByClosenessTo_Test()
{
    local GameInfo G;
    local Actor s0, s1, s2;
    local array<NavigationPoint> Arr;
    local bool Result;

    s0 = EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 30.0, 0.0)));
    s1 = EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 10.0, 0.0)));
    s2 = EQ(Spawn(class'MockPlayerStart', none, 'None', vect(0.0, 20.0, 0.0)));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    Arr = G.GetRespawnPointsSortedByClosenessTo(s1, 0, 2);
    Result = Arr.Length == 2 && Arr[0].Location.Y == float(10) && Arr[1].Location.Y == float(20);
    DQ();
    return Check(Result, "GetRespawnPointsSortedByClosenessTo_Test");
}

function string FindPlayerStart_SD_FindSpotEvenIfAllFailedRecently()
{
    local GameInfo G;
    local MockPlayerStart_SD s0, s1, r0, r1;
    local bool result0, result1;

    s0 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD')));
    s1 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD')));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    s0.LastSpawnFailTime = Level.TimeSeconds;
    s1.LastSpawnFailTime = Level.TimeSeconds;
    s0.eTeamType = 0;
    s1.eTeamType = 1;
    r0 = MockPlayerStart_SD(G.FindPlayerStart_SD(0));
    r1 = MockPlayerStart_SD(G.FindPlayerStart_SD(1));
    result0 = r0 != none && r0.eTeamType == 0;
    result1 = r1 != none && r1.eTeamType == 1;
    DQ();
    return Check(result0 && result1, "FindPlayerStart_SD_FindSpotEvenIfAllFailedRecently");
}

function string FindPlayerStart_SD_FindNotRecenltyFailedSpotsIfAvailable()
{
    local GameInfo G;
    local MockPlayerStart_SD s0, s1;
    local bool result0;

    s0 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD')));
    s1 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD')));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    s0.LastSpawnFailTime = Level.TimeSeconds;
    s1.LastSpawnFailTime = Level.TimeSeconds - float(100);
    s0.eTeamType = 0;
    s1.eTeamType = 0;
    result0 = G.FindPlayerStart_SD(0) == s1;
    DQ();
    return Check(result0, "FindPlayerStart_SD_FindNotRecenltyFailedSpotsIfAvailable");
}

function string IsSafeFromEnemySight_MockVersion_DefaultTraceResult()
{
    local MockGameInfo G;
    local MockPlayerStart_SD s0;
    local MockPawn p0, P1;
    local bool result0, result1;

    s0 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD')));
    p0 = MockPawn(EQ(Spawn(class'MockPawn')));
    P1 = MockPawn(EQ(Spawn(class'MockPawn')));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    p0.PlayerReplicationInfo = PriTeam0;
    P1.PlayerReplicationInfo = PriTeam1;
    G.MockTrace.DefaultTraceResult = false;
    result0 = G.IsSafeFromEnemySight(s0, 0) && G.IsSafeFromEnemySight(s0, 1);
    G.MockTrace.DefaultTraceResult = true;
    result1 = !G.IsSafeFromEnemySight(s0, 0) && !G.IsSafeFromEnemySight(s0, 1);
    DQ();
    return Check(result0 && result1, "IsSafeFromEnemySight_MockVersion_DefaultTraceResult");
}

function string IsSafeFromEnemySight_MockVersion_AddTrace()
{
    local MockGameInfo G;
    local MockPlayerStart_SD s0;
    local MockPawn p0, P1;
    local bool result0;

    s0 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD')));
    p0 = MockPawn(EQ(Spawn(class'MockPawn')));
    p0.PlayerReplicationInfo = PriTeam0;
    P1 = MockPawn(EQ(Spawn(class'MockPawn')));
    P1.PlayerReplicationInfo = PriTeam1;
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    G.MockTrace.DefaultTraceResult = false;
    G.MockTrace.AddTrace(s0, p0, true);
    result0 = G.IsSafeFromEnemySight(s0, 0) && !G.IsSafeFromEnemySight(s0, 1);
    DQ();
    return Check(result0, "IsSafeFromEnemySight_MockVersion_AddTrace");
}

function string GetSafetestRespawnPoint_TestVisibility()
{
    local MockGameInfo G;
    local MockPlayerStart s0, s1, s2, Results;
    local MockPawn P1;
    local bool result0;

    P1 = MockPawn(EQ(Spawn(class'MockPawn', none, 'None', vect(0.0, 0.0, 0.0))));
    P1.PlayerReplicationInfo = PriTeam1;
    s0 = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(50.0, 0.0, 0.0))));
    s1 = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(20.0, 0.0, 0.0))));
    s2 = MockPlayerStart(EQ(Spawn(class'MockPlayerStart', none, 'None', vect(10.0, 0.0, 0.0))));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    G.MockTrace.DefaultTraceResult = false;
    G.MockTrace.AddTrace(s0, P1, true);
    Results = MockPlayerStart(G.GetSafetestRespawnPoint(0, G.EveryPlayerStarts));
    result0 = Results == s1;
    DQ();
    return Check(result0, "GetSafetestRespawnPoint_TestVisibility");
}

function string GetSafetestRespawnPoint_TestSDAttackTeamChange()
{
    local MockMSGameInfo G;
    local MockPlayerStart_SD s0, s1, Results;
    local MockPawn P1;
    local bool result0, result1, result2, result3;

    P1 = MockPawn(EQ(Spawn(class'MockPawn', none, 'None', vect(0.0, 0.0, 0.0))));
    P1.PlayerReplicationInfo = PriTeam1;
    s0 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD', none, 'None', vect(50.0, 0.0, 0.0))));
    s0.eTeamType = 0;
    s1 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD', none, 'None', vect(20.0, 0.0, 0.0))));
    s1.eTeamType = 1;
    G = MockMSGameInfo(EQ(Spawn(class'MockMSGameInfo')));
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 0));
    result0 = Results == s0;
    G.CurrentAttackingTeam = 1;
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 0));
    result1 = Results == s1;
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 1));
    result2 = Results == s0;
    G.CurrentAttackingTeam = 0;
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 1));
    result3 = Results == s1;
    DQ();
    return Check(result0 && result1 && result2 && result3, "GetSafetestRespawnPoint_TestSDAttackTeamChange");
}

function string FindPlayerStart_TestSBT_SDRespawnAfterPrimaryTeamChange()
{
    local MockSBTGameInfo G;
    local MockPlayerStart_SD s0, s1, Results;
    local MockPawn P1;
    local bool result0, result1, result2, result3;

    P1 = MockPawn(EQ(Spawn(class'MockPawn', none, 'None', vect(0.0, 0.0, 0.0))));
    P1.PlayerReplicationInfo = PriTeam1;
    s0 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD', none, 'None', vect(50.0, 0.0, 0.0))));
    s0.eTeamType = 0;
    s1 = MockPlayerStart_SD(EQ(Spawn(class'MockPlayerStart_SD', none, 'None', vect(20.0, 0.0, 0.0))));
    s1.eTeamType = 1;
    G = MockSBTGameInfo(EQ(Spawn(class'MockSBTGameInfo')));
    G.PrimaryTeam = 0;
    G.CurrentAttackingTeam = 1;
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 0));
    result0 = Results == s0;
    G.PrimaryTeam = 1;
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 0));
    result1 = Results == s1;
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 1));
    result2 = Results == s0;
    G.PrimaryTeam = 0;
    G.CurrentAttackingTeam = 0;
    Results = MockPlayerStart_SD(G.FindPlayerStart(none, 1));
    result3 = Results == s1;
    DQ();
    return Check(result0 && result1 && result2 && result3, "FindPlayerStart_TestSBT_SDRespawnAfterPrimaryTeamChange");
}

function string FindPlayerStart_SBTNonSdAfterPrimaryTeamChange()
{
    local MockSBTGameInfo G;
    local MockPlayerStart_SBT s0, s1;
    local Actor r0, r1;
    local MockPawn p0, P1;
    local bool result0, result1;

    p0 = MockPawn(EQ(Spawn(class'MockPawn', none, 'None', vect(0.0, 0.0, 0.0))));
    p0.PlayerReplicationInfo = PriTeam1;
    P1 = MockPawn(EQ(Spawn(class'MockPawn', none, 'None', vect(0.0, 10.0, 0.0))));
    P1.PlayerReplicationInfo = PriTeam1;
    s0 = MockPlayerStart_SBT(EQ(Spawn(class'MockPlayerStart_SBT', none, 'None', vect(0.0, 0.0, 0.0))));
    s0.TeamNumber = 0;
    s1 = MockPlayerStart_SBT(EQ(Spawn(class'MockPlayerStart_SBT', none, 'None', vect(0.0, 10.0, 0.0))));
    s1.TeamNumber = 1;
    G = MockSBTGameInfo(EQ(Spawn(class'MockSBTGameInfo')));
    G.ResultNeedToRespawnSD = false;
    G.PrimaryTeam = 0;
    r0 = G.FindPlayerStart(none, 0);
    result0 = r0 == s0;
    G.PrimaryTeam = 1;
    r1 = G.FindPlayerStart(none, 0);
    result1 = r1 == s1;
    DQ();
    return Check(result0 && result1, "FindPlayerStart_SBTNonSdAfterPrimaryTeamChange");
}

function string GetRespawnPointRatingEnemy_CheckDisableDistance()
{
    local GameInfo G;
    local Actor s0, s1, r0, r1;
    local MockPawn e0;
    local bool result0, result1;

    s0 = EQ(Spawn(class'MockPlayerStart'));
    G = MockGameInfo(EQ(Spawn(class'MockGameInfo')));
    e0 = MockPawn(EQ(Spawn(class'MockPawn')));
    e0.PlayerReplicationInfo = PriTeam0;
    r0 = G.GetRespawnPointRatingEnemy(true, G.EveryPlayerStarts, 1);
    result0 = r0 == none;
    s1 = EQ(Spawn(class'MockPlayerStart', none, 'None', vect(5000.0, 5000.0, 5000.0)));
    G.InitializeEveryPlayerStarts();
    r1 = G.GetRespawnPointRatingEnemy(true, G.EveryPlayerStarts, 1);
    result1 = r1 == s1;
    DQ();
    return Check(result0 && result1, "GetRespawnPointRatingEnemy_CheckDisableDistance");
}
