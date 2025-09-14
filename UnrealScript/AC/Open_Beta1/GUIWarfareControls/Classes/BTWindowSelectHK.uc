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
    LabelInfo = NewLabelComponent(fbLabelInfo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelInfo.CaptionDrawType = 0;
    i = 0;
    J0x47:

    // End:0x74 [Loop If]
    if(i < 5)
    {
        LabelInfo.FontSize[i] = 9;
        i++;
        // [Loop Continue]
        goto J0x47;
    }
    //return;    
}

function SetData(string Title, int titlepadding, string Msg, optional string btnOk, optional string btnCancel)
{
    // End:0x17
    if(Title != "")
    {
        strTitle = Title;
    }
    // End:0x2E
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
    //return;    
}

static function ShowWindow(GUIController con, string Title, string Msg, optional string btnOk, optional string btnCancel)
{
    con.OpenMenu("GUIWarfareControls.BTWindowSelectHK");
    BTWindowSelectHK(con.TopPage()).SetData(Title, 5, Msg, btnOk, btnCancel);
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local FloatBox fbLI, fbT;
    local float lW, tW, BW, maxW, ratioX, ratioY;

    // End:0x39C
    if(bChangeText)
    {
        fbLI = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBox(C, LabelInfo.Caption, LabelInfo.CaptionDrawType, float(LabelInfo.FontSize[0]), 0.0000000, 0.0000000, C.ClipX, C.ClipY);
        lW = (fbLI.X2 - fbLI.X1) * (1024.0000000 / C.ClipX);
        fbT = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBox(C, TopLine.Caption, TopLine.CaptionDrawType, float(TopLine.FontSize[0]), 0.0000000, 0.0000000, C.ClipX, C.ClipY);
        tW = (fbT.X2 - fbT.X1) * (1024.0000000 / C.ClipX);
        tW = tW + float(TopLine.CaptionPadding[0]);
        BW = fbButtonCancel.X2 - fbButtonOK.X1;
        // End:0x1A3
        if(lW > tW)
        {
            maxW = lW;            
        }
        else
        {
            maxW = tW;
        }
        // End:0x1C8
        if(BW > maxW)
        {
            maxW = BW;
        }
        maxW = (maxW / float(2)) - ((fbLabelInfo.X2 - fbLabelInfo.X1) / float(2));
        LabelInfo.AWinPos.X1 = fbLabelInfo.X1 - maxW;
        LabelInfo.AWinPos.X2 = fbLabelInfo.X2 + maxW;
        LabelInfo.ApplyAWinPos();
        ratioX = 1024.0000000 / C.ClipX;
        ratioY = 768.0000000 / C.ClipY;
        fbTopLine.X1 = LabelInfo.AWinPos.X1 - (float(10) * ratioX);
        fbTopLine.X2 = LabelInfo.AWinPos.X2 + (float(10) * ratioX);
        fbBottomLine.X1 = fbTopLine.X1;
        fbBottomLine.X2 = fbTopLine.X2;
        fbBackgroundImage.X1 = fbTopLine.X1 - (float(21) * ratioX);
        fbBackgroundImage.X2 = fbTopLine.X2 + (float(21) * ratioX);
        fbBackgroundImage.Y1 = fbTopLine.Y1 - (float(21) * ratioY);
        fbBackgroundImage.Y2 = fbBottomLine.Y2 + (float(21) * ratioY);
        UpdateDefaultWindow();
        bChangeText = false;
    }
    return TimeOutPreDraw(C);
    //return;    
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    return true;
    //return;    
}

defaultproperties
{
    fbLabelInfo=(X1=276.0000000,Y1=369.0000000,X2=749.0000000,Y2=400.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=304.0000000,X2=779.0000000,Y2=464.0000000)
    fbTopLine=(X1=265.0000000,Y1=324.0000000,X2=759.0000000,Y2=350.0000000)
    fbBottomLine=(X1=265.0000000,Y1=401.0000000,X2=759.0000000,Y2=444.0000000)
    fbButtonOK=(X1=391.0000000,Y1=407.0000000,X2=510.0000000,Y2=438.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=407.0000000,X2=634.0000000,Y2=438.0000000)
    strTitle="Selection Window"
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
    OnPreDraw=BTWindowSelectHK.Internal_OnPreDraw
    OnKeyEvent=BTWindowSelectHK.Internal_OnKeyEvent
}