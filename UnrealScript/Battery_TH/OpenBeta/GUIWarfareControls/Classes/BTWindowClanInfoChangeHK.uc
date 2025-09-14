class BTWindowClanInfoChangeHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[5];
var() automated FloatBox fbLabel[5];
var export editinline BTOwnerDrawImageHK Label[5];
var() automated FloatBox fbEdit[5];
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
    else
    {
        ClanRecruit.ComboBox.SetIndex(0);
    }
    ClanLocation.ComboBox.SetIndex(loc);
    ClanKeyword.SetText(Keyword);
    ClanIntroduction.SetText(Introduction);
    ClanNotice.SetText(Notice);
    // End:0xB6
    if(MyClanGrade == 1)
    {
        ClanNotice.EnableMe();        
    }
    else
    {
        ClanNotice.DisableMe();
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    sampleLocation = BTLabelLocationHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelLocationHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    sampleLocation.SetData("", "");
    sampleRecruit = BTLabelRecruitHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelRecruitHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    sampleRecruit.SetData("", "");
    i = 0;
    J0x8F:

    // End:0x107 [Loop If]
    if(i < 5)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x8F;
    }
    i = 2;
    J0x10F:

    // End:0x167 [Loop If]
    if(i < 5)
    {
        Edit[i] = NewLabelComponent(fbEdit[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4);
        Edit[i].Caption = "";
        i++;
        // [Loop Continue]
        goto J0x10F;
    }
    ClanRecruit = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbEdit[0], 0.9900000));
    ClanLocation = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbEdit[1], 0.9800000));
    ClanKeyword = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[2], -4, -6), 0.9700000));
    ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[3], -4, -6), 0.9600000));
    ClanNotice = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[4], -4, -6), 0.9500000));
    i = 0;
    J0x27A:

    // End:0x2BC [Loop If]
    if(i < 14)
    {
        ClanLocation.ComboBox.AddItem(sampleLocation.strRadioLocation[i]);
        i++;
        // [Loop Continue]
        goto J0x27A;
    }
    i = 0;
    J0x2C3:

    // End:0x305 [Loop If]
    if(i < 2)
    {
        ClanRecruit.ComboBox.AddItem(sampleRecruit.strRecruitState[i]);
        i++;
        // [Loop Continue]
        goto J0x2C3;
    }
    ClanKeyword.MaxTextStrNum = 40;
    ClanIntroduction.SetVisibleLineCount(3);
    ClanIntroduction.MaxTextStrNum = 255;
    ClanNotice.SetVisibleLineCount(6);
    ClanNotice.MaxTextStrNum = 255;
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strLabel[0]="???????????????_gc2470"
    strLabel[1]="??????????????"
    strLabel[2]="??????????"
    strLabel[3]="?????????"
    strLabel[4]="??????"
    fbLabel[0]=(X1=275.0000000,Y1=232.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[1]=(X1=275.0000000,Y1=266.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[2]=(X1=275.0000000,Y1=300.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[3]=(X1=275.0000000,Y1=334.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[4]=(X1=275.0000000,Y1=402.0000000,X2=760.0000000,Y2=577.0000000)
    fbEdit[0]=(X1=351.0000000,Y1=226.0000000,X2=752.0000000,Y2=253.0000000)
    fbEdit[1]=(X1=351.0000000,Y1=260.0000000,X2=752.0000000,Y2=287.0000000)
    fbEdit[2]=(X1=351.0000000,Y1=294.0000000,X2=752.0000000,Y2=321.0000000)
    fbEdit[3]=(X1=351.0000000,Y1=328.0000000,X2=752.0000000,Y2=389.0000000)
    fbEdit[4]=(X1=351.0000000,Y1=396.0000000,X2=752.0000000,Y2=525.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=172.0000000,X2=780.0000000,Y2=597.0000000)
    fbTopLine=(X1=265.0000000,Y1=192.0000000,X2=760.0000000,Y2=217.0000000)
    fbBottomLine=(X1=265.0000000,Y1=533.0000000,X2=760.0000000,Y2=577.0000000)
    fbButtonOK=(X1=391.0000000,Y1=539.0000000,X2=511.0000000,Y2=572.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=539.0000000,X2=634.0000000,Y2=572.0000000)
    strTitle="?????????????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowClanInfoChangeHK.Internal_OnOpen
}