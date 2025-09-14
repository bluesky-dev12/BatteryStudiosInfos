class BTWindowTenderHK extends BTWindowHK
    editinlinenew
    instanced;

var string ItemName;
var int ItemID;
var int PartID;
var int Damage;
var int OverlapCount;
var int UniqueID;
var int MyTender;
var int MaxPrice;
var FloatBox fbItemInfoBox;
var export editinline BTItemInfoVertBoxHK ItemInfoBox;
var FloatBox fbSeparator;
var export editinline BTOwnerDrawImageHK Separator;
var FloatBox fbLabel[2];
var FloatBox fbEdit[2];
var export editinline BTOwnerDrawImageHK Label[2];
var export editinline BTOwnerDrawImageHK Edit[2];
var FloatBox fbNEditBox[2];
var export editinline BTNumericEditBoxHK NEditBox[2];
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
    ItemInfoBox.ItemBoxView.itemBox.ChangeState(9);
    Separator = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    Separator.bUseAWinPos = true;
    Separator.AWinPos = fbSeparator;
    Separator.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Separator.InitComponent(MyController, self);
    AppendComponent(Separator);
    i = 0;
    J0xFF:

    // End:0x1C4 [Loop If]
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
        goto J0xFF;
    }
    i = 0;
    J0x1CB:

    // End:0x2C7 [Loop If]
    if(i < 2)
    {
        Edit[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Edit[i].bUseAWinPos = true;
        Edit[i].AWinPos = fbEdit[i];
        Edit[i].CaptionPadding[2] = 5;
        // End:0x26E
        if(i == 0)
        {
            Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;            
        }
        else
        {
            Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
        }
        Edit[i].InitComponent(MyController, self);
        AppendComponent(Edit[i]);
        i++;
        // [Loop Continue]
        goto J0x1CB;
    }
    i = 0;
    J0x2CE:

    // End:0x388 [Loop If]
    if(i < 2)
    {
        NEditBox[i] = new Class'GUIWarfareControls_Decompressed.BTNumericEditBoxHK';
        NEditBox[i].bUseAWinPos = true;
        NEditBox[i].AWinPos = fbNEditBox[i];
        NEditBox[i].CaptionDrawType = 5;
        NEditBox[i].SetDefaultNonSelectFontColor();
        NEditBox[i].InitComponent(MyController, self);
        AppendComponent(NEditBox[i]);
        i++;
        // [Loop Continue]
        goto J0x2CE;
    }
    NEditBox[0].bReadOnly = true;
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
    NEditBox[1].FocusFirst(none);
    //return;    
}

function SetData(int MyPoint, int InstantlyPrice, int iUniqueID, int iItemID, int iPartID, int iDamage, float CurrentTender, string HightestBidUser, int iOverlapCount)
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
    NEditBox[0].SetData(int(CurrentTender));
    // End:0x161
    if(HightestBidUser == "")
    {
        NEditBox[1].SetData(int(CurrentTender));
        NEditBox[1].MinValue = int(CurrentTender);        
    }
    else
    {
        NEditBox[1].SetData(int((CurrentTender * 1.0500000) + 0.5000000));
        NEditBox[1].MinValue = int((CurrentTender * 1.0500000) + 0.5000000);
    }
    // End:0x1CA
    if(MyPoint < InstantlyPrice)
    {
        MaxPrice = MyPoint;        
    }
    else
    {
        MaxPrice = InstantlyPrice;
    }
    NEditBox[1].MaxValue = MaxPrice;
    // End:0x214
    if(Damage >= 51000)
    {
        LabelWarning.Caption = strLabelWarning[3];        
    }
    else
    {
        // End:0x23D
        if(Damage >= 31000)
        {
            LabelWarning.Caption = strLabelWarning[2];            
        }
        else
        {
            // End:0x265
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

function Internal_OnRendered(Canvas C)
{
    // End:0x32
    if(int(NEditBox[1].OriginalStr) > MaxPrice)
    {
        NEditBox[1].SetData(MaxPrice);
    }
    MyTender = int(NEditBox[1].OriginalStr);
    //return;    
}

function Internal_OnOpen()
{
    NEditBox[1].SetData(0);
    //return;    
}

defaultproperties
{
    fbItemInfoBox=(X1=333.0000000,Y1=165.0000000,X2=690.0000000,Y2=491.0000000)
    fbSeparator=(X1=341.0000000,Y1=494.0000000,X2=683.0000000,Y2=495.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=510.0000000,X2=446.0000000,Y2=543.0000000)
    fbLabel[1]=(X1=344.0000000,Y1=544.0000000,X2=446.0000000,Y2=577.0000000)
    fbEdit[0]=(X1=440.0000000,Y1=503.0000000,X2=683.0000000,Y2=529.0000000)
    fbEdit[1]=(X1=440.0000000,Y1=537.0000000,X2=683.0000000,Y2=563.0000000)
    fbNEditBox[0]=(X1=446.0000000,Y1=509.0000000,X2=677.0000000,Y2=523.0000000)
    fbNEditBox[1]=(X1=446.0000000,Y1=543.0000000,X2=677.0000000,Y2=557.0000000)
    fbLabelWarning=(X1=341.0000000,Y1=571.0000000,X2=683.0000000,Y2=594.0000000)
    strLabel[0]="??????????????????"
    strLabel[1]="??????????"
    strLabelWarning[1]="????????????????????????????????????????"
    strLabelWarning[2]="????????????????????????????????????????"
    strLabelWarning[3]="???????????????????????????????????????????"
    fbBackgroundImage=(X1=313.0000000,Y1=118.0000000,X2=711.0000000,Y2=651.0000000)
    fbTopLine=(X1=333.0000000,Y1=138.0000000,X2=691.0000000,Y2=164.0000000)
    fbBottomLine=(X1=333.0000000,Y1=588.0000000,X2=691.0000000,Y2=631.0000000)
    fbButtonOK=(X1=390.0000000,Y1=594.0000000,X2=508.0000000,Y2=625.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=594.0000000,X2=633.0000000,Y2=625.0000000)
    strTitle="??????"
    strOK="??????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowTenderHK.Internal_OnOpen
    OnRendered=BTWindowTenderHK.Internal_OnRendered
}