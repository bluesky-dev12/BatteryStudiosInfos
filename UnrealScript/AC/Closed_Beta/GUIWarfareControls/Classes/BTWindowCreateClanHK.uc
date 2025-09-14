class BTWindowCreateClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[15];
var() automated FloatBox fbLabel[15];
var export editinline BTOwnerDrawImageHK Label[15];
var() automated FloatBox fbEdit[4];
var export editinline BTOwnerDrawImageHK Edit[4];
var localized string strButtonOverlapCheck;
var() automated FloatBox fbButtonOverlapCheck[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonOverlapCheck[2];
var export editinline BTEditBoxHK ClanName;
var export editinline BTEditBoxHK ClanID;
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTEditBoxHK ClanKeyword;
var export editinline BTComboBoxHK ClanLocation;
var() automated FloatBox fbClanLocation;
var export editinline BTLabelLocationHK sampleLocation;
var bool bCheckDupName;
var bool bCheckDupID;
var BTTcpLink_Channel TcpChannel;

function ClanName_OnChange(GUIComponent Sender)
{
    ClanName.Internal_OnChange(Sender);
    bCheckDupName = false;
    ButtonOverlapCheck[0].EnableMe();
    //return;    
}

function ClanID_OnChange(GUIComponent Sender)
{
    //return;    
}

function bool CheckDup()
{
    return bCheckDupName;
    //return;    
}

function bool ButtonOverlapCheck_OnClick(GUIComponent Sender)
{
    local int temp;
    local string filter;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x192
        case 0:
            // End:0x51
            if(ClanName.TextStr == "")
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                return true;
            }
            // End:0xB2
            if(Controller.ViewportOwner.Actor.Level.GameMgr.ContainsBadNicks(ClanName.TextStr, filter))
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 102);
                return true;
            }
            temp = IsCorrectUserName(ClanName.TextStr);
            // End:0x111
            if((temp == -1) || ClanName.TextStr == "none")
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 49);
                return true;                
            }
            else
            {
                // End:0x143
                if((temp > 16) || temp < 4)
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                    return true;
                }
            }
            // End:0x172
            if(IsInIncompleteLetter(ClanName.TextStr))
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                return true;
            }
            TcpChannel.sfReqDupCheckClanName(ClanName.TextStr);
            // End:0x277
            break;
        // End:0x274
        case 1:
            // End:0x1C3
            if(ClanID.TextStr == "")
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                return true;
            }
            temp = IsCorrectUserName(ClanID.TextStr);
            // End:0x222
            if((temp == -1) || ClanID.TextStr == "none")
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 49);
                return true;                
            }
            else
            {
                // End:0x254
                if((temp > 16) || temp < 4)
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                    return true;
                }
            }
            TcpChannel.sfReqIsAvailClanURL(ClanID.TextStr);
            // End:0x277
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super.InitComponent(MyController, myOwner);
    ClanLocation = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbClanLocation, 0.9800000));
    sampleLocation = BTLabelLocationHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelLocationHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    sampleLocation.CalcLocationCount();
    sampleLocation.SetData("", "");
    i = 0;
    J0x86:

    // End:0xD7 [Loop If]
    if(i < int(sampleLocation.GetLocationCount()))
    {
        ClanLocation.ComboBox.AddItem(sampleLocation.strRadioLocation[i]);
        i++;
        // [Loop Continue]
        goto J0x86;
    }
    i = 0;
    J0xDE:

    // End:0x156 [Loop If]
    if(i < 15)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0xDE;
    }
    Label[2].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[6].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[9].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[13].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[1].SetFontSizeAll(8);
    Label[1].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[5].SetFontSizeAll(8);
    Label[5].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[8].SetFontSizeAll(8);
    Label[8].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[11].SetFontSizeAll(9);
    Label[11].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatGhost());
    Label[12].SetFontSizeAll(8);
    Label[12].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    i = 0;
    J0x2E4:

    // End:0x325 [Loop If]
    if(i < 4)
    {
        Edit[i] = NewLabelComponent(fbEdit[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4);
        i++;
        // [Loop Continue]
        goto J0x2E4;
    }
    fb = fbEdit[0];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanName = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fb));
    ClanName.__OnChange__Delegate = ClanName_OnChange;
    ClanName.bLimitDrawSize = true;
    ClanName.LimitDrawWidth = 110.0000000;
    fb = fbEdit[1];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanID = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fb));
    ClanID.DisableMe();
    fb = fbEdit[2];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', fb));
    ClanIntroduction.VisibleLineCount = 3;
    fb = fbEdit[3];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanKeyword = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fb));
    i = 0;
    J0x58B:

    // End:0x638 [Loop If]
    if(i < 2)
    {
        ButtonOverlapCheck[i] = NewButtonComponent(fbButtonOverlapCheck[i]);
        ButtonOverlapCheck[i].SetDefaultButtonImage();
        ButtonOverlapCheck[i].SetFontSizeAll(9);
        ButtonOverlapCheck[i].Caption = strButtonOverlapCheck;
        ButtonOverlapCheck[i].ButtonID = i;
        ButtonOverlapCheck[i].__OnClick__Delegate = ButtonOverlapCheck_OnClick;
        i++;
        // [Loop Continue]
        goto J0x58B;
    }
    ButtonOverlapCheck[1].DisableMe();
    ClanIntroduction.SetVisibleLineCount(3);
    ClanIntroduction.MaxTextStrNum = 255;
    ClanName.MaxTextStrNum = 40;
    ClanKeyword.MaxTextStrNum = 40;
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strLabel[0]="Clan Name"
    strLabel[1]="- Use of vulgar words may lead to the clan being disbanded without warning."
    strLabel[3]="Clan ID"
    strLabel[4]="http://battery.webzen.co.kr/@"
    strLabel[5]="- This address is presently unimplemented and will be used at the clan homepage in the future."
    strLabel[7]="Clan Intro"
    strLabel[8]="- Use of vulgar words may lead to the clan being disbanded without warning."
    strLabel[10]="Clan Keywords"
    strLabel[11]="Popular keywords: employed, unemployed, women, men, adult, marine, air force"
    strLabel[12]="- Keywords are used in searches and are very important. Enter keywords by using / to distinguish them."
    strLabel[14]="Active Region"
    fbLabel[0]=(X1=276.0000000,Y1=189.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[1]=(X1=352.0000000,Y1=217.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[2]=(X1=274.0000000,Y1=235.0000000,X2=753.0000000,Y2=238.0000000)
    fbLabel[3]=(X1=276.0000000,Y1=250.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[4]=(X1=352.0000000,Y1=250.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[5]=(X1=352.0000000,Y1=278.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[6]=(X1=274.0000000,Y1=296.0000000,X2=753.0000000,Y2=299.0000000)
    fbLabel[7]=(X1=276.0000000,Y1=311.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[8]=(X1=352.0000000,Y1=373.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[9]=(X1=274.0000000,Y1=391.0000000,X2=753.0000000,Y2=394.0000000)
    fbLabel[10]=(X1=276.0000000,Y1=406.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[11]=(X1=352.0000000,Y1=431.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[12]=(X1=352.0000000,Y1=446.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[13]=(X1=274.0000000,Y1=464.0000000,X2=753.0000000,Y2=467.0000000)
    fbLabel[14]=(X1=276.0000000,Y1=479.0000000,X2=760.0000000,Y2=619.0000000)
    fbEdit[0]=(X1=352.0000000,Y1=184.0000000,X2=687.0000000,Y2=211.0000000)
    fbEdit[1]=(X1=563.0000000,Y1=245.0000000,X2=687.0000000,Y2=272.0000000)
    fbEdit[2]=(X1=352.0000000,Y1=306.0000000,X2=753.0000000,Y2=367.0000000)
    fbEdit[3]=(X1=352.0000000,Y1=401.0000000,X2=753.0000000,Y2=428.0000000)
    strButtonOverlapCheck="Duplicate Check"
    fbButtonOverlapCheck[0]=(X1=694.0000000,Y1=186.0000000,X2=753.0000000,Y2=209.0000000)
    fbButtonOverlapCheck[1]=(X1=694.0000000,Y1=247.0000000,X2=753.0000000,Y2=270.0000000)
    fbClanLocation=(X1=351.0000000,Y1=479.0000000,X2=752.0000000,Y2=506.0000000)
    fbBackgroundImage=(X1=246.0000000,Y1=130.0000000,X2=781.0000000,Y2=640.0000000)
    fbTopLine=(X1=266.0000000,Y1=150.0000000,X2=761.0000000,Y2=175.0000000)
    fbBottomLine=(X1=266.0000000,Y1=576.0000000,X2=761.0000000,Y2=619.0000000)
    fbButtonOK=(X1=390.0000000,Y1=582.0000000,X2=510.0000000,Y2=615.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=582.0000000,X2=634.0000000,Y2=615.0000000)
    strTitle="Create Clan"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowCreateClanHK.Internal_OnOpen
}