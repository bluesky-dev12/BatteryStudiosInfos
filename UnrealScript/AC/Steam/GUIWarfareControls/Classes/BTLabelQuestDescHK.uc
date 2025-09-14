/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelQuestDescHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:3
 *
 *******************************************************************************/
class BTLabelQuestDescHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var bool bSummaryMode;
var wGameManager GameMgr;
var wQuestParam q;
var wQuestParam pq;
var array<Text> arrPrevQuest;
var array<Text> arrCurQuest;
var Text txtQuestExtDesc;
var Text txtReward;
var Text txtLastReward;
var Text QuestReward;
var Text AllQuestReward;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    arrPrevQuest.Length = 2;
    arrPrevQuest[0] = class'BTCustomDrawHK'.static.MakeText(11, 0, "");
    arrPrevQuest[1] = class'BTCustomDrawHK'.static.MakeText(10, 0, "");
    arrPrevQuest[0].DrawColor = class'BTUIColorPoolHK'.static.ButtonDisable();
    arrPrevQuest[1].DrawColor = class'BTUIColorPoolHK'.static.ButtonDisable();
    arrCurQuest.Length = 2;
    arrCurQuest[0] = class'BTCustomDrawHK'.static.MakeText(11, 0, "");
    arrCurQuest[1] = class'BTCustomDrawHK'.static.MakeText(10, 0, "");
    txtQuestExtDesc = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    txtReward = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    txtReward.DrawColor = class'BTUIColorPoolHK'.static.ChatSelf();
    txtLastReward = class'BTCustomDrawHK'.static.MakeText(11, 0, "");
    txtLastReward.DrawColor = class'BTUIColorPoolHK'.static.ChatSelf();
}

function SetData(string PrevQuestName, string PrevQuestDesc, string QuestName, string QuestDesc, string QuestExtDesc, string Reward, string LastReward)
{
    arrPrevQuest[0].Text = PrevQuestName;
    arrPrevQuest[1].Text = PrevQuestDesc;
    arrCurQuest[0].Text = QuestName;
    arrCurQuest[1].Text = QuestDesc;
    // End:0x6d
    if(QuestExtDesc != "")
    {
        txtQuestExtDesc.Text = " -" $ QuestExtDesc;
    }
    // End:0x7d
    else
    {
        txtQuestExtDesc.Text = QuestExtDesc;
    }
    txtReward.Text = Reward;
    txtLastReward.Text = LastReward;
}

function Internal_OnRendered(Canvas C)
{
    local int L, t, R, B;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    L = int(RWinPos.X1);
    R = int(RWinPos.X2);
    t = int(RWinPos.Y1);
    B = int(RWinPos.Y2);
    // End:0x1c9
    if(bSummaryMode)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_lobby_n, float(L), float(t), float(R), float(B));
        // End:0x103
        if(arrCurQuest[1].Text != "")
        {
            class'BTCustomDrawHK'.static.DrawTextArray(C, arrCurQuest, 3, 0, float(L + 5), float(t), float(R), float(B));
        }
        // End:0x1c6
        if(txtReward.Text != "")
        {
            txtReward.FontSize = 10;
            C.SetDrawColor(txtReward.DrawColor.R, txtReward.DrawColor.G, txtReward.DrawColor.B, txtReward.DrawColor.A);
            class'BTCustomDrawHK'.static.DrawString(C, txtReward.Text, 5, float(txtReward.FontSize), float(L + 5), float(t), float(R - 9), float(B), txtReward.DrawShadowColor);
        }
    }
    // End:0x386
    else
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(L), float(t), float(R), float(B));
        t += 8;
        // End:0x25c
        if(arrCurQuest[1].Text != "")
        {
            class'BTCustomDrawHK'.static.DrawTextArray(C, arrCurQuest, 0, 0, float(L), float(t), float(R), float(B));
            t += 27;
        }
        // End:0x2a8
        if(txtQuestExtDesc.Text != "")
        {
            class'BTCustomDrawHK'.static.DrawText(C, txtQuestExtDesc, float(L + 5), float(t), float(R), float(B), 0, true);
        }
        t = int(AWinPos.Y1 + float(73) + float(24) + float(14));
        // End:0x327
        if(txtLastReward.Text != "")
        {
            class'BTCustomDrawHK'.static.DrawText(C, txtLastReward, float(L + 5 + 11), float(t), float(R - 5), float(B));
            t -= 19;
        }
        // End:0x386
        if(txtReward.Text != "")
        {
            txtReward.FontSize = 10;
            class'BTCustomDrawHK'.static.DrawText(C, txtReward, float(L + 5 + 11), float(t), float(R - 5), float(B));
        }
    }
}
