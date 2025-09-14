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
var() automated FloatBox fbLabelWarning;
var export editinline BTOwnerDrawImageHK LabelWarning;
var localized string strLabel[2];
var localized string strLabelWarning[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ItemInfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoVertBoxHK';
    ItemInfoBox.bUseAWinPos = true;
    ItemInfoBox.AWinPos = fbItemInfoBox;
    ItemInfoBox.InitComponent(MyController, self);
    AppendComponent(ItemInfoBox);
    Separator = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    Separator.bUseAWinPos = true;
    Separator.AWinPos = fbSeparator;
    Separator.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Separator.InitComponent(MyController, self);
    AppendComponent(Separator);
    i = 0;
    J0xDC:

    // End:0x1A1 [Loop If]
    if(i < 2)
    {
        Label[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        i++;
        // [Loop Continue]
        goto J0xDC;
    }
    Edit = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    Edit.bUseAWinPos = true;
    Edit.AWinPos = fbEdit;
    Edit.CaptionPadding[2] = 5;
    Edit.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    Edit.InitComponent(MyController, self);
    AppendComponent(Edit);
    NEditBox = new Class'GUIWarfareControls_Decompressed.BTNumericEditBoxHK';
    NEditBox.bUseAWinPos = true;
    NEditBox.AWinPos = fbNEditBox;
    NEditBox.CaptionDrawType = 5;
    NEditBox.SetDefaultNonSelectFontColor();
    NEditBox.InitComponent(MyController, self);
    AppendComponent(NEditBox);
    NEditBox.bReadOnly = true;
    LabelWarning = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelWarning.bUseAWinPos = true;
    LabelWarning.AWinPos = fbLabelWarning;
    LabelWarning.CaptionDrawType = 0;
    LabelWarning.FontSize[0] = 8;
    LabelWarning.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
    LabelWarning.InitComponent(MyController, self);
    AppendComponent(LabelWarning);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    //return;    
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
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = PartID;
    instanceInfo.OverlapCount = OverlapCount;
    instanceInfo.DamageDegree = Damage;
    ItemInfoBox.SetData(GameMgr.FindUIItem(ItemID), instanceInfo, none, none);
    ItemName = ItemInfoBox.ItemBoxView.itemBox.ItemInfo.ItemName;
    Label[1].Caption = ItemInfoBox.ItemBoxView.itemBox.ItemInfo.ItemName $ strLabel[1];
    NEditBox.SetData(InstantlyPrice);
    // End:0x18A
    if(Damage >= 51000)
    {
        LabelWarning.Caption = strLabelWarning[3];        
    }
    else
    {
        // End:0x1B3
        if(Damage >= 31000)
        {
            LabelWarning.Caption = strLabelWarning[2];            
        }
        else
        {
            // End:0x1DB
            if(Damage >= 11000)
            {
                LabelWarning.Caption = strLabelWarning[1];                
            }
            else
            {
                LabelWarning.Caption = strLabelWarning[0];
            }
        }
    }
    //return;    
}

defaultproperties
{
    fbItemInfoBox=(X1=333.0000000,Y1=165.0000000,X2=690.0000000,Y2=491.0000000)
    fbSeparator=(X1=341.0000000,Y1=494.0000000,X2=683.0000000,Y2=495.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=510.0000000,X2=446.0000000,Y2=543.0000000)
    fbLabel[1]=(X1=344.0000000,Y1=544.0000000,X2=682.0000000,Y2=577.0000000)
    fbEdit=(X1=440.0000000,Y1=503.0000000,X2=683.0000000,Y2=529.0000000)
    fbNEditBox=(X1=446.0000000,Y1=509.0000000,X2=677.0000000,Y2=523.0000000)
    fbLabelWarning=(X1=341.0000000,Y1=571.0000000,X2=683.0000000,Y2=594.0000000)
    strLabel[0]="?????????????"
    strLabel[1]="??????????????????"
    strLabelWarning[1]="????????????????????????????????????????"
    strLabelWarning[2]="????????????????????????????????????????"
    strLabelWarning[3]="???????????????????????????????????????????"
    fbBackgroundImage=(X1=313.0000000,Y1=118.0000000,X2=711.0000000,Y2=651.0000000)
    fbTopLine=(X1=333.0000000,Y1=138.0000000,X2=691.0000000,Y2=164.0000000)
    fbBottomLine=(X1=333.0000000,Y1=588.0000000,X2=691.0000000,Y2=631.0000000)
    fbButtonOK=(X1=390.0000000,Y1=594.0000000,X2=508.0000000,Y2=625.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=594.0000000,X2=633.0000000,Y2=625.0000000)
    strTitle="?????????"
    strOK="????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}