/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTItemInfoHorzBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
class BTItemInfoHorzBoxHK extends GUITabPanel
    dependson(BTItemStateBoxButtonHK)
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
    // End:0x3c
    if(ItemInfo == none)
    {
        return;
    }
    ItemBoxView.SetData(ItemInfo, instanceInfo);
    // End:0xab
    if(GameMgr.CheckWeaponItem(ItemInfo.ItemType))
    {
        ItemStateView.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        ItemStateView.SetVisibility(true);
    }
    // End:0xbb
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
    Panel = new class'BTOwnerDrawImageHK';
    Panel.bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1;
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    Panel.AWinPos = fb;
    Panel.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    Panel.InitComponent(Controller, self);
    AppendComponent(Panel);
    ItemBoxView = new class'BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(6);
    fb.Y1 = AWinPos.Y1 + float(6);
    fb.X2 = AWinPos.X1 + float(240);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemBoxView.AWinPos = fb;
    ItemBoxView.InitComponent(Controller, self);
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.bBackgroundInfo = true;
    ItemStateView = new class'BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(248);
    fb.Y1 = AWinPos.Y1 + float(3);
    fb.X2 = AWinPos.X1 + float(248) + float(242);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemStateView.AWinPos = fb;
    ItemStateView.InitComponent(Controller, self);
    AppendComponent(ItemStateView);
    LabelItemDescription = new class'BTOwnerDrawImageHK';
    LabelItemDescription.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(6);
    fb.Y1 = AWinPos.Y2 - float(6) - float(44);
    fb.X2 = AWinPos.X2 - float(6);
    fb.Y2 = AWinPos.Y2 - float(6);
    LabelItemDescription.AWinPos = fb;
    LabelItemDescription.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
    LabelItemDescription.InitComponent(Controller, self);
    AppendComponent(LabelItemDescription);
    EditItemDescription = new class'BTMultiLineEditBoxHK';
    EditItemDescription.bUseAWinPos = true;
    fb.X1 = AWinPos.X1 + float(6) + float(3);
    fb.Y1 = AWinPos.Y2 - float(6) + float(3) - float(44);
    fb.X2 = AWinPos.X2 - float(6) - float(3);
    fb.Y2 = AWinPos.Y2 - float(6) - float(3);
    EditItemDescription.AWinPos = fb;
    EditItemDescription.InitComponent(Controller, self);
    AppendComponent(EditItemDescription);
    EditItemDescription.SetFontSizeAll(9);
    EditItemDescription.SetVisibleLineCount(3);
    EditItemDescription.bReadOnly = true;
    EditItemDescription.TextStr = "-";
}

function SetWindowItemBox()
{
    local FloatBox fb;

    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(6) - float(1);
    fb.X2 = AWinPos.X1 + float(240) - float(6) - float(2);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemBoxView.AWinPos = fb;
    ItemBoxView.ApplyAWinPos();
    fb.X1 = AWinPos.X1 + float(248) - float(6) + float(3);
    fb.Y1 = AWinPos.Y1 + float(3);
    fb.X2 = AWinPos.X1 + float(248) + float(242);
    fb.Y2 = AWinPos.Y1 + float(118);
    ItemStateView.AWinPos = fb;
    ItemStateView.ApplyAWinPos();
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y2 - float(6) - float(44) + float(3);
    fb.X2 = AWinPos.X2 - float(6);
    fb.Y2 = AWinPos.Y2 - float(6);
    LabelItemDescription.AWinPos = fb;
    LabelItemDescription.ApplyAWinPos();
    fb.X1 = AWinPos.X1 + float(3);
    fb.Y1 = AWinPos.Y2 - float(6) + float(3) - float(44) + float(3);
    fb.X2 = AWinPos.X2 - float(6) - float(3);
    fb.Y2 = AWinPos.Y2 - float(6) - float(3);
    EditItemDescription.AWinPos = fb;
    EditItemDescription.ApplyAWinPos();
}
