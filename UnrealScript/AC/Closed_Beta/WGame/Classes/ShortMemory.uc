class ShortMemory extends Object
    native;

var wAIBotBase Owner;
var LevelInfo Level;
var array<MemoryItem> Memories;
var int NumVisibleMemories;
var float RetentionTIme;
var float ResponseTime;
var float MemoryItemUpdateInterval;
var int ResponseQueueHead;
var array<float> ResponseQueueTime;
var array<Pawn> ResponseQueuePawn;

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
    local int lp1;
    local bool visibleChanged;
    local Pawn P;

    RemoveMemoriesOverRetentionTime();
    visibleChanged = false;
    MemoryItemUpdateInterval -= dt;
    // End:0x105
    if(MemoryItemUpdateInterval < float(0))
    {
        MemoryItemUpdateInterval = ResponseTime;
        NumVisibleMemories = 0;
        lp1 = 0;
        J0x40:

        // End:0xED [Loop If]
        if(lp1 < Memories.Length)
        {
            // End:0x78
            if(Memories[lp1].IsVisible && Rand(5) <= 2)
            {                
            }
            else
            {
                Memories[lp1].Update();
            }
            // End:0xAC
            if(Memories[lp1].IsVisible)
            {
                NumVisibleMemories++;
            }
            // End:0xE3
            if(Memories[lp1].IsVisible != Memories[lp1].IsVisibleOld)
            {
                visibleChanged = true;
            }
            lp1++;
            // [Loop Continue]
            goto J0x40;
        }
        // End:0x105
        if(visibleChanged)
        {
            Owner.OnMemoryVisibleChanged();
        }
    }
    J0x105:

    // End:0x194 [Loop If]
    if((ResponseQueueHead < ResponseQueueTime.Length) && (ResponseQueueTime[ResponseQueueHead] + ResponseTime) < Level.TimeSeconds)
    {
        P = ResponseQueuePawn[ResponseQueueHead];
        // End:0x18A
        if(P != none)
        {
            GetByPawn(P, true).AddKnownPosition(P.Location, Level.TimeSeconds);
        }
        ResponseQueueHead++;
        // [Loop Continue]
        goto J0x105;
    }
    //return;    
}

function NotifyDestroyed(Actor A)
{
    local int lp1;

    super.NotifyDestroyed(A);
    lp1 = ResponseQueueHead;
    J0x16:

    // End:0x52 [Loop If]
    if(lp1 < ResponseQueuePawn.Length)
    {
        // End:0x48
        if(ResponseQueuePawn[lp1] == A)
        {
            ResponseQueuePawn[lp1] = none;
        }
        lp1++;
        // [Loop Continue]
        goto J0x16;
    }
    //return;    
}

function bool BySound(Pawn P, float Loudness)
{
    return ByVision(P);
    //return;    
}

function bool ByVision(Pawn P)
{
    // End:0x75
    if(P.IsA('Vehicle'))
    {
        // End:0x70
        if((P.Controller != none) && P.Controller.bIsPlayer)
        {
            return ByVision2(Vehicle(P).Driver, P.Controller);            
        }
        else
        {
            return false;
        }        
    }
    else
    {
        return ByVision2(P, P.Controller);
    }
    //return;    
}

function bool ByVision2(Pawn P, Controller C)
{
    // End:0x67
    if(!Owner.Level.Game.SameTeam(Owner, C))
    {
        GetByPawn(P, true).AddKnownPosition(P.Location, Level.TimeSeconds);
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function RemoveMemoriesOverRetentionTime()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x62 [Loop If]
    if(lp1 < Memories.Length)
    {
        // End:0x58
        if((Level.TimeSeconds - Memories[lp1].LastTime) > RetentionTIme)
        {
            Memories.Remove(lp1, 1);
            --lp1;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ClearReferences()
{
    Log("[ShortMemory::ClearRefenreces]");
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
    local int lp1;
    local MemoryItem M;

    Log("[ShortMemory::RemoveByPawn] p=" $ P.PlayerReplicationInfo.PlayerName);
    lp1 = 0;
    J0x42:

    // End:0x98 [Loop If]
    if(lp1 < Memories.Length)
    {
        M = Memories[lp1];
        // End:0x8E
        if(M.Pawn == P)
        {
            Memories.Remove(lp1, 1);
            lp1--;
        }
        lp1++;
        // [Loop Continue]
        goto J0x42;
    }
    lp1 = ResponseQueueHead;
    J0xA3:

    // End:0xF1 [Loop If]
    if(lp1 < ResponseQueueTime.Length)
    {
        // End:0xE7
        if(ResponseQueuePawn[lp1] == P)
        {
            ResponseQueuePawn.Remove(lp1, 1);
            ResponseQueueTime.Remove(lp1, 1);
            lp1--;
        }
        lp1++;
        // [Loop Continue]
        goto J0xA3;
    }
    //return;    
}

event MemoryItem GetByPawn2(Pawn P)
{
    return GetByPawn(P);
    //return;    
}

event MemoryItem GetByPawn(Pawn P, optional bool createIfNotFound)
{
    local int lp1;
    local MemoryItem M, cm;

    lp1 = 0;
    J0x07:

    // End:0x58 [Loop If]
    if(lp1 < Memories.Length)
    {
        cm = Memories[lp1];
        // End:0x4E
        if(cm.Pawn == P)
        {
            M = cm;
            // [Explicit Break]
            goto J0x58;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x58:

    // End:0xC2
    if((M == none) && createIfNotFound)
    {
        M = Class'WGame_Decompressed.MemoryItem'.static.Create(Owner, P);
        M.PRI = P.PlayerReplicationInfo;
        Memories[Memories.Length] = M;
        return M;
    }
    return M;
    //return;    
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    local int lp1;
    local string S;
    local MemoryItem M;
    local Vector loc;

    // End:0x31
    if(Owner.Pawn != none)
    {
        loc = Owner.Pawn.Location;
    }
    S = "";
    lp1 = 0;
    J0x40:

    // End:0x10E [Loop If]
    if(lp1 < Memories.Length)
    {
        M = Memories[lp1];
        S = ((((((((S $ M.PRI.PlayerName) $ " ") $ string(int(M.InSight))) $ string(int(M.IsVisible))) $ " [") $ string(VSize(M.LastPosition - loc))) $ ",") $ string(Level.TimeSeconds - M.LastTime)) $ "s], ";
        lp1++;
        // [Loop Continue]
        goto J0x40;
    }
    YPos += YL;
    C.SetPos(4.0000000, YPos);
    C.DrawText(S);
    //return;    
}

defaultproperties
{
    RetentionTIme=20.0000000
    ResponseTime=0.3000000
}