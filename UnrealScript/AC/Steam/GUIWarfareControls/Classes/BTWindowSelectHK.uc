/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowSelectHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:5
 *
 *******************************************************************************/
class BTWindowSelectHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bChangeText;
var FloatBox fbLabelInfo;
var export editinline BTOwnerDrawImageHK LabelInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    LabelInfo = NewLabelComponent(fbLabelInfo, class'BTUIResourcePoolHK'.default.empty);
    LabelInfo.CaptionDrawType = 0;
    i = 0;
    J0x47:
    // End:0x74 [While If]
    if(i < 5)
    {
        LabelInfo.FontSize[i] = 9;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
}

function SetData(string Title, int titlepadding, string Msg, optional string btnOk, optional string btnCancel)
{
    // End:0x17
    if(Title != "")
    {
        strTitle = Title;
    }
    // End:0x2e
    if(btnOk != "")
    {
        strOK = btnOk;
    }
    // End:0x45
    if(btnCancel != "")
    {
        strCancel = btnCancel;
    }
    LabelInfo.Caption = Msg;
    LabelInfo.SetDefaultFontColor();
    TopLine.CaptionPadding[0] = titlepadding;
    self.UpdateDefaultWindow();
    bChangeText = true;
}

static function ShowWindow(GUIController con, string Title, string Msg, optional string btnOk, optional string btnCancel)
{
    con.OpenMenu("GUIWarfareControls.BTWindowSelectHK");
    BTWindowSelectHK(con.TopPage()).SetData(Title, 5, Msg, btnOk, btnCancel);
}

function bool Internal_OnPreDraw(Canvas C)
{
    local FloatBox fbLI, fbT;
    local float lW, tW, BW, maxW, ratioX, ratioY;

    // End:0x39c
    if(bChangeText)
    {
        fbLI = class'BTCustomDrawHK'.static.GetDrawStringFloatBox(C, LabelInfo.Caption, LabelInfo.CaptionDrawType, float(LabelInfo.FontSize[0]), 0.0, 0.0, C.ClipX, C.ClipY);
        lW = fbLI.X2 - fbLI.X1 * 1024.0 / C.ClipX;
        fbT = class'BTCustomDrawHK'.static.GetDrawStringFloatBox(C, TopLine.Caption, TopLine.CaptionDrawType, float(TopLine.FontSize[0]), 0.0, 0.0, C.ClipX, C.ClipY);
        tW = fbT.X2 - fbT.X1 * 1024.0 / C.ClipX;
        tW = tW + float(TopLine.CaptionPadding[0]);
        BW = fbButtonCancel.X2 - fbButtonOK.X1;
        // End:0x1a3
        if(lW > tW)
        {
            maxW = lW;
        }
        // End:0x1ae
        else
        {
            maxW = tW;
        }
        // End:0x1c8
        if(BW > maxW)
        {
            maxW = BW;
        }
        maxW = maxW / float(2) - fbLabelInfo.X2 - fbLabelInfo.X1 / float(2);
        LabelInfo.AWinPos.X1 = fbLabelInfo.X1 - maxW;
        LabelInfo.AWinPos.X2 = fbLabelInfo.X2 + maxW;
        LabelInfo.ApplyAWinPos();
        ratioX = 1024.0 / C.ClipX;
        ratioY = 768.0 / C.ClipY;
        fbTopLine.X1 = LabelInfo.AWinPos.X1 - float(10) * ratioX;
        fbTopLine.X2 = LabelInfo.AWinPos.X2 + float(10) * ratioX;
        fbBottomLine.X1 = fbTopLine.X1;
        fbBottomLine.X2 = fbTopLine.X2;
        fbBackgroundImage.X1 = fbTopLine.X1 - float(21) * ratioX;
        fbBackgroundImage.X2 = fbTopLine.X2 + float(21) * ratioX;
        fbBackgroundImage.Y1 = fbTopLine.Y1 - float(21) * ratioY;
        fbBackgroundImage.Y2 = fbBottomLine.Y2 + float(21) * ratioY;
        UpdateDefaultWindow();
        bChangeText = false;
    }
    return TimeOutPreDraw(C);
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    return true;
}

defaultproperties
{
    fbLabelInfo=(X1=276.0,Y1=369.0,X2=749.0,Y2=400.0)
    fbBackgroundImage=(X1=245.0,Y1=304.0,X2=779.0,Y2=464.0)
    fbTopLine=(X1=265.0,Y1=324.0,X2=759.0,Y2=350.0)
    fbBottomLine=(X1=265.0,Y1=401.0,X2=759.0,Y2=444.0)
    fbButtonOK=(X1=391.0,Y1=407.0,X2=510.0,Y2=438.0)
    fbButtonCancel=(X1=515.0,Y1=407.0,X2=634.0,Y2=438.0)
    strTitle="Selection Window"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.10
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    WinTop=0.250
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.40
    OnPreDraw=Internal_OnPreDraw
    OnKeyEvent=Internal_OnKeyEvent
}