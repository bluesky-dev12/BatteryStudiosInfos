/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowAlreadyGotTrophyHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
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
    LabelInfo2 = NewLabelComponent(fbLabelInfo2, class'BTUIResourcePoolHK'.default.empty);
    LabelInfo2.SetFontSizeAll(8);
    LabelInfo2.SetFontDrawType(0);
    LabelInfo2.FontColor[0] = class'BTUIColorPoolHK'.static.LabelWarning();
    LabelInfo2.Caption = strLabelInfo2;
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
}

defaultproperties
{
    strLabelInfo="You already have this loot item. Stored in the Mailbox instead."
    strLabelInfo2="- You may only have up to 2 loot items of the same kind."
    fbLabelInfo2=(X1=274.0,Y1=381.0,X2=749.0,Y2=400.0)
    fbLabelInfo=(X1=276.0,Y1=360.0,X2=749.0,Y2=400.0)
    strOK="Mailbox"
    strCancel="OK"
    OnOpen=Internal_OnOpen
}