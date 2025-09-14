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
    local bool isWomanVoice;

    P.myHUD.ResetKillMessageTexture();
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0xA1
    if((RelatedPRI_1.aiBodyItemID[RelatedPRI_1.Team.TeamIndex] > 15499) && RelatedPRI_1.aiBodyItemID[RelatedPRI_1.Team.TeamIndex] < 16000)
    {
        isWomanVoice = true;
    }
    switch(Switch)
    {
        // End:0xD0
        case 1:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[0], 1, true, 17, isWomanVoice);
            // End:0x17A
            break;
        // End:0xF9
        case 3:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[1], 1, true, 17, isWomanVoice);
            // End:0x17A
            break;
        // End:0x123
        case 5:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[2], 1, true, 17, isWomanVoice);
            // End:0x17A
            break;
        // End:0x14D
        case 8:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[3], 1, true, 17, isWomanVoice);
            // End:0x17A
            break;
        // End:0x177
        case 13:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[4], 1, true, 17, isWomanVoice);
            // End:0x17A
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

static simulated function ClientReceiveEx(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional int iReserve)
{
    local bool isWomanVoice;

    P.myHUD.ResetKillMessageTexture();
    super.ClientReceiveEx(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject, iReserve);
    // End:0xA6
    if((RelatedPRI_1.aiBodyItemID[RelatedPRI_1.Team.TeamIndex] > 15499) && RelatedPRI_1.aiBodyItemID[RelatedPRI_1.Team.TeamIndex] < 16000)
    {
        isWomanVoice = true;
    }
    switch(Switch)
    {
        // End:0xD5
        case 1:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[0], 1, true, 17, isWomanVoice);
            // End:0x17F
            break;
        // End:0xFE
        case 3:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[1], 1, true, 17, isWomanVoice);
            // End:0x17F
            break;
        // End:0x128
        case 5:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[2], 1, true, 17, isWomanVoice);
            // End:0x17F
            break;
        // End:0x152
        case 8:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[3], 1, true, 17, isWomanVoice);
            // End:0x17F
            break;
        // End:0x17C
        case 13:
            P.PlayRewardAnnouncement(default.MuliKillSoundName[4], 1, true, 17, isWomanVoice);
            // End:0x17F
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
    MuliKillSoundName[0]="/Combat_kill/v_cb_kill_3kill"
    MuliKillSoundName[1]="/Combat_kill/v_cb_kill_5kill"
    MuliKillSoundName[2]="/Combat_kill/v_cb_kill_7kill"
    MuliKillSoundName[3]="/Combat_kill/v_cb_kill_10kill"
    MuliKillSoundName[4]="/Combat_kill/v_cb_kill_15kill"
    bIsUnique=true
    bFadeMessage=true
    Lifetime=2
    bDrawWithTexture=true
    PosY=0.3750000
    FontSize=30
}