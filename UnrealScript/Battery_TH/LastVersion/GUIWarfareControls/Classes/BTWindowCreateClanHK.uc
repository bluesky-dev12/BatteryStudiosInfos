class BTWindowCreateClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[11];
var localized string strQTRoomNumber;
var() automated FloatBox fbLabel[11];
var export editinline BTOwnerDrawImageHK Label[11];
var() automated FloatBox fbEdit[3];
var export editinline BTOwnerDrawImageHK Edit[3];
var localized string strButtonOverlapCheck;
var() automated FloatBox fbButtonOverlapCheck;
var export editinline BTOwnerDrawCaptionButtonHK ButtonOverlapCheck;
var export editinline BTEditBoxHK ClanName;
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
    ButtonOverlapCheck.EnableMe();
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
            temp = IsCorrectUserName_THAILAND(ClanName.TextStr);
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
            // End:0x195
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
    sampleLocation.Hide();
    i = 0;
    J0x95:

    // End:0xE6 [Loop If]
    if(i < int(sampleLocation.GetLocationCount()))
    {
        ClanLocation.ComboBox.AddItem(sampleLocation.strRadioLocation[i]);
        i++;
        // [Loop Continue]
        goto J0x95;
    }
    i = 0;
    J0xED:

    // End:0x165 [Loop If]
    if(i < 11)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0xED;
    }
    Label[2].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[5].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[9].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[1].SetFontSizeAll(8);
    Label[1].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[4].SetFontSizeAll(8);
    Label[4].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[7].SetFontSizeAll(9);
    Label[7].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatGhost());
    Label[8].SetFontSizeAll(8);
    Label[8].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    i = 0;
    J0x29E:

    // End:0x2DF [Loop If]
    if(i < 3)
    {
        Edit[i] = NewLabelComponent(fbEdit[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4);
        i++;
        // [Loop Continue]
        goto J0x29E;
    }
    fb = fbEdit[0];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanName = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fb));
    ClanName.__OnChange__Delegate = ClanName_OnChange;
    ClanName.bLimitDrawSize = true;
    ClanName.LimitDrawWidth = 110.0000000;
    fb = fbEdit[1];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', fb));
    ClanIntroduction.VisibleLineCount = 3;
    fb = fbEdit[2];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanKeyword = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fb));
    ButtonOverlapCheck = NewButtonComponent(fbButtonOverlapCheck);
    ButtonOverlapCheck.SetDefaultButtonImage();
    ButtonOverlapCheck.SetFontSizeAll(9);
    ButtonOverlapCheck.Caption = strButtonOverlapCheck;
    ButtonOverlapCheck.ButtonID = 0;
    ButtonOverlapCheck.__OnClick__Delegate = ButtonOverlapCheck_OnClick;
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
    strLabel[0]="????????"
    strLabel[1]="??????????????????????????????????????????????????????"
    strLabel[3]="?????????"
    strLabel[4]="??????????????????????????????????????????????????????"
    strLabel[6]="??????????????"
    strLabel[7]="?????????????????: ???????, ????? ???????, ??????, ???????, ?????????"
    strLabel[8]="???????????????????????????????????? ???????????????????????? /"
    strLabel[10]="??????????"
    fbLabel[0]=(X1=276.0000000,Y1=189.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[1]=(X1=352.0000000,Y1=217.0000000,X2=760.0000000,Y2=619.0000000)
    fbLabel[2]=(X1=274.0000000,Y1=235.0000000,X2=753.0000000,Y2=238.0000000)
    fbLabel[3]=(X1=276.0000000,Y1=249.0000000,X2=760.0000000,Y2=557.0000000)
    fbLabel[4]=(X1=352.0000000,Y1=311.0000000,X2=760.0000000,Y2=557.0000000)
    fbLabel[5]=(X1=274.0000000,Y1=329.0000000,X2=753.0000000,Y2=332.0000000)
    fbLabel[6]=(X1=276.0000000,Y1=344.0000000,X2=760.0000000,Y2=557.0000000)
    fbLabel[7]=(X1=352.0000000,Y1=369.0000000,X2=760.0000000,Y2=557.0000000)
    fbLabel[8]=(X1=352.0000000,Y1=384.0000000,X2=760.0000000,Y2=557.0000000)
    fbLabel[9]=(X1=274.0000000,Y1=402.0000000,X2=753.0000000,Y2=405.0000000)
    fbLabel[10]=(X1=276.0000000,Y1=417.0000000,X2=760.0000000,Y2=557.0000000)
    fbEdit[0]=(X1=352.0000000,Y1=184.0000000,X2=687.0000000,Y2=211.0000000)
    fbEdit[1]=(X1=352.0000000,Y1=244.0000000,X2=753.0000000,Y2=305.0000000)
    fbEdit[2]=(X1=352.0000000,Y1=339.0000000,X2=753.0000000,Y2=366.0000000)
    strButtonOverlapCheck="????"
    fbButtonOverlapCheck=(X1=694.0000000,Y1=186.0000000,X2=753.0000000,Y2=209.0000000)
    fbClanLocation=(X1=351.0000000,Y1=417.0000000,X2=752.0000000,Y2=444.0000000)
    fbBackgroundImage=(X1=246.0000000,Y1=130.0000000,X2=781.0000000,Y2=640.0000000)
    fbTopLine=(X1=266.0000000,Y1=150.0000000,X2=761.0000000,Y2=175.0000000)
    fbBottomLine=(X1=266.0000000,Y1=576.0000000,X2=761.0000000,Y2=619.0000000)
    fbButtonOK=(X1=390.0000000,Y1=582.0000000,X2=510.0000000,Y2=615.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=582.0000000,X2=634.0000000,Y2=615.0000000)
    strTitle="?????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowCreateClanHK.Internal_OnOpen
}