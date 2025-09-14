class wMultiKillMessage extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string KillString[15];
var Sound KillSound[7];
var string KillSoundName[7];
var name MuliKillSoundName[5];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return default.KillString[Min(Switch, 14)];
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    P.myHUD.ResetKillMessageTexture();
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    switch(Switch)
    {
        // End:0x60
        case 1:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[0], 1, true, 17);
            // End:0xF2
            break;
        // End:0x83
        case 3:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[1], 1, true, 17);
            // End:0xF2
            break;
        // End:0xA7
        case 5:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[2], 1, true, 17);
            // End:0xF2
            break;
        // End:0xCB
        case 8:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[3], 1, true, 17);
            // End:0xF2
            break;
        // End:0xEF
        case 13:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[4], 1, true, 17);
            // End:0xF2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

defaultproperties
{
    KillString[0]="2kill"
    KillString[1]="3kill"
    KillString[2]="4kill"
    KillString[3]="5kill"
    KillString[4]="6kill"
    KillString[5]="7kill"
    KillString[6]="8kill"
    KillString[7]="9kill"
    KillString[8]="10kill"
    KillString[9]="11kill"
    KillString[10]="12kill"
    KillString[11]="13kill"
    KillString[12]="14kill"
    KillString[13]="15kill"
    KillString[14]="Storm Kill"
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