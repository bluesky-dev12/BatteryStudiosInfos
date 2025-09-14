/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ShortMemoryDF.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:13
 *
 *******************************************************************************/
class ShortMemoryDF extends ShortMemory;

static function ShortMemory Create(wAIBotBase inOwner, float inResponseTime)
{
    local ShortMemory S;

    S = new default.Class;
    S.Owner = inOwner;
    S.Level = inOwner.Level;
    S.ResponseTime = inResponseTime;
    return S;
}

function Update(float dt);
function NotifyDestroyed(Actor A);
function bool BySound(Pawn P, float Loudness)
{
    return false;
}

function bool ByVision(Pawn P)
{
    return false;
}

function bool ByVision2(Pawn P, Controller C)
{
    return false;
}

function RemoveMemoriesOverRetentionTime();
function ClearReferences()
{
    Log("[ShortMemoryDF::ClearRefenreces]");
    Owner = none;
    Level = none;
    RemoveAll();
}

function RemoveAll()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x36 [While If]
    if(lp1 < Memories.Length)
    {
        Memories[lp1].ClearReferences();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Memories.Length = 0;
    NumVisibleMemories = 0;
    ResponseQueueTime.Length = 0;
    ResponseQueuePawn.Length = 0;
    ResponseQueueHead = 0;
}

function RemoveByPawn(Pawn P);
event MemoryItem GetByPawn2(Pawn P)
{
    return GetByPawn(P);
}

event MemoryItem GetByPawn(Pawn P, optional bool createIfNotFound)
{
    return none;
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    YPos += YL;
    C.SetPos(4.0, YPos);
    C.DrawText("[ShortMemoryDF]");
}
