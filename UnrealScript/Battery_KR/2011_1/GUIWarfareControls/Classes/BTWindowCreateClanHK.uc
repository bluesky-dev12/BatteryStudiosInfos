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
var export editinline BTEditBoxHK Clanname;
var export editinline BTEditBoxHK ClanID;
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTEditBoxHK ClanKeyword;
var localized string strRadioLocation[14];
var() automated FloatBox fbRadioLocation[14];
var export editinline BTCheckBoxHK RadioLocation[14];
var export editinline ButtonGroups RadioGroup;
var bool bCheckDupName;
var bool bCheckDupID;
var BTTcpLink_Channel TcpChannel;

function ClanName_OnChange(GUIComponent Sender)
{
    Clanname.Internal_OnChange(Sender);
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
    local int Temp;
    local string filter;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x192
        case 0:
            // End:0x51
            if(Clanname.TextStr == "")
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                return true;
            }
            // End:0xB2
            if(Controller.ViewportOwner.Actor.Level.GameMgr.ContainsBadNicks(Clanname.TextStr, filter))
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 102);
                return true;
            }
            Temp = IsCorrectUserName(Clanname.TextStr);
            // End:0x111
            if((Temp == -1) || Clanname.TextStr == "none")
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 49);
                return true;                
            }
            else
            {
                // End:0x143
                if((Temp > 16) || Temp < 4)
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                    return true;
                }
            }
            // End:0x172
            if(IsInIncompleteLetter(Clanname.TextStr))
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                return true;
            }
            TcpChannel.sfReqDupCheckClanName(Clanname.TextStr);
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
            Temp = IsCorrectUserName(ClanID.TextStr);
            // End:0x222
            if((Temp == -1) || ClanID.TextStr == "none")
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 49);
                return true;                
            }
            else
            {
                // End:0x254
                if((Temp > 16) || Temp < 4)
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
    i = 0;
    J0x17:

    // End:0x8F [Loop If]
    if(i < 15)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x17;
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
    J0x21D:

    // End:0x25E [Loop If]
    if(i < 4)
    {
        Edit[i] = NewLabelComponent(fbEdit[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4);
        i++;
        // [Loop Continue]
        goto J0x21D;
    }
    fb = fbEdit[0];
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fb.X1 + float(4), fb.Y1 + float(4), fb.X2 - float(4), fb.Y2 - float(4));
    Clanname = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fb));
    Clanname.__OnChange__Delegate = ClanName_OnChange;
    Clanname.bLimitDrawSize = true;
    Clanname.LimitDrawWidth = 110.0000000;
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
    J0x4C4:

    // End:0x571 [Loop If]
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
        goto J0x4C4;
    }
    ButtonOverlapCheck[1].DisableMe();
    RadioGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', fbRadioLocation[0]));
    i = 0;
    J0x5AA:

    // End:0x685 [Loop If]
    if(i < 14)
    {
        RadioLocation[i] = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fbRadioLocation[i]));
        RadioLocation[i].SetDefaultRadioImage();
        RadioLocation[i].Caption = strRadioLocation[i];
        RadioLocation[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN());
        RadioLocation[i].FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonDisable();
        RadioGroup.AddButton(RadioLocation[i]);
        i++;
        // [Loop Continue]
        goto J0x5AA;
    }
    RadioGroup.SelectButton(0);
    ClanIntroduction.SetVisibleLineCount(3);
    ClanIntroduction.MaxTextStrNum = 255;
    Clanname.MaxTextStrNum = 40;
    ClanKeyword.MaxTextStrNum = 40;
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strLabel[0]="?? ??"
    strLabel[1]="-???? ??? ?? ?? ?? ?? ??? ??? ? ????."
    strLabel[3]="?? ID"
    strLabel[4]="http://battery.webzen.co.kr/@"
    strLabel[5]="-?? ???? ???? ?? ?? ????? ??? ?????."
    strLabel[7]="?? ??"
    strLabel[8]="-???? ??? ?? ?? ?? ?? ??? ??? ? ????."
    strLabel[10]="?? ???"
    strLabel[11]="?? ??? : ???, ??, ??, ??, ??, ???, ??"
    strLabel[12]="-???? ??? ????? ?????. ???? /? ???? ??"
    strLabel[14]="?? ??"
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
    strButtonOverlapCheck="?? ??"
    fbButtonOverlapCheck[0]=(X1=694.0000000,Y1=186.0000000,X2=753.0000000,Y2=209.0000000)
    fbButtonOverlapCheck[1]=(X1=694.0000000,Y1=247.0000000,X2=753.0000000,Y2=270.0000000)
    strRadioLocation[0]="??"
    strRadioLocation[1]="??"
    strRadioLocation[2]="??"
    strRadioLocation[3]="??"
    strRadioLocation[4]="??"
    strRadioLocation[5]="??"
    strRadioLocation[6]="??"
    strRadioLocation[7]="??"
    strRadioLocation[8]="??"
    strRadioLocation[9]="??"
    strRadioLocation[10]="??"
    strRadioLocation[11]="??"
    strRadioLocation[12]="??"
    strRadioLocation[13]="??"
    fbRadioLocation[0]=(X1=364.0000000,Y1=479.0000000,X2=428.0000000,Y2=499.0000000)
    fbRadioLocation[1]=(X1=428.0000000,Y1=479.0000000,X2=492.0000000,Y2=499.0000000)
    fbRadioLocation[2]=(X1=492.0000000,Y1=479.0000000,X2=556.0000000,Y2=499.0000000)
    fbRadioLocation[3]=(X1=556.0000000,Y1=479.0000000,X2=620.0000000,Y2=499.0000000)
    fbRadioLocation[4]=(X1=620.0000000,Y1=479.0000000,X2=684.0000000,Y2=499.0000000)
    fbRadioLocation[5]=(X1=684.0000000,Y1=479.0000000,X2=748.0000000,Y2=499.0000000)
    fbRadioLocation[6]=(X1=364.0000000,Y1=513.0000000,X2=428.0000000,Y2=533.0000000)
    fbRadioLocation[7]=(X1=428.0000000,Y1=513.0000000,X2=492.0000000,Y2=533.0000000)
    fbRadioLocation[8]=(X1=492.0000000,Y1=513.0000000,X2=556.0000000,Y2=533.0000000)
    fbRadioLocation[9]=(X1=556.0000000,Y1=513.0000000,X2=620.0000000,Y2=533.0000000)
    fbRadioLocation[10]=(X1=620.0000000,Y1=513.0000000,X2=684.0000000,Y2=533.0000000)
    fbRadioLocation[11]=(X1=684.0000000,Y1=513.0000000,X2=748.0000000,Y2=533.0000000)
    fbRadioLocation[12]=(X1=364.0000000,Y1=547.0000000,X2=428.0000000,Y2=567.0000000)
    fbRadioLocation[13]=(X1=428.0000000,Y1=547.0000000,X2=492.0000000,Y2=567.0000000)
    fbBackgroundImage=(X1=246.0000000,Y1=130.0000000,X2=781.0000000,Y2=640.0000000)
    fbTopLine=(X1=266.0000000,Y1=150.0000000,X2=761.0000000,Y2=175.0000000)
    fbBottomLine=(X1=266.0000000,Y1=576.0000000,X2=761.0000000,Y2=619.0000000)
    fbButtonOK=(X1=390.0000000,Y1=582.0000000,X2=510.0000000,Y2=615.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=582.0000000,X2=634.0000000,Y2=615.0000000)
    strTitle="?? ???"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowCreateClanHK.Internal_OnOpen
}