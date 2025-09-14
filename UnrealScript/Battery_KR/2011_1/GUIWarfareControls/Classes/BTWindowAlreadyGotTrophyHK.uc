class BTWindowAlreadyGotTrophyHK extends BTWindowSelectHK
    editinlinenew
    instanced;

var localized string strLabelInfo;
var localized string strLabelInfo2;
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
    LabelInfo2.Caption = strLabelInfo2;
    //return;    
}

function Internal_OnOpen()
{
    local PlayerController PC;

    PC = PlayerOwner();
    BackgroundImage.ApplyAWinPos();
    LabelInfo.ApplyAWinPos();
    LabelInfo2.ApplyAWinPos();
    TopLine.ApplyAWinPos();
    BottomLine.ApplyAWinPos();
    ButtonOK.ApplyAWinPos();
    ButtonCancel.ApplyAWinPos();
    //return;    
}

defaultproperties
{
    strLabelInfo="?? ???? ?? ?????? ???? ???????."
    strLabelInfo2="-???? ??? 2?? ??? ? ????."
    fbLabelInfo2=(X1=274.0000000,Y1=381.0000000,X2=749.0000000,Y2=400.0000000)
    fbLabelInfo=(X1=276.0000000,Y1=360.0000000,X2=749.0000000,Y2=400.0000000)
    strOK="???"
    strCancel="??"
    OnOpen=BTWindowAlreadyGotTrophyHK.Internal_OnOpen
}