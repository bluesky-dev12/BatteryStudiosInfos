/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDefenceController.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class wDefenceController extends wPlayer
    config(User);

simulated event ReceiveMessage_QuestType1(class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId);
simulated event ReceiveMessage_QuestType2(class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec);
simulated event ReceiveMessage_QuestType3(class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    local wMatchMaker kMM;
    local wMapInfo mapInfo;

    Log("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message) $ "[Code_Message] : " $ string(Switch) $ "[iDifficult] :" $ string(iRDifficult) $ "[iMap]:" $ string(iRMap));
    // End:0xb8
    if(Level.NetMode == 1 || GameReplicationInfo == none)
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
            // End:0x1a6
            break;
        // End:0x179
        case Message.default.Code_Quest_BestScoreInBotMode:
            kMM.UpdateQuest_WinnerInBotMode(iRDifficult, 1);
            // End:0x1a6
            break;
        // End:0x1a3
        case Message.default.Code_Quest_BestAssistInBotMode:
            kMM.UpdateQuest_WinnerInBotMode(iRDifficult, 2);
            // End:0x1a6
            break;
        // End:0xffff
        default:
}

simulated event ReceiveMessage_QuestType4(class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRRound)
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    iRDifficult = kMM.BotDifficulty;
    Log("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message) $ "[Code_Message] : " $ string(Switch) $ "[iDifficult] :" $ string(iRDifficult) $ "[iRRound]:" $ string(iRRound));
    // End:0xe4
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    switch(Switch)
    {
        // End:0x118
        case Message.default.Code_Quest_RoundEndInBotMode:
            kMM.UpdateQuest_RoundCompletedInBotMode(iRDifficult, iRRound);
            // End:0x11b
            break;
        // End:0xffff
        default:
}

function SendQuest_KillSuccession(Controller Killer, byte byKillSuccession);
