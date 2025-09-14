/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MessagingSpectator.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *	States:1
 *
 *******************************************************************************/
class MessagingSpectator extends PlayerController
    config(User)
    abstract
    notplaceable;

event PostBeginPlay()
{
    super.PostBeginPlay();
    bIsPlayer = false;
}

function InitPlayerReplicationInfo()
{
    super(Controller).InitPlayerReplicationInfo();
    PlayerReplicationInfo.PlayerName = "WebAdmin";
    PlayerReplicationInfo.bIsSpectator = true;
    PlayerReplicationInfo.bOnlySpectator = true;
    PlayerReplicationInfo.bOutOfLives = true;
    PlayerReplicationInfo.bWaitingPlayer = false;
}

auto state NotPlaying
{

}
