class BTTPInventoryHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strWeapon;
var localized string strSkill;
var localized string strQuickSlot;
var localized string strRSA;
var localized string strAF;
var() automated TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK ButtonInven[3];
var export editinline GUITabPanel TPInven[3];
var export editinline BTTPInventoryEquipItem TPEquipItem;
var export editinline BTTPInventoryQuickSlotHK TPQuickSlot;
var export editinline BTTPInventoryWeaponHK TPWeapon;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    TPEquipItem = new Class'GUIWarfareControls_Decompressed.BTTPInventoryEquipItem';
    TPEquipItem.InitComponent(Controller, self);
    AppendComponent(TPEquipItem);
    TPWeapon = new Class'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK';
    TPWeapon.InitComponent(Controller, self);
    AppendComponent(TPWeapon);
    TPQuickSlot = new Class'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHK';
    TPQuickSlot.InitComponent(Controller, self);
    AppendComponent(TPQuickSlot);
    TabControl.SetVisiblePanel(0);
    i = 0;
    J0xB4:

    // End:0xED [Loop If]
    if(i < 2)
    {
        TPQuickSlot.btnModify[i].__OnClick__Delegate = ShowModifyWindow;
        i++;
        // [Loop Continue]
        goto J0xB4;
    }
    //return;    
}

function bool ShowModifyWindow(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x27
    if(btn.bDisable == true)
    {
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
    BTWindowModifyHK(Controller.TopPage()).SetData(TPQuickSlot.ButtonQuickSlot[btn.ButtonID].itemBox.ItemInfo, TPQuickSlot.ButtonQuickSlot[btn.ButtonID].itemBox.instanceInfo);
    BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = TPWeapon.BTWindowModifyHK_OnOK;
    return true;
    //return;    
}

function bool TabControl_ButtonInven_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TabControl.SetVisiblePanel(btn.ButtonID);
    return true;
    //return;    
}

function bool SaveButton_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

defaultproperties
{
    strWeapon="Weapon"
    strSkill="Skill"
    strQuickSlot="Quick Slot"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
}