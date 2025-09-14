class AnnouncerQueueManager extends Info
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct QueueItem
{
    var string Voice;
    var float Delay;
    var byte Switch;
};

var array<QueueItem> Queue;
var float LastTimerCheck;
var float GapTime;
var PlayerController Receiver;
var float LastPlayEndsAt;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    LastTimerCheck = Level.TimeSeconds;
    SetTimer(0.1000000, true);
    //return;    
}

simulated function InitFor(PlayerController PC)
{
    Receiver = PC;
    //return;    
}

function bool AddItemToQueue(string ASound, optional Object.EAPriority Priority, optional byte Switch)
{
    local QueueItem NewItem;

    // End:0x0D
    if(Receiver == none)
    {
        return false;
    }
    // End:0x2A
    if((int(Priority) == int(2)) && IsQueueing())
    {
        return false;
    }
    // End:0x4E
    if((int(Priority) == int(3)) && !IsQueueingSwitch(Switch))
    {
        return false;
    }
    // End:0x70
    if((int(Priority) == int(1)) && CanFindSoundInQueue(ASound))
    {
        return false;
    }
    NewItem.Voice = ASound;
    NewItem.Switch = Switch;
    // End:0xB3
    if(int(Priority) == int(3))
    {
        NewItem.Delay = 0.0100000;        
    }
    else
    {
        // End:0x10E
        if((Len(ASound) != 0) && Receiver.StatusAnnouncer != none)
        {
            NewItem.Delay = GetSoundDuration(Receiver.StatusAnnouncer.GetSound(ASound)) + GapTime;            
        }
        else
        {
            NewItem.Delay = GapTime;
        }
    }
    // End:0x178
    if(((Queue.Length == 0) && int(Priority) != int(4)) && LastPlayEndsAt < Level.TimeSeconds)
    {
        LastTimerCheck = Level.TimeSeconds;
        ProcessQueueItem(NewItem);        
    }
    else
    {
        // End:0x1AB
        if(Queue.Length == 0)
        {
            NewItem.Delay = FMax(0.0000000, LastPlayEndsAt - Level.TimeSeconds);
        }
        Queue[Queue.Length] = NewItem;
    }
    return true;
    //return;    
}

final function bool CanFindSoundInQueue(string DaSoundName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < Queue.Length)
    {
        // End:0x33
        if(Queue[i].Voice == DaSoundName)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

final function bool RemoveSound(string SoundName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x49 [Loop If]
    if(i < Queue.Length)
    {
        // End:0x3F
        if(Queue[i].Voice == SoundName)
        {
            Queue.Remove(i, 1);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

final function bool IsQueueing()
{
    return Queue.Length > 0;
    //return;    
}

final function bool IsQueueingSwitch(byte Switch)
{
    local int i;

    // End:0x0E
    if(Queue.Length == 0)
    {
        return true;
    }
    i = 0;
    J0x15:

    // End:0x4F [Loop If]
    if(i < Queue.Length)
    {
        // End:0x45
        if(int(Queue[i].Switch) != int(Switch))
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

final function float GetQueueWaitTime()
{
    local int i;
    local float WaitTime;

    // End:0x11
    if(!IsQueueing())
    {
        return 0.0000000;
    }
    i = 0;
    J0x18:

    // End:0x49 [Loop If]
    if(i < Queue.Length)
    {
        WaitTime += Queue[i].Delay;
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return WaitTime;
    //return;    
}

function Timer()
{
    local float DeltaTime;

    DeltaTime = (Level.TimeSeconds - LastTimerCheck) / Level.TimeDilation;
    // End:0x73
    if(Queue.Length > 0)
    {
        Queue[0].Delay -= DeltaTime;
        // End:0x73
        if(Queue[0].Delay <= float(0))
        {
            ProcessQueueItem(Queue[0]);
            Queue.Remove(0, 1);
        }
    }
    LastTimerCheck = Level.TimeSeconds;
    //return;    
}

function ProcessQueueItem(QueueItem Item)
{
    LastPlayEndsAt = Level.TimeSeconds + Item.Delay;
    // End:0x2D
    if(Receiver == none)
    {
        return;
    }
    // End:0x5B
    if(Len(Item.Voice) != 0)
    {
        Receiver.PlayStatusAnnouncement(Item.Voice, 0, true);
    }
    // End:0x99
    if(int(Item.Switch) > 0)
    {
        Receiver.myHUD.AnnouncementPlayed(Item.Voice, Item.Switch);
    }
    //return;    
}

defaultproperties
{
    GapTime=0.1000000
    LastPlayEndsAt=-999.0000000
}