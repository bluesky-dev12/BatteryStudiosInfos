class BTTPMyInfoRankHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var localized string strMainRank[12];
var localized string strSubRank[4];
var export editinline BTComboBoxHK RankComboBox[2];
var int nContentSettingLength;
//var delegate<OnChangeMainComboBox> __OnChangeMainComboBox__Delegate;
//var delegate<OnChangeSubComboBox> __OnChangeSubComboBox__Delegate;
//var delegate<OnHideComboBoxList> __OnHideComboBoxList__Delegate;

delegate OnChangeMainComboBox()
{
    //return;    
}

delegate OnChangeSubComboBox()
{
    //return;    
}

delegate OnHideComboBoxList()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ACLList.SetItemCountPerPage(17, 1);
    InitializeContent(0, 0);
    SetMainComboBox();
    SetSubComboBox(0);
    //return;    
}

function InitializeContent(byte RankType, int nRankingCount)
{
    local int i;
    local float fRenderWeight;
    local RenderObject ro;

    Log((("[BTTPMyInfoRankHK::InitializeContent] nRankingCount=" $ string(nRankingCount)) $ "RankType=") $ string(RankType));
    ++nRankingCount;
    ACLList.RemoveAll();
    i = 1;
    J0x74:

    // End:0x9F [Loop If]
    if(i < Content.Length)
    {
        RemoveComponent(Content[i]);
        ++i;
        // [Loop Continue]
        goto J0x74;
    }
    Label.Length = nRankingCount;
    Content.Length = nRankingCount;
    InternalPadding.Length = nRankingCount;
    fRenderWeight = 0.7800000;
    // End:0x106
    if(Content[0] == none)
    {
        Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), fRenderWeight);
    }
    ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
    ro.Init();
    ACLList.AddRenderObject(ro);
    InternalPadding[0].Y1 = 7.0000000;
    InternalPadding[0].Y2 = 4.0000000;
    RankComboBox[0] = BTTPTwoComboBoxHK(Content[0]).ComboBox[0];
    RankComboBox[0].ComboBox.Edit.bReadOnly = true;
    RankComboBox[0].ComboBox.MaxVisibleItems = 10;
    RankComboBox[1] = BTTPTwoComboBoxHK(Content[0]).ComboBox[1];
    RankComboBox[1].ComboBox.Edit.bReadOnly = true;
    RankComboBox[1].ComboBox.MaxVisibleItems = 10;
    fRenderWeight = 0.7600000;
    i = 1;
    J0x22E:

    // End:0x32A [Loop If]
    if(i < nRankingCount)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        InternalPadding[i].Y1 = 7.0000000;
        InternalPadding[i].Y2 = 4.0000000;
        // End:0x2DB
        if(int(RankType) < 8)
        {
            Content[i] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawRankInfoHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), fRenderWeight);            
        }
        else
        {
            Content[i] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawClanRankInfoHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), fRenderWeight);
        }
        Content[i].SetVisibility(false);
        ++i;
        // [Loop Continue]
        goto J0x22E;
    }
    nContentSettingLength = 1;
    //return;    
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
    J0x8F:

    // End:0xDE [Loop If]
    if(i < 12)
    {
        RankComboBox[0].ComboBox.AddItem(strMainRank[i], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(i));
        ++i;
        // [Loop Continue]
        goto J0x8F;
    }
    SetRankComboboxSelectIndex(0, SelectIdx);
    RankComboBox[0].ComboBox.__OnChange__Delegate = OnChange_MainComboBox;
    RankComboBox[0].ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    //return;    
}

function SetSubComboBox(int MainIdx)
{
    local int i, SelectIdx;

    SelectIdx = GetRankComboboxSelectedIndex(1);
    RankComboBox[1].ComboBox.__OnChange__Delegate = None;
    RankComboBox[1].ComboBox.__OnHideList__Delegate = None;
    RankComboBox[1].ComboBox.Clear();
    i = 0;
    J0x6C:

    // End:0x104 [Loop If]
    if(i < 4)
    {
        // End:0xC1
        if((MainIdx > 7) && (i == 0) || i == 1)
        {
            // End:0xBE
            if((SelectIdx == 0) || SelectIdx == 1)
            {
                SelectIdx = 2;
            }
            // [Explicit Continue]
            goto J0xFA;
        }
        RankComboBox[1].ComboBox.AddItem(strSubRank[i], Class'Engine.BTCustomDrawHK'.static.MakeIntClass(i));
        J0xFA:

        ++i;
        // [Loop Continue]
        goto J0x6C;
    }
    SetRankComboboxSelectIndex(1, SelectIdx);
    RankComboBox[1].ComboBox.__OnChange__Delegate = OnChange_SubComboBox;
    RankComboBox[1].ComboBox.__OnHideList__Delegate = OnHide_ComboBoxList;
    //return;    
}

function OnChange_MainComboBox(GUIComponent Sender)
{
    local int MainIdx;

    MainIdx = GetRankComboboxSelectedIndex(0);
    SetSubComboBox(MainIdx);
    OnChangeMainComboBox();
    //return;    
}

function OnChange_SubComboBox(GUIComponent Sender)
{
    OnChangeSubComboBox();
    //return;    
}

function OnHide_ComboBoxList()
{
    OnHideComboBoxList();
    //return;    
}

function int GetRankComboboxSelectedIndex(int idx)
{
    return IntClass(RankComboBox[idx].ComboBox.List.GetObjectAtIndex(RankComboBox[idx].ComboBox.Index)).Index;
    //return;    
}

function SetRankComboboxSelectIndex(int idx, int SelectIdx)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xA2 [Loop If]
    if(i < RankComboBox[idx].ComboBox.ItemCount())
    {
        // End:0x98
        if(SelectIdx == IntClass(RankComboBox[idx].ComboBox.List.GetObjectAtIndex(i)).Index)
        {
            RankComboBox[idx].ComboBox.SetIndex(i);
            return;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetRankingInfo(byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xDD [Loop If]
    if(i < CharName.Length)
    {
        BTOwnerDrawRankInfoHK(Content[nContentSettingLength + i]).SetData(CharLevel[i], ClanMarkPattern[i], ClanMarkBG[i], ClanMarkBL[i], 0, CharName[i], ClanName[i], Ranking_Accum[i], Ranking_Accum_Prev[i], Ranking_Accum_Exp[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    nContentSettingLength += CharName.Length;
    //return;    
}

function CompleteSetRankingInfo()
{
    ACLList_PositionChanged(0);
    //return;    
}

defaultproperties
{
    strMainRank[0]="Ranking ???????"
    strMainRank[1]="???????????????-????????"
    strMainRank[2]="Ranking ???????"
    strMainRank[3]="???????????????-????????"
    strMainRank[4]="Ranking ???????"
    strMainRank[5]="H/S Rank/Month"
    strMainRank[6]="????????????????"
    strMainRank[7]="ClanRank/Month"
    strMainRank[8]="????????????"
    strMainRank[9]="????????????-????????"
    strMainRank[10]="????????????????"
    strMainRank[11]="Clan Event"
    strSubRank[0]="??????&??????????"
    strSubRank[1]="????????????????? ???? PC"
    strSubRank[2]="??????"
    strSubRank[3]="TOP"
    ItemWidth=468
    LabelWidth=10
    fbACLList=(X1=523.0000000,Y1=126.0000000,X2=1004.0000000,Y2=736.0000000)
}