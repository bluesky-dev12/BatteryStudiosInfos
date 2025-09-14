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
    return 34.0000000;
    //return;    
}

function AddClanMember(byte IsLogOn, int Level, string CharName, byte ClanGrade, int LevelMarkID, int TitleMarkID)
{
    local BTAutoColumnListDataHK row;
    local wGameManager GameMgr;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(7);
    i = 0;
    J0x27:

    // End:0xA8 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 4;
        row.DataPerColumn[3].Text[i].FontDrawType = 4;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[0].tempValue = int(IsLogOn);
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = CharName;
    row.DataPerColumn[2].strValue = IntToClanGrade(int(ClanGrade));
    row.DataPerColumn[2].IntValue = int(ClanGrade);
    // End:0x198
    if(int(IsLogOn) == 1)
    {
        row.DataPerColumn[3].strValue = strOnLine;        
    }
    else
    {
        row.DataPerColumn[3].strValue = strOffLine;
    }
    row.DataPerColumn[3].IntValue = LevelMarkID;
    AddRow(row);
    //return;    
}

function ChangeLevelMarkID(string UserName, int LevelMarkID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6A [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x60
        if(ACLRowList[i].DataPerColumn[1].strValue == UserName)
        {
            ACLRowList[i].DataPerColumn[3].IntValue = LevelMarkID;
            return;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    return;
    //return;    
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
    //return;    
}

function int GetUserGrade(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
    //return;    
}

function string GetSelfIntro(int row)
{
    return ACLRowList[row].DataPerColumn[6].strValue;
    //return;    
}

function string IntToClanGrade(int cg)
{
    return strClanGrade[cg];
    //return;    
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
    //return;    
}

function int GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[4].tempValue;
    //return;    
}

function string GetServerIP(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
    //return;    
}

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
    //return;    
}

function int GetGameRoomNumber(int row)
{
    return ACLRowList[row].DataPerColumn[5].tempValue;
    //return;    
}

function int GetChannelNumber(int row)
{
    return ACLRowList[row].DataPerColumn[5].IntValue;
    //return;    
}

function int GetCurState(int row)
{
    return ACLRowList[row].DataPerColumn[6].tempValue;
    //return;    
}

function int GetLogOnState(int row)
{
    return ACLRowList[row].DataPerColumn[0].tempValue;
    //return;    
}

function SetCurpos(int row, int Value)
{
    ACLRowList[row].DataPerColumn[4].tempValue = Value;
    //return;    
}

function SetCurLocationName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[0].strValue = Value;
    //return;    
}

function SetChannelName(int row, string Value)
{
    //return;    
}

function SetServerPort(int row, int Value)
{
    ACLRowList[row].DataPerColumn[4].IntValue = Value;
    //return;    
}

function SetServerIP(int row, string Value)
{
    ACLRowList[row].DataPerColumn[4].strValue = Value;
    //return;    
}

function SetServerName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[5].strValue = Value;
    //return;    
}

function SetGameRoomNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[5].tempValue = Value;
    //return;    
}

function SetChannelNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[5].IntValue = Value;
    //return;    
}

function SetCurState(int row, int Value)
{
    ACLRowList[row].DataPerColumn[6].tempValue = Value;
    //return;    
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
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
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LevelImg, L + float(1), t + float(1), (L + float(1)) + float(32), (t + float(1)) + float(32));
    //return;    
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    // End:0x3C
    if(0 == (GetLogOnState(row)))
    {
        C.DrawColor = C.MakeColor(100, 100, 100, byte(255));        
    }
    else
    {
        i = 0;
        // End:0x5A
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
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
    //return;    
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
    self.SelectImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_on');
    self.LastSelectedImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_cli');
    self.DefaultRowImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(731, 25, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_n');
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Level", 32.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Nick Name", 575.0000000 - float(454), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Grade", 638.0000000 - float(575), 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Location", 745.0000000 - float(638), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    LevelImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cm_00;
    btToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 5;
    btToolTip.InternalPadding[3] = 5;
    //return;    
}

defaultproperties
{
    strClanGrade[1]="Master"
    strClanGrade[2]="Officer"
    strClanGrade[3]="Soldier"
    strClanGrade[4]="Recruit"
    strOffLine="Offline"
    strOnLine="Online"
    OnRendered=BTACLClanMemberHK.Internal_OnRendered
}