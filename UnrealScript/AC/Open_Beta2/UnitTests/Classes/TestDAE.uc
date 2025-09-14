class TestDAE extends UnitTest;

function string RunUnitTest(int SW)
{
    switch(SW)
    {
        // End:0x12
        case 0:
            return DAE_Healthy_Test();
        // End:0x1D
        case 1:
            return DAE_Healthy_UnderOverFlowTest();
        // End:0x29
        case 2:
            return DAE_Inverse();
        // End:0x35
        case 3:
            return DAE_Multiple();
        // End:0x41
        case 4:
            return DAE_Proximity();
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

function FixtureSetup()
{
    //return;    
}

function FixtureTearOff()
{
    //return;    
}

function string DAE_Healthy_Test()
{
    local Pawn P;
    local float Score;
    local DAE_Healthy DAE;
    local bool Result;
    local MemoryItem mi;

    P = Pawn(EQ(Spawn(Class'UnitTests_Decompressed.MockPawn')));
    P.Health = int(P.HealthMax / float(2));
    DAE = Class'WGame.DAE_Healthy'.static.Create();
    mi = Class'WGame.MemoryItem'.static.Create(none, P);
    Score = DAE.Evaluate(mi);
    Result = Score == 0.5000000;
    DQ();
    return Check(Result, "DAE_Healthy_Test");
    //return;    
}

function string DAE_Healthy_UnderOverFlowTest()
{
    local Pawn P;
    local float Score;
    local DAE_Healthy DAE;
    local bool Result;
    local MemoryItem mi;

    P = Pawn(EQ(Spawn(Class'UnitTests_Decompressed.MockPawn')));
    P.Health = -1000;
    DAE = Class'WGame.DAE_Healthy'.static.Create();
    mi = Class'WGame.MemoryItem'.static.Create(none, P);
    Score = DAE.Evaluate(mi);
    Result = Score >= 0.0000000;
    P.Health = int(P.HealthMax * float(2));
    Score = DAE.Evaluate(mi);
    Result = Result && Score <= 1.0000000;
    DQ();
    return Check(Result, "DAE_Healthy_UnderOverFlowTest");
    //return;    
}

function string DAE_Inverse()
{
    local Pawn P;
    local float Score;
    local DAE_Healthy DAE;
    local DAE_Inverse Inv;
    local bool Result;
    local MemoryItem mi;

    P = Pawn(EQ(Spawn(Class'UnitTests_Decompressed.MockPawn')));
    P.Health = int(P.HealthMax * 0.2000000);
    DAE = Class'WGame.DAE_Healthy'.static.Create();
    Inv = Class'WGame.DAE_Inverse'.static.Create(DAE);
    mi = Class'WGame.MemoryItem'.static.Create(none, P);
    Score = Inv.Evaluate(mi);
    Result = Score == 0.8000000;
    DQ();
    return Check(Result, "DAE_Inverse");
    //return;    
}

function string DAE_Multiple()
{
    local Pawn P;
    local float Score;
    local DAE_Dummy dae1, dae2;
    local DAE_Multiple mut;
    local bool Result;
    local MemoryItem mi;

    P = Pawn(EQ(Spawn(Class'UnitTests_Decompressed.MockPawn')));
    P.Health = int(P.HealthMax);
    dae1 = Class'WGame.DAE_Dummy'.static.Create(0.5000000);
    dae2 = Class'WGame.DAE_Dummy'.static.Create(1.0000000);
    mut = Class'WGame.DAE_Multiple'.static.Create();
    mut.Add(4.0000000, dae1);
    mut.Add(6.0000000, dae2);
    mi = Class'WGame.MemoryItem'.static.Create(none, P);
    Score = mut.Evaluate(mi);
    Result = Score == 0.8000000;
    DQ();
    return Check(Result, "DAE_Multiple");
    //return;    
}

function string DAE_Proximity()
{
    local Pawn P1, P2, p3;
    local DAE_Proximity DAE;
    local bool Result;
    local MemoryItem mi2, mi3;
    local wAIBotBase aiBot;

    P1 = Pawn(EQ(Spawn(Class'UnitTests_Decompressed.MockPawn', none, 'None', vect(0.0000000, 0.0000000, 0.0000000))));
    P2 = Pawn(EQ(Spawn(Class'UnitTests_Decompressed.MockPawn', none, 'None', vect(10.0000000, 0.0000000, 0.0000000))));
    p3 = Pawn(EQ(Spawn(Class'UnitTests_Decompressed.MockPawn', none, 'None', vect(200.0000000, 0.0000000, 0.0000000))));
    aiBot = Spawn(Class'WGame.wAIBot');
    aiBot.Pawn = P1;
    mi2 = Class'WGame.MemoryItem'.static.Create(none, P2);
    mi3 = Class'WGame.MemoryItem'.static.Create(none, p3);
    DAE = Class'WGame.DAE_Proximity'.static.Create(aiBot, 100.0000000);
    Result = (DAE.Evaluate(mi2) == 0.9000000) && DAE.Evaluate(mi3) == float(0);
    DQ();
    return Check(Result, "DAE_Proximity");
    //return;    
}
