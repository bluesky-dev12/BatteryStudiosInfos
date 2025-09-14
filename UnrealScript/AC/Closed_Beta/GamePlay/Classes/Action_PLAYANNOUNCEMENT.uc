class Action_PLAYANNOUNCEMENT extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Sound Sound;
var bool bSoundsPrecached;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController P;
    local name soundName;

    // End:0x36
    if(int(C.Level.NetMode) == int(NM_Standalone))
    {
        soundName = LastMinuteHack_ShipIt(C);        
    }
    else
    {
        soundName = Sound.Name;
    }
    // End:0x7E
    foreach C.DynamicActors(Class'Engine.PlayerController', P)
    {
        P.QueueAnnouncement(string(soundName), 1, 0);        
    }    
    return false;
    //return;    
}

function name LastMinuteHack_ShipIt(ScriptedController C)
{
    local PlayerController LocalPlayer;
    local name soundName;

    LocalPlayer = C.Level.GetLocalPlayerController();
    // End:0x3D
    if(Sound != none)
    {
        soundName = Sound.Name;
    }
    // End:0x93
    if(((Sound == none) && C.Tag == 'Play_Intro3') && C.MyScript.Tag == 'Hack_RIP_Epic_MegaCar')
    {
        soundName = 'MotherShip_intro';        
    }
    else
    {
        // End:0x186
        if(C.MyScript.Tag == 'Hack_I_Love_Mina')
        {
            // End:0x10C
            if((C.Tag == 'Play_Brief4') && LocalPlayer.StatusAnnouncer.GetSound("Junkyard_brief4a") != none)
            {
                soundName = 'Junkyard_brief4a';                
            }
            else
            {
                // End:0x186
                if(Sound == none)
                {
                    // End:0x13D
                    if(C.Tag == 'Play_Brief5')
                    {
                        soundName = 'Junkyard_brief5a';                        
                    }
                    else
                    {
                        // End:0x163
                        if(C.Tag == 'Play_Brief6')
                        {
                            soundName = 'Junkyard_brief6a';                            
                        }
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
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(Sound);
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x4A
    if(!bRewardSounds && !bSoundsPrecached)
    {
        bSoundsPrecached = true;
        // End:0x4A
        if(Sound != none)
        {
            V.PrecacheSound(string(Sound.Name));
        }
    }
    //return;    
}

defaultproperties
{
    ActionString="play announcement"
}