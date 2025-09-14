/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowClanInfoChangeHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowClanInfoChangeHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[5];
var export editinline BTOwnerDrawImageHK Label[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEdit[5];
var export editinline BTOwnerDrawImageHK Edit[5];
var export editinline BTComboBoxHK ClanRecruit;
var export editinline BTComboBoxHK ClanLocation;
var export editinline BTEditBoxHK ClanKeyword;
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTMultiLineEditBoxHK ClanNotice;
var export editinline BTLabelLocationHK sampleLocation;
var export editinline BTLabelRecruitHK sampleRecruit;

function SetData(int loc, int Rec, string Keyword, string Introduction, string Notice, int MyClanGrade)
{
    // End:0x27
    if(Rec > 0)
    {
        ClanRecruit.ComboBox.SetIndex(1);
    }
    // End:0x40
    else
    {
        ClanRecruit.ComboBox.SetIndex(0);
    }
    ClanLocation.ComboBox.SetIndex(loc);
    ClanKeyword.SetText(Keyword);
    ClanIntroduction.SetText(Introduction);
    ClanNotice.SetText(Notice);
    // End:0xb6
    if(MyClanGrade == 1)
    {
        ClanNotice.EnableMe();
    }
    // End:0xc5
    else
    {
        ClanNotice.DisableMe();
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    sampleLocation = BTLabelLocationHK(NewComponent(new class'BTLabelLocationHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    sampleLocation.CalcLocationCount();
    sampleLocation.SetData("", "");
    sampleLocation.Hide();
    sampleRecruit = BTLabelRecruitHK(NewComponent(new class'BTLabelRecruitHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    sampleRecruit.SetData("", "");
    sampleRecruit.Hide();
    i = 0;
    J0xbc:
    // End:0x134 [While If]
    if(i < 5)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbc;
    }
    i = 2;
    J0x13c:
    // End:0x194 [While If]
    if(i < 5)
    {
        Edit[i] = NewLabelComponent(fbEdit[i], class'BTUIResourcePoolHK'.default.panel_4);
        Edit[i].Caption = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13c;
    }
    ClanRecruit = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbEdit[0], 0.990));
    ClanLocation = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbEdit[1], 0.980));
    ClanKeyword = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbEdit[2], -4, -6), 0.970));
    ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbEdit[3], -4, -6), 0.960));
    ClanNotice = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbEdit[4], -4, -6), 0.950));
    i = 0;
    J0x2a7:
    // End:0x2f8 [While If]
    if(i < sampleLocation.GetLocationCount())
    {
        ClanLocation.ComboBox.AddItem(sampleLocation.strRadioLocation[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a7;
    }
    i = 0;
    J0x2ff:
    // End:0x341 [While If]
    if(i < 2)
    {
        ClanRecruit.ComboBox.AddItem(sampleRecruit.strRecruitState[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2ff;
    }
    ClanKeyword.MaxTextStrNum = 40;
    ClanIntroduction.SetVisibleLineCount(3);
    ClanIntroduction.MaxTextStrNum = 255;
    ClanNotice.SetVisibleLineCount(6);
    ClanNotice.MaxTextStrNum = 255;
}

function Internal_OnOpen();

defaultproperties
{
    strLabel[0]="Recruiting"
    strLabel[1]="Region"
    strLabel[2]="Keywords"
    strLabel[3]="Clan Intro"
    strLabel[4]="Notice"
    fbLabel[0]=(X1=275.0,Y1=232.0,X2=760.0,Y2=577.0)
    fbLabel[1]=(X1=275.0,Y1=266.0,X2=760.0,Y2=577.0)
    fbLabel[2]=(X1=275.0,Y1=300.0,X2=760.0,Y2=577.0)
    fbLabel[3]=(X1=275.0,Y1=334.0,X2=760.0,Y2=577.0)
    fbLabel[4]=(X1=275.0,Y1=402.0,X2=760.0,Y2=577.0)
    fbEdit[0]=(X1=351.0,Y1=226.0,X2=752.0,Y2=253.0)
    fbEdit[1]=(X1=351.0,Y1=260.0,X2=752.0,Y2=287.0)
    fbEdit[2]=(X1=351.0,Y1=294.0,X2=752.0,Y2=321.0)
    fbEdit[3]=(X1=351.0,Y1=328.0,X2=752.0,Y2=389.0)
    fbEdit[4]=(X1=351.0,Y1=396.0,X2=752.0,Y2=525.0)
    fbBackgroundImage=(X1=245.0,Y1=172.0,X2=780.0,Y2=597.0)
    fbTopLine=(X1=265.0,Y1=192.0,X2=760.0,Y2=217.0)
    fbBottomLine=(X1=265.0,Y1=533.0,X2=760.0,Y2=577.0)
    fbButtonOK=(X1=391.0,Y1=539.0,X2=511.0,Y2=572.0)
    fbButtonCancel=(X1=515.0,Y1=539.0,X2=634.0,Y2=572.0)
    strTitle="Change Info"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
}