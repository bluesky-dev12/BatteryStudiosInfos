class wQuestParam extends Object
    native;

var int QuestType;
var int QuestID;
var int LinkQuestID;
var int LinkQuestStep;
var int LimitArea;
var BtrDouble EventStartTime;
var BtrDouble EventEndTime;
var int QuestCreateLv;
var int DisplayOrder;
var string LinkQuestName;
var string QuestMissionDesc;
var string QuestExtDesc;
var int MissionType;
var int MissionOption[2];
var int MissionBotMode;
var int MissionCount;
var int RewardExp;
var int RewardPoint;
var int RewardItemID[2];
var int RewardItemPartID[2];
var int RewardQuestID[5];
var string HelpResource;

function bool IsEventQuest()
{
    return QuestType == 1;
    //return;    
}

function bool IsEnabledEventQuest(BtrDouble CurrentTime)
{
    // End:0x24
    if(__NFUN_922__(EventStartTime, CurrentTime) && __NFUN_922__(CurrentTime, EventEndTime))
    {
        return true;
    }
    return false;
    //return;    
}
