/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMyInfoRankHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:14
 *
 *******************************************************************************/
class BTTPMyInfoRankHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var localized string strMainRank[12];
var localized string strSubRank[4];
var export editinline BTComboBoxHK RankComboBox[2];
var int nContentSettingLength;
var delegate<OnChangeMainComboBox> __OnChangeMainComboBox__Delegate;
var delegate<OnChangeSubComboBox> __OnChangeSubComboBox__Delegate;
var delegate<OnHideComboBoxList> __OnHideComboBoxList__Delegate;

delegate OnChangeMainComboBox();
delegate OnChangeSubComboBox();
delegate OnHideComboBoxList();
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ACLList.SetItemCountPerPage(17, 1);
    InitializeContent(0, 0);
    SetMainComboBox();
    SetSubComboBox(0);
}

function InitializeContent(byte RankType, int nRankingCount)
{
    local int i;
    local float fRenderWeight;
    local RenderObject ro;

    Log("[BTTPMyInfoRankHK::InitializeContent] nRankingCount=" $ string(nRankingCount) $ "RankType=" $ string(RankType));
    ++ nRankingCount;
    ACLList.RemoveAll();
    i = 1;
    J0x74:
    // End:0x9f [While If]
    if(i < Content.Length)
    {
        RemoveComponent(Content[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x74;
    }
    Label.Length = nRankingCount;
    Content.Length = nRankingCount;
    InternalPadding.Length = nRankingCount;
    fRenderWeight = 0.780;
    // End:0x106
    if(Content[0] == none)
    {
        Content[0] = NewComponent(new class'BTTPTwoComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), fRenderWeight);
    }
    ro = new class'RenderObject';
    ro.Init();
    ACLList.AddRenderObject(ro);
    InternalPadding[0].Y1 = 7.0;
    InternalPadding[0].Y2 = 4.0;
    RankComboBox[0] = BTTPTwoComboBoxHK(Content[0]).ComboBox[0];
    RankComboBox[0].ComboBox.Edit.bReadOnly = true;
    RankComboBox[0].ComboBox.MaxVisibleItems = 10;
    RankComboBox[1] = BTTPTwoComboBoxHK(Content[0]).ComboBox[1];
    RankComboBox[1].ComboBox.Edit.bReadOnly = true;
    RankComboBox[1].ComboBox.MaxVisibleItems = 10;
    fRenderWeight = 0.760;
    i = 1;
    J0x22e:
    // End:0x32a [While If]
    if(i < nRankingCount)
    {
        ro = new class'RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        InternalPadding[i].Y1 = 7.0;
        InternalPadding[i].Y2 = 4.0;
        // End:0x2db
        if(RankType < 8)
        {
            Content[i] = NewComponent(new class'BTOwnerDrawRankInfoHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), fRenderWeight);
        }
        // End:0x30a
        else
        {
            Content[i] = NewComponent(new class'BTOwnerDrawClanRankInfoHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), fRenderWeight);
        }
        Content[i].SetVisibility(false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x22e;
    }
    nContentSettingLength = 1;
}

function SetMainComboBox()
{
    local int i, SelectIdx;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    RankComboBox[0].ComboBox.__OnChange__Delegate = None;
    RankComboBox[0].ComboBox.__OnHideList__Delegate = None;
    RankComboBox[0].ComboBox.Clear();
    i = 0;
    J0x8f:
    // End:0xde [While If]
    if(i < 12)
    {
        RankComboBox[0].ComboBox.AddItem(strMainRank[i], class'BTCustomDrawHK'.static.MakeIntClass(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8f;
    }
    SetRankComboboxSelectIndex(0, SelectIdx);
    RankComboBox[0].ComboBox.__OnChange__Delegate = OnChange_MainComboBox;
    RankComboBox[0].ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
}

function SetSubComboBox(int MainIdx)
{
    local int i, SelectIdx;

    SelectIdx = GetRankComboboxSelectedIndex(1);
    RankComboBox[1].ComboBox.__OnChange__Delegate = None;
    RankComboBox[1].ComboBox.__OnHideList__Delegate = None;
    RankComboBox[1].ComboBox.Clear();
    i = 0;
    J0x6c:
    // End:0x104 [While If]
    if(i < 4)
    {
        // End:0xc1
        if(MainIdx > 7 && i == 0 || i == 1)
        {
            // End:0xbe
            if(SelectIdx == 0 || SelectIdx == 1)
            {
                SelectIdx = 2;
            }
        }
        // End:0xfa
        else
        {
            RankComboBox[1].ComboBox.AddItem(strSubRank[i], class'BTCustomDrawHK'.static.MakeIntClass(i));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6c;
    }
    SetRankComboboxSelectIndex(1, SelectIdx);
    RankComboBox[1].ComboBox.__OnChange__Delegate = OnChange_SubComboBox;
    RankComboBox[1].ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
}

function OnChange_MainComboBox(GUIComponent Sender)
{
    local int MainIdx;

    MainIdx = GetRankComboboxSelectedIndex(0);
    SetSubComboBox(MainIdx);
    OnChangeMainComboBox();
}

function OnChange_SubComboBox(GUIComponent Sender)
{
    OnChangeSubComboBox();
}

function OnHide_ComboBoxList()
{
    OnHideComboBoxList();
}

function int GetRankComboboxSelectedIndex(int idx)
{
    return IntClass(RankComboBox[idx].ComboBox.List.GetObjectAtIndex(RankComboBox[idx].ComboBox.Index)).Index;
}

function SetRankComboboxSelectIndex(int idx, int SelectIdx)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xa2 [While If]
    if(i < RankComboBox[idx].ComboBox.ItemCount())
    {
        // End:0x98
        if(SelectIdx == IntClass(RankComboBox[idx].ComboBox.List.GetObjectAtIndex(i)).Index)
        {
            RankComboBox[idx].ComboBox.SetIndex(i);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetRankingInfo(byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xdd [While If]
    if(i < CharName.Length)
    {
        BTOwnerDrawRankInfoHK(Content[nContentSettingLength + i]).SetData(CharLevel[i], ClanMarkPattern[i], ClanMarkBG[i], ClanMarkBL[i], 0, CharName[i], ClanName[i], Ranking_Accum[i], Ranking_Accum_Prev[i], Ranking_Accum_Exp[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    nContentSettingLength += CharName.Length;
}

function CompleteSetRankingInfo()
{
    ACLList_PositionChanged(0);
}

defaultproperties
{
    strMainRank[0]="Overall Rank"
    strMainRank[1]="Overall Rank - Monthly"
    strMainRank[2]="Women's Rank"
    strMainRank[3]="Women's Rank - Monthly"
    strMainRank[4]="Headshot Rank"
    strMainRank[5]="Headshot Rank - Monthly"
    strMainRank[6]="Clan Battle Rank"
    strMainRank[7]="Clan Battle Rank - Monthly"
    strMainRank[8]="Clan Rank"
    strMainRank[9]="Clan Rank - Monthly"
    strMainRank[10]="Clan Activity"
    strMainRank[11]="Clan Activity - Monthly"
    strSubRank[0]="Friends & Clan Members"
    strSubRank[1]="Primary PC Cafe"
    strSubRank[2]="Self"
    strSubRank[3]="TOP"
    ItemWidth=468
    LabelWidth=10
    fbACLList=(X1=201.0,Y1=81.0,X2=826.0,Y2=691.0)
}