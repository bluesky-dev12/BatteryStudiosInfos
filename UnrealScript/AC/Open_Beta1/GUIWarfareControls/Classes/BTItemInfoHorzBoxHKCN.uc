class BTItemInfoHorzBoxHKCN extends BTItemInfoHorzBoxHK
    editinlinenew
    instanced;

function SetData(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, wItemBoxHK cItemInfo, wItemBoxInstanceHK cInstanceInfo)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x3C
    if(ItemInfo == none)
    {
        return;
    }
    ItemBoxView.SetData(ItemInfo, instanceInfo);
    // End:0xAB
    if(GameMgr.CheckWeaponItem(ItemInfo.ItemType))
    {
        ItemStateView.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        ItemStateView.SetVisibility(true);        
    }
    else
    {
        ItemStateView.SetVisibility(false);
    }
    EditItemDescription.SetText(ItemInfo.ItemDescription);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ItemBoxView = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    fb.X1 = 519.0000000;
    fb.Y1 = 554.0000000;
    fb.X2 = 751.0000000;
    fb.Y2 = 652.0000000;
    ItemBoxView.AWinPos = fb;
    ItemBoxView.InitComponent(Controller, self);
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.bBackgroundInfo = true;
    ItemStateView = new Class'GUIWarfareControls_Decompressed.BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fb.X1 = 823.0000000;
    fb.Y1 = 560.0000000;
    fb.X2 = 951.0000000;
    fb.Y2 = 675.0000000;
    ItemStateView.AWinPos = fb;
    ItemStateView.GaugeBGImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_gauge_bg;
    ItemStateView.BGOffsetX = 15;
    ItemStateView.InitComponent(Controller, self);
    AppendComponent(ItemStateView);
    LabelItemDescription = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemDescription.bUseAWinPos = true;
    fb.X1 = 525.0000000;
    fb.Y1 = 658.0000000;
    fb.X2 = 752.0000000;
    fb.Y2 = 738.0000000;
    LabelItemDescription.AWinPos = fb;
    LabelItemDescription.InitComponent(Controller, self);
    AppendComponent(LabelItemDescription);
    EditItemDescription = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    EditItemDescription.bUseAWinPos = true;
    fb.X1 = 525.0000000;
    fb.Y1 = 658.0000000;
    fb.X2 = 752.0000000;
    fb.Y2 = 738.0000000;
    EditItemDescription.AWinPos = fb;
    EditItemDescription.InitComponent(Controller, self);
    AppendComponent(EditItemDescription);
    EditItemDescription.SetFontSizeAll(9);
    EditItemDescription.SetVisibleLineCount(6);
    EditItemDescription.bReadOnly = true;
    EditItemDescription.TextStr = "-";
    //return;    
}

function SetWindowItemBox()
{
    local FloatBox fb;

    fb.X1 = AWinPos.X1;
    fb.Y1 = (AWinPos.Y1 + float(6)) - float(1);
    fb.X2 = ((AWinPos.X1 + float(240)) - float(6)) - float(2);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemBoxView.AWinPos = fb;
    ItemBoxView.ApplyAWinPos();
    fb.X1 = ((AWinPos.X1 + float(248)) - float(6)) + float(3);
    fb.Y1 = AWinPos.Y1 + float(3);
    fb.X2 = (AWinPos.X1 + float(248)) + float(242);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemStateView.AWinPos = fb;
    ItemStateView.ApplyAWinPos();
    fb.X1 = AWinPos.X1;
    fb.Y1 = ((AWinPos.Y2 - float(6)) - float(44)) + float(3);
    fb.X2 = AWinPos.X2 - float(6);
    fb.Y2 = AWinPos.Y2 - float(6);
    LabelItemDescription.AWinPos = fb;
    LabelItemDescription.ApplyAWinPos();
    fb.X1 = AWinPos.X1 + float(3);
    fb.Y1 = (((AWinPos.Y2 - float(6)) + float(3)) - float(44)) + float(3);
    fb.X2 = (AWinPos.X2 - float(6)) - float(3);
    fb.Y2 = (AWinPos.Y2 - float(6)) - float(3);
    EditItemDescription.AWinPos = fb;
    EditItemDescription.ApplyAWinPos();
    //return;    
}
