class BTWindowCapsuleReward extends BTWindowItemBoxHK
    editinlinenew
    instanced;

var() automated FloatBox fbLabelHeaderDesc;
var() automated FloatBox fbLabelDesc;
var export editinline BTOwnerDrawImageHK LabelHeaderDesc;
var export editinline BTOwnerDrawImageHK LabelDesc;
var localized string strRewardTitle[2];
var localized string strLabelHeaderDesc;
var localized string strLabelDesc;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BGDeco_Capsule_Reward;
    TopLine.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
    TopLine.SetFontSizeAll(11);
    TopLine.SetFontDrawType(4);
    LabelHeaderDesc = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelHeaderDesc, 0.5000000));
    LabelHeaderDesc.Caption = strLabelHeaderDesc;
    LabelHeaderDesc.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
    LabelHeaderDesc.SetFontSizeAll(9);
    LabelHeaderDesc.SetFontDrawType(4);
    LabelDesc = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelDesc, 0.5000000));
    LabelDesc.Caption = strLabelDesc;
    LabelDesc.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    LabelDesc.SetFontSizeAll(9);
    LabelDesc.SetFontDrawType(4);
    TPItemList.ItemList.SetItemCountPerPage(2, 3);
    InfoBox.Hide();
    //return;    
}

function SetFromContent(int _from)
{
    super.SetFromContent(_from);
    TopLine.Caption = strRewardTitle[_from - 1];
    //return;    
}

defaultproperties
{
    fbLabelHeaderDesc=(X1=258.0000000,Y1=219.0000000,X2=771.0000000,Y2=234.0000000)
    fbLabelDesc=(X1=304.0000000,Y1=432.0000000,X2=720.0000000,Y2=447.0000000)
    strRewardTitle[0]="Receive ticket reward"
    strRewardTitle[1]="Receive ticket reward"
    strLabelHeaderDesc="Please select one reward item."
    strLabelDesc="Have you selected the reward you wish to receive?"
    fbTPItemList=(X1=256.0000000,Y1=241.0000000,X2=769.0000000,Y2=415.0000000)
    fbLabelDivider=(X1=0.0000000,Y1=0.0000000,X2=0.0000000,Y2=0.0000000)
    fbInfoBox=(X1=0.0000000,Y1=0.0000000,X2=0.0000000,Y2=0.0000000)
    fbBackgroundImage=(X1=178.0000000,Y1=181.0000000,X2=847.0000000,Y2=511.0000000)
    fbTopLine=(X1=403.0000000,Y1=187.0000000,X2=621.0000000,Y2=202.0000000)
    fbButtonOK=(X1=389.0000000,Y1=464.0000000,X2=513.0000000,Y2=501.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=464.0000000,X2=639.0000000,Y2=501.0000000)
}