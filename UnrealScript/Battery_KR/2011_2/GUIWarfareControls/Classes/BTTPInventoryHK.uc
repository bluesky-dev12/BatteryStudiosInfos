class BTTPInventoryHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strWeapon;
var localized string strSkill;
var localized string strQuickSlot;
var BTROModelNew CharacterModel;
var() automated TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK ButtonInven[3];
var export editinline GUITabPanel TPInven[3];
var export editinline BTTPInventoryWeaponHK TPWeapon;
var export editinline BTTPInventorySkillHK TPSkill;
var export editinline BTTPInventoryQuickSlotHK TPQuickSlot;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local export editinline GUITabPanel serverTP;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x31C [Loop If]
    if(i < 3)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (AWinPos.X1 + float(110 * i)) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = (AWinPos.X1 + float(110 * (i + 1))) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.ButtonID = i;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        ButtonInven[i] = serverButton;
        // End:0x1E7
        if(i == 0)
        {
            TPWeapon = new Class'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK';
            serverTP = TPWeapon;            
        }
        else
        {
            // End:0x20F
            if(i == 1)
            {
                TPSkill = new Class'GUIWarfareControls_Decompressed.BTTPInventorySkillHK';
                serverTP = TPSkill;                
            }
            else
            {
                TPQuickSlot = new Class'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHK';
                serverTP = TPQuickSlot;
            }
        }
        serverTP.bUseAWinPos = true;
        fb.X1 = AWinPos.X1;
        fb.Y1 = AWinPos.Y1 + float(23);
        fb.X2 = AWinPos.X2;
        fb.Y2 = AWinPos.Y2;
        serverTP.AWinPos = fb;
        serverTP.RenderWeight = 0.5000000;
        serverTP.InitComponent(Controller, self);
        AppendComponent(serverTP);
        TPInven[i] = serverTP;
        TabControl.BindTabButtonAndPanel(ButtonInven[i], TPInven[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    ButtonInven[0].Caption = strWeapon;
    ButtonInven[1].Caption = strSkill;
    ButtonInven[2].Caption = strQuickSlot;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
    TPWeapon.CharacterModel = CharacterModel;
    TPSkill.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
    ButtonInven[0].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
    ButtonInven[1].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
    ButtonInven[2].__OnClick__Delegate = TabControl_ButtonInven_OnClick;
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
    CharacterModel.SaveModelData();
    return true;
    //return;    
}

defaultproperties
{
    strWeapon="??"
    strSkill="??"
    strQuickSlot="???"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
}