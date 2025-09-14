/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMessengerChannelHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:12
 *
 *******************************************************************************/
class BTACLMessengerChannelHK extends BTACLMessengerCommon
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    // End:0x83
    if(Data.strValue != "")
    {
        PlayerOwner().Level.GameMgr.cmm.Render(C, int(L + float(2)), int(t + float(1)), int(L + float(2) + float(32)), int(B - float(1)), Data.strValue);
    }
    // End:0x191
    else
    {
        // End:0x11d
        if(ACLRowList[row].DataPerColumn[3].tempValue > 0)
        {
            // End:0x11a
            if(PlayerOwner().Level.GetMatchMaker().kClanLookingFor)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark_02, L + float(2), t + float(1), L + float(2) + float(32), B - float(1));
            }
        }
        // End:0x191
        else
        {
            // End:0x191
            if(ACLRowList[row].DataPerColumn[4].tempValue > 0)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark_02, L + float(2), t + float(1), L + float(2) + float(32), B - float(1));
            }
        }
    }
    PlayerOwner().Level.GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
    i = 0;
    // End:0x238
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x24e
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x27e
    if(IsFriendlyUser(row))
    {
        C.DrawColor = GetUserNameColor(row, i);
    }
    // End:0x2a2
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 91, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x40f
    if(self.selectIndex == row)
    {
        // End:0x40f
        if(Data.strValue != "")
        {
            class'BTCustomDrawHK'.static.DrawImage(C, SelectImage, L - float(110) - float(13) + float(2), t, L + float(2), B);
            class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[1].FontDrawType, float(Data.Text[1].FontSize), L - float(110) - float(13) + float(2) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[1].DrawShadowColor);
        }
    }
}

function int GetClanID(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function string GetClanName(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
}

function int GetUserID(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
}

function int GetClanPatternID(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function bool IsFriendlyUser(int row)
{
    return ACLRowList[row].DataPerColumn[2].floatValue != float(0);
}

function Color GetUserNameColor(int row, int idx)
{
    return ACLRowList[row].DataPerColumn[2].Text[idx].DrawColor;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[5].IntValue;
}

function float GetItemHeight(Canvas C)
{
    return 34.0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.width = 32.0;
    CommonSizeImg.Height = 32.0;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = class'BTUIResourcePoolHK'.default.Msg_list_on;
    ruii2 = class'BTUIResourcePoolHK'.default.Msg_list_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.Msg_list_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ClanMark/Level/UserName", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}
