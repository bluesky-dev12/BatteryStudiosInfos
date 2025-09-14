/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowCreateClanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:5
 *
 *******************************************************************************/
class BTWindowCreateClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[11];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[11];
var export editinline BTOwnerDrawImageHK Label[11];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEdit[3];
var export editinline BTOwnerDrawImageHK Edit[3];
var localized string strButtonOverlapCheck;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonOverlapCheck;
var export editinline BTOwnerDrawCaptionButtonHK ButtonOverlapCheck;
var export editinline BTEditBoxHK ClanName;
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTEditBoxHK ClanKeyword;
var export editinline BTComboBoxHK ClanLocation;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbClanLocation;
var export editinline BTLabelLocationHK sampleLocation;
var bool bCheckDupName;
var bool bCheckDupID;
var BTTcpLink_Channel TcpChannel;

function ClanName_OnChange(GUIComponent Sender)
{
    ClanName.Internal_OnChange(Sender);
    bCheckDupName = false;
    ButtonOverlapCheck.EnableMe();
}

function bool CheckDup()
{
    return bCheckDupName;
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
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                return true;
            }
            // End:0xb2
            if(Controller.ViewportOwner.Actor.Level.GameMgr.ContainsBadNicks(ClanName.TextStr, filter))
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 102);
                return true;
            }
            temp = IsCorrectUserName(ClanName.TextStr);
            // End:0x111
            if(temp == -1 || ClanName.TextStr == "none")
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 49);
                return true;
            }
            // End:0x143
            else
            {
                // End:0x143
                if(temp > 16 || temp < 4)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                    return true;
                }
            }
            // End:0x172
            if(IsInIncompleteLetter(ClanName.TextStr))
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                return true;
            }
            TcpChannel.sfReqDupCheckClanName(ClanName.TextStr);
            // End:0x195
            break;
        // End:0xffff
        default:
            return true;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super.InitComponent(MyController, myOwner);
    ClanLocation = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbClanLocation, 0.980));
    sampleLocation = BTLabelLocationHK(NewComponent(new class'BTLabelLocationHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    sampleLocation.CalcLocationCount();
    sampleLocation.SetData("", "");
    sampleLocation.Hide();
    i = 0;
    J0x95:
    // End:0xe6 [While If]
    if(i < sampleLocation.GetLocationCount())
    {
        ClanLocation.ComboBox.AddItem(sampleLocation.strRadioLocation[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x95;
    }
    i = 0;
    J0xed:
    // End:0x165 [While If]
    if(i < 11)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xed;
    }
    Label[2].BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    Label[5].BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    Label[9].BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    Label[1].SetFontSizeAll(8);
    Label[1].SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
    Label[4].SetFontSizeAll(8);
    Label[4].SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
    Label[7].SetFontSizeAll(9);
    Label[7].SetFontColorAll(class'BTUIColorPoolHK'.static.ChatGhost());
    Label[8].SetFontSizeAll(8);
    Label[8].SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
    i = 0;
    J0x29e:
    // End:0x2df [While If]
    if(i < 3)
    {
        Edit[i] = NewLabelComponent(fbEdit[i], class'BTUIResourcePoolHK'.default.panel_4);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x29e;
    }
    fb = fbEdit[0];
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanName = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', fb));
    ClanName.__OnChange__Delegate = ClanName_OnChange;
    ClanName.bLimitDrawSize = true;
    ClanName.LimitDrawWidth = 110.0;
    fb = fbEdit[1];
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', fb));
    ClanIntroduction.VisibleLineCount = 3;
    fb = fbEdit[2];
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    ClanKeyword = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', fb));
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
}

function Internal_OnOpen();

defaultproperties
{
    strLabel[0]="Clan Name"
    strLabel[1]="- Use of vulgar words may lead to the clan being disbanded without warning."
    strLabel[3]="Clan Intro"
    strLabel[4]=" - Use of vulgar words may lead to the clan being disbanded without warning."
    strLabel[6]="Keywords"
    strLabel[7]="Keywords are used in searches."
    strLabel[8]="- Distinguish keywords by using '/'."
    strLabel[10]="Region"
    fbLabel[0]=(X1=276.0,Y1=189.0,X2=760.0,Y2=619.0)
    fbLabel[1]=(X1=352.0,Y1=217.0,X2=760.0,Y2=619.0)
    fbLabel[2]=(X1=274.0,Y1=235.0,X2=753.0,Y2=238.0)
    fbLabel[3]=(X1=276.0,Y1=249.0,X2=760.0,Y2=557.0)
    fbLabel[4]=(X1=352.0,Y1=311.0,X2=760.0,Y2=557.0)
    fbLabel[5]=(X1=274.0,Y1=329.0,X2=753.0,Y2=332.0)
    fbLabel[6]=(X1=276.0,Y1=344.0,X2=760.0,Y2=557.0)
    fbLabel[7]=(X1=352.0,Y1=369.0,X2=760.0,Y2=557.0)
    fbLabel[8]=(X1=352.0,Y1=384.0,X2=760.0,Y2=557.0)
    fbLabel[9]=(X1=274.0,Y1=402.0,X2=753.0,Y2=405.0)
    fbLabel[10]=(X1=276.0,Y1=417.0,X2=760.0,Y2=557.0)
    fbEdit[0]=(X1=352.0,Y1=184.0,X2=687.0,Y2=211.0)
    fbEdit[1]=(X1=352.0,Y1=244.0,X2=753.0,Y2=305.0)
    fbEdit[2]=(X1=352.0,Y1=339.0,X2=753.0,Y2=366.0)
    strButtonOverlapCheck="Check"
    fbButtonOverlapCheck=(X1=694.0,Y1=186.0,X2=753.0,Y2=209.0)
    fbClanLocation=(X1=351.0,Y1=417.0,X2=752.0,Y2=444.0)
    fbBackgroundImage=(X1=246.0,Y1=130.0,X2=781.0,Y2=640.0)
    fbTopLine=(X1=266.0,Y1=150.0,X2=761.0,Y2=175.0)
    fbBottomLine=(X1=266.0,Y1=576.0,X2=761.0,Y2=619.0)
    fbButtonOK=(X1=390.0,Y1=582.0,X2=510.0,Y2=615.0)
    fbButtonCancel=(X1=514.0,Y1=582.0,X2=634.0,Y2=615.0)
    strTitle="Create Clan"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
}