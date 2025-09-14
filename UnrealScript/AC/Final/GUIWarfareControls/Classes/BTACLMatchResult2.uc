class BTACLMatchResult2 extends BTACLMatchResultHK
    editinlinenew
    instanced;

function LC3_Draw_Death(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = ACLRowList[row].DataPerColumn[7].Text[i].DrawColor;
    ACLRowList[row].DataPerColumn[7].Text[i].FontDrawType = 4;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(ACLRowList[row].DataPerColumn[7].IntValue), ACLRowList[row].DataPerColumn[7].Text[i].FontDrawType, float(ACLRowList[row].DataPerColumn[7].Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), ACLRowList[row].DataPerColumn[7].Text[i].DrawShadowColor);
    //return;    
}

function LC9_10_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x65
    if(i == 0)
    {
        tarray[0].DrawColor = ACLRowList[row].DataPerColumn[9].Text[i].DrawColor;
        tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SmallPerc();        
    }
    else
    {
        tarray[0].DrawColor = ACLRowList[row].DataPerColumn[9].Text[i].DrawColor;
        tarray[1].DrawColor = ACLRowList[row].DataPerColumn[9].Text[i].DrawColor;
    }
    tarray[0].Text = string(ACLRowList[row].DataPerColumn[9].IntValue);
    tarray[1].Text = ("(+" $ string(int(ACLRowList[row].DataPerColumn[9].floatValue))) $ "%)";
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, tarray, 4, 0, L, t, R, B);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    LevelImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 26, none);
    super(BTAutoColumnListHK).InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_on');
    self.LastSelectedImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_cli');
    self.DefaultRowImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(731, 25, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_n');
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clan", 359.0000000 - float(327), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("level", 393.0000000 - float(361), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("nickname", 571.0000000 - float(394), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clanname", 721.0000000 - float(571), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("score", 759.0000000 - float(721), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Score;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("kill", 794.0000000 - float(759), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_kill;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("death", 830.0000000 - float(794), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Death;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("bonus", 930.0000000 - float(830), 7);
    headerInfo.__CustomDraw__Delegate = LC8_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("exp", 1024.0000000 - float(930), 7);
    headerInfo.__CustomDraw__Delegate = LC9_10_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    tarray.Length = 2;
    tarray[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 4, "");
    tarray[1] = Class'Engine.BTCustomDrawHK'.static.MakeText(8, 4, "");
    tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SmallPerc();
    //return;    
}
