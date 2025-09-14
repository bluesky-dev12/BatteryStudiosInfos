class BTInventory extends GUITabPanel
    editinlinenew
    instanced;

var float TabButtonMarginX;
var export editinline GUIButton TabButtonSample;
var float TabButtonOffsetX;
var() automated TabControlMocker TabControl;
var export editinline BTItemImageListBox ImageListBoxSample;
var array<export editinline BTItemImageListBox> ImageBoxes;
var export editinline GUIButton ButtonControlSample;
var float ButtonControlOffsetX;
var float ButtonControllBaseOffsetX;
var string StyleNameShopButton;
var array<export editinline GUIButton> TabButtons;
var array<export editinline GUIButton> ControlButtons;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    //return;    
}

function BTItemImageListBox AddTab(string tabButtonCaption, string returnClass)
{
    local export editinline GUIButton NewTabButton;
    local int iTemp;
    local Class<BTItemImageListBox> tmClass;
    local export editinline BTItemImageListBox newImageBox;

    NewTabButton = new Class'XInterface.GUIButton';
    NewTabButton.WinHeight = TabButtonSample.WinHeight;
    NewTabButton.WinWidth = TabButtonSample.WinWidth;
    NewTabButton.WinLeft = TabButtonSample.WinLeft;
    iTemp = 0;
    J0x6D:

    // End:0xB7 [Loop If]
    if(iTemp < TabButtons.Length)
    {
        TabButtons[iTemp].WinLeft = TabButtons[iTemp].WinLeft + TabButtonOffsetX;
        iTemp++;
        // [Loop Continue]
        goto J0x6D;
    }
    NewTabButton.WinTop = TabButtonSample.WinTop;
    NewTabButton.StyleName = TabButtonSample.StyleName;
    NewTabButton.Caption = tabButtonCaption;
    NewTabButton.bScaleToParent = TabButtonSample.bScaleToParent;
    NewTabButton.bBoundToParent = TabButtonSample.bBoundToParent;
    NewTabButton.InitComponent(Controller, self);
    NewTabButton.EnableMe();
    AppendComponent(NewTabButton);
    TabButtons[TabButtons.Length] = NewTabButton;
    tmClass = Class<BTItemImageListBox>(DynamicLoadObject("GUIWarfareControls." $ returnClass, Class'Core.Class'));
    newImageBox = new tmClass;
    newImageBox.WinWidth = ImageListBoxSample.WinWidth;
    newImageBox.WinHeight = ImageListBoxSample.WinHeight;
    newImageBox.WinLeft = ImageListBoxSample.WinLeft;
    newImageBox.WinTop = ImageListBoxSample.WinTop;
    newImageBox.__OnChange__Delegate = ImageBox_OnChange;
    newImageBox.InitComponent(Controller, self);
    newImageBox.Opened(self);
    newImageBox.Hide();
    AppendComponent(newImageBox);
    ImageBoxes[ImageBoxes.Length] = newImageBox;
    TabControl.BindTabButtonAndPanel(NewTabButton, newImageBox);
    return newImageBox;
    //return;    
}

function SetupTempImageList(out BTItemImageListBox YO, int Count)
{
    local int lp1;
    local array<Material> Materials;

    Materials[0] = Texture'Warfare_UI_Item.ShopIcon.Item_Item_WP_AR_AK47';
    Materials[1] = Texture'Warfare_UI_Item.ShopIcon.Item_Item_WP_AR_G3';
    Materials[2] = Texture'Warfare_UI_Item.ShopIcon.Item_Item_WP_PS_M1911';
    Materials[3] = Texture'Warfare_UI_Item.ShopIcon.Item_Item_WP_SMG_MP5';
    Materials[4] = Texture'Warfare_UI_Item.ShopIcon.Item_Item_WP_SR_CheyTacLRRS';
    lp1 = 0;
    J0x4B:

    // End:0x7F [Loop If]
    if(lp1 < Count)
    {
        YO.AddItem(Materials[Rand(5)], none, true);
        lp1++;
        // [Loop Continue]
        goto J0x4B;
    }
    //return;    
}

function GUIButton AddControlButton(string Caption)
{
    local export editinline GUIButton newButton;

    newButton = new Class'XInterface.GUIButton';
    newButton.WinHeight = ButtonControlSample.WinHeight;
    newButton.WinWidth = ButtonControlSample.WinWidth;
    newButton.WinLeft = ButtonControlSample.WinLeft + (float(ControlButtons.Length) * ButtonControlOffsetX);
    newButton.WinTop = ButtonControlSample.WinTop;
    newButton.StyleName = ButtonControlSample.StyleName;
    newButton.bScaleToParent = ButtonControlSample.bScaleToParent;
    newButton.bBoundToParent = ButtonControlSample.bBoundToParent;
    newButton.Caption = Caption;
    newButton.InitComponent(Controller, self);
    AppendComponent(newButton);
    ControlButtons[ControlButtons.Length] = newButton;
    return newButton;
    //return;    
}

function GUIButton AddShopControlButton(string Caption)
{
    local export editinline GUIButton newButton;

    newButton = new Class'XInterface.GUIButton';
    newButton.WinHeight = ButtonControlSample.WinHeight;
    newButton.WinWidth = ButtonControlSample.WinWidth;
    newButton.WinLeft = ButtonControlSample.WinLeft + (float(ControlButtons.Length) * ButtonControlOffsetX);
    newButton.WinTop = ButtonControlSample.WinTop;
    newButton.StyleName = StyleNameShopButton;
    newButton.bScaleToParent = ButtonControlSample.bScaleToParent;
    newButton.bBoundToParent = ButtonControlSample.bBoundToParent;
    newButton.Caption = Caption;
    newButton.InitComponent(Controller, self);
    AppendComponent(newButton);
    ControlButtons[ControlButtons.Length] = newButton;
    return newButton;
    //return;    
}

function ImageBox_OnChange(GUIComponent Sender)
{
    OnChange(self);
    //return;    
}

function OnVisiblePanelChanged(int Index)
{
    OnChange(self);
    //return;    
}

function BTItemImageListBox GetVisibleImageListBox()
{
    return BTItemImageListBox(TabControl.GetVisiblePanel());
    //return;    
}

defaultproperties
{
    TabButtonMarginX=0.0104167
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTInventory.mTabButtonSample'
    begin object name="mTabButtonSample" class=XInterface.GUIButton
        Caption="Sample"
        StyleName="STY2Warfare_TabButton"
        WinTop=0.0048000
        WinLeft=0.7934066
        WinWidth=0.1626374
        WinHeight=0.0703595
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        OnKeyEvent=mTabButtonSample.InternalOnKeyEvent
    end object
    TabButtonSample=mTabButtonSample
    TabButtonOffsetX=-0.1692308
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTInventory.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
        OnVisiblePanelChanged=BTInventory.OnVisiblePanelChanged
    end object
    TabControl=mTabControl
    // Reference: BTItemImageListBox'GUIWarfareControls_Decompressed.BTInventory.mImageListBoxSample'
    begin object name="mImageListBoxSample" class=GUIWarfareControls_Decompressed.BTItemImageListBox
        WinTop=0.0980392
        WinHeight=0.7549019
        bVisible=false
    end object
    ImageListBoxSample=mImageListBoxSample
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTInventory.mButtonControlSample'
    begin object name="mButtonControlSample" class=XInterface.GUIButton
        Caption="Sample"
        StyleName="STY2Warfare_ConformButton"
        WinTop=0.8954248
        WinLeft=0.7894176
        WinWidth=0.1736264
        WinHeight=0.1045752
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        OnKeyEvent=mButtonControlSample.InternalOnKeyEvent
    end object
    ButtonControlSample=mButtonControlSample
    ButtonControlOffsetX=-0.1782198
    StyleNameShopButton="STY2Warfare_ConformButton_Blue"
    bBoundToParent=true
    bScaleToParent=true
}