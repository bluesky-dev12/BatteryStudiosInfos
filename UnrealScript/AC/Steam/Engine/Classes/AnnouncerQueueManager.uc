/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AnnouncerQueueManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:5
 *	Functions:10
 *
 *******************************************************************************/
class AnnouncerQueueManager extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

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
    SetTimer(0.10, true);
}

simulated function InitFor(PlayerController PC)
{
    Receiver = PC;
}

function bool AddItemToQueue(string ASound, optional Core.Object.EAPriority Priority, optional byte Switch)
{
    local QueueItem NewItem;

    // End:0x0d
    if(Receiver == none)
    {
        return false;
    }
    // End:0x2a
    if(Priority == 2 && IsQueueing())
    {
        return false;
    }
    // End:0x4e
    if(Priority == 3 && !IsQueueingSwitch(Switch))
    {
        return false;
    }
    // End:0x70
    if(Priority == 1 && CanFindSoundInQueue(ASound))
    {
        return false;
    }
    NewItem.Voice = ASound;
    NewItem.Switch = Switch;
    // End:0xb3
    if(Priority == 3)
    {
        NewItem.Delay = 0.010;
    }
    // End:0x11e
    else
    {
        // End:0x10e
        if(Len(ASound) != 0 && Receiver.StatusAnnouncer != none)
        {
            NewItem.Delay = GetSoundDuration(Receiver.StatusAnnouncer.GetSound(ASound)) + GapTime;
        }
        // End:0x11e
        else
        {
            NewItem.Delay = GapTime;
        }
    }
    // End:0x178
    if(Queue.Length == 0 && Priority != 4 && LastPlayEndsAt < Level.TimeSeconds)
    {
        LastTimerCheck = Level.TimeSeconds;
        ProcessQueueItem(NewItem);
    }
    // End:0x1bd
    else
    {
        // End:0x1ab
        if(Queue.Length == 0)
        {
            NewItem.Delay = FMax(0.0, LastPlayEndsAt - Level.TimeSeconds);
        }
        Queue[Queue.Length] = NewItem;
    }
    return true;
}

final function bool CanFindSoundInQueue(string DaSoundName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < Queue.Length)
    {
        // End:0x33
        if(Queue[i].Voice == DaSoundName)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

final function bool RemoveSound(string soundName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x49 [While If]
    if(i < Queue.Length)
    {
        // End:0x3f
        if(Queue[i].Voice == soundName)
        {
            Queue.Remove(i, 1);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

final function bool IsQueueing()
{
    return Queue.Length > 0;
}

final function bool IsQueueingSwitch(byte Switch)
{
    local int i;

    // End:0x0e
    if(Queue.Length == 0)
    {
        return true;
    }
    i = 0;
    J0x15:
    // End:0x4f [While If]
    if(i < Queue.Length)
    {
        // End:0x45
        if(Queue[i].Switch != Switch)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

final function float GetQueueWaitTime()
{
    local int i;
    local float WaitTime;

    // End:0x11
    if(!IsQueueing())
    {
        return 0.0;
    }
    i = 0;
    J0x18:
    // End:0x49 [While If]
    if(i < Queue.Length)
    {
        WaitTime += Queue[i].Delay;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return WaitTime;
}

function Timer()
{
    local float DeltaTime;

    DeltaTime = Level.TimeSeconds - LastTimerCheck / Level.TimeDilation;
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
}

function ProcessQueueItem(QueueItem Item)
{
    LastPlayEndsAt = Level.TimeSeconds + Item.Delay;
    // End:0x2d
    if(Receiver == none)
    {
        return;
    }
    // End:0x5b
    if(Len(Item.Voice) != 0)
    {
        Receiver.PlayStatusAnnouncement(Item.Voice, 0, true);
    }
    // End:0x99
    if(Item.Switch > 0)
    {
        Receiver.myHUD.AnnouncementPlayed(Item.Voice, Item.Switch);
    }
}

defaultproperties
{
    GapTime=0.10
    LastPlayEndsAt=-999.0
}