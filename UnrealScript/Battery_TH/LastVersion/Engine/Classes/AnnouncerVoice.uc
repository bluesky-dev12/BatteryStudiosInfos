class AnnouncerVoice extends Info
    abstract
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct CachedSound
{
    var string CacheName;
    var Sound CacheSound;
};

var cache string SoundPackage;
var cache string FallbackSoundPackage;
var string AlternateFallbackSoundPackage;
var localized cache string AnnouncerName;
var array<CachedSound> CachedSounds;
var bool bPrecachedBaseSounds;
var bool bPrecachedGameSounds;
var const cache bool bEnglishOnly;

event string GetSound(string AName, optional bool isWomanVoice)
{
    // End:0x24
    if(!isWomanVoice)
    {
        return Class'Engine.AnnouncerVoice'.default.AlternateFallbackSoundPackage $ AName;        
    }
    else
    {
        return "Warfare_Sound_Voice_CH_Female" $ AName;
    }
    //return;    
}

static function ResetPrecacheSound()
{
    Class'Engine.AnnouncerVoice'.default.CachedSounds.Length = 0;
    //return;    
}

static function Sound PrecacheFallbackPackage(string Package, string AName, optional string strFullName)
{
    local Sound NewSound;
    local int i, iLength;
    local string FullName;

    FullName = (Package $ ".") $ AName;
    NewSound = Sound(DynamicLoadObject(FullName, Class'Engine.Sound', true));
    // End:0x159
    if(NewSound != none)
    {
        i = 0;
        J0x45:

        // End:0xB0 [Loop If]
        if(i < Class'Engine.AnnouncerVoice'.default.CachedSounds.Length)
        {
            // End:0xA6
            if(Class'Engine.AnnouncerVoice'.default.CachedSounds[i].CacheName == FullName)
            {
                Class'Engine.AnnouncerVoice'.default.CachedSounds[i].CacheSound = NewSound;
                return NewSound;
            }
            i++;
            // [Loop Continue]
            goto J0x45;
        }
        iLength = Class'Engine.AnnouncerVoice'.default.CachedSounds.Length;
        Class'Engine.AnnouncerVoice'.default.CachedSounds.Length = Class'Engine.AnnouncerVoice'.default.CachedSounds.Length + 1;
        // End:0x115
        if(strFullName != "")
        {
            Class'Engine.AnnouncerVoice'.default.CachedSounds[iLength].CacheName = strFullName;            
        }
        else
        {
            Class'Engine.AnnouncerVoice'.default.CachedSounds[iLength].CacheName = FullName;
        }
        Class'Engine.AnnouncerVoice'.default.CachedSounds[iLength].CacheSound = NewSound;
        return NewSound;
    }
    Log(FullName @ "Package Precached");
    return none;
    //return;    
}

function PrecacheAnnouncements(bool bRewardSounds)
{
    local Class<GameInfo> GameClass;
    local Actor A;

    // End:0x6E
    if(!bPrecachedGameSounds)
    {
        bPrecachedGameSounds = (Level.GRI != none) && Level.GRI.GameClass != "";
        GameClass = Level.GetGameClass();
        GameClass.static.PrecacheGameAnnouncements(self, bRewardSounds);
    }
    // End:0x95
    foreach DynamicActors(Class'Engine.Actor', A)
    {
        A.PrecacheAnnouncer(self, bRewardSounds);        
    }    
    // End:0xC4
    if(!bPrecachedBaseSounds)
    {
        bPrecachedBaseSounds = true;
        // End:0xC4
        if(bRewardSounds)
        {
            Class'Engine.AnnouncerVoice'.static.PrecacheList();            
        }
    }
    //return;    
}

static function PrecacheList()
{
    //return;    
}

defaultproperties
{
    AlternateFallbackSoundPackage="Warfare_Sound_Voice_E"
}