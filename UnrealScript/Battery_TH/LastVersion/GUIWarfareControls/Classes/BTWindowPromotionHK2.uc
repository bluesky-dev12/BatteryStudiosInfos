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
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    TopLine.CaptionDrawType = 4;
    TopLine.Caption = strLabelTopLine;
    BottomLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    LabelPromotion = BTLabelPromotionHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelPromotionHK', fbLabelPromotion, 0.9900000));
    LabelPromotion.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_promot_Scale;
    LabelPromotion.__OnStartPhase__Delegate = LabelPromotion_OnStartPhase;
    LabelPromotion.__OnEndPhase__Delegate = LabelPromotion_OnEndPhase;
    LabelContent = NewLabelComponent(fbLabelContent, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelContent.SetFontSizeAll(12);
    LabelContent.CaptionDrawType = 0;
    LabelContent.Caption = strLabelContent;
    LabelLevel = NewLabelComponent(fbLabelLevel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    //return;    
}

function SetData(int Level)
{
    LabelLevel.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    PlayerOwner().Level.GameMgr.GetLevelImage(Level, 0, LabelLevel.BackgroundImage);
    LabelPromotion.StartShow();
    //return;    
}

function Internal_OnOpen()
{
    PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Result/level_up",,, 6);
    //return;    
}

function LabelPromotion_OnStartPhase(int Phase)
{
    // End:0x1A
    if(Phase == 1)
    {
        ButtonOK.EnableMe();
    }
    //return;    
}

function LabelPromotion_OnEndPhase(int Phase)
{
    //return;    
}

function SetPromotionItem(int Exp)
{
    BackgroundImage.Caption = "";
    //return;    
}

defaultproperties
{
    strLevelUpItemEmpty="???????????????????????????"
    strPoint="BP"
    strLabelTopLine="??????????"
    fbLabelPromotion=(X1=428.0000000,Y1=140.0000000,X2=606.0000000,Y2=324.0000000)
    strLabelContent="????????????????????"
    fbLabelContent=(X1=454.0000000,Y1=365.0000000,X2=1024.0000000,Y2=768.0000000)
    fbLabelLevel=(X1=415.0000000,Y1=360.0000000,X2=1024.0000000,Y2=768.0000000)
    fbBackgroundImage=(X1=-20.0000000,Y1=294.0000000,X2=1044.0000000,Y2=474.0000000)
    fbTopLine=(X1=0.0000000,Y1=314.0000000,X2=1024.0000000,Y2=340.0000000)
    fbBottomLine=(X1=0.0000000,Y1=411.0000000,X2=1024.0000000,Y2=454.0000000)
    fbButtonOK=(X1=395.0000000,Y1=416.0000000,X2=629.0000000,Y2=448.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    OnOpen=BTWindowPromotionHK2.Internal_OnOpen
}