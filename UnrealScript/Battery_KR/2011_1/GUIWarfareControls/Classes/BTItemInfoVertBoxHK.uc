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
    ItemBoxView.SetData(ItemInfo, instanceInfo);
    // End:0x3E
    if(ItemInfo.bSkill)
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
    ItemBoxView = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + (((AWinPos.X2 - AWinPos.X1) - float(234)) / float(2));
    fb.Y1 = AWinPos.Y1 + float(8);
    fb.X2 = fb.X1 + float(234);
    fb.Y2 = (AWinPos.Y1 + float(8)) + float(112);
    ItemBoxView.AWinPos = fb;
    ItemBoxView.InitComponent(Controller, self);
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.bBackgroundInfo = true;
    ItemStateView = new Class'GUIWarfareControls_Decompressed.BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(208);
    fb.X2 = AWinPos.X2;
    fb.Y2 = (AWinPos.Y1 + float(129)) + float(208);
    ItemStateView.AWinPos = fb;
    ItemStateView.InitComponent(Controller, self);
    AppendComponent(ItemStateView);
    ItemStateView.StateBox.X[0] = 20;
    ItemStateView.StateBox.X[1] = int(float(399) - fb.X1);
    ItemStateView.StateBox.X[2] = int(float(623) - fb.X1);
    ItemStateView.StateBox.X[3] = int(float(653) - fb.X1);
    ItemStateView.StateBox.SetTextDrawType(5);
    ItemStateView.StateBox.SetTextWidthNSpace(30, 5);
    LabelItemDescription = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemDescription.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(8);
    fb.Y1 = AWinPos.Y1 + float(128);
    fb.X2 = AWinPos.X2 - float(8);
    fb.Y2 = AWinPos.Y1 + float(199);
    LabelItemDescription.AWinPos = fb;
    LabelItemDescription.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    LabelItemDescription.InitComponent(Controller, self);
    AppendComponent(LabelItemDescription);
    EditItemDescription = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    EditItemDescription.bUseAWinPos = true;
    fb.X1 = (AWinPos.X1 + float(8)) + float(6);
    fb.Y1 = (AWinPos.Y1 + float(128)) + float(6);
    fb.X2 = (AWinPos.X2 - float(8)) - float(6);
    fb.Y2 = (AWinPos.Y1 + float(199)) - float(6);
    EditItemDescription.AWinPos = fb;
    EditItemDescription.InitComponent(Controller, self);
    AppendComponent(EditItemDescription);
    EditItemDescription.SetFontSizeAll(9);
    EditItemDescription.SetVisibleLineCount(4);
    EditItemDescription.bReadOnly = true;
    EditItemDescription.TextStr = "-";
    //return;    
}
