/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowInstantlyBuyHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:2
 *
 *******************************************************************************/
class BTWindowInstantlyBuyHK extends BTWindowHK
    editinlinenew
    instanced;

var string ItemName;
var int ItemID;
var int PartID;
var int Damage;
var int OverlapCount;
var int UniqueID;
var FloatBox fbItemInfoBox;
var export editinline BTItemInfoVertBoxHK ItemInfoBox;
var FloatBox fbSeparator;
var export editinline BTOwnerDrawImageHK Separator;
var FloatBox fbLabel[2];
var FloatBox fbEdit;
var export editinline BTOwnerDrawImageHK Label[2];
var export editinline BTOwnerDrawImageHK Edit;
var FloatBox fbNEditBox;
var export editinline BTNumericEditBoxHK NEditBox;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelWarning;
var export editinline BTOwnerDrawImageHK LabelWarning;
var localized string strLabel[2];
var localized string strLabelWarning[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ItemInfoBox = new class'BTItemInfoVertBoxHK';
    ItemInfoBox.bUseAWinPos = true;
    ItemInfoBox.AWinPos = fbItemInfoBox;
    ItemInfoBox.InitComponent(MyController, self);
    AppendComponent(ItemInfoBox);
    Separator = new class'BTOwnerDrawImageHK';
    Separator.bUseAWinPos = true;
    Separator.AWinPos = fbSeparator;
    Separator.BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    Separator.InitComponent(MyController, self);
    AppendComponent(Separator);
    i = 0;
    J0xdc:
    // End:0x1a1 [While If]
    if(i < 2)
    {
        Label[i] = new class'BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xdc;
    }
    Edit = new class'BTOwnerDrawImageHK';
    Edit.bUseAWinPos = true;
    Edit.AWinPos = fbEdit;
    Edit.CaptionPadding[2] = 5;
    Edit.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
    Edit.InitComponent(MyController, self);
    AppendComponent(Edit);
    NEditBox = new class'BTNumericEditBoxHK';
    NEditBox.bUseAWinPos = true;
    NEditBox.AWinPos = fbNEditBox;
    NEditBox.CaptionDrawType = 5;
    NEditBox.SetDefaultNonSelectFontColor();
    NEditBox.InitComponent(MyController, self);
    AppendComponent(NEditBox);
    NEditBox.bReadOnly = true;
    LabelWarning = new class'BTOwnerDrawImageHK';
    LabelWarning.bUseAWinPos = true;
    LabelWarning.AWinPos = fbLabelWarning;
    LabelWarning.CaptionDrawType = 0;
    LabelWarning.FontSize[0] = 8;
    LabelWarning.FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
    LabelWarning.InitComponent(MyController, self);
    AppendComponent(LabelWarning);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
}

function SetData(int MyPoint, int InstantlyPrice, int iUniqueID, int iItemID, int iPartID, int iDamage, int iOverlapCount)
{
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    UniqueID = iUniqueID;
    ItemID = iItemID;
    PartID = iPartID;
    Damage = iDamage;
    OverlapCount = iOverlapCount;
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = PartID;
    instanceInfo.OverlapCount = OverlapCount;
    instanceInfo.DamageDegree = Damage;
    ItemInfoBox.SetData(GameMgr.FindUIItem(ItemID), instanceInfo, none, none);
    ItemName = ItemInfoBox.ItemBoxView.itemBox.ItemInfo.ItemName;
    Label[1].Caption = ItemInfoBox.ItemBoxView.itemBox.ItemInfo.ItemName $ strLabel[1];
    NEditBox.SetData(InstantlyPrice);
    // End:0x18a
    if(Damage >= 51000)
    {
        LabelWarning.Caption = strLabelWarning[3];
    }
    // End:0x1f1
    else
    {
        // End:0x1b3
        if(Damage >= 31000)
        {
            LabelWarning.Caption = strLabelWarning[2];
        }
        // End:0x1f1
        else
        {
            // End:0x1db
            if(Damage >= 11000)
            {
                LabelWarning.Caption = strLabelWarning[1];
            }
            // End:0x1f1
            else
            {
                LabelWarning.Caption = strLabelWarning[0];
            }
        }
    }
}

defaultproperties
{
    fbItemInfoBox=(X1=333.0,Y1=165.0,X2=690.0,Y2=491.0)
    fbSeparator=(X1=341.0,Y1=494.0,X2=683.0,Y2=495.0)
    fbLabel[0]=(X1=344.0,Y1=510.0,X2=446.0,Y2=543.0)
    fbLabel[1]=(X1=344.0,Y1=544.0,X2=682.0,Y2=577.0)
    fbEdit=(X1=440.0,Y1=503.0,X2=683.0,Y2=529.0)
    fbNEditBox=(X1=446.0,Y1=509.0,X2=677.0,Y2=523.0)
    fbLabelWarning=(X1=341.0,Y1=571.0,X2=683.0,Y2=594.0)
    strLabel[0]="Buy-Now Price"
    strLabel[1]=" will be purchased immediately. Proceed?"
    strLabelWarning[1]="- The repair cost for this item is slightly higher due to its damage level."
    strLabelWarning[2]="- The repair cost for this item is high due to its damage level."
    strLabelWarning[3]="- The repair cost for this item is very high due to its damage level."
    fbBackgroundImage=(X1=313.0,Y1=118.0,X2=711.0,Y2=651.0)
    fbTopLine=(X1=333.0,Y1=138.0,X2=691.0,Y2=164.0)
    fbBottomLine=(X1=333.0,Y1=588.0,X2=691.0,Y2=631.0)
    fbButtonOK=(X1=390.0,Y1=594.0,X2=508.0,Y2=625.0)
    fbButtonCancel=(X1=514.0,Y1=594.0,X2=633.0,Y2=625.0)
    strTitle="Buy Now"
    strOK="Buy"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}