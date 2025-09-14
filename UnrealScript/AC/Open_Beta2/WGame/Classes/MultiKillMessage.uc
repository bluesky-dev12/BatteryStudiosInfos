class MultiKillMessage extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string KillString[7];
var Sound KillSound[7];
var name KillSoundName[7];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x28
    if(Class'Engine.PlayerController'.default.bNoMatureLanguage)
    {
        return default.KillString[Min(Switch, 6) - 1];        
    }
    else
    {
        return default.KillString[Min(Switch, 7) - 1];
    }
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x58
    if(Class'Engine.PlayerController'.default.bNoMatureLanguage)
    {
        P.PlayRewardAnnouncement(default.KillSoundName[Min(Switch - 1, 5)], 1, true);        
    }
    else
    {
        P.PlayRewardAnnouncement(default.KillSoundName[Min(Switch - 1, 6)], 1, true);
    }
    //return;    
}

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
    // End:0x0E
    if(Switch < 4)
    {
        return 0;
    }
    // End:0x1C
    if(Switch == 4)
    {
        return 1;
    }
    // End:0x2B
    if(Switch == 7)
    {
        return 3;
    }
    return 2;
    //return;    
}

defaultproperties
{
    KillString[0]="?? ?!"
    KillString[1]="?? ?!"
    KillString[2]="?? ?!!"
    KillString[3]="??? ?!!"
    KillString[4]="??? ? !!!"
    KillString[5]="????? ?!!!"
    KillString[6]="?? ?!!!"
    KillSoundName[0]="Double_Kill"
    KillSoundName[1]="MultiKill"
    KillSoundName[2]="MegaKill"
    KillSoundName[3]="UltraKill"
    KillSoundName[4]="MonsterKill_F"
    KillSoundName[5]="LudicrousKill_F"
    KillSoundName[6]="HolyShit_F"
    bIsUnique=true
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.2420000
    FontSize=1
}