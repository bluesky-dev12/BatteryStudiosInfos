class Trigger_ASMessageTrigger extends Triggers;

enum EPSM_AssaultTeam
{
    EMT_Attackers,                  // 0
    EMT_Defenders,                  // 1
    EMT_All                         // 2
};

var() Trigger_ASMessageTrigger.EPSM_AssaultTeam AssaultTeam;
var() Sound AnnouncerSound;
var() localized string Message;
var() byte AnnouncementLevel;
var bool bSoundsPrecached;
var() Object.EAPriority Priority;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local byte RealTeam;

    RealTeam = GetTeamNum();
    // End:0x77
    if((AnnouncerSound != none) && ASGameInfo(Level.Game).IsPlaying())
    {
        ASGameInfo(Level.Game).QueueAnnouncerSound(string(AnnouncerSound.Name), AnnouncementLevel, RealTeam, Priority, 210);
    }
    //return;    
}

function byte GetTeamNum()
{
    local byte DefendingTeam;

    // End:0x15
    if(int(AssaultTeam) == int(2))
    {
        return byte(255);
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x4B
    if(int(AssaultTeam) == int(1))
    {
        return DefendingTeam;
    }
    return byte(int(1) - int(DefendingTeam));
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x4C
    if((!bRewardSounds && AnnouncerSound != none) && !bSoundsPrecached)
    {
        bSoundsPrecached = true;
        V.PrecacheSound(string(AnnouncerSound.Name));
    }
    //return;    
}

defaultproperties
{
    AssaultTeam=2
    Message="? ???"
    AnnouncementLevel=1
    bCollideActors=false
}