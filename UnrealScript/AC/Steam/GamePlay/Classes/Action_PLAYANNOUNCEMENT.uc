/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_PLAYANNOUNCEMENT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class Action_PLAYANNOUNCEMENT extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) Sound Sound;
var bool bSoundsPrecached;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController P;
    local name soundName;

    // End:0x36
    if(C.Level.NetMode == 0)
    {
        soundName = LastMinuteHack_ShipIt(C);
    }
    // End:0x4a
    else
    {
        soundName = Sound.Name;
    }
    // End:0x7e
    foreach C.DynamicActors(class'PlayerController', P)
    {
        P.QueueAnnouncement(string(soundName), 1, 0);                
    }
    return false;
}

function name LastMinuteHack_ShipIt(ScriptedController C)
{
    local PlayerController LocalPlayer;
    local name soundName;

    LocalPlayer = C.Level.GetLocalPlayerController();
    // End:0x3d
    if(Sound != none)
    {
        soundName = Sound.Name;
    }
    // End:0x93
    if(Sound == none && C.Tag == 'Play_Intro3' && C.MyScript.Tag == 'Hack_RIP_Epic_MegaCar')
    {
        soundName = 'MotherShip_intro';
    }
    // End:0x186
    else
    {
        // End:0x186
        if(C.MyScript.Tag == 'Hack_I_Love_Mina')
        {
            // End:0x10c
            if(C.Tag == 'Play_Brief4' && LocalPlayer.StatusAnnouncer.GetSound("Junkyard_brief4a") != none)
            {
                soundName = 'Junkyard_brief4a';
            }
            // End:0x186
            else
            {
                // End:0x186
                if(Sound == none)
                {
                    // End:0x13d
                    if(C.Tag == 'Play_Brief5')
                    {
                        soundName = 'Junkyard_brief5a';
                    }
                    // End:0x186
                    else
                    {
                        // End:0x163
                        if(C.Tag == 'Play_Brief6')
                        {
                            soundName = 'Junkyard_brief6a';
                        }
                        // End:0x186
                        else
                        {
                            // End:0x186
                            if(C.Tag == 'Play_Brief7')
                            {
                                soundName = 'Junkyard_brief7a';
                            }
                        }
                    }
                }
            }
        }
    }
    return soundName;
}

function string GetActionString()
{
    return ActionString @ string(Sound);
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x4a
    if(!bRewardSounds && !bSoundsPrecached)
    {
        bSoundsPrecached = true;
        // End:0x4a
        if(Sound != none)
        {
            V.PrecacheSound(string(Sound.Name));
        }
    }
}

defaultproperties
{
    ActionString="play announcement"
}