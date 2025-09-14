class BTACLQuestHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var int LastTabIndex;
var wGameManager GameMgr;
var BTROExpBarHK expbar;
var array<BTAutoColumnListDataHK> ACLRowListPool;
var localized string strCannotRepair;
var localized string Rewardname[2];

function float GetItemHeight(Canvas C)
{
    return 23.0000000 * (float(Controller.ResY) / 768.0000000);
    //return;    
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, linkqindex, maxstep, shiftL, nDailyQuestType;

    local FloatBox fb;
    local wQuestParam q, linkq;

    q = GameMgr.GetQuestInfoFromIndex(Data.IntValue);
    nDailyQuestType = GameMgr.GetDailyQuestType(ACLRowList[row].DataPerColumn[2].IntValue);
    i = 0;
    // End:0x6E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x84
    if(selectIndex == row)
    {
        i = 1;
    }
    shiftL = int(L + float(15));
    switch(q.QuestType)
    {
        // End:0xF5
        case 0:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_quest_tuto, float(shiftL), t + float(4), R, B);
            shiftL += 52;
            // End:0x1AF
            break;
        // End:0x143
        case 1:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_Event_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 52;
            // End:0x1AF
            break;
        // End:0x192
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_Day_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 52;
            // End:0x1AF
            break;
        // End:0x19A
        case 3:
            // End:0x1AF
            break;
        // End:0x1A2
        case 4:
            // End:0x1AF
            break;
        // End:0x1AC
        case 8:
            return;
            // End:0x1AF
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(nDailyQuestType)
    {
        // End:0x205
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Queest_Attend_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 52;
            // End:0x261
            break;
        // End:0x20A
        case 3:
        // End:0x20F
        case 4:
        // End:0x25E
        case 5:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Queest_Puzzle_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 52;
            // End:0x261
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(q.LimitArea)
    {
        // End:0x278
        case 0:
            // End:0x318
            break;
        // End:0x2C6
        case 1:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PC_B_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 62;
            // End:0x318
            break;
        // End:0x315
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PC_Y_Mark, float(shiftL), t + float(4), R, B);
            shiftL += 62;
            // End:0x318
            break;
        // End:0xFFFF
        default:
            break;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    linkqindex = ACLRowList[row].DataPerColumn[1].IntValue;
    // End:0x4EF
    if(linkqindex > 0)
    {
        linkq = GameMgr.GetQuestInfoFromIndex(linkqindex);
        maxstep = ACLRowList[row].DataPerColumn[1].tempValue;
        fb = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBox(C, ACLRowList[row].DataPerColumn[2].strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize + 1), float(shiftL), t, R, B);
        ACLRowList[row].DataPerColumn[2].tempValue = int(fb.X2 - fb.X1);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ACLRowList[row].DataPerColumn[2].strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize + 1), float(shiftL), t, R, B);
        shiftL += (ACLRowList[row].DataPerColumn[2].tempValue + 7);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize - 1), float(shiftL), t, R, B);
    expbar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(R - float(137), t + float(4), R - float(9), B - float(5));
    expbar.SetData(Data.tempValue, q.MissionCount, false, true);
    expbar.Render(C);
    //return;    
}

function bool AddQuestInfo(int QuestID, int currentstatus)
{
    local BTAutoColumnListDataHK row;
    local int i, PrevQuestID, questindex, linkquestindex, linkquestmaxstep;

    local wQuestParam q, linkq, tempq;
    local string Reward, rewardTemp;
    local array<string> strTemp;
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
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    q = GameMgr.GetQuestInfo(QuestID);
    // End:0x13A
    if(q.IsEventQuest())
    {
        CurrentTime = GameMgr.GetClientTime(true);
        // End:0xF5
        if(__NFUN_922__(q.EventEndTime, CurrentTime))
        {
            return true;            
        }
        else
        {
            // End:0x13A
            if(__NFUN_922__(CurrentTime, q.EventStartTime))
            {
                row.DataPerColumn[0].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Disable();
            }
        }
    }
    // End:0x41C
    if(q.LinkQuestID > 0)
    {
        linkquestindex = questindex;
        linkquestmaxstep = GameMgr.GetLinkQuestMaxStep(q.LinkQuestID);
        linkq = GameMgr.GetQuestInfoFromIndex(linkquestindex);
        row.DataPerColumn[2].strValue = ((((linkq.LinkQuestName $ "(") $ string(linkq.LinkQuestStep)) $ "/") $ string(linkquestmaxstep)) $ ") ";
        // End:0x2F8
        if(q.LinkQuestStep > 1)
        {
            // End:0x24F
            if(q.QuestType == 2)
            {
                PrevQuestID = GameMgr.GetPrevDailyQuestID(q.QuestID);
                tempq = GameMgr.GetQuestInfo(PrevQuestID);                
            }
            else
            {
                tempq = GameMgr.GetLinkQuestInfo(linkq.LinkQuestID, linkq.LinkQuestStep - 1);
            }
            row.DataPerColumn[3].strValue = ((((tempq.LinkQuestName $ "(") $ string(tempq.LinkQuestStep)) $ "/") $ string(linkquestmaxstep)) $ ") ";
            row.DataPerColumn[4].strValue = tempq.QuestMissionDesc;
        }
        // End:0x34D
        if(q.QuestType == 2)
        {
            PrevQuestID = GameMgr.GetLastDailyQuestID(q.QuestID);
            tempq = GameMgr.GetQuestInfo(PrevQuestID);            
        }
        else
        {
            tempq = GameMgr.GetLinkQuestInfo(linkq.LinkQuestID, linkquestmaxstep);
        }
        row.DataPerColumn[6].strValue = GetFormatRewardString(tempq);
        // End:0x419
        if(row.DataPerColumn[6].strValue != "")
        {
            Reward = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(110);
            Reward $= Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(111);
            row.DataPerColumn[6].strValue = Reward $ row.DataPerColumn[6].strValue;
        }        
    }
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
    rewardTemp = GetFormatRewardString(q);
    // End:0x5C2
    if(rewardTemp != "")
    {
        Reward = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(111, string(strTemp.Length + 1));
        strTemp[strTemp.Length] = Reward $ rewardTemp;
    }
    rewardTemp = GetFormatRewardAttendPuzzleString(q);
    // End:0x61A
    if(rewardTemp != "")
    {
        Reward = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(111, string(strTemp.Length + 1));
        strTemp[strTemp.Length] = Reward $ rewardTemp;
    }
    rewardTemp = GetFormatRewardItemString(q);
    // End:0x672
    if(rewardTemp != "")
    {
        Reward = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(111, string(strTemp.Length + 1));
        strTemp[strTemp.Length] = Reward $ rewardTemp;
    }
    i = 0;
    J0x679:

    // End:0x6D3 [Loop If]
    if(i < strTemp.Length)
    {
        // End:0x69C
        if((i * 2) > 2)
        {
            // [Explicit Continue]
            goto J0x6C9;
        }
        row.DataPerColumn[5 + (i * 2)].strValue = strTemp[i];
        J0x6C9:

        i++;
        // [Loop Continue]
        goto J0x679;
    }
    row.DataPerColumn[5].tempValue = int(q.HelpResource);
    i = 0;
    J0x701:

    // End:0x73A [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x701;
    }
    ACLRowListPool.Length = ACLRowListPool.Length + 1;
    ACLRowListPool[ACLRowListPool.Length - 1] = row;
    // End:0x79A
    if((LastTabIndex == 0) || row.DataPerColumn[3].IntValue == (LastTabIndex - 1))
    {
        AddRow(row);
    }
    return true;
    //return;    
}

function RemovePool()
{
    ACLRowListPool.Length = 0;
    //return;    
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

        // End:0x43 [Loop If]
        if(i < ACLRowListPool.Length)
        {
            AddRow(ACLRowListPool[i]);
            i++;
            // [Loop Continue]
            goto J0x18;
        }        
    }
    else
    {
        i = 0;
        J0x4D:

        // End:0x9E [Loop If]
        if(i < ACLRowListPool.Length)
        {
            // End:0x94
            if(ACLRowListPool[i].DataPerColumn[3].IntValue == TabIndex)
            {
                AddRow(ACLRowListPool[i]);
            }
            i++;
            // [Loop Continue]
            goto J0x4D;
        }
    }
    LastTabIndex = TabIndex;
    //return;    
}

function string GetFormatRewardString(wQuestParam tempq)
{
    local bool bPassComma;
    local string Reward;

    Reward = "";
    bPassComma = true;
    // End:0x56
    if(tempq.RewardExp > 0)
    {
        Reward $= Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(113, string(tempq.RewardExp));
        bPassComma = false;
    }
    // End:0xB5
    if(tempq.RewardPoint > 0)
    {
        // End:0x83
        if(bPassComma == false)
        {
            Reward $= ", ";
        }
        Reward $= Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(112, string(tempq.RewardPoint));
        bPassComma = false;
    }
    return Reward;
    //return;    
}

function string GetFormatRewardAttendPuzzleString(wQuestParam tempq)
{
    local int nDailyQuestType;
    local string Reward;

    nDailyQuestType = GameMgr.GetDailyQuestType(tempq.QuestID);
    // End:0x3F
    if(nDailyQuestType == 2)
    {
        Reward = Rewardname[0];        
    }
    else
    {
        // End:0x66
        if((nDailyQuestType >= 3) && nDailyQuestType <= 5)
        {
            Reward = Rewardname[1];
        }
    }
    return Reward;
    //return;    
}

function string GetFormatRewardItemString(wQuestParam tempq)
{
    local int i;
    local bool bPassComma;
    local string Reward;
    local wItemBoxHK ItemInfo;

    Reward = "";
    bPassComma = true;
    i = 0;
    J0x17:

    // End:0xDE [Loop If]
    if(i < 2)
    {
        // End:0xD4
        if(tempq.RewardItemID[i] > 0)
        {
            // End:0x56
            if(bPassComma == false)
            {
                Reward $= ", ";
            }
            ItemInfo = GameMgr.FindUIItem(tempq.RewardItemID[i]);
            // End:0xB5
            if(ItemInfo.CostType == 2)
            {
                Reward $= (ItemInfo.ItemName $ strCannotRepair);                
            }
            else
            {
                Reward $= ItemInfo.ItemName;
            }
            bPassComma = false;
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    return Reward;
    //return;    
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
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_List_n;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_List_ci;
    self.DefaultRowImage = ruii;
    self.SelectImage = ruii2;
    self.LastSelectedImage = ruii2;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("", 1.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    expbar = new Class'GUIWarfareControls_Decompressed.BTROExpBarHK';
    expbar.Init();
    //return;    
}

function string GetPrevQuestName(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
    //return;    
}

function string GetPrevQuestDesc(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
    //return;    
}

function string GetQuestName(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
    //return;    
}

function string GetQuestDesc(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
    //return;    
}

function int GetQuestId(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
    //return;    
}

function string GetQuestExtDesc(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
    //return;    
}

function string GetReward(int row)
{
    return ACLRowList[row].DataPerColumn[5].strValue;
    //return;    
}

function string GetLastReward(int row)
{
    return ACLRowList[row].DataPerColumn[6].strValue;
    //return;    
}

function int GetHelpResourceIndex(int row)
{
    return ACLRowList[row].DataPerColumn[5].tempValue;
    //return;    
}

function string GetDailyReward(int row)
{
    return ACLRowList[row].DataPerColumn[7].strValue;
    //return;    
}

defaultproperties
{
    strCannotRepair="[Unrepairable]"
    Rewardname[0]="Roll Call one-time ticket"
    Rewardname[1]="1 puzzle piece"
}