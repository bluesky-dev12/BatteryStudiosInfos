class BTItemInfoVertBoxHK extends GUITabPanel
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK Panel;
var export editinline BTItemBoxButtonHK ItemBoxView;
var export editinline BTItemStateBoxButtonHK ItemStateView;
var export editinline BTOwnerDrawImageHK LabelItemDescription;
var export editinline BTMultiLineEditBoxHK EditItemDescription;

function SetData(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, wItemBoxHK cItemInfo, wItemBoxInstanceHK cInstanceInfo)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemBoxView.SetData(ItemInfo, instanceInfo);
    // End:0x9E
    if(GameMgr.CheckWeaponItem(ItemInfo.ItemType))
    {
        ItemStateView.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        ItemStateView.SetVisibility(true);        
    }
    else
    {
        ItemStateView.SetVisibility(false);
    }
    // End:0x115
    if(((instanceInfo != none) && instanceInfo.cashItemInfo != none) && instanceInfo.cashItemInfo.UseDescription)
    {
        EditItemDescription.SetText(instanceInfo.cashItemInfo.WZItemDescription);        
    }
    else
    {
        EditItemDescription.SetText(ItemInfo.ItemDescription);
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ItemBoxView = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(80);
    fb.Y1 = AWinPos.Y1;
    fb.X2 = fb.X1 + float(218);
    fb.Y2 = fb.Y1 + float(89);
    ItemBoxView.AWinPos = fb;
    ItemBoxView.InitComponent(Controller, self);
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.bBackgroundInfo = true;
    EditItemDescription = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    EditItemDescription.bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(101);
    fb.X2 = AWinPos.X2 - float(15);
    fb.Y2 = fb.Y1 + float(45);
    EditItemDescription.AWinPos = fb;
    EditItemDescription.InitComponent(Controller, self);
    AppendComponent(EditItemDescription);
    EditItemDescription.SetFontSizeAll(9);
    EditItemDescription.SetVisibleLineCount(4);
    EditItemDescription.bReadOnly = true;
    EditItemDescription.TextStr = "-";
    ItemStateView = new Class'GUIWarfareControls_Decompressed.BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(78);
    fb.X2 = AWinPos.X2 - float(79);
    fb.Y1 = AWinPos.Y1 + float(176);
    fb.Y2 = AWinPos.Y2 - float(17);
    ItemStateView.AWinPos = fb;
    ItemStateView.InitComponent(Controller, self);
    ItemStateView.GaugeBGImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemPopup_ItemInfo_back;
    ItemStateView.StateBox.X[0] = -78;
    ItemStateView.StateBox.X[2] = 233;
    ItemStateView.StateBox.X[1] = 3;
    ItemStateView.StateBox.X[3] = 233;
    ItemStateView.StateBox.locYOffset = 18.0000000;
    ItemStateView.StateBox.SetTextDrawType(5);
    ItemStateView.StateBox.SetTextWidthNSpace(30, 5);
    AppendComponent(ItemStateView);
    //return;    
}
