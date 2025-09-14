/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wQuestParam.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:2
 *
 *******************************************************************************/
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
}

function bool IsEnabledEventQuest(BtrDouble CurrentTime)
{
    // End:0x24
    if(UnresolvedNativeFunction_99(EventStartTime, CurrentTime) && UnresolvedNativeFunction_99(CurrentTime, EventEndTime))
    {
        return true;
    }
    return false;
}
