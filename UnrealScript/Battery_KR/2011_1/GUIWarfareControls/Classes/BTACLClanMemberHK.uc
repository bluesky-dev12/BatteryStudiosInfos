class BTACLClanMemberHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image LevelImg;
var localized string strClanGrade[5];
var localized string strOffLine;
var BTRODecorateStringHK ToolTip;

function float GetItemHeight(Canvas C)
{
    return 34.0000000;
    //return;    
}

function AddClanMember(int Level, string CharName, byte ClanGrade, string ServerName, string serverIP, int serverPort, byte CurPos, int ChannelNum, string ChannelNickName, int GameRoomNum, string ClanSelfIntro, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local wGameManager GameMgr;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(7);
    i = 0;
    J0x27:

    // End:0xA8 [Loop If]
    if(i < 6)
    {
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 4;
        row.DataPerColumn[3].Text[i].FontDrawType = 4;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = CharName;
    row.DataPerColumn[2].strValue = IntToClanGrade(int(ClanGrade));
    row.DataPerColumn[2].IntValue = int(ClanGrade);
    row.DataPerColumn[4].strValue = serverIP;
    row.DataPerColumn[4].IntValue = serverPort;
    row.DataPerColumn[4].tempValue = int(CurPos);
    row.DataPerColumn[5].strValue = ServerName;
    row.DataPerColumn[5].IntValue = ChannelNum;
    row.DataPerColumn[5].tempValue = GameRoomNum;
    row.DataPerColumn[6].strValue = ClanSelfIntro;
    row.DataPerColumn[3].IntValue = LevelMarkID;
    // End:0x274
    if((ServerName ~= "offline") || ServerName ~= strOffLine)
    {
        row.DataPerColumn[3].strValue = strOffLine;        
    }
    else
    {
        switch(CurPos)
        {
            // End:0x29F
            case 0:
                row.DataPerColumn[3].strValue = ServerName;
                // End:0x2F8
                break;
            // End:0x2C3
            case 1:
                row.DataPerColumn[3].strValue = ChannelNickName;
                // End:0x2F8
                break;
            // End:0x2F5
            case 2:
                row.DataPerColumn[3].strValue = (ChannelNickName $ "/") $ string(GameRoomNum);
                // End:0x2F8
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
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

function bool IsOffLine(int row)
{
    return (ACLRowList[row].DataPerColumn[3].strValue == "") || ACLRowList[row].DataPerColumn[3].strValue == strOffLine;
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function Internal_OnRendered(Canvas Canvas)
{
    // End:0x82
    if(selectIndex >= 0)
    {
        ToolTip.OriginalString.Text = GetSelfIntro(selectIndex);
        // End:0x82
        if(ToolTip.OriginalString.Text != "")
        {
            ToolTip.AWinPos = GetTooltipPos(170, 20);
            ToolTip.bNeedUpdate = true;
            ToolTip.Render(Canvas);
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
    self.SelectImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_UI_UI.Lobby.list_lobby_on');
    self.LastSelectedImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_UI_UI.Lobby.list_lobby_cli');
    self.DefaultRowImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(731, 25, 15, Texture'Warfare_UI_UI.Lobby.list_lobby_n');
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Level", 32.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Nick Name", 575.0000000 - float(454), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Grade", 638.0000000 - float(575), 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Location", 745.0000000 - float(638), 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    LevelImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cm_00;
    ToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    ToolTip.Init();
    ToolTip.OriginalString.FontDrawType = 3;
    ToolTip.InternalPadding[0] = 5;
    ToolTip.InternalPadding[1] = 5;
    ToolTip.InternalPadding[2] = 5;
    ToolTip.InternalPadding[3] = 5;
    //return;    
}

defaultproperties
{
    strClanGrade[1]="???"
    strClanGrade[2]="????"
    strClanGrade[3]="??"
    strClanGrade[4]="??"
    strOffLine="????"
    OnRendered=BTACLClanMemberHK.Internal_OnRendered
}