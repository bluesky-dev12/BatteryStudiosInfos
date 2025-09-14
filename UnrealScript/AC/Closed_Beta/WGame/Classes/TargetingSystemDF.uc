class TargetingSystemDF extends TargetingSystem;

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
    //return;    
}

function MemoryItem GetTarget()
{
    return none;
    //return;    
}

function Update(float dt)
{
    //return;    
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    C.DrawText("[TargetingSystemDF]");
    //return;    
}

function ClearReferences()
{
    Log("[TargetingSystemDF::ClearRefenreces]");
    //return;    
}
