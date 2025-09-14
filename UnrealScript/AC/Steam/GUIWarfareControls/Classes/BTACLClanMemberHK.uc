/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLClanMemberHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:28
 *
 *******************************************************************************/
class BTACLClanMemberHK extends BTACLMessengerCommon
    editinlinenew
    instanced;

var Image LevelImg;
var localized string strClanGrade[5];
var localized string strOffLine;
var localized string strOnLine;
var BTRODecorateStringHK btToolTip;

function float GetItemHeight(Canvas C)
{
    return 34.0;
}

function AddClanMember(byte IsLogOn, int Level, string CharName, byte ClanGrade, int LevelMarkID, int TitleMarkID)
{
    local BTAutoColumnListDataHK row;
    local wGameManager GameMgr;
    local int i;

    row = new class'BTAutoColumnListDataHK';
    row.Init(7);
    i = 0;
    J0x27:
    // End:0xa8 [While If]
    if(i < 3)
    {
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 4;
        row.DataPerColumn[3].Text[i].FontDrawType = 4;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[0].tempValue = IsLogOn;
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = CharName;
    row.DataPerColumn[2].strValue = IntToClanGrade(ClanGrade);
    row.DataPerColumn[2].IntValue = ClanGrade;
    // End:0x198
    if(IsLogOn == 1)
    {
        row.DataPerColumn[3].strValue = strOnLine;
    }
    // End:0x1b4
    else
    {
        row.DataPerColumn[3].strValue = strOffLine;
    }
    row.DataPerColumn[3].IntValue = LevelMarkID;
    AddRow(row);
}

function ChangeLevelMarkID(string UserName, int LevelMarkID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6a [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x60
        if(ACLRowList[i].DataPerColumn[1].strValue == UserName)
        {
            ACLRowList[i].DataPerColumn[3].IntValue = LevelMarkID;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
}

function int GetUserGrade(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
}

function string GetSelfIntro(int row)
{
    return ACLRowList[row].DataPerColumn[6].strValue;
}

function string IntToClanGrade(int cg)
{
    return strClanGrade[cg];
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
}

function int GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[4].tempValue;
}

function string GetServerIP(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
}

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
}

function int GetGameRoomNumber(int row)
{
    return ACLRowList[row].DataPerColumn[5].tempValue;
}

function int GetChannelNumber(int row)
{
    return ACLRowList[row].DataPerColumn[5].IntValue;
}

function int GetCurState(int row)
{
    return ACLRowList[row].DataPerColumn[6].tempValue;
}

function int GetLogOnState(int row)
{
    return ACLRowList[row].DataPerColumn[0].tempValue;
}

function SetCurpos(int row, int Value)
{
    ACLRowList[row].DataPerColumn[4].tempValue = Value;
}

function SetCurLocationName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[0].strValue = Value;
}

function SetChannelName(int row, string Value);
function SetServerPort(int row, int Value)
{
    ACLRowList[row].DataPerColumn[4].IntValue = Value;
}

function SetServerIP(int row, string Value)
{
    ACLRowList[row].DataPerColumn[4].strValue = Value;
}

function SetServerName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[5].strValue = Value;
}

function SetGameRoomNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[5].tempValue = Value;
}

function SetChannelNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[5].IntValue = Value;
}

function SetCurState(int row, int Value)
{
    ACLRowList[row].DataPerColumn[6].tempValue = Value;
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(Data.IntValue, GetLevelMarkID(row), LevelImg);
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, L + float(1), t + float(1), L + float(1) + float(32), t + float(1) + float(32));
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    // End:0x3c
    if(0 == GetLogOnState(row))
    {
        C.DrawColor = C.MakeColor(100, 100, 100, byte(255));
    }
    // End:0x94
    else
    {
        i = 0;
        // End:0x5a
        if(LastSelectedIndex == row)
        {
            i = 2;
        }
        // End:0x70
        if(selectIndex == row)
        {
            i = 1;
        }
        C.DrawColor = Data.Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    MultiColumnBox.MyScrollBar.bUseAWinPos = true;
    MultiColumnBox.MyScrollBar.AWinPos.X1 = AWinPos.X2;
    MultiColumnBox.MyScrollBar.AWinPos.X2 = AWinPos.X2 + float(15);
    MultiColumnBox.MyScrollBar.AWinPos.Y1 = AWinPos.Y1;
    MultiColumnBox.MyScrollBar.AWinPos.Y2 = AWinPos.Y2;
    MultiColumnBox.MyScrollBar.ApplyAWinPos();
    self.SelectImage = class'BTCustomDrawHK'.static.MakeImage(8, 8, 15, texture'list_lobby_on');
    self.LastSelectedImage = class'BTCustomDrawHK'.static.MakeImage(8, 8, 15, texture'list_lobby_cli');
    self.DefaultRowImage = class'BTCustomDrawHK'.static.MakeImage(731, 25, 15, texture'list_lobby_n');
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Level", 32.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Nick Name", 575.0 - float(454), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Grade", 638.0 - float(575), 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Location", 745.0 - float(638), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    LevelImg = class'BTUIResourcePoolHK'.default.cm_00;
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
    strClanGrade[1]="Master"
    strClanGrade[2]="Officer"
    strClanGrade[3]="Soldier"
    strClanGrade[4]="Recruit"
    strOffLine="Offline"
    strOnLine="Online"
    OnRendered=Internal_OnRendered
}