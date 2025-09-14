class BTWindowAutoResizeHK extends BTWindowHK
    editinlinenew
    instanced;

struct StringAndFontSize
{
    var string Text;
    var int FontSize;
    var Color FontColor;
};

var BtrDouble ExtraData_btrdouble;
var string ExtraData_string;
var int ExtraData_int;
var int ExtraData_int2;
var int ExtraData_int3;
var bool bStableText;
var string Caption;
var string Warning;
var int FontSize;
var int LabelSpace;
var int LabelSpaceWarning;
var int LabelSpaceDivider;
var int LabelSpaceEdit;
var int LabelSpaceMultiLineEditMsg;
var int VisibleLabelCount;
var FloatBox fbLabelInfo;
var FloatBox fbLabelWarning;
var FloatBox fbLabelDivider;
var FloatBox fbEditName;
var FloatBox fbMultiLineEditMsg;
var FloatBox fbMultiLineEditMsg2;
var FloatBox fbButtonOK2;
var FloatBox fbButtonCancel2;
var export editinline BTOwnerDrawImageHK LabelInfo[10];
var export editinline BTEditBoxHK EditName;
var export editinline BTMultiLineEditBoxHK MultiLineEditMsg;
var export editinline BTMultiLineEditBoxHK MultiLineEditMsg2;
var export editinline BTOwnerDrawImageHK LabelWarning;
var export editinline BTOwnerDrawImageHK LabelDivider;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x7F [Loop If]
    if(i < 10)
    {
        LabelInfo[i] = NewLabelComponent(fbLabelInfo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelInfo[i].SetVisibility(false);
        LabelInfo[i].SetFontDrawType(0);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    LabelWarning = NewLabelComponent(fbLabelWarning, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelWarning.SetVisibility(false);
    LabelWarning.SetFontDrawType(0);
    LabelWarning.SetFontSizeAll(9);
    LabelWarning.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    LabelDivider = NewLabelComponent(fbLabelDivider, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line);
    LabelDivider.SetVisibility(false);
    EditName = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fbEditName));
    EditName.bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    EditName.SetVisibility(false);
    EditName.bLimitDrawSize = true;
    EditName.MaxTextStrNum = 255;
    MultiLineEditMsg = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', fbMultiLineEditMsg));
    MultiLineEditMsg.bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    MultiLineEditMsg.SetVisibility(false);
    MultiLineEditMsg.SetVisibleLineCount(3);
    MultiLineEditMsg.MaxTextStrNum = 255;
    MultiLineEditMsg2 = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', fbMultiLineEditMsg2));
    MultiLineEditMsg2.bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    MultiLineEditMsg2.SetVisibility(false);
    MultiLineEditMsg2.SetVisibleLineCount(2);
    MultiLineEditMsg2.MaxTextStrNum = 255;
    LabelInfo[0].SetVisibility(true);
    VisibleLabelCount = 1;
    LabelSpace = 5;
    LabelSpaceWarning = 5;
    LabelSpaceDivider = 15;
    LabelSpaceEdit = 10;
    LabelSpaceMultiLineEditMsg = 10;
    Caption = "";
    bStableText = true;
    FontSize = 10;
    SetButtonCaption(strOK, strCancel);
    //return;    
}

function SetData(string Title, string Caption, optional string Warning)
{
    self.TopLine.Caption = Title;
    self.Caption = Caption;
    // End:0x8F
    if(Warning == "EditBox")
    {
        LabelDivider.SetVisibility(true);
        EditName.SetVisibility(true);
        LabelWarning.SetVisibility(false);
        MultiLineEditMsg.SetVisibility(false);
        MultiLineEditMsg2.SetVisibility(false);        
    }
    else
    {
        // End:0xFE
        if(Warning == "MultiLineEditBox")
        {
            LabelDivider.SetVisibility(true);
            MultiLineEditMsg.SetVisibility(true);
            EditName.SetVisibility(false);
            LabelWarning.SetVisibility(false);
            MultiLineEditMsg2.SetVisibility(false);            
        }
        else
        {
            // End:0x16E
            if(Warning == "MultiLineEditBox2")
            {
                LabelDivider.SetVisibility(true);
                MultiLineEditMsg2.SetVisibility(true);
                EditName.SetVisibility(false);
                LabelWarning.SetVisibility(false);
                MultiLineEditMsg.SetVisibility(false);                
            }
            else
            {
                LabelDivider.SetVisibility(false);
                EditName.SetVisibility(false);
                MultiLineEditMsg.SetVisibility(false);
                MultiLineEditMsg2.SetVisibility(false);
                LabelWarning.Caption = Warning;
                // End:0x1EA
                if(LabelWarning.Caption != "")
                {
                    LabelWarning.SetVisibility(true);                    
                }
                else
                {
                    LabelWarning.SetVisibility(false);
                }
            }
        }
    }
    bStableText = false;
    //return;    
}

function SetButtonCaption(optional string strOK, optional string strCancel)
{
    // End:0x8E
    if(strCancel == "")
    {
        ButtonOK.Caption = strOK;
        ButtonOK.AWinPos.X1 = fbButtonOK.X1;
        ButtonOK.AWinPos.X2 = fbButtonOK.X2;
        ButtonOK.TraversalApplyAWinPos();
        ButtonOK.SetVisibility(true);
        ButtonCancel.SetVisibility(false);        
    }
    else
    {
        ButtonOK.Caption = strOK;
        ButtonOK.AWinPos.X1 = fbButtonOK2.X1;
        ButtonOK.AWinPos.X2 = fbButtonOK2.X2;
        ButtonOK.TraversalApplyAWinPos();
        ButtonCancel.Caption = strCancel;
        ButtonCancel.AWinPos.X1 = fbButtonCancel2.X1;
        ButtonCancel.AWinPos.X2 = fbButtonCancel2.X2;
        ButtonCancel.AWinPos.Y1 = ButtonOK.AWinPos.Y1;
        ButtonCancel.AWinPos.Y2 = ButtonOK.AWinPos.Y2;
        ButtonCancel.TraversalApplyAWinPos();
        ButtonOK.SetVisibility(true);
        ButtonCancel.SetVisibility(true);
    }
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int i, j;
    local float HT;
    local FloatBox fb;
    local string original;
    local Color forecolor;
    local array<string> tarray, temparray, mergetarray;
    local array<StringAndFontSize> OriginArray, AddArray;
    local float VLCHeight, ExtHeight, LastVisibleLabelHeight;
    local int LabelInfoWidth;

    LabelInfoWidth = int(LabelInfo[0].AWinPos.X2 - LabelInfo[0].AWinPos.X1);
    // End:0x107B
    if(bStableText == false)
    {
        Class'Engine.BTCustomDrawHK'.static.SplitString(Caption, mergetarray, 2, "<8>", "<9>", "<10>");
        i = 0;
        J0x72:

        // End:0x520 [Loop If]
        if(i < mergetarray.Length)
        {
            temparray.Length = 0;
            // End:0x156
            if(StrStartsWith(mergetarray[i], "<8>"))
            {
                mergetarray[i] = Mid(mergetarray[i], 3);
                Class'Engine.BTCustomDrawHK'.static.SplitTextBounds(C, temparray, mergetarray[i], 8, float(LabelInfoWidth));
                j = 0;
                J0xF2:

                // End:0x153 [Loop If]
                if(j < temparray.Length)
                {
                    AddArray.Length = AddArray.Length + 1;
                    AddArray[AddArray.Length - 1].Text = temparray[j];
                    AddArray[AddArray.Length - 1].FontSize = 8;
                    j++;
                    // [Loop Continue]
                    goto J0xF2;
                }                
            }
            else
            {
                // End:0x222
                if(StrStartsWith(mergetarray[i], "<9>"))
                {
                    mergetarray[i] = Mid(mergetarray[i], 3);
                    Class'Engine.BTCustomDrawHK'.static.SplitTextBounds(C, temparray, mergetarray[i], 9, float(LabelInfoWidth));
                    j = 0;
                    J0x1BE:

                    // End:0x21F [Loop If]
                    if(j < temparray.Length)
                    {
                        AddArray.Length = AddArray.Length + 1;
                        AddArray[AddArray.Length - 1].Text = temparray[j];
                        AddArray[AddArray.Length - 1].FontSize = 9;
                        j++;
                        // [Loop Continue]
                        goto J0x1BE;
                    }                    
                }
                else
                {
                    // End:0x2EF
                    if(StrStartsWith(mergetarray[i], "<10>"))
                    {
                        mergetarray[i] = Mid(mergetarray[i], 4);
                        Class'Engine.BTCustomDrawHK'.static.SplitTextBounds(C, temparray, mergetarray[i], 10, float(LabelInfoWidth));
                        j = 0;
                        J0x28B:

                        // End:0x2EC [Loop If]
                        if(j < temparray.Length)
                        {
                            AddArray.Length = AddArray.Length + 1;
                            AddArray[AddArray.Length - 1].Text = temparray[j];
                            AddArray[AddArray.Length - 1].FontSize = 10;
                            j++;
                            // [Loop Continue]
                            goto J0x28B;
                        }                        
                    }
                    else
                    {
                        Class'Engine.BTCustomDrawHK'.static.SplitTextBounds(C, temparray, mergetarray[i], 10, float(LabelInfoWidth));
                        j = 0;
                        J0x323:

                        // End:0x384 [Loop If]
                        if(j < temparray.Length)
                        {
                            AddArray.Length = AddArray.Length + 1;
                            AddArray[AddArray.Length - 1].Text = temparray[j];
                            AddArray[AddArray.Length - 1].FontSize = 10;
                            j++;
                            // [Loop Continue]
                            goto J0x323;
                        }
                    }
                }
            }
            // End:0x3B7
            if(StrStartsWith(mergetarray[i], "<RED>"))
            {
                forecolor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();                
            }
            else
            {
                // End:0x3ED
                if(StrStartsWith(mergetarray[i], "<YELLOW>"))
                {
                    forecolor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSelf();                    
                }
                else
                {
                    forecolor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                }
            }
            j = 0;
            J0x409:

            // End:0x516 [Loop If]
            if(j < temparray.Length)
            {
                // End:0x482
                if(StrStartsWith(AddArray[(AddArray.Length - 1) - j].Text, "<RED>"))
                {
                    AddArray[(AddArray.Length - 1) - j].Text = Mid(AddArray[(AddArray.Length - 1) - j].Text, 5);                    
                }
                else
                {
                    // End:0x4EB
                    if(StrStartsWith(AddArray[(AddArray.Length - 1) - j].Text, "<YELLOW>"))
                    {
                        AddArray[(AddArray.Length - 1) - j].Text = Mid(AddArray[(AddArray.Length - 1) - j].Text, 8);
                    }
                }
                AddArray[(AddArray.Length - 1) - j].FontColor = forecolor;
                j++;
                // [Loop Continue]
                goto J0x409;
            }
            i++;
            // [Loop Continue]
            goto J0x72;
        }
        HT = fbLabelInfo.Y2 - fbLabelInfo.Y1;
        i = 0;
        J0x543:

        // End:0x58E [Loop If]
        if(i < VisibleLabelCount)
        {
            RemoveSizeY(int(HT + float(LabelSpace)), int(fbLabelInfo.Y2 + fbLabelInfo.Y1) / 2);
            i++;
            // [Loop Continue]
            goto J0x543;
        }
        OriginArray.Length = AddArray.Length;
        i = 0;
        J0x5A2:

        // End:0x61F [Loop If]
        if(i < AddArray.Length)
        {
            OriginArray[i].Text = AddArray[i].Text;
            OriginArray[i].FontSize = AddArray[i].FontSize;
            OriginArray[i].FontColor = AddArray[i].FontColor;
            i++;
            // [Loop Continue]
            goto J0x5A2;
        }
        VisibleLabelCount = OriginArray.Length;
        i = 0;
        J0x632:

        // End:0x67D [Loop If]
        if(i < VisibleLabelCount)
        {
            InsertSizeY(int(HT + float(LabelSpace)), int(fbLabelInfo.Y2 + fbLabelInfo.Y1) / 2);
            i++;
            // [Loop Continue]
            goto J0x632;
        }
        VLCHeight = (float(VisibleLabelCount - 1) / 2.0000000) * (HT + float(LabelSpace));
        ExtHeight = 0.0000000;
        // End:0x731
        if(LabelWarning.bVisible)
        {
            InsertSizeY(int((fbLabelWarning.Y2 - fbLabelWarning.Y1) + float(LabelSpaceWarning)), int(fbLabelInfo.Y2 + fbLabelInfo.Y1) / 2);
            ExtHeight += (((fbLabelWarning.Y2 - fbLabelWarning.Y1) + float(LabelSpaceWarning)) / 2.0000000);
        }
        // End:0x7B3
        if(LabelDivider.bVisible)
        {
            InsertSizeY(int((fbLabelDivider.Y2 - fbLabelDivider.Y1) + float(LabelSpaceDivider)), int(fbLabelInfo.Y2 + fbLabelInfo.Y1) / 2);
            ExtHeight += (((fbLabelDivider.Y2 - fbLabelDivider.Y1) + float(LabelSpaceDivider)) / 2.0000000);
        }
        // End:0x86C
        if(EditName.bVisible)
        {
            InsertSizeY(int((fbEditName.Y2 - fbEditName.Y1) + float(LabelSpaceEdit)), int(fbLabelInfo.Y2 + fbLabelInfo.Y1) / 2);
            ExtHeight += (((fbEditName.Y2 - fbEditName.Y1) + float(LabelSpaceEdit)) / 2.0000000);
            EditName.LimitDrawWidth = EditName.AWinPos.X2 - EditName.AWinPos.X1;
        }
        // End:0x8EE
        if(MultiLineEditMsg.bVisible)
        {
            InsertSizeY(int((fbMultiLineEditMsg.Y2 - fbMultiLineEditMsg.Y1) + float(LabelSpaceMultiLineEditMsg)), int(fbLabelInfo.Y2 + fbLabelInfo.Y1) / 2);
            ExtHeight += (((fbMultiLineEditMsg.Y2 - fbMultiLineEditMsg.Y1) + float(LabelSpaceMultiLineEditMsg)) / 2.0000000);
        }
        // End:0x970
        if(MultiLineEditMsg2.bVisible)
        {
            InsertSizeY(int((fbMultiLineEditMsg2.Y2 - fbMultiLineEditMsg2.Y1) + float(LabelSpaceMultiLineEditMsg)), int(fbLabelInfo.Y2 + fbLabelInfo.Y1) / 2);
            ExtHeight += (((fbMultiLineEditMsg2.Y2 - fbMultiLineEditMsg2.Y1) + float(LabelSpaceMultiLineEditMsg)) / 2.0000000);
        }
        i = 0;
        J0x977:

        // End:0xB60 [Loop If]
        if(i < 10)
        {
            // End:0xB40
            if(i < VisibleLabelCount)
            {
                LabelInfo[i].AWinPos.Y1 = fbLabelInfo.Y1;
                LabelInfo[i].AWinPos.Y2 = fbLabelInfo.Y2;
                LabelInfo[i].AWinPos.Y1 -= (VLCHeight + ExtHeight);
                LabelInfo[i].AWinPos.Y2 -= (VLCHeight + ExtHeight);
                LabelInfo[i].AWinPos.Y1 += (float(i) * (HT + float(LabelSpace)));
                LabelInfo[i].AWinPos.Y2 += (float(i) * (HT + float(LabelSpace)));
                LabelInfo[i].Caption = OriginArray[i].Text;
                LabelInfo[i].SetFontDrawType(3);
                LabelInfo[i].SetFontSizeAll(OriginArray[i].FontSize);
                LabelInfo[i].SetFontColorAll(OriginArray[i].FontColor);
                LabelInfo[i].TraversalApplyAWinPos();
                LabelInfo[i].SetVisibility(true);
                // [Explicit Continue]
                goto J0xB56;
            }
            LabelInfo[i].SetVisibility(false);
            J0xB56:

            i++;
            // [Loop Continue]
            goto J0x977;
        }
        LastVisibleLabelHeight = float(VisibleLabelCount) * (HT + float(LabelSpace));
        // End:0xC7B
        if(LabelWarning.bVisible)
        {
            LabelWarning.AWinPos.Y1 = fbLabelWarning.Y1;
            LabelWarning.AWinPos.Y2 = fbLabelWarning.Y2;
            LabelWarning.AWinPos.Y1 -= (VLCHeight + ExtHeight);
            LabelWarning.AWinPos.Y2 -= (VLCHeight + ExtHeight);
            LastVisibleLabelHeight += float(LabelSpaceWarning);
            LabelWarning.AWinPos.Y1 += LastVisibleLabelHeight;
            LabelWarning.AWinPos.Y2 += LastVisibleLabelHeight;
            LastVisibleLabelHeight += (fbLabelWarning.Y2 - fbLabelWarning.Y1);
            LabelWarning.TraversalApplyAWinPos();
        }
        // End:0xD79
        if(LabelDivider.bVisible)
        {
            LabelDivider.AWinPos.Y1 = fbLabelDivider.Y1;
            LabelDivider.AWinPos.Y2 = fbLabelDivider.Y2;
            LabelDivider.AWinPos.Y1 -= (VLCHeight + ExtHeight);
            LabelDivider.AWinPos.Y2 -= (VLCHeight + ExtHeight);
            LastVisibleLabelHeight += float(LabelSpaceDivider);
            LabelDivider.AWinPos.Y1 += LastVisibleLabelHeight;
            LabelDivider.AWinPos.Y2 += LastVisibleLabelHeight;
            LastVisibleLabelHeight += (fbLabelDivider.Y2 - fbLabelDivider.Y1);
            LabelDivider.TraversalApplyAWinPos();
        }
        // End:0xE77
        if(EditName.bVisible)
        {
            EditName.AWinPos.Y1 = fbEditName.Y1;
            EditName.AWinPos.Y2 = fbEditName.Y2;
            EditName.AWinPos.Y1 -= (VLCHeight + ExtHeight);
            EditName.AWinPos.Y2 -= (VLCHeight + ExtHeight);
            LastVisibleLabelHeight += float(LabelSpaceEdit);
            EditName.AWinPos.Y1 += LastVisibleLabelHeight;
            EditName.AWinPos.Y2 += LastVisibleLabelHeight;
            LastVisibleLabelHeight += (fbEditName.Y2 - fbEditName.Y1);
            EditName.TraversalApplyAWinPos();
        }
        // End:0xF75
        if(MultiLineEditMsg.bVisible)
        {
            MultiLineEditMsg.AWinPos.Y1 = fbMultiLineEditMsg.Y1;
            MultiLineEditMsg.AWinPos.Y2 = fbMultiLineEditMsg.Y2;
            MultiLineEditMsg.AWinPos.Y1 -= (VLCHeight + ExtHeight);
            MultiLineEditMsg.AWinPos.Y2 -= (VLCHeight + ExtHeight);
            LastVisibleLabelHeight += float(LabelSpaceMultiLineEditMsg);
            MultiLineEditMsg.AWinPos.Y1 += LastVisibleLabelHeight;
            MultiLineEditMsg.AWinPos.Y2 += LastVisibleLabelHeight;
            LastVisibleLabelHeight += (fbMultiLineEditMsg.Y2 - fbMultiLineEditMsg.Y1);
            MultiLineEditMsg.TraversalApplyAWinPos();
        }
        // End:0x1073
        if(MultiLineEditMsg2.bVisible)
        {
            MultiLineEditMsg2.AWinPos.Y1 = fbMultiLineEditMsg2.Y1;
            MultiLineEditMsg2.AWinPos.Y2 = fbMultiLineEditMsg2.Y2;
            MultiLineEditMsg2.AWinPos.Y1 -= (VLCHeight + ExtHeight);
            MultiLineEditMsg2.AWinPos.Y2 -= (VLCHeight + ExtHeight);
            LastVisibleLabelHeight += float(LabelSpaceMultiLineEditMsg);
            MultiLineEditMsg2.AWinPos.Y1 += LastVisibleLabelHeight;
            MultiLineEditMsg2.AWinPos.Y2 += LastVisibleLabelHeight;
            LastVisibleLabelHeight += (fbMultiLineEditMsg2.Y2 - fbMultiLineEditMsg2.Y1);
            MultiLineEditMsg2.TraversalApplyAWinPos();
        }
        bStableText = true;
    }
    return TimeOutPreDraw(C);
    //return;    
}

function InsertSizeY(int halfsize, int halfy)
{
    local int i;

    halfsize /= float(2);
    i = 0;
    J0x12:

    // End:0x119 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x6C
        if(Controls[i].AWinPos.Y1 > float(halfy))
        {
            Controls[i].AWinPos.Y1 += float(halfsize);            
        }
        else
        {
            Controls[i].AWinPos.Y1 -= float(halfsize);
        }
        // End:0xD8
        if(Controls[i].AWinPos.Y2 > float(halfy))
        {
            Controls[i].AWinPos.Y2 += float(halfsize);            
        }
        else
        {
            Controls[i].AWinPos.Y2 -= float(halfsize);
        }
        Controls[i].TraversalApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function RemoveSizeY(int halfsize, int halfy)
{
    local int i;

    halfsize /= float(2);
    i = 0;
    J0x12:

    // End:0x119 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x6C
        if(Controls[i].AWinPos.Y1 > float(halfy))
        {
            Controls[i].AWinPos.Y1 -= float(halfsize);            
        }
        else
        {
            Controls[i].AWinPos.Y1 += float(halfsize);
        }
        // End:0xD8
        if(Controls[i].AWinPos.Y2 > float(halfy))
        {
            Controls[i].AWinPos.Y2 -= float(halfsize);            
        }
        else
        {
            Controls[i].AWinPos.Y2 += float(halfsize);
        }
        Controls[i].TraversalApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

static function bool ShowWindow(GUIController con, string Title, string Msg, optional string Warn, optional string btnOk, optional string btnCancel)
{
    // End:0x48
    if(con == none)
    {
        Log("[BTWindowAutoResizeHK::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xCD
    if(con.OpenMenu("GUIWarfareControls.BTWindowAutoResizeHK") == false)
    {
        Log("[BTWindowAutoResizeHK::ShowWindow] GUIController.OpenMenu Failed!");
        return false;
    }
    BTWindowAutoResizeHK(con.TopPage()).SetData(Title, Msg, Warn);
    // End:0x129
    if(btnOk == "")
    {
        btnOk = BTWindowAutoResizeHK(con.TopPage()).strOK;
    }
    // End:0x158
    if(btnCancel == "")
    {
        btnCancel = BTWindowAutoResizeHK(con.TopPage()).strCancel;
    }
    BTWindowAutoResizeHK(con.TopPage()).SetButtonCaption(btnOk, btnCancel);
    Log("[BTWindowAutoResizeHK::ShowWindow] Msg=" $ Msg);
    return true;
    //return;    
}

function ResizeWidth(int W)
{
    local int i, cw;
    local float bwperc;

    bwperc = float(W) / ((BackgroundImage.AWinPos.X2 - BackgroundImage.AWinPos.X1) - float(40));
    cw = int(float(int((BackgroundImage.AWinPos.X2 - BackgroundImage.AWinPos.X1) - float(40))) * bwperc);
    BackgroundImage.AWinPos.X1 += float(cw / 2);
    BackgroundImage.AWinPos.X2 -= float(cw / 2);
    cw = int(float(int(TopLine.AWinPos.X2 - TopLine.AWinPos.X1)) * bwperc);
    TopLine.AWinPos.X1 += float(cw / 2);
    TopLine.AWinPos.X2 -= float(cw / 2);
    cw = int(float(int(BottomLine.AWinPos.X2 - BottomLine.AWinPos.X1)) * bwperc);
    BottomLine.AWinPos.X1 += float(cw / 2);
    BottomLine.AWinPos.X2 -= float(cw / 2);
    cw = int(float(int(MultiLineEditMsg.AWinPos.X2 - MultiLineEditMsg.AWinPos.X1)) * bwperc);
    MultiLineEditMsg.AWinPos.X1 += float(cw / 2);
    MultiLineEditMsg.AWinPos.X2 -= float(cw / 2);
    cw = int(float(int(MultiLineEditMsg2.AWinPos.X2 - MultiLineEditMsg2.AWinPos.X1)) * bwperc);
    MultiLineEditMsg2.AWinPos.X1 += float(cw / 2);
    MultiLineEditMsg2.AWinPos.X2 -= float(cw / 2);
    cw = int(float(int(LabelDivider.AWinPos.X2 - LabelDivider.AWinPos.X1)) * bwperc);
    LabelDivider.AWinPos.X1 += float(cw / 2);
    LabelDivider.AWinPos.X2 -= float(cw / 2);
    cw = int(float(int(EditName.AWinPos.X2 - EditName.AWinPos.X1)) * bwperc);
    EditName.AWinPos.X1 += float(cw / 2);
    EditName.AWinPos.X2 -= float(cw / 2);
    cw = int(float(int(LabelWarning.AWinPos.X2 - LabelWarning.AWinPos.X1)) * bwperc);
    LabelWarning.AWinPos.X1 += float(cw / 2);
    LabelWarning.AWinPos.X2 -= float(cw / 2);
    i = 0;
    J0x422:

    // End:0x4CB [Loop If]
    if(i < 10)
    {
        cw = int(float(int(LabelInfo[i].AWinPos.X2 - LabelInfo[i].AWinPos.X1)) * bwperc);
        LabelInfo[i].AWinPos.X1 += float(cw / 2);
        LabelInfo[i].AWinPos.X2 -= float(cw / 2);
        i++;
        // [Loop Continue]
        goto J0x422;
    }
    TraversalApplyAWinPos();
    //return;    
}

defaultproperties
{
    fbLabelInfo=(X1=276.0000000,Y1=369.0000000,X2=749.0000000,Y2=390.0000000)
    fbLabelWarning=(X1=276.0000000,Y1=369.0000000,X2=749.0000000,Y2=390.0000000)
    fbLabelDivider=(X1=276.0000000,Y1=369.0000000,X2=749.0000000,Y2=371.0000000)
    fbEditName=(X1=282.0000000,Y1=369.0000000,X2=743.0000000,Y2=390.0000000)
    fbMultiLineEditMsg=(X1=282.0000000,Y1=369.0000000,X2=743.0000000,Y2=432.0000000)
    fbMultiLineEditMsg2=(X1=282.0000000,Y1=369.0000000,X2=743.0000000,Y2=406.0000000)
    fbButtonOK2=(X1=391.0000000,Y1=407.0000000,X2=510.0000000,Y2=438.0000000)
    fbButtonCancel2=(X1=515.0000000,Y1=407.0000000,X2=634.0000000,Y2=438.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=304.0000000,X2=779.0000000,Y2=464.0000000)
    fbTopLine=(X1=265.0000000,Y1=324.0000000,X2=759.0000000,Y2=350.0000000)
    fbBottomLine=(X1=265.0000000,Y1=401.0000000,X2=759.0000000,Y2=444.0000000)
    fbButtonOK=(X1=452.0000000,Y1=407.0000000,X2=570.0000000,Y2=438.0000000)
    fbButtonCancel=(X1=452.0000000,Y1=407.0000000,X2=570.0000000,Y2=438.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
    OnPreDraw=BTWindowAutoResizeHK.Internal_OnPreDraw
}