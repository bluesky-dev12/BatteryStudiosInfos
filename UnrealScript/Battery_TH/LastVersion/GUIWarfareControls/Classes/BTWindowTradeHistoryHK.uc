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
    itemBox = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(9);
    ACLTradeHistory = new Class'GUIWarfareControls_Decompressed.BTACLTradeHistoryHK';
    ACLTradeHistory.bUseAWinPos = true;
    ACLTradeHistory.AWinPos = fbACLTradeHistory;
    ACLTradeHistory.InitComponent(MyController, self);
    AppendComponent(ACLTradeHistory);
    i = 0;
    J0xF3:

    // End:0x2E3 [Loop If]
    if(i < 3)
    {
        ButtonTrade[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonTrade[i].bUseAWinPos = true;
        ButtonTrade[i].AWinPos = fbButtonTrade[i];
        ButtonTrade[i].SetDefaultListButtonImage();
        ButtonTrade[i].SetDefaultListTopButtonFontColor();
        ButtonTrade[i].SetFontSizeAll(10);
        ButtonTrade[i].Caption = strButtonTrade[i];
        ButtonTrade[i].InitComponent(MyController, self);
        AppendComponent(ButtonTrade[i]);
        // End:0x2D9
        if(i < 2)
        {
            LabelTradeDivider[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
            LabelTradeDivider[i].bUseAWinPos = true;
            LabelTradeDivider[i].AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbButtonTrade[i].X2 - float(1), fbButtonTrade[i].Y1 + float(4), fbButtonTrade[i].X2 + float(1), fbButtonTrade[i].Y2 - float(4));
            LabelTradeDivider[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_list_divid;
            LabelTradeDivider[i].InitComponent(MyController, self);
            AppendComponent(LabelTradeDivider[i]);
        }
        i++;
        // [Loop Continue]
        goto J0xF3;
    }
    LabelTradeBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelTradeBG.bUseAWinPos = true;
    LabelTradeBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbButtonTrade[0].X1, fbButtonTrade[0].Y1, fbButtonTrade[2].X2, fbButtonTrade[2].Y2);
    LabelTradeBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_n;
    LabelTradeBG.InitComponent(MyController, self);
    AppendComponent(LabelTradeBG);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    //return;    
}

function SetData(int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = PartID;
    itemBox.SetData(GameMgr.FindUIItem(ItemID), instanceInfo);
    i = 0;
    J0x81:

    // End:0xDC [Loop If]
    if(i < SellerCharNm.Length)
    {
        ACLTradeHistory.AddItem(SellerCharNm[i], DamageDegree[i], Class'Engine.BTCustomDrawHK'.static.ToWonString(string(Price[i])));
        i++;
        // [Loop Continue]
        goto J0x81;
    }
    //return;    
}

defaultproperties
{
    fbItemBox=(X1=395.0000000,Y1=172.0000000,X2=630.0000000,Y2=284.0000000)
    fbButtonTrade[0]=(X1=333.0000000,Y1=293.0000000,X2=450.0000000,Y2=320.0000000)
    fbButtonTrade[1]=(X1=450.0000000,Y1=293.0000000,X2=570.0000000,Y2=320.0000000)
    fbButtonTrade[2]=(X1=570.0000000,Y1=293.0000000,X2=692.0000000,Y2=320.0000000)
    strButtonTrade[0]="??????"
    strButtonTrade[1]="???????"
    strButtonTrade[2]="???????"
    fbACLTradeHistory=(X1=333.0000000,Y1=320.0000000,X2=692.0000000,Y2=581.0000000)
    fbBackgroundImage=(X1=313.0000000,Y1=118.0000000,X2=712.0000000,Y2=652.0000000)
    fbTopLine=(X1=333.0000000,Y1=138.0000000,X2=692.0000000,Y2=165.0000000)
    fbBottomLine=(X1=333.0000000,Y1=588.0000000,X2=692.0000000,Y2=632.0000000)
    fbButtonOK=(X1=452.0000000,Y1=594.0000000,X2=572.0000000,Y2=627.0000000)
    strTitle="???????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}