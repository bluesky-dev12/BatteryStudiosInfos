/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnitTests\Classes\TestDAE.uc
 * Package Imports:
 *	UnitTests
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:8
 *
 *******************************************************************************/
class TestDAE extends UnitTest;

function string RunUnitTest(int SW)
{
    switch(SW)
    {
        // End:0x12
        case 0:
            return DAE_Healthy_Test();
        // End:0x1d
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
        // End:0xffff
        default:
            return "";
    }
}

function FixtureSetup();
function FixtureTearOff();
function string DAE_Healthy_Test()
{
    local Pawn P;
    local float Score;
    local DAE_Healthy DAE;
    local bool Result;
    local MemoryItem MI;

    P = Pawn(EQ(Spawn(class'MockPawn')));
    P.Health = int(P.HealthMax / float(2));
    DAE = class'DAE_Healthy'.static.Create();
    MI = class'MemoryItem'.static.Create(none, P);
    Score = DAE.Evaluate(MI);
    Result = Score == 0.50;
    DQ();
    return Check(Result, "DAE_Healthy_Test");
}

function string DAE_Healthy_UnderOverFlowTest()
{
    local Pawn P;
    local float Score;
    local DAE_Healthy DAE;
    local bool Result;
    local MemoryItem MI;

    P = Pawn(EQ(Spawn(class'MockPawn')));
    P.Health = -1000;
    DAE = class'DAE_Healthy'.static.Create();
    MI = class'MemoryItem'.static.Create(none, P);
    Score = DAE.Evaluate(MI);
    Result = Score >= 0.0;
    P.Health = int(P.HealthMax * float(2));
    Score = DAE.Evaluate(MI);
    Result = Result && Score <= 1.0;
    DQ();
    return Check(Result, "DAE_Healthy_UnderOverFlowTest");
}

function string DAE_Inverse()
{
    local Pawn P;
    local float Score;
    local DAE_Healthy DAE;
    local DAE_Inverse Inv;
    local bool Result;
    local MemoryItem MI;

    P = Pawn(EQ(Spawn(class'MockPawn')));
    P.Health = int(P.HealthMax * 0.20);
    DAE = class'DAE_Healthy'.static.Create();
    Inv = class'DAE_Inverse'.static.Create(DAE);
    MI = class'MemoryItem'.static.Create(none, P);
    Score = Inv.Evaluate(MI);
    Result = Score == 0.80;
    DQ();
    return Check(Result, "DAE_Inverse");
}

function string DAE_Multiple()
{
    local Pawn P;
    local float Score;
    local DAE_Dummy dae1, dae2;
    local DAE_Multiple mut;
    local bool Result;
    local MemoryItem MI;

    P = Pawn(EQ(Spawn(class'MockPawn')));
    P.Health = int(P.HealthMax);
    dae1 = class'DAE_Dummy'.static.Create(0.50);
    dae2 = class'DAE_Dummy'.static.Create(1.0);
    mut = class'DAE_Multiple'.static.Create();
    mut.Add(4.0, dae1);
    mut.Add(6.0, dae2);
    MI = class'MemoryItem'.static.Create(none, P);
    Score = mut.Evaluate(MI);
    Result = Score == 0.80;
    DQ();
    return Check(Result, "DAE_Multiple");
}

function string DAE_Proximity()
{
    local Pawn P1, P2, p3;
    local DAE_Proximity DAE;
    local bool Result;
    local MemoryItem mi2, mi3;
    local wAIBotBase aibot;

    P1 = Pawn(EQ(Spawn(class'MockPawn', none, 'None', vect(0.0, 0.0, 0.0))));
    P2 = Pawn(EQ(Spawn(class'MockPawn', none, 'None', vect(10.0, 0.0, 0.0))));
    p3 = Pawn(EQ(Spawn(class'MockPawn', none, 'None', vect(200.0, 0.0, 0.0))));
    aibot = Spawn(class'wAIBot');
    aibot.Pawn = P1;
    mi2 = class'MemoryItem'.static.Create(none, P2);
    mi3 = class'MemoryItem'.static.Create(none, p3);
    DAE = class'DAE_Proximity'.static.Create(aibot, 100.0);
    Result = DAE.Evaluate(mi2) == 0.90 && DAE.Evaluate(mi3) == float(0);
    DQ();
    return Check(Result, "DAE_Proximity");
}
