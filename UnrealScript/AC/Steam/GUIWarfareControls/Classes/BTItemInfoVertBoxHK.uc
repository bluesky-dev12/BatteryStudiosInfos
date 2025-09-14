/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTItemInfoVertBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
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
    // End:0x9e
    if(GameMgr.CheckWeaponItem(ItemInfo.ItemType))
    {
        ItemStateView.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        ItemStateView.SetVisibility(true);
    }
    // End:0xae
    else
    {
        ItemStateView.SetVisibility(false);
    }
    EditItemDescription.SetText(ItemInfo.ItemDescription);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ItemBoxView = new class'BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(80);
    fb.Y1 = AWinPos.Y1;
    fb.X2 = fb.X1 + float(218);
    fb.Y2 = fb.Y1 + float(89);
    ItemBoxView.AWinPos = fb;
    ItemBoxView.InitComponent(Controller, self);
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.bBackgroundInfo = true;
    EditItemDescription = new class'BTMultiLineEditBoxHK';
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
    ItemStateView = new class'BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(78);
    fb.X2 = AWinPos.X2 - float(79);
    fb.Y1 = AWinPos.Y1 + float(176);
    fb.Y2 = AWinPos.Y2 - float(17);
    ItemStateView.AWinPos = fb;
    ItemStateView.InitComponent(Controller, self);
    ItemStateView.GaugeBGImage = class'BTUIResourcePoolHK'.default.ItemPopup_ItemInfo_back;
    ItemStateView.StateBox.X[0] = -78;
    ItemStateView.StateBox.X[2] = 268;
    ItemStateView.StateBox.X[1] = 33;
    ItemStateView.StateBox.X[3] = 268;
    ItemStateView.BGOffsetX = 35;
    ItemStateView.StateBox.locYOffset = 18.0;
    ItemStateView.StateBox.SetTextDrawType(5);
    ItemStateView.StateBox.SetTextWidthNSpace(30, 5);
    AppendComponent(ItemStateView);
}
