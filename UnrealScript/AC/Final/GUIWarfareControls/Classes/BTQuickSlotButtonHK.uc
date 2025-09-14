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
    super.InitComponent(MyController, myOwner);
    ButtonQS = NewButtonComponent(AWinPos, 0.5000000);
    ButtonQS.SetDefaultButtonImage();
    ButtonQS.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_chang;
    ButtonChangeName = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(88), AWinPos.Y2 - float(26), AWinPos.X2 - float(6), AWinPos.Y2 - float(6)), 0.7000000);
    ButtonChangeName.SetDefaultMButtonImage();
    ButtonChangeName.SetFontSizeAll(9);
    EditQS = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(7), AWinPos.Y1 + float(7), AWinPos.X2 - float(7), AWinPos.Y2 - float(32)), 0.8000000));
    EditQS.bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    LabelTop = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(7), AWinPos.Y1 + float(7), AWinPos.X2 - float(7), AWinPos.Y2 - float(32)), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5, 0.6000000);
    LabelBottom = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(13), AWinPos.Y2 - float(26), AWinPos.X2 - float(96), AWinPos.Y2 - float(6)), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5, 0.6000000);
    //return;    
}
