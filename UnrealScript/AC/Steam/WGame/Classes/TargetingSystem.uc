/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\TargetingSystem.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:6
 *
 *******************************************************************************/
class TargetingSystem extends Object
    dependson(DAE_Multiple)
    dependson(DAE_InSight)
    dependson(DAE_Visibility)
    dependson(DAE_Proximity)
    dependson(DAE_IsTurret)
    dependson(DAE_RecentTarget);

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
}

function InitEvaluator()
{
    Evaluator = class'DAE_Multiple'.static.Create();
    Evaluator.Add(0.50, class'DAE_InSight'.static.Create(Owner));
    Evaluator.Add(1.50, class'DAE_Visibility'.static.Create(Owner));
    Evaluator.Add(1.0, class'DAE_Proximity'.static.Create(Owner, 2000.0));
    Evaluator.Add(1.0, class'DAE_Proximity'.static.Create(Owner, 500.0));
    Evaluator.Add(0.70, class'DAE_IsTurret'.static.Create());
    Evaluator.Add(1.0, class'DAE_RecentTarget'.static.Create(Owner, 2.50));
}

function MemoryItem GetTarget()
{
    local int lp1;
    local MemoryItem MI;
    local float Score, bestScore;
    local MemoryItem Best;

    bestScore = -999.0;
    lp1 = 0;
    J0x12:
    // End:0xb4 [While If]
    if(lp1 < Owner.Memory.Memories.Length)
    {
        MI = Owner.Memory.Memories[lp1];
        // End:0xaa
        if(MI.Pawn != none)
        {
            Score = Evaluator.Evaluate(MI);
            // End:0xaa
            if(Score > bestScore)
            {
                bestScore = Score;
                Best = MI;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    Target = Best;
    return Best;
}

function Update(float dt);
function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    local int lp1;
    local MemoryItem MI;
    local float Score, bestScore;

    bestScore = -999.0;
    lp1 = 0;
    J0x12:
    // End:0xf9 [While If]
    if(lp1 < Owner.Memory.Memories.Length)
    {
        MI = Owner.Memory.Memories[lp1];
        // End:0xef
        if(MI.Pawn != none)
        {
            Score = Evaluator.Evaluate(MI);
            C.SetPos(4.0, YPos += YL);
            C.DrawText("name=" $ MI.Pawn.PlayerReplicationInfo.PlayerName $ ", score=" $ string(Score));
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
}

function ClearReferences()
{
    Log("[TargetingSystem::ClearRefenreces]");
    Owner = none;
    Level = none;
    Target.ClearReferences();
}
