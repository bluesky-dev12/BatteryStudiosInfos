class BTTPWarehouseSkillHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strMainMenu[3];
var() automated TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK MainButton[3];
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() automated FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() automated FloatBox fbLabelPoint;
var() automated FloatBox fbLabelCash;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var() automated FloatBox fbLabelP;
var() automated FloatBox fbLabelC;
var export editinline BTOwnerDrawImageHK LabelP;
var export editinline BTOwnerDrawImageHK LabelC;
var localized string strMenuButton;
var() automated FloatBox fbMenuButton;
var export editinline BTOwnerDrawCaptionButtonHK MenuButton;
var export editinline BTItemInfoHorzBoxHK InfoBox;

function bool MainButton_OnClick(GUIComponent Sender)
{
    TabControl.SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshItemList();
    SetInfoBox();
    return true;
    //return;    
}

function RefreshItemList()
{
    switch(TabControl.GetCurrentTabIndex())
    {
        // End:0x30
        case 0:
            TPItemList.ItemList.ShowSkillAll();
            // End:0x72
            break;
        // End:0x4F
        case 1:
            TPItemList.ItemList.ShowActiveSkill();
            // End:0x72
            break;
        // End:0x6F
        case 2:
            TPItemList.ItemList.ShowPassiveSkill();
            // End:0x72
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SetInfoBox()
{
    InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[0]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[0]).instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelItemList = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new Class'GUIWarfareControls_Decompressed.BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShowOnlyInventory = true;
    i = 0;
    J0xF6:

    // End:0x30B [Loop If]
    if(i < 3)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (AWinPos.X1 + float(100 * i)) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = (AWinPos.X1 + float(100 * (i + 1))) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        MainButton[i] = serverButton;
        MainButton[i].Caption = strMainMenu[i];
        TabControl.BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0xF6;
    }
    TabControl.SetVisiblePanel(0);
    InfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoHorzBoxHK';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0000000;
    fb.Y1 = 564.0000000;
    fb.X2 = 510.0000000 + float(504);
    fb.Y2 = 564.0000000 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    MenuButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    MenuButton.Caption = strMenuButton;
    MenuButton.bUseAWinPos = true;
    MenuButton.AWinPos = fbMenuButton;
    MenuButton.SetFontSizeAll(12);
    MenuButton.SetDefaultFontColor();
    MenuButton.SetDefaultButtonImage();
    MenuButton.RenderWeight = 0.6000000;
    MenuButton.ButtonID = 4;
    MenuButton.InitComponent(Controller, self);
    AppendComponent(MenuButton);
    LabelCash = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    LabelPoint.InitComponent(Controller, self);
    AppendComponent(LabelPoint);
    LabelC = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelC.bUseAWinPos = true;
    LabelC.AWinPos = fbLabelC;
    LabelC.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_cash;
    LabelC.InitComponent(Controller, self);
    AppendComponent(LabelC);
    LabelP = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelP.bUseAWinPos = true;
    LabelP.AWinPos = fbLabelP;
    LabelP.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point;
    LabelP.InitComponent(Controller, self);
    AppendComponent(LabelP);
    //return;    
}

defaultproperties
{
    strMainMenu[0]="???????"
    strMainMenu[1]="?????????"
    strMainMenu[2]="?????????????"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPWarehouseSkillHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbTPItemList=(X1=517.0000000,Y1=167.0000000,X2=1011.0000000,Y2=515.0000000)
    fbLabelItemList=(X1=510.0000000,Y1=137.0000000,X2=1014.0000000,Y2=558.0000000)
    fbLabelPoint=(X1=510.0000000,Y1=81.0000000,X2=757.0000000,Y2=104.0000000)
    fbLabelCash=(X1=767.0000000,Y1=81.0000000,X2=1014.0000000,Y2=104.0000000)
    fbLabelP=(X1=519.0000000,Y1=85.0000000,X2=534.0000000,Y2=100.0000000)
    fbLabelC=(X1=776.0000000,Y1=85.0000000,X2=791.0000000,Y2=100.0000000)
    strMenuButton="???"
    fbMenuButton=(X1=911.0000000,Y1=520.0000000,X2=1004.0000000,Y2=552.0000000)
}