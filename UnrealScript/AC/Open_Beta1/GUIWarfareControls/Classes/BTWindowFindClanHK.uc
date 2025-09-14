class BTWindowFindClanHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bReceiveLock;
var int CurrentPage;
var int MinPage;
var int MaxPage;
var string searchtext;
var int SearchType;
var int Status;
var int Region;
var BTTcpLink_Channel TcpChannel;
var localized string strCreateDate[2];
var localized string strRound;
var localized string strRank;
var localized string strButtonCafe;
var localized string strButtonInfo;
var localized string strClanSearchType[4];
var() automated FloatBox fbButtonCafe;
var() automated FloatBox fbButtonInfo;
var export editinline BTOwnerDrawCaptionButtonHK ButtonCafe;
var export editinline BTOwnerDrawCaptionButtonHK ButtonInfo;
var localized string strLabel[3];
var() automated FloatBox fbLabel[3];
var export editinline BTOwnerDrawImageHK Label[3];
var() automated FloatBox fbComboSearch;
var export editinline BTComboBoxHK ComboSearch;
var() automated FloatBox fbEdit;
var export editinline BTOwnerDrawImageHK Edit;
var export editinline BTEditBoxHK EditSearch;
var localized string strButtonSearch;
var() automated FloatBox fbButtonSearch;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSearch;
var export editinline BTOwnerDrawImageHK LabelTop[7];
var FloatBox fbButtonTop[7];
var localized string strButtonTop[7];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTop[7];
var export editinline ButtonGroups RadioGroup;
var localized string strRadioOption[2];
var() automated FloatBox fbRadioOption[2];
var export editinline BTCheckBoxHK RadioOption[2];
var export editinline BTComboBoxHK ClanLocation;
var() automated FloatBox fbClanLocation;
var export editinline BTLabelLocationHK sampleLocation;
var export editinline BTOwnerDrawImageHK lbClanLocation;
var() automated FloatBox fblbClanLocation;
var localized string strClanLocation;
var() automated FloatBox fbACLClanList;
var export editinline BTACLClanHK ACLClanList;

function SetData(int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local int i;
    local string formCreateDate;

    i = 0;
    J0x07:

    // End:0x18A [Loop If]
    if(i < ClanName.Length)
    {
        // End:0x65
        if(ClanCreateDate[i] < 365)
        {
            formCreateDate = Class'Engine.BTCustomDrawHK'.static.FormatString(strCreateDate[0], string(int(float(ClanCreateDate[i]) % float(365))));            
        }
        else
        {
            formCreateDate = Class'Engine.BTCustomDrawHK'.static.FormatString(strCreateDate[1], string(ClanCreateDate[i] / 365), string(int(float(ClanCreateDate[i]) % float(365))));
        }
        ACLClanList.AddClan(ClanMarkPattern[i], ClanMarkBG[i], int(ClanMarkBL[i]), ClanName[i], ClanMaster[i], (string(ClanMember[i]) $ "/") $ string(ClanMemberMax[i]), formCreateDate, Class'Engine.BTCustomDrawHK'.static.FormatString(strRound, string(ClanWin[i]), string(ClanLose[i])), string(ClanRank[i]) $ strRank, ClanRecruit[i], ClanRank[i], ClanLevel[i]);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    bReceiveLock = false;
    ACLClanList.MultiColumnList.MyScrollBar.MyGripButton.MenuState = 0;
    //return;    
}

function string GetSelectClanName()
{
    // End:0x42
    if(ACLClanList.LastSelectedIndex >= 0)
    {
        return ACLClanList.ACLRowList[ACLClanList.LastSelectedIndex].DataPerColumn[1].strValue;
    }
    return "";
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super.InitComponent(MyController, myOwner);
    ComboSearch = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbComboSearch));
    i = 0;
    J0x36:

    // End:0x6F [Loop If]
    if(i < 4)
    {
        ComboSearch.ComboBox.AddItem(strClanSearchType[i]);
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    i = 0;
    J0x76:

    // End:0xEE [Loop If]
    if(i < 3)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x76;
    }
    Label[0].SetFontSizeAll(8);
    Label[0].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[2].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Edit = NewLabelComponent(fbEdit, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4);
    EditSearch = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit, -4, -6)));
    ButtonSearch = NewButtonComponent(fbButtonSearch);
    ButtonSearch.SetDefaultButtonImage();
    ButtonSearch.SetFontSizeAll(9);
    ButtonSearch.Caption = strButtonSearch;
    ButtonSearch.__OnClick__Delegate = ButtonSearch_OnClick;
    RadioGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', fbRadioOption[0]));
    i = 0;
    J0x238:

    // End:0x313 [Loop If]
    if(i < 2)
    {
        RadioOption[i] = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fbRadioOption[i]));
        RadioOption[i].SetDefaultRadioImage();
        RadioOption[i].Caption = strRadioOption[i];
        RadioOption[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN());
        RadioOption[i].FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonDisable();
        RadioGroup.AddButton(RadioOption[i]);
        i++;
        // [Loop Continue]
        goto J0x238;
    }
    RadioGroup.SelectButton(0);
    lbClanLocation = NewLabelComponent(fblbClanLocation, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    lbClanLocation.CaptionDrawType = 0;
    lbClanLocation.Caption = strClanLocation;
    ClanLocation = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbClanLocation, 0.9800000));
    sampleLocation = BTLabelLocationHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelLocationHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    sampleLocation.CalcLocationCount();
    sampleLocation.SetData("", "");
    sampleLocation.Hide();
    i = 0;
    J0x3EC:

    // End:0x43D [Loop If]
    if(i < int(sampleLocation.GetLocationCount()))
    {
        ClanLocation.ComboBox.AddItem(sampleLocation.strRadioLocation[i]);
        i++;
        // [Loop Continue]
        goto J0x3EC;
    }
    i = 0;
    J0x444:

    // End:0x5B4 [Loop If]
    if(i < 7)
    {
        ButtonTop[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonTop[i].bUseAWinPos = true;
        ButtonTop[i].AWinPos = fbButtonTop[i];
        ButtonTop[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_on;
        ButtonTop[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].RenderWeight = 0.2000000;
        ButtonTop[i].SetFontSizeAll(9);
        ButtonTop[i].SetDefaultListTopButtonFontColor();
        ButtonTop[i].Caption = strButtonTop[i];
        ButtonTop[i].CaptionDrawType = 4;
        ButtonTop[i].ButtonID = i;
        ButtonTop[i].InitComponent(Controller, self);
        AppendComponent(ButtonTop[i]);
        i++;
        // [Loop Continue]
        goto J0x444;
    }
    i = 0;
    J0x5BB:

    // End:0x74D [Loop If]
    if(i < (7 - 1))
    {
        LabelTop[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        LabelTop[i].bUseAWinPos = true;
        LabelTop[i].AWinPos.X1 = ButtonTop[i].AWinPos.X2 - float(2);
        LabelTop[i].AWinPos.Y1 = ButtonTop[i].AWinPos.Y1 + float(5);
        LabelTop[i].AWinPos.X2 = ButtonTop[i].AWinPos.X2 + float(2);
        LabelTop[i].AWinPos.Y2 = ButtonTop[i].AWinPos.Y2 - float(5);
        LabelTop[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_list_divid;
        LabelTop[i].RenderWeight = 0.1900000;
        LabelTop[i].InitComponent(Controller, self);
        AppendComponent(LabelTop[i]);
        i++;
        // [Loop Continue]
        goto J0x5BB;
    }
    LabelTop[7 - 1] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelTop[7 - 1].bUseAWinPos = true;
    LabelTop[7 - 1].AWinPos.X1 = ButtonTop[0].AWinPos.X1;
    LabelTop[7 - 1].AWinPos.Y1 = ButtonTop[0].AWinPos.Y1;
    LabelTop[7 - 1].AWinPos.X2 = ButtonTop[7 - 1].AWinPos.X2;
    LabelTop[7 - 1].AWinPos.Y2 = ButtonTop[7 - 1].AWinPos.Y2;
    LabelTop[7 - 1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_n;
    LabelTop[7 - 1].RenderWeight = 0.1000000;
    LabelTop[7 - 1].InitComponent(Controller, self);
    AppendComponent(LabelTop[7 - 1]);
    ACLClanList = BTACLClanHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLClanHK', fbACLClanList));
    ACLClanList.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    fb.X1 = fbACLClanList.X2 + float(2);
    fb.Y1 = fbACLClanList.Y1;
    fb.X2 = fbACLClanList.X2 + float(14);
    fb.Y2 = fbACLClanList.Y2;
    ACLClanList.MultiColumnList.MyScrollBar.AWinPos = fb;
    ACLClanList.MultiColumnList.MyScrollBar.ApplyAWinPos();
    ACLClanList.bAlwaysActiveCursor = true;
    ACLClanList.__OnHitBottom__Delegate = ACLClanList_OnHitBottom;
    ButtonInfo = NewButtonComponent(fbButtonInfo);
    ButtonInfo.SetDefaultButtonImage();
    ButtonInfo.Caption = strButtonInfo;
    ButtonInfo.SetFontSizeAll(11);
    ButtonOK.SetFontSizeAll(11);
    ButtonCancel.SetFontSizeAll(11);
    EditSearch.MaxTextStrNum = 16;
    //return;    
}

function SetPageLimit(int minp, int maxp)
{
    MinPage = minp;
    // End:0x29
    if(MaxPage == -1)
    {
        ACLClanList.RemoveAll();
    }
    MaxPage = maxp;
    //return;    
}

function ACLClanList_OnHitTop(int Top, int Count, int itemperpage)
{
    // End:0x0B
    if(bReceiveLock)
    {
        return;
    }
    // End:0x27
    if((CurrentPage - 1) >= MinPage)
    {
        CurrentPage--;        
    }
    else
    {
        return;
    }
    TcpChannel.sfReqSerachClan(byte(SearchType), searchtext, byte(Status), byte(Region), CurrentPage);
    bReceiveLock = true;
    //return;    
}

function ACLClanList_OnHitBottom(int Top, int Count, int itemperpage)
{
    // End:0x0B
    if(bReceiveLock)
    {
        return;
    }
    // End:0x27
    if((CurrentPage + 1) <= MaxPage)
    {
        CurrentPage++;        
    }
    else
    {
        return;
    }
    TcpChannel.sfReqSerachClan(byte(SearchType), searchtext, byte(Status), byte(Region), CurrentPage);
    bReceiveLock = true;
    ACLClanList.MultiColumnList.MyScrollBar.MyGripButton.MenuState = 4;
    //return;    
}

function bool ButtonSearch_OnClick(GUIComponent Sender)
{
    SearchType = ComboSearch.ComboBox.GetIndex() + 1;
    searchtext = EditSearch.TextStr;
    Status = RadioGroup.GetSelectIndex();
    Region = ClanLocation.ComboBox.GetIndex();
    MaxPage = -1;
    CurrentPage = 1;
    TcpChannel.sfReqSerachClan(byte(SearchType), searchtext, byte(Status), byte(Region), CurrentPage);
    return true;
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strCreateDate[0]="%0 d"
    strCreateDate[1]="%0 y, %1 d"
    strRound="%0 W %1 L"
    strRank=" "
    strButtonCafe="Clan Cafe"
    strButtonInfo="Clan Info"
    strClanSearchType[0]="Clan Name"
    strClanSearchType[1]="Clan Master"
    strClanSearchType[2]="Clan Member Name"
    strClanSearchType[3]="Keywords"
    fbButtonInfo=(X1=450.0000000,Y1=690.0000000,X2=570.0000000,Y2=723.0000000)
    strLabel="- Popular keywords: employed, unemployed, women, men, adult, marine, air force"
    fbLabel[0]=(X1=224.0000000,Y1=109.0000000,X2=809.0000000,Y2=728.0000000)
    fbLabel[1]=(X1=224.0000000,Y1=126.0000000,X2=801.0000000,Y2=129.0000000)
    fbLabel[2]=(X1=224.0000000,Y1=170.0000000,X2=801.0000000,Y2=173.0000000)
    fbComboSearch=(X1=224.0000000,Y1=75.0000000,X2=357.0000000,Y2=102.0000000)
    fbEdit=(X1=364.0000000,Y1=75.0000000,X2=736.0000000,Y2=102.0000000)
    strButtonSearch="Search"
    fbButtonSearch=(X1=746.0000000,Y1=77.0000000,X2=797.0000000,Y2=100.0000000)
    fbButtonTop[0]=(X1=216.0000000,Y1=248.0000000,X2=251.0000000,Y2=275.0000000)
    fbButtonTop[1]=(X1=251.0000000,Y1=248.0000000,X2=363.0000000,Y2=275.0000000)
    fbButtonTop[2]=(X1=363.0000000,Y1=248.0000000,X2=473.0000000,Y2=275.0000000)
    fbButtonTop[3]=(X1=473.0000000,Y1=248.0000000,X2=523.0000000,Y2=275.0000000)
    fbButtonTop[4]=(X1=523.0000000,Y1=248.0000000,X2=601.0000000,Y2=275.0000000)
    fbButtonTop[5]=(X1=601.0000000,Y1=248.0000000,X2=713.0000000,Y2=275.0000000)
    fbButtonTop[6]=(X1=713.0000000,Y1=248.0000000,X2=809.0000000,Y2=275.0000000)
    strButtonTop[0]="Mark"
    strButtonTop[1]="Clan Name"
    strButtonTop[2]="Master Nickname"
    strButtonTop[3]="Players"
    strButtonTop[4]="History"
    strButtonTop[5]="Records"
    strButtonTop[6]="Rank"
    strRadioOption[0]="All Clans"
    strRadioOption[1]="Recruiting Clans"
    fbRadioOption[0]=(X1=228.0000000,Y1=141.0000000,X2=318.0000000,Y2=161.0000000)
    fbRadioOption[1]=(X1=356.0000000,Y1=141.0000000,X2=508.0000000,Y2=161.0000000)
    fbClanLocation=(X1=311.0000000,Y1=185.0000000,X2=712.0000000,Y2=212.0000000)
    fblbClanLocation=(X1=240.0000000,Y1=193.0000000,X2=752.0000000,Y2=212.0000000)
    fbACLClanList=(X1=216.0000000,Y1=275.0000000,X2=793.0000000,Y2=684.0000000)
    fbBackgroundImage=(X1=196.0000000,Y1=21.0000000,X2=829.0000000,Y2=748.0000000)
    fbTopLine=(X1=216.0000000,Y1=41.0000000,X2=809.0000000,Y2=68.0000000)
    fbBottomLine=(X1=216.0000000,Y1=684.0000000,X2=809.0000000,Y2=728.0000000)
    fbButtonOK=(X1=326.0000000,Y1=690.0000000,X2=446.0000000,Y2=723.0000000)
    fbButtonCancel=(X1=574.0000000,Y1=690.0000000,X2=704.0000000,Y2=723.0000000)
    strTitle="Clan Search"
    strOK="Clan Application"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowFindClanHK.Internal_OnOpen
}