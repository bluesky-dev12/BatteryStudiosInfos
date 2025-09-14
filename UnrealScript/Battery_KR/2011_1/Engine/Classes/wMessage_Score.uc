class wMessage_Score extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string strScore_Default;
var localized string strScore_Heli;
var localized string strScore_Artillery;
var localized string strScore_Assist;
var localized string strScore_Capture;
var localized string strScore_BombSetted;
var localized string strScore_BombDiffused;
var int Code_MessageScore_Normal;
var int Code_MessageScore_Heli_Killer;
var int Code_MessageScore_Heli_Killed;
var int Code_MessageScore_Artillery;
var int Code_MessageScore_Assist;
var int Code_MessageScore_Assist_Special;
var int Code_MessageScore_Capture;
var int Code_MessageScore_BombSetted;
var int Code_MessageScore_BombDiffused;
var int GainPoint_Three;
var int GainPoint_Six;
var int GainPoint_Ten;
var int GainPoint_Twenty;
var float TextPosX;
var float TextPosY;
var float fTotalEffectRunTime;
var float fEffectRunTime1;
var float fEffectRunTime2;
var float fFadeOutTime;
var float StartScale;
var float ScaleStep;
var float ScaleStepMultiplier;
var string AMessageScoreSound;
var string AMessageHeadshotSound;
var string AMessageScoreChainSound;
var int iMaxDisplayMessage;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_MessageScore_Normal:
            return default.strScore_Default;
        // End:0x23
        case default.Code_MessageScore_Heli_Killer:
            return default.strScore_Heli;
        // End:0x31
        case default.Code_MessageScore_Heli_Killed:
            return default.strScore_Default;
        // End:0x3F
        case default.Code_MessageScore_Artillery:
            return default.strScore_Artillery;
        // End:0x4D
        case default.Code_MessageScore_Assist:
            return default.strScore_Assist;
        // End:0x5B
        case default.Code_MessageScore_Assist_Special:
            return default.strScore_Assist;
        // End:0x69
        case default.Code_MessageScore_Capture:
            return default.strScore_Capture;
        // End:0x77
        case default.Code_MessageScore_BombSetted:
            return default.strScore_BombSetted;
        // End:0x85
        case default.Code_MessageScore_BombDiffused:
            return default.strScore_BombDiffused;
        // End:0xFFFF
        default:
            return default.strScore_Default;
            break;
    }
    return default.strScore_Default;
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

static simulated function PlaySoundMessageScore(PlayerController P, string SoundKind)
{
    switch(SoundKind)
    {
        // End:0x11
        case "3kill":
        // End:0x1B
        case "5kill":
        // End:0x25
        case "7kill":
        // End:0x30
        case "10kill":
        // End:0x62
        case "15kill":
            P.ClientPlaySound(Sound(DynamicLoadObject(default.AMessageScoreChainSound, Class'Engine_Decompressed.Sound')));
            // End:0xC0
            break;
        // End:0x96
        case "headshot":
            P.ClientPlaySound(Sound(DynamicLoadObject(default.AMessageHeadshotSound, Class'Engine_Decompressed.Sound')));
            // End:0xC0
            break;
        // End:0xFFFF
        default:
            P.ClientPlaySound(Sound(DynamicLoadObject(default.AMessageScoreSound, Class'Engine_Decompressed.Sound')));
            // End:0xC0
            break;
            break;
    }
    //return;    
}

static simulated function int GetGainPoint(int Code_MessageScore)
{
    switch(Code_MessageScore)
    {
        // End:0x15
        case default.Code_MessageScore_Assist:
            return default.GainPoint_Three;
        // End:0x23
        case default.Code_MessageScore_Assist_Special:
            return default.GainPoint_Six;
        // End:0x31
        case default.Code_MessageScore_Normal:
            return default.GainPoint_Ten;
        // End:0x3F
        case default.Code_MessageScore_Heli_Killer:
            return default.GainPoint_Ten;
        // End:0x4D
        case default.Code_MessageScore_Artillery:
            return default.GainPoint_Ten;
        // End:0x5B
        case default.Code_MessageScore_Capture:
            return default.GainPoint_Ten;
        // End:0x69
        case default.Code_MessageScore_BombSetted:
            return default.GainPoint_Ten;
        // End:0x77
        case default.Code_MessageScore_BombDiffused:
            return default.GainPoint_Ten;
        // End:0x85
        case default.Code_MessageScore_Heli_Killed:
            return default.GainPoint_Twenty;
        // End:0xFFFF
        default:
            return default.GainPoint_Ten;
            break;
    }
    //return;    
}

defaultproperties
{
    strScore_Default="Kill"
    strScore_Heli="Helikill"
    strScore_Artillery="Artillerykill"
    strScore_Assist="Assist"
    strScore_Capture="Capture"
    strScore_BombSetted="BombSetted"
    strScore_BombDiffused="BombDiffused"
    Code_MessageScore_Normal=100
    Code_MessageScore_Heli_Killer=101
    Code_MessageScore_Heli_Killed=102
    Code_MessageScore_Artillery=103
    Code_MessageScore_Assist=104
    Code_MessageScore_Assist_Special=108
    Code_MessageScore_Capture=105
    Code_MessageScore_BombSetted=106
    Code_MessageScore_BombDiffused=107
    GainPoint_Three=3
    GainPoint_Six=6
    GainPoint_Ten=10
    GainPoint_Twenty=20
    TextPosX=0.4443750
    TextPosY=0.2758333
    fTotalEffectRunTime=0.2000000
    fEffectRunTime1=0.1900000
    fFadeOutTime=1.0000000
    StartScale=10.0000000
    ScaleStep=0.1000000
    ScaleStepMultiplier=1.1500000
    AMessageScoreSound="Warfare_Sound_UI.com.ui_com_score"
    AMessageHeadshotSound="Warfare_Sound_UI.com.ui_com_score_head"
    AMessageScoreChainSound="Warfare_Sound_UI.com.ui_com_score_chain"
    iMaxDisplayMessage=3
    bIsConsoleMessage=false
    bFadeMessage=true
    Lifetime=2
    bDrawWithTexture=true
    PosY=0.2258333
    FontSize=28
}