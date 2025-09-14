class wDefenceController extends wPlayer
    config(User);

simulated event ReceiveMessage_QuestType1(Class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId)
{
    //return;    
}

simulated event ReceiveMessage_QuestType2(Class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec)
{
    //return;    
}

simulated event ReceiveMessage_QuestType3(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    local wMatchMaker kMM;
    local wMapInfo mapInfo;

    Log((((((("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message)) $ "[Code_Message] : ") $ string(Switch)) $ "[iDifficult] :") $ string(iRDifficult)) $ "[iMap]:") $ string(iRMap));
    // End:0xB8
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    iRDifficult = kMM.BotDifficulty;
    mapInfo = kMM.MapSettings.GetMapInfo(kMM.szMapName);
    iRMap = mapInfo.MapID;
    switch(Switch)
    {
        // End:0x150
        case Message.default.Code_Quest_MatchEndInBotMode:
            kMM.UpdateQuest_MatchCompletedInBotMode(iRDifficult);
            // End:0x1A6
            break;
        // End:0x179
        case Message.default.Code_Quest_BestScoreInBotMode:
            kMM.UpdateQuest_WinnerInBotMode(iRDifficult, 1);
            // End:0x1A6
            break;
        // End:0x1A3
        case Message.default.Code_Quest_BestAssistInBotMode:
            kMM.UpdateQuest_WinnerInBotMode(iRDifficult, 2);
            // End:0x1A6
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event ReceiveMessage_QuestType4(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRRound)
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    iRDifficult = kMM.BotDifficulty;
    Log((((((("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message)) $ "[Code_Message] : ") $ string(Switch)) $ "[iDifficult] :") $ string(iRDifficult)) $ "[iRRound]:") $ string(iRRound));
    // End:0xE4
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    switch(Switch)
    {
        // End:0x118
        case Message.default.Code_Quest_RoundEndInBotMode:
            kMM.UpdateQuest_RoundCompletedInBotMode(iRDifficult, iRRound);
            // End:0x11B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SendQuest_KillSuccession(Controller Killer, byte byKillSuccession)
{
    //return;    
}
