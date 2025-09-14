class BTWindowDisconnectGameHK extends BTWindowSelectHK
    editinlinenew
    instanced;

var localized string strLabelInfo;
var localized string strLabelInfo2;
var localized string strLabelInfo3;
var FloatBox fbLabelInfo2;
var export editinline BTOwnerDrawImageHK LabelInfo2;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    LabelInfo.Caption = strLabelInfo;
    LabelInfo2 = NewLabelComponent(fbLabelInfo2, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelInfo2.SetFontSizeAll(8);
    LabelInfo2.SetFontDrawType(0);
    LabelInfo2.FontColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
    // End:0xD3
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().kIsInPracticeChannel)
    {
        LabelInfo2.Caption = strLabelInfo3;        
    }
    else
    {
        LabelInfo2.Caption = strLabelInfo2;
    }
    //return;    
}

function Internal_OnOpen()
{
    bChangeText = true;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local FloatBox fbT, fbLI2;
    local float ratioX, ratioY, lW, tW, BW, maxW;

    // End:0x3FB
    if(bChangeText)
    {
        fbLI2 = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBox(C, LabelInfo2.Caption, LabelInfo2.CaptionDrawType, float(LabelInfo2.FontSize[0]), 0.0000000, 0.0000000, C.ClipX, C.ClipY);
        lW = (fbLI2.X2 - fbLI2.X1) * (1024.0000000 / C.ClipX);
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
        maxW = (maxW / float(2)) - ((fbLabelInfo2.X2 - fbLabelInfo2.X1) / float(2));
        LabelInfo2.AWinPos.X1 = fbLabelInfo2.X1 - maxW;
        LabelInfo2.AWinPos.X2 = fbLabelInfo2.X2 + maxW;
        LabelInfo2.ApplyAWinPos();
        fbLabelInfo.X1 = LabelInfo2.AWinPos.X1;
        fbLabelInfo.X2 = LabelInfo2.AWinPos.X2;
        LabelInfo.AWinPos = fbLabelInfo;
        LabelInfo.ApplyAWinPos();
        ratioX = 1024.0000000 / C.ClipX;
        ratioY = 768.0000000 / C.ClipY;
        fbTopLine.X1 = LabelInfo2.AWinPos.X1 - (float(10) * ratioX);
        fbTopLine.X2 = LabelInfo2.AWinPos.X2 + (float(10) * ratioX);
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

defaultproperties
{
    strLabelInfo="????????? ??????????? waiting room ???????????"
    strLabelInfo2="???????????????????????????????????????????????? ????????? 1 ??????????????????????????"
    strLabelInfo3="????????????????????????????????????????????????"
    fbLabelInfo2=(X1=274.0000000,Y1=381.0000000,X2=749.0000000,Y2=400.0000000)
    fbLabelInfo=(X1=276.0000000,Y1=360.0000000,X2=749.0000000,Y2=400.0000000)
    OnOpen=BTWindowDisconnectGameHK.Internal_OnOpen
    OnPreDraw=BTWindowDisconnectGameHK.Internal_OnPreDraw
}