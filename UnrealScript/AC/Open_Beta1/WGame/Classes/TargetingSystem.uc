class TargetingSystem extends Object;

var wAIBotBase Owner;
var LevelInfo Level;
var DAE_Multiple Evaluator;
var MemoryItem Target;

static function TargetingSystem Create(wAIBotBase inOwner)
{
    local TargetingSystem S;

    S = new default.Class;
    S.Owner = inOwner;
    S.Level = inOwner.Level;
    S.InitEvaluator();
    return S;
    //return;    
}

function InitEvaluator()
{
    Evaluator = Class'WGame_Decompressed.DAE_Multiple'.static.Create();
    Evaluator.Add(0.5000000, Class'WGame_Decompressed.DAE_InSight'.static.Create(Owner));
    Evaluator.Add(1.5000000, Class'WGame_Decompressed.DAE_Visibility'.static.Create(Owner));
    Evaluator.Add(1.0000000, Class'WGame_Decompressed.DAE_Proximity'.static.Create(Owner, 2000.0000000));
    Evaluator.Add(1.0000000, Class'WGame_Decompressed.DAE_Proximity'.static.Create(Owner, 500.0000000));
    Evaluator.Add(0.7000000, Class'WGame_Decompressed.DAE_IsTurret'.static.Create());
    Evaluator.Add(1.0000000, Class'WGame_Decompressed.DAE_RecentTarget'.static.Create(Owner, 2.5000000));
    //return;    
}

function MemoryItem GetTarget()
{
    local int lp1;
    local MemoryItem MI;
    local float Score, bestScore;
    local MemoryItem Best;

    bestScore = -999.0000000;
    lp1 = 0;
    J0x12:

    // End:0xB4 [Loop If]
    if(lp1 < Owner.Memory.Memories.Length)
    {
        MI = Owner.Memory.Memories[lp1];
        // End:0xAA
        if(MI.Pawn != none)
        {
            Score = Evaluator.Evaluate(MI);
            // End:0xAA
            if(Score > bestScore)
            {
                bestScore = Score;
                Best = MI;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x12;
    }
    Target = Best;
    return Best;
    //return;    
}

function Update(float dt)
{
    //return;    
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    local int lp1;
    local MemoryItem MI;
    local float Score, bestScore;

    bestScore = -999.0000000;
    lp1 = 0;
    J0x12:

    // End:0xF9 [Loop If]
    if(lp1 < Owner.Memory.Memories.Length)
    {
        MI = Owner.Memory.Memories[lp1];
        // End:0xEF
        if(MI.Pawn != none)
        {
            Score = Evaluator.Evaluate(MI);
            C.SetPos(4.0000000, YPos += YL);
            C.DrawText((("name=" $ MI.Pawn.PlayerReplicationInfo.PlayerName) $ ", score=") $ string(Score));
        }
        lp1++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function ClearReferences()
{
    Log("[TargetingSystem::ClearRefenreces]");
    Owner = none;
    Level = none;
    Target.ClearReferences();
    //return;    
}
