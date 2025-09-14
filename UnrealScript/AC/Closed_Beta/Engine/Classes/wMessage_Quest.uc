class wMessage_Quest extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int Code_Quest_Kill;
var int Code_Quest_AimedKill;
var int Code_Quest_HeadShotKill;
var int Code_Quest_MeeleAttackKill;
var int Code_Quest_2Kill;
var int Code_Quest_3Kill;
var int Code_Quest_4Kill;
var int Code_Quest_5Kill;
var int Code_Quest_6Kill;
var int Code_Quest_7Kill;
var int Code_Quest_8Kill;
var int Code_Quest_9Kill;
var int Code_Quest_10Kill;
var int Code_Quest_15Kill;
var int Code_Quest_Assist;
var int Code_Quest_Death;
var int Code_Quest_CombatTime;
var int Code_Quest_MatchEnd;
var int Code_Quest_KillInBotMode;
var int Code_Quest_MatchEndInBotMode;
var int Code_Quest_AcquireTrophy;
var int Code_Quest_SprintTime;
var int Code_Quest_RoundEndInBotMode;
var int Code_Quest_BestScoreInBotMode;
var int Code_Quest_BestAssistInBotMode;
var int Code_Quest_KillGrenade;
var string AMessageQuestSound;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x38
        case default.Code_Quest_Kill:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_Kill";
        // End:0x6E
        case default.Code_Quest_AimedKill:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_AimedKill";
        // End:0xA7
        case default.Code_Quest_HeadShotKill:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_HeadShotKill";
        // End:0xE3
        case default.Code_Quest_MeeleAttackKill:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_MeeleAttackKill";
        // End:0x115
        case default.Code_Quest_2Kill:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_2Kill";
        // End:0x147
        case default.Code_Quest_3Kill:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_3Kill";
        // End:0x17A
        case default.Code_Quest_Assist:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_Assist";
        // End:0x1AC
        case default.Code_Quest_Death:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_Death";
        // End:0x1E3
        case default.Code_Quest_CombatTime:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_CombatTime";
        // End:0x218
        case default.Code_Quest_MatchEnd:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_MatchEnd";
        // End:0x24F
        case default.Code_Quest_SprintTime:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_SprintTime";
        // End:0x289
        case default.Code_Quest_KillInBotMode:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_KillInBotMode";
        // End:0x2C7
        case default.Code_Quest_MatchEndInBotMode:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_MatchEndInBotMode";
        // End:0x305
        case default.Code_Quest_RoundEndInBotMode:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_RoundEndInBotMode";
        // End:0x344
        case default.Code_Quest_BestScoreInBotMode:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_BestScoreInBotMode";
        // End:0x384
        case default.Code_Quest_BestAssistInBotMode:
            return (RelatedPRI_1.PlayerName $ " : ") $ "Code_Quest_BestAssistInBotMode";
        // End:0xFFFF
        default:
            return "No Code";
            break;
    }
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    //return;    
}

static simulated function ClientReceive_Type1(PlayerController P, optional int Switch, optional int iRWeaponType, optional int iRweaponId)
{
    switch(Switch)
    {
        // End:0x0F
        case default.Code_Quest_Kill:
        // End:0x17
        case default.Code_Quest_AimedKill:
        // End:0x1F
        case default.Code_Quest_HeadShotKill:
        // End:0x27
        case default.Code_Quest_MeeleAttackKill:
        // End:0x2F
        case default.Code_Quest_2Kill:
        // End:0x37
        case default.Code_Quest_3Kill:
        // End:0x3F
        case default.Code_Quest_Assist:
        // End:0x47
        case default.Code_Quest_Death:
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static simulated function ClientReceive_Type2(PlayerController P, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec)
{
    switch(Switch)
    {
        // End:0x0F
        case default.Code_Quest_CombatTime:
        // End:0x17
        case default.Code_Quest_MatchEnd:
        // End:0x1F
        case default.Code_Quest_SprintTime:
        // End:0x27
        case default.Code_Quest_AcquireTrophy:
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static simulated function ClientReceive_Type3(PlayerController P, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    switch(Switch)
    {
        // End:0x0F
        case default.Code_Quest_KillInBotMode:
        // End:0x17
        case default.Code_Quest_MatchEndInBotMode:
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static simulated function PlaySoundMessageQuest(PlayerController P)
{
    P.ClientPlaySound(Sound(DynamicLoadObject(default.AMessageQuestSound, Class'Engine.Sound')));
    //return;    
}

defaultproperties
{
    Code_Quest_Kill=101
    Code_Quest_AimedKill=102
    Code_Quest_HeadShotKill=103
    Code_Quest_MeeleAttackKill=104
    Code_Quest_2Kill=105
    Code_Quest_3Kill=106
    Code_Quest_4Kill=109
    Code_Quest_5Kill=110
    Code_Quest_6Kill=111
    Code_Quest_7Kill=112
    Code_Quest_8Kill=113
    Code_Quest_9Kill=114
    Code_Quest_10Kill=115
    Code_Quest_15Kill=116
    Code_Quest_Assist=107
    Code_Quest_Death=108
    Code_Quest_CombatTime=201
    Code_Quest_MatchEnd=202
    Code_Quest_KillInBotMode=203
    Code_Quest_AcquireTrophy=204
    Code_Quest_SprintTime=305
    Code_Quest_RoundEndInBotMode=401
    Code_Quest_BestScoreInBotMode=402
    Code_Quest_BestAssistInBotMode=403
    Code_Quest_KillGrenade=117
    AMessageQuestSound="Warfare_Sound_UI.com.ui_com_countdown"
}