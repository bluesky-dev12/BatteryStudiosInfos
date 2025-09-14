class BTItemInfoHorzBoxHKCN extends BTItemInfoHorzBoxHK
    editinlinenew
    instanced;

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
    fb.Y2 = 655.0000000;
    ItemStateView.AWinPos = fb;
    ItemStateView.GaugeBGImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_gauge_bg;
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
