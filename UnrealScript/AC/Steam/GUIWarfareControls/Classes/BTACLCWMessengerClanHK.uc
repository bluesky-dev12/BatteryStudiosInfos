/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLCWMessengerClanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:12
 *
 *******************************************************************************/
class BTACLCWMessengerClanHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;
var BTRODecorateStringHK btToolTip;

function SortByConnectionStatus()
{
    local int i;
    local array<BTAutoColumnListDataHK> OffLineList;

    i = 0;
    J0x07:
    // End:0x6d [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x63
        if(ACLRowList[i].DataPerColumn[0].tempValue == 0)
        {
            OffLineList[OffLineList.Length] = ACLRowList[i];
            ACLRowList.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x74:
    // End:0xa6 [While If]
    if(i < OffLineList.Length)
    {
        ACLRowList[ACLRowList.Length] = OffLineList[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x74;
    }
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    // End:0x4d
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x63
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontSize = 10;
    // End:0x221
    if(false)
    {
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetCombatState(row), 3, float(Data.Text[i].FontSize), L, t, L + float(71), B, 15, 0, 0, 0, Data.Text[i].DrawShadowColor);
        GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
        class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(71), t + float(1), L + float(71) + float(32), B - float(1));
        C.DrawColor = Data.Text[i].DrawColor;
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetWinLose(row), 3, float(Data.Text[i].FontSize), L + float(71) + float(32) + float(123), t, R, B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    }
    // End:0x293
    else
    {
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetCurPos(row), 3, float(Data.Text[i].FontSize), L, t, L + float(71) + float(32), B, 15, 0, 0, 0, Data.Text[i].DrawShadowColor);
    }
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), 3, float(Data.Text[i].FontSize), L + float(71) + float(32), t, L + float(71) + float(32) + float(123), B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function Internal_OnRendered(Canvas Canvas)
{
    // End:0x82
    if(selectIndex >= 0)
    {
        btToolTip.OriginalString.Text = GetSelfIntro(selectIndex);
        // End:0x82
        if(btToolTip.OriginalString.Text != "")
        {
            btToolTip.AWinPos = GetTooltipPos(170, 20);
            btToolTip.bNeedUpdate = true;
            btToolTip.Render(Canvas);
        }
    }
}

function string GetCombatState(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
}

function string GetWinLose(int row)
{
    return ACLRowList[row].DataPerColumn[5].strValue;
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function string GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
}

function string GetSelfIntro(int row)
{
    return ACLRowList[row].DataPerColumn[6].strValue;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[7].IntValue;
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
    ruii = class'BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = class'BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.list_commu_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    btToolTip = new class'BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 5;
    btToolTip.InternalPadding[3] = 5;
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}