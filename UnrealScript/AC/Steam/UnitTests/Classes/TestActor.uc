/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnitTests\Classes\TestActor.uc
 * Package Imports:
 *	UnitTests
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:8
 *
 *******************************************************************************/
class TestActor extends UnitTest;

function string RunUnitTest(int SW)
{
    switch(SW)
    {
        // End:0x12
        case 0:
            return IterateActorArray_TestIterateCount();
        // End:0x1d
        case 1:
            return IterateActorArray_TestClassFiltering();
        // End:0x29
        case 2:
            return IterateActorArray_TestCorrectIteration();
        // End:0x35
        case 3:
            return IterateObjectArray_TestIterateCount();
        // End:0x41
        case 4:
            return IterateObjectArray_TestClassFiltering();
        // End:0x4d
        case 5:
            return SetLocation_WorksInUnitTest();
        // End:0x59
        case 6:
            return Spawn_SpawnInSpecificLocation();
        // End:0xffff
        default:
            return "";
    }
}

function string IterateActorArray_TestIterateCount()
{
    local array<Actor> Arr;
    local Actor A;
    local int Count;

    Arr[0] = Spawn(class'MockPawn');
    Arr[1] = Spawn(class'MockPawn');
    Arr[2] = Spawn(class'MockPawn');
    // End:0x51
    foreach IterateActorArray(Arr, class'MockPawn', A)
    {
        ++ Count;                
    }
    Arr[0].Destroy();
    Arr[1].Destroy();
    Arr[2].Destroy();
    return Check(Count == 3, "IterateActorArray_TestIterateCount");
}

function string IterateActorArray_TestClassFiltering()
{
    local array<Actor> Arr;
    local Actor A;
    local int Count;

    Arr[0] = Spawn(class'MockPawn');
    Arr[1] = Spawn(class'wDamageType');
    // End:0x40
    foreach IterateActorArray(Arr, class'wDamageType', A)
    {
        ++ Count;                
    }
    Arr[0].Destroy();
    Arr[1].Destroy();
    return Check(Count == 1, "IterateActorArray_TestClassFiltering");
}

function string IterateActorArray_TestCorrectIteration()
{
    local array<Actor> Arr;
    local Actor A;
    local bool arr0Chk, arr1Chk;

    Arr[0] = Spawn(class'MockPawn');
    Arr[1] = Spawn(class'MockPawn');
    // End:0x6b
    foreach IterateActorArray(Arr, class'MockPawn', A)
    {
        // End:0x51
        if(Arr[0] == A)
        {
            arr0Chk = true;
        }
        // End:0x6a
        if(Arr[1] == A)
        {
            arr1Chk = true;
        }                
    }
    Arr[0].Destroy();
    Arr[1].Destroy();
    return Check(arr0Chk && arr0Chk, "IterateActorArray_TestCorrectIteration");
}

function string IterateObjectArray_TestIterateCount()
{
    local array<Object> Arr;
    local Object o;
    local int Count;

    Arr[0] = Spawn(class'MockPawn');
    Arr[1] = new class'BtrTraceResult';
    Arr[2] = new class'BGMTable';
    // End:0x53
    foreach IterateObjectArray(Arr, class'Object', o)
    {
        ++ Count;                
    }
    MockPawn(Arr[0]).Destroy();
    return Check(Count == 3, "IterateObjectArray_TestIterateCount");
}

function string IterateObjectArray_TestClassFiltering()
{
    local array<Object> Arr;
    local Object o;
    local int Count;

    Arr[0] = Spawn(class'MockPawn');
    Arr[1] = new class'BtrTraceResult';
    // End:0x41
    foreach IterateObjectArray(Arr, class'BtrTraceResult', o)
    {
        ++ Count;                
    }
    MockPawn(Arr[0]).Destroy();
    return Check(Count == 1, "IterateObjectArray_TestClassFiltering");
}

function string SetLocation_WorksInUnitTest()
{
    local Actor A;
    local bool Result;

    A = Spawn(class'MockPawn');
    A.SetLocation(vect(100.0, 200.0, 300.0));
    Result = A.Location.X == float(100) && A.Location.Y == float(200) && A.Location.Z == float(300);
    A.Destroy();
    return Check(Result, "SetLocation_WorksInUnitTest");
}

function string Spawn_SpawnInSpecificLocation()
{
    local Actor A;
    local bool Result;

    A = Spawn(class'MockPawn', none, 'None', vect(100.0, 200.0, 300.0));
    Result = A.Location.X == float(100) && A.Location.Y == float(200) && A.Location.Z == float(300);
    A.Destroy();
    return Check(Result, "Spawn_SpawnInSpecificLocation");
}
