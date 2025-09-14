class BTTPOptionGQSimpleHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonRadio;
var FloatBox fbButtonRadio;
var export editinline BTCheckBoxHK ButtonRadio;
var export editinline ButtonGroups GraphicSimpleGroup;
var localized string strLow;
var localized string strNormal;
var localized string strHigh;
var localized string strExHigh;
var export editinline BTOwnerDrawCaptionButtonHK SimpleButton[4];
var FloatBox fbButtonTab[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW, i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = (int(AWinPos.X2 - AWinPos.X1) * 1) / 4;
    fbButtonRadio = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, (AWinPos.X1 + float(halfW)) - float(2), AWinPos.Y2);
    ButtonRadio = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fbButtonRadio, 0.7700000));
    ButtonRadio.ButtonID = 1;
    ButtonRadio.SetDefaultRadioImage();
    ButtonRadio.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN());
    ButtonRadio.FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonDisable();
    ButtonRadio.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_dis;
    ButtonRadio.Caption = strButtonRadio;
    ButtonRadio.SetFontSizeAll(9);
    GraphicSimpleGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x178:

    // End:0x28F [Loop If]
    if(i < 4)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AWinPos.X1 + float(70 * i)) + float(halfW), AWinPos.Y1, ((AWinPos.X1 + float(70 * i)) + float(halfW)) + float(68), AWinPos.Y1 + float(28));
        SimpleButton[i] = NewButtonComponent(fb);
        SimpleButton[i].SetGraphicUpDownBtnImage();
        SimpleButton[i].SetDefaultFontColor();
        SimpleButton[i].SetFontSizeAll(9);
        SimpleButton[i].ButtonID = i;
        GraphicSimpleGroup.AddButton(SimpleButton[i]);
        i++;
        // [Loop Continue]
        goto J0x178;
    }
    SimpleButton[0].Caption = strLow;
    SimpleButton[1].Caption = strNormal;
    SimpleButton[2].Caption = strHigh;
    SimpleButton[3].Caption = strExHigh;
    //return;    
}

function ApplyAWinPos()
{
    local int halfW, i;
    local FloatBox fb;

    // End:0x0D
    if(ButtonRadio == none)
    {
        return;
    }
    super(GUIComponent).ApplyAWinPos();
    halfW = (int(AWinPos.X2 - AWinPos.X1) * 1) / 4;
    fbButtonRadio = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, (AWinPos.X1 + float(halfW)) - float(2), AWinPos.Y2);
    ButtonRadio.AWinPos = fbButtonRadio;
    ButtonRadio.ApplyAWinPos();
    i = 0;
    J0xAE:

    // End:0x168 [Loop If]
    if(i < 4)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AWinPos.X1 + float(70 * i)) + float(halfW), AWinPos.Y1, ((AWinPos.X1 + float(70 * i)) + float(halfW)) + float(68), AWinPos.Y1 + float(28));
        SimpleButton[i].AWinPos = fb;
        SimpleButton[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0xAE;
    }
    //return;    
}

function ChangeButtonImage()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 4)
    {
        SimpleButton[i].SetGraphicUpDownBtnImage();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    SimpleButton[GraphicSimpleGroup.GetSelectIndex()].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    //return;    
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 4)
    {
        SimpleButton[i].DisableMe();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function bool EnableAllButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 4)
    {
        SimpleButton[i].EnableMe();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

defaultproperties
{
    strButtonRadio="Simple"
    strLow="Low"
    strNormal="Normal"
    strHigh="High"
    strExHigh="Very High"
}