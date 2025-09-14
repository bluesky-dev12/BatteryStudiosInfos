class wMultiKillMessage extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string KillString[7];
var Sound KillSound[7];
var string KillSoundName[7];
var name MuliKillSoundName[5];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.KillString[Min(Switch, 5)];
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    P.myHUD.ResetKillMessageTexture();
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    P.PlayRewardAnnouncement(default.MuliKillSoundName[Min(Switch, 4)], 1, true, 17);
    //return;    
}

defaultproperties
{
    KillString[0]="3kill"
    KillString[1]="5kill"
    KillString[2]="7kill"
    KillString[3]="10kill"
    KillString[4]="15kill"
    MuliKillSoundName[0]="v_cb_kill_3kill"
    MuliKillSoundName[1]="v_cb_kill_5kill"
    MuliKillSoundName[2]="v_cb_kill_7kill"
    MuliKillSoundName[3]="v_cb_kill_10kill"
    MuliKillSoundName[4]="v_cb_kill_15kill"
    bIsUnique=true
    bFadeMessage=true
    Lifetime=2
    bDrawWithTexture=true
    PosY=0.3750000
    FontSize=30
}