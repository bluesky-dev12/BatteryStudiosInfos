/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPInventoryHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class BTTPInventoryHKCN extends BTTPInventoryHK
    editinlinenew
    instanced;

var localized string strRSA;
var localized string strAF;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    TPWeapon = new class'BTTPInventoryWeaponHKCN';
    TPWeapon.InitComponent(Controller, self);
    AppendComponent(TPWeapon);
    TPQuickSlot = new class'BTTPInventoryQuickSlotHKCN';
    TPQuickSlot.InitComponent(Controller, self);
    AppendComponent(TPQuickSlot);
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 500.0);
    CharacterModel.cameraPos.X = -340.0;
    CharacterModel.cameraPos.Y = 15.0;
    CharacterModel.cameraPos.Z = 2.50;
    TPWeapon.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
}

function bool SaveButton_OnClick(GUIComponent Sender)
{
    CharacterModel.SaveModelData();
    return true;
}

defaultproperties
{
    TabControl=mTabControl
}