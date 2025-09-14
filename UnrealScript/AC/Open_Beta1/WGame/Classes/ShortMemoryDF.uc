class ShortMemoryDF extends ShortMemory;

static function ShortMemory Create(wAIBotBase inOwner, float inResponseTime)
{
    local ShortMemory S;

    S = new default.Class;
    S.Owner = inOwner;
    S.Level = inOwner.Level;
    S.ResponseTime = inResponseTime;
    return S;
    //return;    
}

function Update(float dt)
{
    //return;    
}

function NotifyDestroyed(Actor A)
{
    //return;    
}

function bool BySound(Pawn P, float Loudness)
{
    return false;
    //return;    
}

function bool ByVision(Pawn P)
{
    return false;
    //return;    
}

function bool ByVision2(Pawn P, Controller C)
{
    return false;
    //return;    
}

function RemoveMemoriesOverRetentionTime()
{
    //return;    
}

function ClearReferences()
{
    Log("[ShortMemoryDF::ClearRefenreces]");
    Owner = none;
    Level = none;
    RemoveAll();
    //return;    
}

function RemoveAll()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(lp1 < Memories.Length)
    {
        Memories[lp1].ClearReferences();
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    Memories.Length = 0;
    NumVisibleMemories = 0;
    ResponseQueueTime.Length = 0;
    ResponseQueuePawn.Length = 0;
    ResponseQueueHead = 0;
    //return;    
}

function RemoveByPawn(Pawn P)
{
    //return;    
}

event MemoryItem GetByPawn2(Pawn P)
{
    return GetByPawn(P);
    //return;    
}

event MemoryItem GetByPawn(Pawn P, optional bool createIfNotFound)
{
    return none;
    //return;    
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    YPos += YL;
    C.SetPos(4.0000000, YPos);
    C.DrawText("[ShortMemoryDF]");
    //return;    
}
