/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLQuestHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:15
 *
 *******************************************************************************/
class BTACLQuestHK extends BTAutoColumnListHK
    dependson(BTROExpBarHK)
    editinlinenew
    instanced;

var int LastTabIndex;
var wGameManager GameMgr;
var BTROExpBarHK expbar;
var array<BTAutoColumnListDataHK> ACLRowListPool;
var localized string strCannotRepair;

function float GetItemHeight(Canvas C)
{
    return 23.0;
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, linkqindex, maxstep, shiftL;
    local FloatBox fb;
    local wQuestParam q, linkq;

    q = GameMgr.GetQuestInfoFromIndex(Data.IntValue);
    i = 0;
    // End:0x3d
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x53
    if(selectIndex == row)
    {
        i = 1;
    }
    shiftL = int(L + float(11));
    switch(q.QuestType)
    {
        // End:0xc4
        case 0:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_quest_tuto, float(shiftL), t + float(4), R, B);
            shiftL += 58;
            // End:0x17e
            break;
        // End:0x112
        case 1:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Quest_Event_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 58;
            // End:0x17e
            break;
        // End:0x161
        case 2:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Quest_Day_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 58;
            // End:0x17e
            break;
        // End:0x169
        case 3:
            // End:0x17e
            break;
        // End:0x171
        case 4:
            // End:0x17e
            break;
        // End:0x17b
        case 8:
            return;
            // End:0x17e
            break;
        // End:0xffff
        default:
            switch(q.LimitArea)
            {
                // End:0x195
                case 0:
                    // End:0x235
                    break;
                // End:0x1e3
                case 1:
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Quest_PC_B_Mark, float(shiftL), t + float(4), R, B);
                    shiftL += 62;
                    // End:0x235
                    break;
                // End:0x232
                case 2:
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Quest_PC_Y_Mark, float(shiftL), t + float(4), R, B);
                    shiftL += 62;
                    // End:0x235
                    break;
                // End:0xffff
                default:
                    C.DrawColor = Data.Text[i].DrawColor;
                    linkqindex = ACLRowList[row].DataPerColumn[1].IntValue;
                    // End:0x40c
                    if(linkqindex > 0)
                    {
                        linkq = GameMgr.GetQuestInfoFromIndex(linkqindex);
                        maxstep = ACLRowList[row].DataPerColumn[1].tempValue;
                        fb = class'BTCustomDrawHK'.static.GetDrawStringFloatBox(C, ACLRowList[row].DataPerColumn[2].strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize + 1), float(shiftL), t, R, B);
                        ACLRowList[row].DataPerColumn[2].tempValue = int(fb.X2 - fb.X1);
                        class'BTCustomDrawHK'.static.DrawString(C, ACLRowList[row].DataPerColumn[2].strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize + 1), float(shiftL), t, R, B);
                        shiftL += ACLRowList[row].DataPerColumn[2].tempValue + 7;
                    }
                    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize - 1), float(shiftL), t, R, B);
                    expbar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(R - float(137), t + float(4), R - float(9), B - float(5));
                    expbar.SetData(Data.tempValue, q.MissionCount, false, true);
                    expbar.Render(C);
}

function bool AddQuestInfo(int QuestID, int currentstatus)
{
    local BTAutoColumnListDataHK row;
    local int i, PrevQuestID, questindex, linkquestindex, linkquestmaxstep;

    local wQuestParam q, linkq, tempq;
    local string Reward;
    local BtrDouble CurrentTime;

    questindex = GameMgr.GetQuestInfoIndex(QuestID);
    // End:0x27
    if(questindex < 0)
    {
        return false;
    }
    q = GameMgr.GetQuestInfoFromIndex(questindex);
    // End:0x58
    if(q.QuestType == 8)
    {
        return true;
    }
    row = new class'BTAutoColumnListDataHK';
    row.Init(7);
    row.BackgroundImage = class'BTUIResourcePoolHK'.default.list_commu_n;
    q = GameMgr.GetQuestInfo(QuestID);
    // End:0x13a
    if(q.IsEventQuest())
    {
        CurrentTime = GameMgr.GetClientTime(true);
        // End:0xf5
        if(UnresolvedNativeFunction_99(q.EventEndTime, CurrentTime))
        {
            return true;
        }
        // End:0x13a
        else
        {
            // End:0x13a
            if(UnresolvedNativeFunction_99(CurrentTime, q.EventStartTime))
            {
                row.DataPerColumn[0].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Disable();
            }
        }
    }
    // End:0x41c
    if(q.LinkQuestID > 0)
    {
        linkquestindex = questindex;
        linkquestmaxstep = GameMgr.GetLinkQuestMaxStep(q.LinkQuestID);
        linkq = GameMgr.GetQuestInfoFromIndex(linkquestindex);
        row.DataPerColumn[2].strValue = linkq.LinkQuestName $ "(" $ string(linkq.LinkQuestStep) $ "/" $ string(linkquestmaxstep) $ ") ";
        // End:0x2f8
        if(q.LinkQuestStep > 1)
        {
            // End:0x24f
            if(q.QuestType == 2)
            {
                PrevQuestID = GameMgr.GetPrevDailyQuestID(q.QuestID);
                tempq = GameMgr.GetQuestInfo(PrevQuestID);
            }
            // End:0x283
            else
            {
                tempq = GameMgr.GetLinkQuestInfo(linkq.LinkQuestID, linkq.LinkQuestStep - 1);
            }
            row.DataPerColumn[3].strValue = tempq.LinkQuestName $ "(" $ string(tempq.LinkQuestStep) $ "/" $ string(linkquestmaxstep) $ ") ";
            row.DataPerColumn[4].strValue = tempq.QuestMissionDesc;
        }
        // End:0x34d
        if(q.QuestType == 2)
        {
            PrevQuestID = GameMgr.GetLastDailyQuestID(q.QuestID);
            tempq = GameMgr.GetQuestInfo(PrevQuestID);
        }
        // End:0x375
        else
        {
            tempq = GameMgr.GetLinkQuestInfo(linkq.LinkQuestID, linkquestmaxstep);
        }
        row.DataPerColumn[6].strValue = GetFormatRewardString(tempq);
        // End:0x419
        if(row.DataPerColumn[6].strValue != "")
        {
            Reward = class'BTWindowDefineInfoHK'.static.GetFormatString(110);
            Reward $= class'BTWindowDefineInfoHK'.static.GetFormatString(111);
            row.DataPerColumn[6].strValue = Reward $ row.DataPerColumn[6].strValue;
        }
    }
    // End:0x475
    else
    {
        linkquestindex = 0;
        linkquestmaxstep = 0;
        row.DataPerColumn[3].strValue = "";
        row.DataPerColumn[4].strValue = "";
        row.DataPerColumn[6].strValue = "";
    }
    row.DataPerColumn[0].IntValue = questindex;
    row.DataPerColumn[0].tempValue = currentstatus;
    row.DataPerColumn[1].IntValue = linkquestindex;
    row.DataPerColumn[1].tempValue = linkquestmaxstep;
    row.DataPerColumn[0].strValue = q.QuestMissionDesc;
    row.DataPerColumn[1].strValue = q.QuestExtDesc;
    row.DataPerColumn[2].IntValue = QuestID;
    row.DataPerColumn[3].IntValue = q.QuestType;
    row.DataPerColumn[5].strValue = GetFormatRewardString(q);
    // End:0x5f4
    if(row.DataPerColumn[5].strValue != "")
    {
        Reward = class'BTWindowDefineInfoHK'.static.GetFormatString(111);
        row.DataPerColumn[5].strValue = Reward $ row.DataPerColumn[5].strValue;
    }
    row.DataPerColumn[5].tempValue = int(q.HelpResource);
    i = 0;
    J0x622:
    // End:0x65b [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x622;
    }
    ACLRowListPool.Length = ACLRowListPool.Length + 1;
    ACLRowListPool[ACLRowListPool.Length - 1] = row;
    // End:0x6bb
    if(LastTabIndex == 0 || row.DataPerColumn[3].IntValue == LastTabIndex - 1)
    {
        AddRow(row);
    }
    return true;
}

function RemovePool()
{
    ACLRowListPool.Length = 0;
}

function SetVisibleQuestType(int TabIndex)
{
    local int i;

    RemoveAll();
    // End:0x46
    if(TabIndex == 0)
    {
        i = 0;
        J0x18:
        // End:0x43 [While If]
        if(i < ACLRowListPool.Length)
        {
            AddRow(ACLRowListPool[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x18;
        }
    }
    // End:0xa1
    else
    {
        i = 0;
        J0x4d:
        // End:0xa1 [While If]
        if(i < ACLRowListPool.Length)
        {
            // End:0x97
            if(ACLRowListPool[i].DataPerColumn[3].IntValue == TabIndex - 1)
            {
                AddRow(ACLRowListPool[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4d;
        }
    }
    LastTabIndex = TabIndex;
}

function string GetFormatRewardString(wQuestParam tempq)
{
    local int i;
    local bool bPassComma;
    local string Reward;
    local wItemBoxHK ItemInfo;

    Reward = "";
    bPassComma = true;
    // End:0x56
    if(tempq.RewardExp > 0)
    {
        Reward $= class'BTWindowDefineInfoHK'.static.GetFormatString(113, string(tempq.RewardExp));
        bPassComma = false;
    }
    // End:0xb5
    if(tempq.RewardPoint > 0)
    {
        // End:0x83
        if(bPassComma == false)
        {
            Reward $= ", ";
        }
        Reward $= class'BTWindowDefineInfoHK'.static.GetFormatString(112, string(tempq.RewardPoint));
        bPassComma = false;
    }
    i = 0;
    J0xbc:
    // End:0x183 [While If]
    if(i < 2)
    {
        // End:0x179
        if(tempq.RewardItemID[i] > 0)
        {
            // End:0xfb
            if(bPassComma == false)
            {
                Reward $= ", ";
            }
            ItemInfo = GameMgr.FindUIItem(tempq.RewardItemID[i]);
            // End:0x15a
            if(ItemInfo.CostType == 2)
            {
                Reward $= ItemInfo.ItemName $ strCannotRepair;
            }
            // End:0x171
            else
            {
                Reward $= ItemInfo.ItemName;
            }
            bPassComma = false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbc;
    }
    return Reward;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnBox.MyScrollBar.bUseAWinPos = true;
    MultiColumnBox.MyScrollBar.AWinPos.X1 = AWinPos.X2;
    MultiColumnBox.MyScrollBar.AWinPos.X2 = AWinPos.X2 + float(12);
    MultiColumnBox.MyScrollBar.AWinPos.Y1 = AWinPos.Y1;
    MultiColumnBox.MyScrollBar.AWinPos.Y2 = AWinPos.Y2;
    MultiColumnBox.MyScrollBar.ApplyAWinPos();
    ruii = class'BTUIResourcePoolHK'.default.Quest_List_n;
    ruii2 = class'BTUIResourcePoolHK'.default.Quest_List_ci;
    self.DefaultRowImage = ruii;
    self.SelectImage = ruii2;
    self.LastSelectedImage = ruii2;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    expbar = new class'BTROExpBarHK';
    expbar.Init();
}

function string GetPrevQuestName(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
}

function string GetPrevQuestDesc(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
}

function string GetQuestName(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
}

function string GetQuestDesc(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
}

function string GetQuestExtDesc(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
}

function string GetReward(int row)
{
    return ACLRowList[row].DataPerColumn[5].strValue;
}

function string GetLastReward(int row)
{
    return ACLRowList[row].DataPerColumn[6].strValue;
}

function int GetHelpResourceIndex(int row)
{
    return ACLRowList[row].DataPerColumn[5].tempValue;
}

defaultproperties
{
    strCannotRepair="[Unrepairable]"
}