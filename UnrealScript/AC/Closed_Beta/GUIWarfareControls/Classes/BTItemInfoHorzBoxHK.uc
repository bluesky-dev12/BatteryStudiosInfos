class BTItemInfoHorzBoxHK extends GUITabPanel
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK Panel;
var export editinline BTItemBoxButtonHK ItemBoxView;
var export editinline BTItemStateBoxButtonHK ItemStateView;
var export editinline BTOwnerDrawImageHK LabelItemDescription;
var export editinline BTMultiLineEditBoxHK EditItemDescription;

function SetData(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, wItemBoxHK cItemInfo, wItemBoxInstanceHK cInstanceInfo)
{
    // End:0x0D
    if(ItemInfo == none)
    {
        return;
    }
    ItemBoxView.SetData(ItemInfo, instanceInfo);
    // End:0x79
    if(ItemInfo.bSkill || (ItemInfo.ItemType > 4) && ItemInfo.ItemType < 32)
    {
        ItemStateView.SetVisibility(false);        
    }
    else
    {
        ItemStateView.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        ItemStateView.SetVisibility(true);
    }
    EditItemDescription.SetText(ItemInfo.ItemDescription);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    Panel = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    Panel.bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1;
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    Panel.AWinPos = fb;
    Panel.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    Panel.InitComponent(Controller, self);
    AppendComponent(Panel);
    ItemBoxView = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(6);
    fb.Y1 = AWinPos.Y1 + float(6);
    fb.X2 = AWinPos.X1 + float(240);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemBoxView.AWinPos = fb;
    ItemBoxView.InitComponent(Controller, self);
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.bBackgroundInfo = true;
    ItemStateView = new Class'GUIWarfareControls_Decompressed.BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(248);
    fb.Y1 = AWinPos.Y1 + float(3);
    fb.X2 = (AWinPos.X1 + float(248)) + float(242);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemStateView.AWinPos = fb;
    ItemStateView.InitComponent(Controller, self);
    AppendComponent(ItemStateView);
    LabelItemDescription = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemDescription.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(6);
    fb.Y1 = (AWinPos.Y2 - float(6)) - float(44);
    fb.X2 = AWinPos.X2 - float(6);
    fb.Y2 = AWinPos.Y2 - float(6);
    LabelItemDescription.AWinPos = fb;
    LabelItemDescription.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    LabelItemDescription.InitComponent(Controller, self);
    AppendComponent(LabelItemDescription);
    EditItemDescription = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    EditItemDescription.bUseAWinPos = true;
    fb.X1 = (AWinPos.X1 + float(6)) + float(3);
    fb.Y1 = ((AWinPos.Y2 - float(6)) + float(3)) - float(44);
    fb.X2 = (AWinPos.X2 - float(6)) - float(3);
    fb.Y2 = (AWinPos.Y2 - float(6)) - float(3);
    EditItemDescription.AWinPos = fb;
    EditItemDescription.InitComponent(Controller, self);
    AppendComponent(EditItemDescription);
    EditItemDescription.SetFontSizeAll(9);
    EditItemDescription.SetVisibleLineCount(3);
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
