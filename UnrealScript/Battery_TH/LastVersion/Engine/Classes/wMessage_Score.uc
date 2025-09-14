class wMessage_Score extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string strScore_Default;
var localized string strScore_Assist;
var localized string strScore_Capture;
var localized string strScore_BombSetted;
var localized string strScore_BombDiffused;
var int Code_MessageScore_Normal;
var int Code_MessageScore_Heli_Killed;
var int Code_MessageScore_Sentry;
var int Code_MessageScore_Assist;
var int Code_MessageScore_Assist4;
var int Code_MessageScore_Assist5;
var int Code_MessageScore_Assist_Special;
var int Code_MessageScore_Capture;
var int Code_MessageScore_BombSetted;
var int Code_MessageScore_BombDiffused;
var int Code_GainBonusPoint;
var int GainPoint_Three;
var int GainPoint_Four;
var int GainPoint_Five;
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
var string AMsgHeliKillSound;
var string AMsgArtilleryKillSound;
var string AMsgMeleeKillSound;
var string AMsgGrenadeKillSound;
var string AMsgStepOnKillSound;
var string AMsgSpecialETCKillSound;
var string AMsgSentryGunKillSound;
var int iMaxDisplayMessage;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_MessageScore_Normal:
            return default.strScore_Default;
        // End:0x23
        case default.Code_MessageScore_Heli_Killed:
            return default.strScore_Default;
        // End:0x31
        case default.Code_MessageScore_Sentry:
            return default.strScore_Default;
        // End:0x3F
        case default.Code_MessageScore_Assist:
            return default.strScore_Assist;
        // End:0x4D
        case default.Code_MessageScore_Assist4:
            return default.strScore_Assist;
        // End:0x5B
        case default.Code_MessageScore_Assist5:
            return default.strScore_Assist;
        // End:0x69
        case default.Code_MessageScore_Assist_Special:
            return default.strScore_Assist;
        // End:0x77
        case default.Code_MessageScore_Capture:
            return default.strScore_Capture;
        // End:0x85
        case default.Code_MessageScore_BombSetted:
            return default.strScore_BombSetted;
        // End:0x93
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

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return super.GotoHud(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
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
        // End:0x32
        case "FragGrenadeKill":
            P.FmodClientPlaySound(default.AMsgGrenadeKillSound);
            // End:0x15B
            break;
        // End:0x57
        case "MeleeKill":
            P.FmodClientPlaySound(default.AMsgMeleeKillSound);
            // End:0x15B
            break;
        // End:0x7D
        case "StepOnKill":
            P.FmodClientPlaySound(default.AMsgStepOnKillSound);
            // End:0x15B
            break;
        // End:0xA7
        case "SpecialETCKill":
            P.FmodClientPlaySound(default.AMsgSpecialETCKillSound);
            // End:0x15B
            break;
        // End:0xCB
        case "Helikill":
            P.FmodClientPlaySound(default.AMsgHeliKillSound);
            // End:0x15B
            break;
        // End:0xF4
        case "Artillerykill":
            P.FmodClientPlaySound(default.AMsgArtilleryKillSound);
            // End:0x15B
            break;
        // End:0x118
        case "headshot":
            P.FmodClientPlaySound(default.AMessageHeadshotSound);
            // End:0x15B
            break;
        // End:0x141
        case "SentryGunKill":
            P.FmodClientPlaySound(default.AMsgSentryGunKillSound);
            // End:0x15B
            break;
        // End:0xFFFF
        default:
            P.FmodClientPlaySound(default.AMessageScoreSound);
            // End:0x15B
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
        case default.Code_MessageScore_Assist4:
            return default.GainPoint_Four;
        // End:0x31
        case default.Code_MessageScore_Assist5:
            return default.GainPoint_Five;
        // End:0x3F
        case default.Code_MessageScore_Assist_Special:
            return default.GainPoint_Six;
        // End:0x4D
        case default.Code_MessageScore_Normal:
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
        // End:0x93
        case default.Code_MessageScore_Sentry:
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
    strScore_Assist="Assist"
    strScore_Capture="Capture"
    strScore_BombSetted="BombSetted"
    strScore_BombDiffused="BombDiffused"
    Code_MessageScore_Normal=100
    Code_MessageScore_Heli_Killed=102
    Code_MessageScore_Sentry=104
    Code_MessageScore_Assist=105
    Code_MessageScore_Assist4=110
    Code_MessageScore_Assist5=111
    Code_MessageScore_Assist_Special=109
    Code_MessageScore_Capture=106
    Code_MessageScore_BombSetted=107
    Code_MessageScore_BombDiffused=108
    Code_GainBonusPoint=112
    GainPoint_Three=3
    GainPoint_Four=4
    GainPoint_Five=5
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
    AMessageScoreSound="Warfare_Sound_UI/Com/score"
    AMessageHeadshotSound="Warfare_Sound_UI/Com/score_head"
    AMessageScoreChainSound="Warfare_Sound_UI/com/score_chain"
    AMsgHeliKillSound="Warfare_Sound_UI/Kill/helicopter"
    AMsgArtilleryKillSound="Warfare_Sound_UI/Kill/bombing"
    AMsgMeleeKillSound="Warfare_Sound_UI/Kill/melee"
    AMsgGrenadeKillSound="Warfare_Sound_UI/Kill/frag"
    AMsgStepOnKillSound="Warfare_Sound_UI/Kill/foot"
    AMsgSpecialETCKillSound="Warfare_Sound_UI/Kill/specialweapons"
    iMaxDisplayMessage=3
    bIsConsoleMessage=false
    bFadeMessage=true
    Lifetime=2
    bDrawWithTexture=true
    PosY=0.2258333
    FontSize=28
}