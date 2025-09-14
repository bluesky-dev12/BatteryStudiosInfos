class BTWindowCreateClanMarkHK extends BTWindowHK
    editinlinenew
    instanced;

var BtrDouble UniqueID;
var bool bFreeItem;
var bool bCheckDupSuccess;
var int SelectClanMark[3];
var int ChooseClanMark[3];
var int PaidType;
var() automated FloatBox fbLabel[12];
var() automated FloatBox fbPrevClanMarkBig;
var() automated FloatBox fbNewClanMarkBig;
var localized string strLabel[12];
var export editinline BTOwnerDrawImageHK Label[12];
var export editinline BTLabelClanMarkHK PrevClanMark[2];
var export editinline BTClanMarkHK NewClanMark[2];
var() automated FloatBox fbButtonIsExist;
var localized string strButtonIsExist;
var export editinline BTOwnerDrawCaptionButtonHK ButtonIsExist;
var() automated FloatBox fbFT_Button[6];
var() automated FloatBox fbFT_ClanMarkList;
var export editinline ButtonGroups FT_Group;
var localized string strFT_Button[6];
var export editinline BTOwnerDrawCaptionButtonHK FT_Button[6];
var export editinline BTTPClanMarkListHK FT_ClanMarkList;
var() automated FloatBox fbST_Button[6];
var() automated FloatBox fbST_ClanMarkList;
var export editinline ButtonGroups ST_Group;
var localized string strST_Button[6];
var export editinline BTOwnerDrawCaptionButtonHK ST_Button[6];
var export editinline BTTPClanMarkListHK ST_ClanMarkList;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    TopLine.SetFontDrawType(4);
    BottomLine.SetVisibility(false);
    i = 0;
    J0x38:

    // End:0xB0 [Loop If]
    if(i < 12)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].SetFontDrawType(4);
        i++;
        // [Loop Continue]
        goto J0x38;
    }
    Label[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    Label[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    Label[2].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    Label[3].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_make_clan;
    Label[4].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    Label[5].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_right_n;
    Label[6].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    Label[7].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    Label[8].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_panel_2;
    Label[9].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    Label[10].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    Label[11].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    Label[1].SetFontSizeAll(11);
    Label[2].SetFontSizeAll(11);
    Label[9].SetFontSizeAll(9);
    Label[9].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSystem());
    Label[10].SetFontSizeAll(9);
    Label[10].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSystem());
    Label[11].SetFontSizeAll(9);
    Label[11].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSystem());
    PrevClanMark[0] = BTLabelClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelClanMarkHK', fbPrevClanMarkBig));
    NewClanMark[0] = BTClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTClanMarkHK', fbLabel[4]));
    PrevClanMark[1] = BTLabelClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelClanMarkHK', fbLabel[6]));
    NewClanMark[1] = BTClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTClanMarkHK', fbLabel[7]));
    ButtonOK.SetDefaultBigButtonImage();
    ButtonOK.SetFontSizeAll(15);
    ButtonCancel.SetFontSizeAll(11);
    ButtonIsExist = NewButtonComponent(fbButtonIsExist);
    ButtonIsExist.Caption = strButtonIsExist;
    ButtonIsExist.SetFontSizeAll(11);
    ButtonIsExist.SetDefaultButtonImage();
    FT_Group = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    FT_Group.bTabControlMode = true;
    ST_Group = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    ST_Group.bTabControlMode = true;
    i = 0;
    J0x472:

    // End:0x5EC [Loop If]
    if(i < 4)
    {
        FT_Button[i] = NewButtonComponent(fbFT_Button[i]);
        FT_Button[i].Caption = strFT_Button[i];
        FT_Button[i].SetDefaultTabButtonImage();
        FT_Button[i].SetDefaultTabButtonFontColor();
        FT_Button[i].SetFontDrawType(4);
        FT_Group.AddButton(FT_Button[i]);
        FT_Button[i].__OnClick__Delegate = FT_Group_OnClick;
        ST_Button[i] = NewButtonComponent(fbST_Button[i]);
        ST_Button[i].Caption = strST_Button[i];
        ST_Button[i].SetDefaultTabButtonImage();
        ST_Button[i].SetDefaultTabButtonFontColor();
        ST_Button[i].SetFontDrawType(4);
        ST_Group.AddButton(ST_Button[i]);
        ST_Button[i].__OnClick__Delegate = ST_Group_OnClick;
        i++;
        // [Loop Continue]
        goto J0x472;
    }
    FT_ClanMarkList = BTTPClanMarkListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPClanMarkListHK', fbFT_ClanMarkList));
    ST_ClanMarkList = BTTPClanMarkListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPClanMarkListHK', fbST_ClanMarkList));
    FT_ClanMarkList.ClanMarkList.ImageList.__OnClick__Delegate = FT_ClanMarkList_OnClick;
    ST_ClanMarkList.ClanMarkList.ImageList.__OnClick__Delegate = ST_ClanMarkList_OnClick;
    //return;    
}

function SetPaidType(int t)
{
    local wGameManager GameMgr;
    local wClanMarkParam cmp;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    PaidType = t;
    i = 0;
    J0x41:

    // End:0x1B0 [Loop If]
    if(i < GameMgr.ClanMarkParams.Length)
    {
        cmp = GameMgr.ClanMarkParams[i];
        // End:0x98
        if((cmp.nSell_Type == 1) && PaidType == 1)
        {
            // [Explicit Continue]
            goto J0x1A6;
        }
        // End:0x120
        if(cmp.nClanMark_Type_1 == 1)
        {
            FT_ClanMarkList.AddItem(cmp.nClanMark_ID, cmp.nClanMark_Type_1, cmp.nClanMark_Type_2, cmp.nSell_Type, cmp.nDisplay_Order, cmp.sClanMark_Resource_32, cmp.sClanMark_Resource_128);
            // [Explicit Continue]
            goto J0x1A6;
        }
        // End:0x1A6
        if(cmp.nClanMark_Type_1 == 2)
        {
            ST_ClanMarkList.AddItem(cmp.nClanMark_ID, cmp.nClanMark_Type_1, cmp.nClanMark_Type_2, cmp.nSell_Type, cmp.nDisplay_Order, cmp.sClanMark_Resource_32, cmp.sClanMark_Resource_128);
        }
        J0x1A6:

        i++;
        // [Loop Continue]
        goto J0x41;
    }
    FT_Group_OnClick(FT_Button[0]);
    ST_Group_OnClick(ST_Button[0]);
    //return;    
}

function bool SetDupCheck(bool bSuccess)
{
    bCheckDupSuccess = bSuccess;
    // End:0x35
    if((PaidType == 1) || bSuccess)
    {
        ButtonIsExist.DisableMe();        
    }
    else
    {
        ButtonIsExist.EnableMe();
    }
    return true;
    //return;    
}

function bool SetCurrentClanMark(int Pattern, int BG, int BL)
{
    PrevClanMark[1].SetData(Pattern, BG, BL);
    PrevClanMark[0].SetData(Pattern, BG, BL, true);
    return true;
    //return;    
}

function bool FT_ClanMarkList_OnClick(GUIComponent Sender)
{
    local BTROCreateClanMarkHK ro;

    ro = BTROCreateClanMarkHK(FT_ClanMarkList.ClanMarkList.DataList[FT_ClanMarkList.ClanMarkList.LastSelectedItemIndex]);
    NewClanMark[0].ro.SetData(1, ro.clanmarkid[0], ro.clanmarktype1[0], ro.clanmarktype2[0], ro.selltype[0], ro.DisplayOrder[0], ro.clanmarkresource32[0], ro.clanmarkresource128[0]);
    NewClanMark[0].ro.SetClanMarkSize128();
    NewClanMark[1].ro.SetData(1, ro.clanmarkid[0], ro.clanmarktype1[0], ro.clanmarktype2[0], ro.selltype[0], ro.DisplayOrder[0], ro.clanmarkresource32[0], ro.clanmarkresource128[0]);
    NewClanMark[1].ro.SetClanMarkSize32();
    SelectClanMark[0] = ro.clanmarkid[0];
    SetDupCheck(false);
    return true;
    //return;    
}

function bool ST_ClanMarkList_OnClick(GUIComponent Sender)
{
    local BTROCreateClanMarkHK ro;

    ro = BTROCreateClanMarkHK(ST_ClanMarkList.ClanMarkList.DataList[ST_ClanMarkList.ClanMarkList.LastSelectedItemIndex]);
    NewClanMark[0].ro.SetData(0, ro.clanmarkid[0], ro.clanmarktype1[0], ro.clanmarktype2[0], ro.selltype[0], ro.DisplayOrder[0], ro.clanmarkresource32[0], ro.clanmarkresource128[0]);
    NewClanMark[0].ro.SetClanMarkSize128();
    NewClanMark[1].ro.SetData(0, ro.clanmarkid[0], ro.clanmarktype1[0], ro.clanmarktype2[0], ro.selltype[0], ro.DisplayOrder[0], ro.clanmarkresource32[0], ro.clanmarkresource128[0]);
    NewClanMark[1].ro.SetClanMarkSize32();
    SelectClanMark[1] = ro.clanmarkid[0];
    SetDupCheck(false);
    return true;
    //return;    
}

function bool FT_Group_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    FT_Group.SelectButton(btn.ButtonID);
    switch(btn.ButtonID)
    {
        // End:0x5D
        case 0:
            FT_ClanMarkList.ClanMarkList.ShowAll(1);
            // End:0xCF
            break;
        // End:0x7C
        case 1:
            FT_ClanMarkList.ClanMarkList.ShowAnimal();
            // End:0xCF
            break;
        // End:0x9C
        case 2:
            FT_ClanMarkList.ClanMarkList.ShowWeapon();
            // End:0xCF
            break;
        // End:0xBC
        case 3:
            FT_ClanMarkList.ClanMarkList.ShowEtc();
            // End:0xCF
            break;
        // End:0xC4
        case 4:
            // End:0xCF
            break;
        // End:0xCC
        case 5:
            // End:0xCF
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool ST_Group_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ST_Group.SelectButton(btn.ButtonID);
    switch(btn.ButtonID)
    {
        // End:0x5E
        case 0:
            ST_ClanMarkList.ClanMarkList.ShowAll(2);
            // End:0xD0
            break;
        // End:0x7D
        case 1:
            ST_ClanMarkList.ClanMarkList.ShowBGShield();
            // End:0xD0
            break;
        // End:0x9D
        case 2:
            ST_ClanMarkList.ClanMarkList.ShowBGCircle();
            // End:0xD0
            break;
        // End:0xBD
        case 3:
            ST_ClanMarkList.ClanMarkList.ShowBGEtc();
            // End:0xD0
            break;
        // End:0xC5
        case 4:
            // End:0xD0
            break;
        // End:0xCD
        case 5:
            // End:0xD0
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

defaultproperties
{
    fbLabel[0]=(X1=673.0000000,Y1=210.0000000,X2=905.0000000,Y2=613.0000000)
    fbLabel[1]=(X1=707.0000000,Y1=222.0000000,X2=766.0000000,Y2=240.0000000)
    fbLabel[2]=(X1=812.0000000,Y1=222.0000000,X2=871.0000000,Y2=240.0000000)
    fbLabel[3]=(X1=694.0000000,Y1=247.0000000,X2=778.0000000,Y2=331.0000000)
    fbLabel[4]=(X1=799.0000000,Y1=247.0000000,X2=883.0000000,Y2=331.0000000)
    fbLabel[5]=(X1=782.0000000,Y1=272.0000000,X2=797.0000000,Y2=308.0000000)
    fbLabel[6]=(X1=694.0000000,Y1=340.0000000,X2=725.0000000,Y2=371.0000000)
    fbLabel[7]=(X1=799.0000000,Y1=340.0000000,X2=830.0000000,Y2=371.0000000)
    fbLabel[8]=(X1=683.0000000,Y1=383.0000000,X2=895.0000000,Y2=562.0000000)
    fbLabel[9]=(X1=706.0000000,Y1=506.0000000,X2=872.0000000,Y2=520.0000000)
    fbLabel[10]=(X1=706.0000000,Y1=522.0000000,X2=872.0000000,Y2=536.0000000)
    fbLabel[11]=(X1=706.0000000,Y1=538.0000000,X2=872.0000000,Y2=552.0000000)
    fbPrevClanMarkBig=(X1=704.0000000,Y1=257.0000000,X2=768.0000000,Y2=321.0000000)
    fbNewClanMarkBig=(X1=809.0000000,Y1=257.0000000,X2=873.0000000,Y2=321.0000000)
    strLabel[1]="Previous"
    strLabel[2]="New"
    strLabel[9]="With a default clan mark change coupon,"
    strLabel[10]="you may only select free marks"
    strLabel[11]="which can be duplicates."
    fbButtonIsExist=(X1=692.0000000,Y1=393.0000000,X2=886.0000000,Y2=425.0000000)
    strButtonIsExist="Duplicate Check"
    fbFT_Button[0]=(X1=118.0000000,Y1=185.0000000,X2=208.0000000,Y2=210.0000000)
    fbFT_Button[1]=(X1=209.0000000,Y1=185.0000000,X2=299.0000000,Y2=210.0000000)
    fbFT_Button[2]=(X1=300.0000000,Y1=185.0000000,X2=390.0000000,Y2=210.0000000)
    fbFT_Button[3]=(X1=391.0000000,Y1=185.0000000,X2=481.0000000,Y2=210.0000000)
    fbFT_Button[4]=(X1=482.0000000,Y1=185.0000000,X2=572.0000000,Y2=210.0000000)
    fbFT_Button[5]=(X1=573.0000000,Y1=185.0000000,X2=663.0000000,Y2=210.0000000)
    fbFT_ClanMarkList=(X1=118.0000000,Y1=210.0000000,X2=667.0000000,Y2=392.0000000)
    strFT_Button[0]="All"
    strFT_Button[1]="Animal"
    strFT_Button[2]="Weapon"
    strFT_Button[3]="Other"
    strFT_Button[4]="NEW"
    strFT_Button[5]="Cool"
    fbST_Button[0]=(X1=118.0000000,Y1=402.0000000,X2=208.0000000,Y2=427.0000000)
    fbST_Button[1]=(X1=209.0000000,Y1=402.0000000,X2=299.0000000,Y2=427.0000000)
    fbST_Button[2]=(X1=300.0000000,Y1=402.0000000,X2=390.0000000,Y2=427.0000000)
    fbST_Button[3]=(X1=391.0000000,Y1=402.0000000,X2=481.0000000,Y2=427.0000000)
    fbST_Button[4]=(X1=482.0000000,Y1=402.0000000,X2=572.0000000,Y2=427.0000000)
    fbST_Button[5]=(X1=573.0000000,Y1=402.0000000,X2=663.0000000,Y2=427.0000000)
    fbST_ClanMarkList=(X1=118.0000000,Y1=427.0000000,X2=667.0000000,Y2=609.0000000)
    strST_Button[0]="All"
    strST_Button[1]="Shield"
    strST_Button[2]="Round"
    strST_Button[3]="Other"
    strST_Button[4]="NEW"
    strST_Button[5]="Cool"
    fbBackgroundImage=(X1=88.0000000,Y1=125.0000000,X2=934.0000000,Y2=639.0000000)
    fbTopLine=(X1=108.0000000,Y1=144.0000000,X2=915.0000000,Y2=170.0000000)
    fbButtonOK=(X1=692.0000000,Y1=433.0000000,X2=886.0000000,Y2=497.0000000)
    fbButtonCancel=(X1=683.0000000,Y1=571.0000000,X2=895.0000000,Y2=603.0000000)
    strTitle="Create Clan Mark"
    strOK="Apply Clan Mark"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}