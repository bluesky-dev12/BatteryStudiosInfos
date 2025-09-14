/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\TargetingSystemDF.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class TargetingSystemDF extends TargetingSystem;

static function TargetingSystem Create(wAIBotBase inOwner)
{
    local TargetingSystem S;

    S = new default.Class;
    S.Owner = inOwner;
    S.Level = inOwner.Level;
    S.InitEvaluator();
    return S;
}

function InitEvaluator();
function MemoryItem GetTarget()
{
    return none;
}

function Update(float dt);
function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    C.DrawText("[TargetingSystemDF]");
}

function ClearReferences()
{
    Log("[TargetingSystemDF::ClearRefenreces]");
}
