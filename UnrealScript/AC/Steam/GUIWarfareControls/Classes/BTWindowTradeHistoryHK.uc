/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowTradeHistoryHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:2
 *
 *******************************************************************************/
class BTWindowTradeHistoryHK extends BTWindowHK
    editinlinenew
    instanced;

var int ItemID;
var FloatBox fbItemBox;
var export editinline BTItemBoxButtonHK itemBox;
var export editinline BTOwnerDrawImageHK LabelTradeBG;
var export editinline BTOwnerDrawImageHK LabelTradeDivider[2];
var FloatBox fbButtonTrade[3];
var localized string strButtonTrade[3];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTrade[3];
var FloatBox fbACLTradeHistory;
var export editinline BTACLTradeHistoryHK ACLTradeHistory;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    itemBox = new class'BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(9);
    ACLTradeHistory = new class'BTACLTradeHistoryHK';
    ACLTradeHistory.bUseAWinPos = true;
    ACLTradeHistory.AWinPos = fbACLTradeHistory;
    ACLTradeHistory.InitComponent(MyController, self);
    AppendComponent(ACLTradeHistory);
    i = 0;
    J0xf3:
    // End:0x2e3 [While If]
    if(i < 3)
    {
        ButtonTrade[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonTrade[i].bUseAWinPos = true;
        ButtonTrade[i].AWinPos = fbButtonTrade[i];
        ButtonTrade[i].SetDefaultListButtonImage();
        ButtonTrade[i].SetDefaultListTopButtonFontColor();
        ButtonTrade[i].SetFontSizeAll(10);
        ButtonTrade[i].Caption = strButtonTrade[i];
        ButtonTrade[i].InitComponent(MyController, self);
        AppendComponent(ButtonTrade[i]);
        // End:0x2d9
        if(i < 2)
        {
            LabelTradeDivider[i] = new class'BTOwnerDrawImageHK';
            LabelTradeDivider[i].bUseAWinPos = true;
            LabelTradeDivider[i].AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(fbButtonTrade[i].X2 - float(1), fbButtonTrade[i].Y1 + float(4), fbButtonTrade[i].X2 + float(1), fbButtonTrade[i].Y2 - float(4));
            LabelTradeDivider[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_list_divid;
            LabelTradeDivider[i].InitComponent(MyController, self);
            AppendComponent(LabelTradeDivider[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf3;
    }
    LabelTradeBG = new class'BTOwnerDrawImageHK';
    LabelTradeBG.bUseAWinPos = true;
    LabelTradeBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(fbButtonTrade[0].X1, fbButtonTrade[0].Y1, fbButtonTrade[2].X2, fbButtonTrade[2].Y2);
    LabelTradeBG.BackgroundImage = class'BTUIResourcePoolHK'.default.butt_list_n;
    LabelTradeBG.InitComponent(MyController, self);
    AppendComponent(LabelTradeBG);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
}

function SetData(int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = PartID;
    itemBox.SetData(GameMgr.FindUIItem(ItemID), instanceInfo);
    i = 0;
    J0x81:
    // End:0xdc [While If]
    if(i < SellerCharNm.Length)
    {
        ACLTradeHistory.AddItem(SellerCharNm[i], DamageDegree[i], class'BTCustomDrawHK'.static.ToWonString(string(Price[i])));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x81;
    }
}

defaultproperties
{
    fbItemBox=(X1=395.0,Y1=172.0,X2=630.0,Y2=284.0)
    fbButtonTrade[0]=(X1=333.0,Y1=293.0,X2=450.0,Y2=320.0)
    fbButtonTrade[1]=(X1=450.0,Y1=293.0,X2=570.0,Y2=320.0)
    fbButtonTrade[2]=(X1=570.0,Y1=293.0,X2=692.0,Y2=320.0)
    strButtonTrade[0]="Seller"
    strButtonTrade[1]="Damage Level"
    strButtonTrade[2]="Sale Price"
    fbACLTradeHistory=(X1=333.0,Y1=320.0,X2=692.0,Y2=581.0)
    fbBackgroundImage=(X1=313.0,Y1=118.0,X2=712.0,Y2=652.0)
    fbTopLine=(X1=333.0,Y1=138.0,X2=692.0,Y2=165.0)
    fbBottomLine=(X1=333.0,Y1=588.0,X2=692.0,Y2=632.0)
    fbButtonOK=(X1=452.0,Y1=594.0,X2=572.0,Y2=627.0)
    strTitle="Market Price"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}