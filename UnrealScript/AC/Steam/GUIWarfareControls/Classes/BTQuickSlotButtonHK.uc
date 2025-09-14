/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTQuickSlotButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:1
 *
 *******************************************************************************/
class BTQuickSlotButtonHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strChangeName;
var localized string strConfirm;
var export editinline BTOwnerDrawImageHK LabelTop;
var export editinline BTOwnerDrawImageHK LabelBottom;
var export editinline BTEditBoxHK EditQS;
var export editinline BTOwnerDrawCaptionButtonHK ButtonQS;
var export editinline BTOwnerDrawCaptionButtonHK ButtonChangeName;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    ButtonQS = NewButtonComponent(AWinPos, 0.50);
    ButtonQS.SetDefaultButtonImage();
    ButtonQS.buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_quik_chang;
    ButtonChangeName = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(88), AWinPos.Y2 - float(26), AWinPos.X2 - float(6), AWinPos.Y2 - float(6)), 0.70);
    ButtonChangeName.SetDefaultMButtonImage();
    ButtonChangeName.SetFontSizeAll(9);
    EditQS = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(7), AWinPos.Y1 + float(7), AWinPos.X2 - float(7), AWinPos.Y2 - float(32)), 0.80));
    EditQS.bgImg = class'BTUIResourcePoolHK'.default.panel_5;
    LabelTop = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(7), AWinPos.Y1 + float(7), AWinPos.X2 - float(7), AWinPos.Y2 - float(32)), class'BTUIResourcePoolHK'.default.panel_5, 0.60);
    LabelBottom = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(13), AWinPos.Y2 - float(26), AWinPos.X2 - float(96), AWinPos.Y2 - float(6)), class'BTUIResourcePoolHK'.default.panel_5, 0.60);
}
