class MessagingSpectator extends PlayerController
    abstract
    config(User)
    notplaceable;

event PostBeginPlay()
{
    super.PostBeginPlay();
    bIsPlayer = false;
    //return;    
}

function InitPlayerReplicationInfo()
{
    super(Controller).InitPlayerReplicationInfo();
    PlayerReplicationInfo.PlayerName = "WebAdmin";
    PlayerReplicationInfo.bIsSpectator = true;
    PlayerReplicationInfo.bOnlySpectator = true;
    PlayerReplicationInfo.bOutOfLives = true;
    PlayerReplicationInfo.bWaitingPlayer = false;
    //return;    
}

auto state NotPlaying
{    stop;    
}
