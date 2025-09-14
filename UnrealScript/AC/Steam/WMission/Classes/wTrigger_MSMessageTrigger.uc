/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wTrigger_MSMessageTrigger.uc
 * Package Imports:
 *	WMission
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:6
 *	Functions:3
 *
 *******************************************************************************/
class wTrigger_MSMessageTrigger extends Triggers;

enum EPSM_AssaultTeam
{
    EMT_Attackers,
    EMT_Defenders,
    EMT_All
};

var() wTrigger_MSMessageTrigger.EPSM_AssaultTeam AssaultTeam;
var() Sound AnnouncerSound;
var() localized string Message;
var() byte AnnouncementLevel;
var bool bSoundsPrecached;
var() Core.Object.EAPriority Priority;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local byte RealTeam;

    RealTeam = GetTeamNum();
    // End:0x77
    if(AnnouncerSound != none && wMSGameInfo(Level.Game).IsPlaying())
    {
        wMSGameInfo(Level.Game).QueueAnnouncerSound(string(AnnouncerSound.Name), AnnouncementLevel, RealTeam, Priority, 210);
    }
}

function byte GetTeamNum()
{
    local byte DefendingTeam;

    // End:0x15
    if(AssaultTeam == 2)
    {
        return byte(255);
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x4b
    if(AssaultTeam == 1)
    {
        return DefendingTeam;
    }
    return byte(1 - DefendingTeam);
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x4c
    if(!bRewardSounds && AnnouncerSound != none && !bSoundsPrecached)
    {
        bSoundsPrecached = true;
        V.PrecacheSound(string(AnnouncerSound.Name));
    }
}

defaultproperties
{
    AssaultTeam=2
    Message="My Message"
    AnnouncementLevel=1
    bCollideActors=true
}