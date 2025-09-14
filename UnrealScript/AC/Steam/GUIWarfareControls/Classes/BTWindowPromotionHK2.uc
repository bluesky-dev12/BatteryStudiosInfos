/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowPromotionHK2.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:6
 *
 *******************************************************************************/
class BTWindowPromotionHK2 extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLevelUpItemEmpty;
var localized string strPoint;
var localized string strLabelTopLine;
var FloatBox fbLabelPromotion;
var export editinline BTLabelPromotionHK LabelPromotion;
var localized string strLabelContent;
var FloatBox fbLabelContent;
var export editinline BTOwnerDrawImageHK LabelContent;
var FloatBox fbLabelLevel;
var export editinline BTOwnerDrawImageHK LabelLevel;
var export editinline BTOwnerDrawImageHK LabelPoint;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ButtonOK.DisableMe();
    ButtonCancel.SetVisibility(false);
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strLabelTopLine;
    BottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    LabelPromotion = BTLabelPromotionHK(NewComponent(new class'BTLabelPromotionHK', fbLabelPromotion, 0.990));
    LabelPromotion.BackgroundImage = class'BTUIResourcePoolHK'.default.img_promot_Scale;
    LabelPromotion.__OnStartPhase__Delegate = LabelPromotion_OnStartPhase;
    LabelPromotion.__OnEndPhase__Delegate = LabelPromotion_OnEndPhase;
    LabelContent = NewLabelComponent(fbLabelContent, class'BTUIResourcePoolHK'.default.empty);
    LabelContent.SetFontSizeAll(12);
    LabelContent.CaptionDrawType = 0;
    LabelContent.Caption = strLabelContent;
    LabelLevel = NewLabelComponent(fbLabelLevel, class'BTUIResourcePoolHK'.default.empty);
}

function SetData(int Level)
{
    LabelLevel.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    PlayerOwner().Level.GameMgr.GetLevelImage(Level, 0, LabelLevel.BackgroundImage);
    LabelPromotion.StartShow();
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(sound'ui_result_level_up', 6, 1.0);
}

function LabelPromotion_OnStartPhase(int Phase)
{
    // End:0x1a
    if(Phase == 1)
    {
        ButtonOK.EnableMe();
    }
}

function LabelPromotion_OnEndPhase(int Phase);
function SetPromotionItem(int Exp)
{
    BackgroundImage.Caption = "";
}

defaultproperties
{
    strLevelUpItemEmpty="There is no reward for the promotion."
    strPoint="Points"
    strLabelTopLine="Promotion"
    fbLabelPromotion=(X1=428.0,Y1=140.0,X2=606.0,Y2=324.0)
    strLabelContent="Congratulations on your promotion."
    fbLabelContent=(X1=454.0,Y1=365.0,X2=1024.0,Y2=768.0)
    fbLabelLevel=(X1=415.0,Y1=360.0,X2=1024.0,Y2=768.0)
    fbBackgroundImage=(X1=-20.0,Y1=294.0,X2=1044.0,Y2=474.0)
    fbTopLine=(X1=0.0,Y1=314.0,X2=1024.0,Y2=340.0)
    fbBottomLine=(X1=0.0,Y1=411.0,X2=1024.0,Y2=454.0)
    fbButtonOK=(X1=395.0,Y1=416.0,X2=629.0,Y2=448.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    OnOpen=Internal_OnOpen
}